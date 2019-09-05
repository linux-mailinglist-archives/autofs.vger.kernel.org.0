Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5BFAAF2D
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbfIEXqE (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:04 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387487AbfIEXqE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:04 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DqEgAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXJEmCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzcGDgIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo?=
 =?us-ascii?q?1gQwoAYt3GHiBB4ERM4psglgEjFSCXoYjQpYZgimUaBuNfAOKdy2Df6Q7IoF?=
 =?us-ascii?q?YTS4KO4Jsgk4Xji82MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DqEgAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXJEmCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzcGDgIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo1gQwoAYt3GHiBB?=
 =?us-ascii?q?4ERM4psglgEjFSCXoYjQpYZgimUaBuNfAOKdy2Df6Q7IoFYTS4KO4Jsgk4Xj?=
 =?us-ascii?q?i82MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582653"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:36 +0800
Subject: [PATCH 19/32] autofs-5.1.5 - use bit flags for autofs mount types
 in mnt_list
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:36 +0800
Message-ID: <156772695585.5865.16051661794040820235.stgit@mickey.themaw.net>
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

Several fields in struct mnt_list don't need to be saved as strings
so change to using bit flags for them instead.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 daemon/direct.c   |   10 +++--
 daemon/indirect.c |   16 ++++-----
 include/mounts.h  |    7 ++--
 lib/mounts.c      |   99 +++++++++++------------------------------------------
 5 files changed, 39 insertions(+), 94 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 9c1fe70c..5b0e2b4f 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -25,6 +25,7 @@ xx/xx/2019 autofs-5.1.6
 - fix unlink_mount_tree() not umounting mounts.
 - use ignore option for offset mounts as well.
 - add config option for "ignore" mount option
+- use bit flags for autofs mount types in mnt_list.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index a11801be..b23d0518 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -271,10 +271,10 @@ static int unlink_mount_tree(struct autofs_point *ap, struct list_head *list)
 
 		mnt = list_entry(p, struct mnt_list, list);
 
-		if (strcmp(mnt->fs_type, "autofs"))
-			rv = spawn_umount(ap->logopt, "-l", mnt->path, NULL);
-		else
+		if (mnt->flags & MNTS_AUTOFS)
 			rv = umount2(mnt->path, MNT_DETACH);
+		else
+			rv = spawn_umount(ap->logopt, "-l", mnt->path, NULL);
 		if (rv == -1) {
 			debug(ap->logopt,
 			      "can't unlink %s from mount tree", mnt->path);
@@ -925,7 +925,7 @@ void *expire_proc_direct(void *arg)
 		if (!me)
 			continue;
 
-		if (!strcmp(next->fs_type, "autofs")) {
+		if (next->flags & MNTS_AUTOFS) {
 			struct stat st;
 			int ioctlfd;
 
@@ -936,7 +936,7 @@ void *expire_proc_direct(void *arg)
 			 * one of them and pass on state change.
 			 */
 			pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &cur_state);
-			if (strstr(next->opts, "indirect")) {
+			if (next->flags & MNTS_INDIRECT) {
 				master_notify_submount(ap, next->path, ap->state);
 				pthread_setcancelstate(cur_state, NULL);
 				continue;
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 6f36805f..81844c29 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -48,10 +48,10 @@ static int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
 	ret = 1;
 	this = mnts;
 	while (this) {
-		if (strcmp(this->fs_type, "autofs"))
-			rv = spawn_umount(ap->logopt, "-l", this->path, NULL);
-		else
+		if (this->flags & MNTS_AUTOFS)
 			rv = umount2(this->path, MNT_DETACH);
+		else
+			rv = spawn_umount(ap->logopt, "-l", this->path, NULL);
 		if (rv == -1) {
 			debug(ap->logopt,
 			      "can't unlink %s from mount tree", this->path);
@@ -439,15 +439,15 @@ void *expire_proc_indirect(void *arg)
 		char *ind_key;
 		int ret;
 
-		if (!strcmp(next->fs_type, "autofs")) {
+		if (next->flags & MNTS_AUTOFS) {
 			/*
 			 * If we have submounts check if this path lives below
 			 * one of them and pass on the state change.
 			 */
 			pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &cur_state);
-			if (strstr(next->opts, "indirect"))
+			if (next->flags & MNTS_INDIRECT)
 				master_notify_submount(ap, next->path, ap->state);
-			else if (strstr(next->opts, "offset")) {
+			else if (next->flags & MNTS_OFFSET) {
 				struct map_source *map;
 				struct mapent_cache *mc = NULL;
 				struct mapent *me = NULL;
@@ -567,10 +567,10 @@ void *expire_proc_indirect(void *arg)
 	pthread_cleanup_push(mnts_cleanup, mnts);
 	/* Are there any real mounts left */
 	for (next = mnts; next; next = next->next) {
-		if (strcmp(next->fs_type, "autofs"))
+		if (!(next->flags & MNTS_AUTOFS))
 			count++;
 		else {
-			if (strstr(next->opts, "indirect"))
+			if (next->flags & MNTS_INDIRECT)
 				submnts++;
 			else
 				offsets++;
diff --git a/include/mounts.h b/include/mounts.h
index 0cb4a89a..0a7dd3d6 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -35,6 +35,9 @@
 #define MNTS_ALL	0x0001
 #define MNTS_REAL	0x0002
 #define MNTS_AUTOFS	0x0004
+#define MNTS_INDIRECT	0x0008
+#define MNTS_DIRECT	0x0010
+#define MNTS_OFFSET	0x0020
 
 #define REMOUNT_SUCCESS		0x0000
 #define REMOUNT_FAIL		0x0001
@@ -50,9 +53,7 @@ struct mapent;
 
 struct mnt_list {
 	char *path;
-	char *fs_name;
-	char *fs_type;
-	char *opts;
+	unsigned int flags;
 	/*
 	 * List operations ie. get_mnt_list.
 	 */
diff --git a/lib/mounts.c b/lib/mounts.c
index 45f1faa3..a731a5f2 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -855,29 +855,17 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 		}
 		strcpy(ent->path, mnt->mnt_dir);
 
-		ent->fs_name = malloc(strlen(mnt->mnt_fsname) + 1);
-		if (!ent->fs_name) {
-			endmntent(tab);
-			free_mnt_list(list);
-			return NULL;
-		}
-		strcpy(ent->fs_name, mnt->mnt_fsname);
-
-		ent->fs_type = malloc(strlen(mnt->mnt_type) + 1);
-		if (!ent->fs_type) {
-			endmntent(tab);
-			free_mnt_list(list);
-			return NULL;
+		if (!strcmp(mnt->mnt_type, "autofs"))
+			ent->flags |= MNTS_AUTOFS;
+
+		if (ent->flags & MNTS_AUTOFS) {
+			if (strstr(mnt->mnt_opts, "indirect"))
+				ent->flags |= MNTS_INDIRECT;
+			else if (strstr(mnt->mnt_opts, "direct"))
+				ent->flags |= MNTS_DIRECT;
+			else if (strstr(mnt->mnt_opts, "offset"))
+				ent->flags |= MNTS_OFFSET;
 		}
-		strcpy(ent->fs_type, mnt->mnt_type);
-
-		ent->opts = malloc(strlen(mnt->mnt_opts) + 1);
-		if (!ent->opts) {
-			endmntent(tab);
-			free_mnt_list(list);
-			return NULL;
-		}
-		strcpy(ent->opts, mnt->mnt_opts);
 	}
 	endmntent(tab);
 
@@ -900,15 +888,6 @@ void free_mnt_list(struct mnt_list *list)
 		if (this->path)
 			free(this->path);
 
-		if (this->fs_name)
-			free(this->fs_name);
-
-		if (this->fs_type)
-			free(this->fs_type);
-
-		if (this->opts)
-			free(this->opts);
-
 		free(this);
 	}
 }
@@ -1028,22 +1007,11 @@ void tree_free_mnt_tree(struct mnt_list *tree)
 		list_del(&this->self);
 
 		free(this->path);
-		free(this->fs_name);
-		free(this->fs_type);
-
-		if (this->opts)
-			free(this->opts);
 
 		free(this);
 	}
 
 	free(tree->path);
-	free(tree->fs_name);
-	free(tree->fs_type);
-
-	if (tree->opts)
-		free(tree->opts);
-
 	free(tree);
 }
 
@@ -1103,38 +1071,17 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 		}
 		strcpy(ent->path, mnt->mnt_dir);
 
-		ent->fs_name = malloc(strlen(mnt->mnt_fsname) + 1);
-		if (!ent->fs_name) {
-			free(ent->path);
-			free(ent);
-			endmntent(tab);
-			tree_free_mnt_tree(tree);
-			return NULL;
-		}
-		strcpy(ent->fs_name, mnt->mnt_fsname);
-
-		ent->fs_type = malloc(strlen(mnt->mnt_type) + 1);
-		if (!ent->fs_type) {
-			free(ent->fs_name);
-			free(ent->path);
-			free(ent);
-			endmntent(tab);
-			tree_free_mnt_tree(tree);
-			return NULL;
-		}
-		strcpy(ent->fs_type, mnt->mnt_type);
+		if (!strcmp(mnt->mnt_type, "autofs"))
+			ent->flags |= MNTS_AUTOFS;
 
-		ent->opts = malloc(strlen(mnt->mnt_opts) + 1);
-		if (!ent->opts) {
-			free(ent->fs_type);
-			free(ent->fs_name);
-			free(ent->path);
-			free(ent);
-			endmntent(tab);
-			tree_free_mnt_tree(tree);
-			return NULL;
+		if (ent->flags & MNTS_AUTOFS) {
+			if (strstr(mnt->mnt_opts, "indirect"))
+				ent->flags |= MNTS_INDIRECT;
+			else if (strstr(mnt->mnt_opts, "direct"))
+				ent->flags |= MNTS_DIRECT;
+			else if (strstr(mnt->mnt_opts, "offset"))
+				ent->flags |= MNTS_OFFSET;
 		}
-		strcpy(ent->opts, mnt->mnt_opts);
 
 		mptr = tree;
 		while (mptr) {
@@ -1347,17 +1294,13 @@ int tree_is_mounted(struct mnt_list *mnts, const char *path, unsigned int type)
 		mptr = list_entry(p, struct mnt_list, entries);
 
 		if (type) {
-			unsigned int autofs_fs;
-
-			autofs_fs = !strcmp(mptr->fs_type, "autofs");
-
 			if (type & MNTS_REAL) {
-				if (!autofs_fs) {
+				if (mptr->flags & MNTS_AUTOFS) {
 					mounted = 1;
 					break;
 				}
 			} else if (type & MNTS_AUTOFS) {
-				if (autofs_fs) {
+				if (mptr->flags & MNTS_AUTOFS) {
 					mounted = 1;
 					break;
 				}

