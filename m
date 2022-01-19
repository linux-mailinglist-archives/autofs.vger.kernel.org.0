Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640814932D9
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350893AbiASCUO (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350898AbiASCUI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:08 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB948C061401
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:20:06 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 4F66C100FCB
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:57 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2IVVIIZobwqF for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:57 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 47B28100059; Wed, 19 Jan 2022 13:12:57 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id B9F2E10029D;
        Wed, 19 Jan 2022 13:12:56 +1100 (AEDT)
Subject: [PATCH 10/19] autofs-5.1.8 - fix nfsv4 only mounts should not use
 rpcbind
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:56 +0800
Message-ID: <164255837625.27570.11265840413605524876.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Commit 606795ecfaa1 ("autofs-5.1.7 - also require TCP_REQUESTED when
setting NFS port" together with commit 26fb6b5408be) caused NFSv4 only
mounts to also use rpcbind to probe availability which breaks the
requirememt that this type of mount not use rpcbind at all.

Fix this by treating fstype=nfs4 mounts as a special case which doesn't
use rpcbind.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG            |    1 +
 include/replicated.h |    2 ++
 modules/mount_nfs.c  |   13 +++++++------
 modules/replicated.c |    4 ++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 3b22937e..950eb7e7 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -6,6 +6,7 @@
 - fix nonstrict fail handling of last offset mount.
 - dont fail on duplicate offset entry tree add.
 - fix loop under run in cache_get_offset_parent().
+- fix nfsv4 only mounts should not use rpcbind.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/replicated.h b/include/replicated.h
index 95ff1f0d..f889a56a 100644
--- a/include/replicated.h
+++ b/include/replicated.h
@@ -35,6 +35,8 @@
 #define NFS3_REQUESTED		NFS3_SUPPORTED
 #define NFS4_REQUESTED		NFS4_SUPPORTED
 
+#define NFS4_ONLY_REQUESTED	0x0800
+
 #define TCP_SUPPORTED		0x0001
 #define UDP_SUPPORTED		0x0002
 #define TCP_REQUESTED		TCP_SUPPORTED
diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
index 0ab87dcf..feb5afcd 100644
--- a/modules/mount_nfs.c
+++ b/modules/mount_nfs.c
@@ -92,7 +92,7 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
 	mount_default_proto = defaults_get_mount_nfs_default_proto();
 	vers = NFS_VERS_DEFAULT | NFS_PROTO_DEFAULT;
 	if (strcmp(fstype, "nfs4") == 0)
-		vers = NFS4_VERS_DEFAULT | TCP_SUPPORTED;
+		vers = NFS4_VERS_DEFAULT | TCP_SUPPORTED | NFS4_ONLY_REQUESTED;
 	else if (mount_default_proto == 4)
 		vers = vers | NFS4_VERS_DEFAULT;
 
@@ -157,15 +157,16 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
 			} else {
 				/* Is any version of NFSv4 in the options */
 				if (_strncmp("vers=4", cp, 6) == 0 ||
-				    _strncmp("nfsvers=4", cp, 9) == 0)
-					vers = NFS4_VERS_MASK | TCP_SUPPORTED;
-				else if (_strncmp("vers=3", cp, o_len) == 0 ||
+				    _strncmp("nfsvers=4", cp, 9) == 0) {
+					vers &= ~(NFS_VERS_MASK);
+					vers |= NFS4_VERS_MASK | TCP_SUPPORTED | NFS4_ONLY_REQUESTED;
+				} else if (_strncmp("vers=3", cp, o_len) == 0 ||
 					 _strncmp("nfsvers=3", cp, o_len) == 0) {
-					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK);
+					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK | NFS4_ONLY_REQUESTED);
 					vers |= NFS3_REQUESTED;
 				} else if (_strncmp("vers=2", cp, o_len) == 0 ||
 					 _strncmp("nfsvers=2", cp, o_len) == 0) {
-					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK);
+					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK | NFS4_ONLY_REQUESTED);
 					vers |= NFS2_REQUESTED;
 				} else if (strstr(cp, "port=") == cp &&
 					 o_len - 5 < 25) {
diff --git a/modules/replicated.c b/modules/replicated.c
index 09075dd0..cdb7c617 100644
--- a/modules/replicated.c
+++ b/modules/replicated.c
@@ -291,7 +291,7 @@ static unsigned int get_nfs_info(unsigned logopt, struct host *host,
 
 	rpc_info->proto = proto;
 	if (port < 0) {
-		if ((version & NFS4_REQUESTED) && (version & TCP_REQUESTED))
+		if (version & NFS4_REQUESTED && (version & NFS4_ONLY_REQUESTED))
 			rpc_info->port = NFS_PORT;
 		else
 			port = 0;
@@ -525,7 +525,7 @@ static int get_vers_and_cost(unsigned logopt, struct host *host,
 {
 	struct conn_info pm_info, rpc_info;
 	time_t timeout = RPC_TIMEOUT;
-	unsigned int supported, vers = (NFS_VERS_MASK | NFS4_VERS_MASK);
+	unsigned int supported, vers = (NFS_VERS_MASK | NFS4_VERS_MASK | NFS4_ONLY_REQUESTED);
 	int ret = 0;
 
 	if (!check_address_proto(logopt, host, version))


