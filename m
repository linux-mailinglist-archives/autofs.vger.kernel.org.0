Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5928FAAF38
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389673AbfIEXqo (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:44 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730501AbfIEXqn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:43 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DPAQAYnXFd/1230XZlHgEGBwaBVAg?=
 =?us-ascii?q?LAQGCFoE/IRIqhCGPDFIBBoEROIlcigeFJIF7CQEBAQEBAQEBARsZAQIBAYQ?=
 =?us-ascii?q?/AoI2IzUIDgIMAQEBBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxA?=
 =?us-ascii?q?GE4UZE6p2fzMaAoo1gQwoAYt3GHiBB4ERM4psglgEjzKGI0KWGYIplGgbjXw?=
 =?us-ascii?q?Dinctg3+kJgE2gVhNLgqDJ5EUNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2DPAQAYnXFd/1230XZlHgEGBwaBVAgLAQGCFoE/IRIqh?=
 =?us-ascii?q?CGPDFIBBoEROIlcigeFJIF7CQEBAQEBAQEBARsZAQIBAYQ/AoI2IzUIDgIMA?=
 =?us-ascii?q?QEBBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaA?=
 =?us-ascii?q?oo1gQwoAYt3GHiBB4ERM4psglgEjzKGI0KWGYIplGgbjXwDinctg3+kJgE2g?=
 =?us-ascii?q?VhNLgqDJ5EUNjCBBgEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582845"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:39 +0800
Subject: [PATCH 30/32] autofs-5.1.5 - use local getmntent_r() in
 tree_make_mnt_list()
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:39 +0800
Message-ID: <156772701916.5865.3792905274836219456.stgit@mickey.themaw.net>
In-Reply-To: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Change tree_make_mnt_list() to use the local getmntent_r() instead of
the glibc version so that if glibc is changed to support the autofs
"ignore" hint automount(8) won't be affected.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 24620911..05acd16a 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -36,6 +36,7 @@ xx/xx/2019 autofs-5.1.6
 - move unlink_mount_tree() to lib/mounts.c.
 - use local_getmntent_r() for unlink_mount_tree().
 - use local getmntent_r() in get_mnt_list().
+- use local getmntent_r() in tree_make_mnt_list().
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/lib/mounts.c b/lib/mounts.c
index 86382bf3..83d053c8 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1182,16 +1182,16 @@ struct mnt_list *tree_make_mnt_tree(const char *path)
 	size_t plen;
 	int eq;
 
-	tab = open_setmntent_r(_PROC_MOUNTS);
+	tab = open_fopen_r(_PROC_MOUNTS);
 	if (!tab) {
 		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
-		logerr("setmntent: %s", estr);
+		logerr("fopen: %s", estr);
 		return NULL;
 	}
 
 	plen = strlen(path);
 
-	while ((mnt = getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
+	while ((mnt = local_getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
 		size_t len = strlen(mnt->mnt_dir);
 
 		/* Not matching path */
@@ -1283,7 +1283,7 @@ struct mnt_list *tree_make_mnt_tree(const char *path)
 		if (!tree)
 			tree = ent;
 	}
-	endmntent(tab);
+	fclose(tab);
 
 	return tree;
 }

