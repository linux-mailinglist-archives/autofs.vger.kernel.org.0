Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049424932D4
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350879AbiASCUL (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:11 -0500
Received: from smtp01.aussiebb.com.au ([121.200.0.92]:48572 "EHLO
        smtp01.aussiebb.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350891AbiASCUH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:07 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6FFA31009F9
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:02 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HvhGyB4JAWur for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:02 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 6758D100FC5; Wed, 19 Jan 2022 13:12:02 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6A7CD1009F9;
        Wed, 19 Jan 2022 13:12:01 +1100 (AEDT)
Subject: [PATCH 01/19] autofs-5.1.8 - fix kernel mount status notification
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:01 +0800
Message-ID: <164255832100.27570.1646553501193176220.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

The status return for attempted mount notification is not done
correctly in some cases leading to a status being sent to the
kernel multiple times or the send causing an error.

We must send a status to the kernel but it needs to be the correct
one. It definitely shouldn't be sent twice for the same mount attempt
and shouldn't be failing.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    2 ++
 daemon/direct.c   |   19 +++++++++++--------
 daemon/indirect.c |   19 +++++++++++--------
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 3be6119a..18a2f29c 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,3 +1,5 @@
+- fix kernel mount status notification.
+
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
 - remove mount.x and rpcgen dependencies.
diff --git a/daemon/direct.c b/daemon/direct.c
index 4a56486b..c2331155 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -1147,12 +1147,18 @@ int handle_packet_expire_direct(struct autofs_point *ap, autofs_packet_expire_di
 	return 0;
 }
 
-static void mount_send_fail(void *arg)
+static void mount_send_status(void *arg)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 	struct pending_args *mt = arg;
 	struct autofs_point *ap = mt->ap;
-	ops->send_fail(ap->logopt, mt->ioctlfd, mt->wait_queue_token, -ENOENT);
+
+	if (mt->status)
+		ops->send_fail(ap->logopt, mt->ioctlfd,
+			       mt->wait_queue_token, mt->status);
+	else
+		ops->send_ready(ap->logopt,
+				mt->ioctlfd, mt->wait_queue_token);
 	ops->close(ap->logopt, mt->ioctlfd);
 }
 
@@ -1181,7 +1187,8 @@ static void *do_mount_direct(void *arg)
 
 	pending_mutex_unlock(args);
 
-	pthread_cleanup_push(mount_send_fail, &mt);
+	mt.status = 0;
+	pthread_cleanup_push(mount_send_status, &mt);
 
 	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &state);
 
@@ -1195,9 +1202,7 @@ static void *do_mount_direct(void *arg)
 	if (status == -1) {
 		error(ap->logopt,
 		      "can't stat direct mount trigger %s", mt.name);
-		ops->send_fail(ap->logopt,
-			       mt.ioctlfd, mt.wait_queue_token, -ENOENT);
-		ops->close(ap->logopt, mt.ioctlfd);
+		mt.status = -ENOENT;
 		pthread_setcancelstate(state, NULL);
 		pthread_exit(NULL);
 	}
@@ -1207,8 +1212,6 @@ static void *do_mount_direct(void *arg)
 		error(ap->logopt,
 		     "direct trigger not valid or already mounted %s",
 		     mt.name);
-		ops->send_ready(ap->logopt, mt.ioctlfd, mt.wait_queue_token);
-		ops->close(ap->logopt, mt.ioctlfd);
 		pthread_setcancelstate(state, NULL);
 		pthread_exit(NULL);
 	}
diff --git a/daemon/indirect.c b/daemon/indirect.c
index b73c2781..23ef9f41 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -683,13 +683,18 @@ int handle_packet_expire_indirect(struct autofs_point *ap, autofs_packet_expire_
 	return 0;
 }
 
-static void mount_send_fail(void *arg)
+static void mount_send_status(void *arg)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 	struct pending_args *mt = arg;
 	struct autofs_point *ap = mt->ap;
-	ops->send_fail(ap->logopt,
-		       ap->ioctlfd, mt->wait_queue_token, -ENOENT);
+
+	if (mt->status)
+		ops->send_fail(ap->logopt, ap->ioctlfd,
+			       mt->wait_queue_token, mt->status);
+	else
+		ops->send_ready(ap->logopt,
+				ap->ioctlfd, mt->wait_queue_token);
 }
 
 static void *do_mount_indirect(void *arg)
@@ -718,7 +723,8 @@ static void *do_mount_indirect(void *arg)
 
 	pending_mutex_unlock(args);
 
-	pthread_cleanup_push(mount_send_fail, &mt);
+	mt.status = 0;
+	pthread_cleanup_push(mount_send_status, &mt);
 
 	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &state);
 
@@ -731,9 +737,7 @@ static void *do_mount_indirect(void *arg)
 	len = ncat_path(buf, sizeof(buf), ap->path, mt.name, mt.len);
 	if (!len) {
 		crit(ap->logopt, "path to be mounted is to long");
-		ops->send_fail(ap->logopt,
-			       ap->ioctlfd, mt.wait_queue_token,
-			      -ENAMETOOLONG);
+		mt.status = -ENAMETOOLONG;
 		pthread_setcancelstate(state, NULL);
 		pthread_exit(NULL);
 	}
@@ -742,7 +746,6 @@ static void *do_mount_indirect(void *arg)
 	if (status != -1 && !(S_ISDIR(st.st_mode) && st.st_dev == mt.dev)) {
 		error(ap->logopt,
 		      "indirect trigger not valid or already mounted %s", buf);
-		ops->send_ready(ap->logopt, ap->ioctlfd, mt.wait_queue_token);
 		pthread_setcancelstate(state, NULL);
 		pthread_exit(NULL);
 	}


