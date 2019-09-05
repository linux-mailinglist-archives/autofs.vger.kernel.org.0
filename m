Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BE8AAF36
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389647AbfIEXqd (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:33 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389423AbfIEXqd (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:33 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DjFAAYnXFd/1230XZlHgEGBwaBZwK?=
 =?us-ascii?q?CFoE/IRIqhCGPDFIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM?=
 =?us-ascii?q?4EwIMAQEBBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p?=
 =?us-ascii?q?2fzMaAoo1gQwoAYt3GHiBB4ERM4psglgEjEoKgl6GI0JulSuCKZRoG418A4p?=
 =?us-ascii?q?3LYN/pDwhgVhNLgo7gmyCTheOLzYwgQYBAYQ8iggBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DjFAAYnXFd/1230XZlHgEGBwaBZwKCFoE/IRIqhCGPD?=
 =?us-ascii?q?FIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQEBBAEBA?=
 =?us-ascii?q?QEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo1gQwoA?=
 =?us-ascii?q?Yt3GHiBB4ERM4psglgEjEoKgl6GI0JulSuCKZRoG418A4p3LYN/pDwhgVhNL?=
 =?us-ascii?q?go7gmyCTheOLzYwgQYBAYQ8iggBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582797"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:28 +0800
Subject: [PATCH 28/32] autofs-5.1.5 - use local_getmntent_r() for
 unlink_mount_tree()
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:28 +0800
Message-ID: <156772700775.5865.3142895705083953701.stgit@mickey.themaw.net>
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

Now that unlink_mount_tree() is located in a single location and
only one function is used for this, change it to use our local
getmntent_r() function so that if glibc is changed to support the
autofs "ignore" hint automount(8) won't be affected.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 daemon/direct.c   |   24 ++++++------------------
 daemon/indirect.c |   17 ++++++-----------
 include/mounts.h  |    2 +-
 lib/mounts.c      |   45 ++++++++++++++++++++++++++++++++++-----------
 5 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 023bfdf7..c73dc4ea 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -34,6 +34,7 @@ xx/xx/2019 autofs-5.1.6
 - don't use tree_is_mounted() for mounted checks.
 - use single unlink_umount_tree() for both direct and indirect mounts.
 - move unlink_mount_tree() to lib/mounts.c.
+- use local_getmntent_r() for unlink_mount_tree().
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index 1cc66237..b82d6e95 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -286,8 +286,6 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 		if (ret == 0)
 			return -1;
 	} else {
-		struct mnt_list *mnts;
-
 		if (ap->state == ST_READMAP && is_mounted(me->key, MNTS_ALL)) {
 			time_t tout = get_exp_timeout(ap, me->source);
 			int save_ioctlfd, ioctlfd;
@@ -313,22 +311,12 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 			return 0;
 		}
 
-		mnts = get_mnt_list(me->key, 1);
-		if (mnts) {
-			/*
-			 * A return of 1 indicates we successfully unlinked
-			 * the mount tree if there was one. A return of 0
-			 * indicates we failed to unlink the mount tree so
-			 * we have to return a failure.
-			 */
-			ret = unlink_mount_tree(ap, mnts);
-			free_mnt_list(mnts);
-			if (!ret) {
-				error(ap->logopt,
-				      "already mounted as other than autofs "
-				      "or failed to unlink entry in tree");
-				return -1;
-			}
+		ret = unlink_mount_tree(ap, ap->path);
+		if (!ret) {
+			error(ap->logopt,
+			     "already mounted as other than autofs "
+			     "or failed to unlink entry in tree");
+			goto out_err;
 		}
 
 		if (me->ioctlfd != -1) {
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 1ef481ee..32257323 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -50,7 +50,6 @@ static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
 	const char *map_name = hosts_map_name;
 	const char *type;
 	struct stat st;
-	struct mnt_list *mnts;
 	int ret;
 	int err;
 
@@ -70,16 +69,12 @@ static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
 		if (ret == 0)
 			return -1;
 	} else {
-		mnts = get_mnt_list(ap->path, 1);
-		if (mnts) {
-			ret = unlink_mount_tree(ap, mnts);
-			free_mnt_list(mnts);
-			if (!ret) {
-				error(ap->logopt,
-				      "already mounted as other than autofs "
-				      "or failed to unlink entry in tree");
-				goto out_err;
-			}
+		ret = unlink_mount_tree(ap, ap->path);
+		if (!ret) {
+			error(ap->logopt,
+			      "already mounted as other than autofs "
+			      "or failed to unlink entry in tree");
+			goto out_err;
 		}
 	}
 
diff --git a/include/mounts.h b/include/mounts.h
index 27a224c7..1214aed9 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -100,7 +100,7 @@ int ext_mount_add(struct list_head *, const char *, unsigned int);
 int ext_mount_remove(struct list_head *, const char *);
 int ext_mount_inuse(const char *);
 struct mnt_list *get_mnt_list(const char *path, int include);
-int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts);
+int unlink_mount_tree(struct autofs_point *ap, const char *mp);
 void free_mnt_list(struct mnt_list *list);
 int is_mounted(const char *mp, unsigned int type);
 void tree_free_mnt_tree(struct mnt_list *tree);
diff --git a/lib/mounts.c b/lib/mounts.c
index 64924737..1b24e52d 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -881,21 +881,44 @@ local_getmntent_r(FILE *tab, struct mntent *mnt, char *buf, int size)
 	return mnt;
 }
 
-int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
+int unlink_mount_tree(struct autofs_point *ap, const char *mp)
 {
-	struct mnt_list *this;
-	int rv, ret;
+	FILE *tab;
+	struct mntent *mnt;
+	struct mntent mnt_wrk;
+	char buf[PATH_MAX * 3];
+	unsigned int mp_len = strlen(mp);
+	int rv, ret = 1;
 
-	ret = 1;
-	this = mnts;
-	while (this) {
-		if (this->flags & MNTS_AUTOFS)
-			rv = umount2(this->mp, MNT_DETACH);
+	tab = open_fopen_r(_PROC_MOUNTS);
+	if (!tab) {
+		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
+		logerr("fopen: %s", estr);
+		return 0;
+	}
+
+	while ((mnt = local_getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
+		unsigned int mnt_dir_len;
+		int is_autofs;
+
+		if (strncmp(mnt->mnt_dir, mp, mp_len))
+			continue;
+
+		mnt_dir_len = strlen(mnt->mnt_dir);
+		is_autofs = !strcmp(mnt->mnt_type, "autofs");
+
+		if (mnt_dir_len == mp_len && !is_autofs) {
+			ret = 0;
+			break;
+		}
+
+		if (is_autofs)
+			rv = umount2(mnt->mnt_dir, MNT_DETACH);
 		else
-			rv = spawn_umount(ap->logopt, "-l", this->mp, NULL);
+			rv = spawn_umount(ap->logopt, "-l", mnt->mnt_dir, NULL);
 		if (rv == -1) {
 			debug(ap->logopt,
-			      "can't unlink %s from mount tree", this->mp);
+			      "can't unlink %s from mount tree", mnt->mnt_dir);
 
 			switch (errno) {
 			case EINVAL:
@@ -910,8 +933,8 @@ int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
 				break;
 			}
 		}
-		this = this->next;
 	}
+	fclose(tab);
 
 	return ret;
 }

