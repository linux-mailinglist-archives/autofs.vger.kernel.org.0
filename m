Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88364932CF
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350897AbiASCUH (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:07 -0500
Received: from smtp01.aussiebb.com.au ([121.200.0.92]:48562 "EHLO
        smtp01.aussiebb.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238815AbiASCUF (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:05 -0500
X-Greylist: delayed 477 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jan 2022 21:20:05 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id DB7D4100FC7
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:26 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OmO8Omu3ZlgI for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:26 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id D0C171009F4; Wed, 19 Jan 2022 13:12:26 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6ED1710027D;
        Wed, 19 Jan 2022 13:12:26 +1100 (AEDT)
Subject: [PATCH 05/19] autofs-5.1.8 - fix root offset error handling
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:26 +0800
Message-ID: <164255834617.27570.13151127330135183507.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

If mounting the root or offsets of a multi-mount root fails any mounts
done so far need to be umounted and the multi-mount offset tree deleted
so it can be created cleanly and possibly mounted the next time it's
triggered.

Also, if a subtree that is not the multi-mount root fails the expire
alarm needs to be re-instated so other subtrees (at least the root)
will continue to expire.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG           |    1 +
 daemon/direct.c     |   10 +++++++++-
 modules/parse_sun.c |    6 ++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 870fd8f3..6f18a0bb 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -2,6 +2,7 @@
 - fix fedfs build flags.
 - fix set open file limit.
 - improve descriptor open error reporting.
+- fix root offset error handling.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/direct.c b/daemon/direct.c
index c2331155..8810900c 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -1167,6 +1167,7 @@ static void *do_mount_direct(void *arg)
 	struct ioctl_ops *ops = get_ioctl_ops();
 	struct pending_args *args, mt;
 	struct autofs_point *ap;
+	struct mapent *me;
 	struct stat st;
 	int status, state;
 
@@ -1230,7 +1231,6 @@ static void *do_mount_direct(void *arg)
 	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &state);
 	if (status) {
 		struct mnt_list *sbmnt;
-		struct mapent *me;
 		struct statfs fs;
 		unsigned int close_fd = 0;
 		unsigned int flags = MNTS_DIRECT|MNTS_MOUNTED;
@@ -1271,6 +1271,14 @@ static void *do_mount_direct(void *arg)
 			       mt.ioctlfd, mt.wait_queue_token, -ENOENT);
 		ops->close(ap->logopt, mt.ioctlfd);
 		info(ap->logopt, "failed to mount %s", mt.name);
+
+		/* If this is a multi-mount subtree mount failure
+		 * ensure the tree continues to expire.
+		 */
+		me = cache_lookup_distinct(mt.mc, mt.name);
+		if (me && IS_MM(me) && !IS_MM_ROOT(me))
+			conditional_alarm_add(ap, ap->exp_runfreq);
+		cache_unlock(mt.mc);
 	}
 	pthread_setcancelstate(state, NULL);
 
diff --git a/modules/parse_sun.c b/modules/parse_sun.c
index d9ac0c94..56fe4161 100644
--- a/modules/parse_sun.c
+++ b/modules/parse_sun.c
@@ -1142,6 +1142,9 @@ static int mount_subtree(struct autofs_point *ap, struct mapent_cache *mc,
 		if (!len) {
 			warn(ap->logopt, "path loo long");
 			cache_unlock(mc);
+			cache_writelock(mc);
+			tree_mapent_delete_offsets(mc, name);
+			cache_unlock(mc);
 			return 1;
 		}
 		key[len] = '/';
@@ -1186,6 +1189,9 @@ static int mount_subtree(struct autofs_point *ap, struct mapent_cache *mc,
 				cache_unlock(mc);
 				error(ap->logopt, MODPREFIX
 					 "failed to mount offset triggers");
+				cache_writelock(mc);
+				tree_mapent_delete_offsets(mc, name);
+				cache_unlock(mc);
 				return 1;
 			}
 		}


