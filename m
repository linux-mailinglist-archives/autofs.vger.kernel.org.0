Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D97DFAAF2A
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733080AbfIEXqB (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:01 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48906
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725921AbfIEXqB (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:01 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 19:45:55 EDT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DrFAAYnXFd/1230XZlghuCFoE/IRI?=
 =?us-ascii?q?qhCGPDFIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo?=
 =?us-ascii?q?1gQwoAYt3GHiBB4ERM4psglgEjFSCXoYjQpYZgimUaBuNfAOKdy2Df6Q8IYF?=
 =?us-ascii?q?YTS4KO4JskRQ2MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DrFAAYnXFd/1230XZlghuCFoE/IRIqhCGPDFIBBoERO?=
 =?us-ascii?q?IlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo1gQwoAYt3GHiBB?=
 =?us-ascii?q?4ERM4psglgEjFSCXoYjQpYZgimUaBuNfAOKdy2Df6Q8IYFYTS4KO4JskRQ2M?=
 =?us-ascii?q?IEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582609"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:19 +0800
Subject: [PATCH 16/32] autofs-5.1.5 - fix unlink_mount_tree() not umounting
 mounts
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:19 +0800
Message-ID: <156772693912.5865.2167305582960499742.stgit@mickey.themaw.net>
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

At some point a check matching process group id of mounts was added to
the unlink_mount_tree() function so that mounts not matching the group
id of the calling process would be skipped.

But unlink_mount_tree() is meant to force a cleanup of mounts from a
previous automount process so the process group of the current process
can never match so all mounts are skipped.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 daemon/direct.c   |    7 -------
 daemon/indirect.c |    9 ---------
 include/mounts.h  |    1 -
 lib/mounts.c      |   20 --------------------
 5 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index ecfbd2c9..5c255756 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -22,6 +22,7 @@ xx/xx/2019 autofs-5.1.6
 - remove unused function reverse_mnt_list().
 - remove a couple of old debug messages.
 - fix amd entry memory leak.
+- fix unlink_mount_tree() not umounting mounts.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index 1c7a9a5c..5b532a53 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -264,10 +264,6 @@ static int unlink_mount_tree(struct autofs_point *ap, struct list_head *list)
 {
 	struct list_head *p;
 	int rv, ret;
-	pid_t pgrp = getpgrp();
-	char spgrp[20];
-
-	sprintf(spgrp, "pgrp=%d", pgrp);
 
 	ret = 1;
 	list_for_each(p, list) {
@@ -275,9 +271,6 @@ static int unlink_mount_tree(struct autofs_point *ap, struct list_head *list)
 
 		mnt = list_entry(p, struct mnt_list, list);
 
-		if (strstr(mnt->opts, spgrp))
-			continue;
-
 		if (strcmp(mnt->fs_type, "autofs"))
 			rv = spawn_umount(ap->logopt, "-l", mnt->path, NULL);
 		else
diff --git a/daemon/indirect.c b/daemon/indirect.c
index e19c0bbf..6f36805f 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -44,19 +44,10 @@ static int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
 {
 	struct mnt_list *this;
 	int rv, ret;
-	pid_t pgrp = getpgrp();
-	char spgrp[20];
-
-	sprintf(spgrp, "pgrp=%d", pgrp);
 
 	ret = 1;
 	this = mnts;
 	while (this) {
-		if (strstr(this->opts, spgrp)) {
-			this = this->next;
-			continue;
-		}
-
 		if (strcmp(this->fs_type, "autofs"))
 			rv = spawn_umount(ap->logopt, "-l", this->path, NULL);
 		else
diff --git a/include/mounts.h b/include/mounts.h
index ec85ae94..0cb4a89a 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -53,7 +53,6 @@ struct mnt_list {
 	char *fs_name;
 	char *fs_type;
 	char *opts;
-	pid_t owner;
 	/*
 	 * List operations ie. get_mnt_list.
 	 */
diff --git a/lib/mounts.c b/lib/mounts.c
index 4bc7a4d2..45f1faa3 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -798,7 +798,6 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 	struct mntent *mnt;
 	struct mnt_list *ent, *mptr, *last;
 	struct mnt_list *list = NULL;
-	char *pgrp;
 	size_t len;
 
 	if (!path || !pathlen || pathlen > PATH_MAX)
@@ -879,15 +878,6 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 			return NULL;
 		}
 		strcpy(ent->opts, mnt->mnt_opts);
-
-		ent->owner = 0;
-		pgrp = strstr(mnt->mnt_opts, "pgrp=");
-		if (pgrp) {
-			char *end = strchr(pgrp, ',');
-			if (end)
-				*end = '\0';
-			sscanf(pgrp, "pgrp=%d", &ent->owner);
-		}
 	}
 	endmntent(tab);
 
@@ -1068,7 +1058,6 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 	struct mntent *mnt;
 	struct mnt_list *ent, *mptr;
 	struct mnt_list *tree = NULL;
-	char *pgrp;
 	size_t plen;
 	int eq;
 
@@ -1147,15 +1136,6 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 		}
 		strcpy(ent->opts, mnt->mnt_opts);
 
-		ent->owner = 0;
-		pgrp = strstr(mnt->mnt_opts, "pgrp=");
-		if (pgrp) {
-			char *end = strchr(pgrp, ',');
-			if (end)
-				*end = '\0';
-			sscanf(pgrp, "pgrp=%d", &ent->owner);
-		}
-
 		mptr = tree;
 		while (mptr) {
 			int elen = strlen(ent->path);

