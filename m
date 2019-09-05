Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8381AAF2E
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387949AbfIEXqG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:06 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48934
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732047AbfIEXqG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:06 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DnFAAYnXFd/1230XZlghuCFoE/IRI?=
 =?us-ascii?q?qhCGPDFIBBoEROIlckSYJAQEBAQEBAQEBGxkBAgEBhD8CgjYjOBMCDAEBAQQ?=
 =?us-ascii?q?BAQEBAQYDAW2Ea09CARABhHcGIwRiGA0CGA4CAkcQBhOFGROqdn8zGgKKNYE?=
 =?us-ascii?q?MKAGLdxh4gQeBETOKbIJYBIxUgl6GI0KWGYIplGgbjXwDinctg3+kPCGBWE0?=
 =?us-ascii?q?uCjuCbIJOF44vNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2DnFAAYnXFd/1230XZlghuCFoE/IRIqhCGPDFIBBoERO?=
 =?us-ascii?q?IlckSYJAQEBAQEBAQEBGxkBAgEBhD8CgjYjOBMCDAEBAQQBAQEBAQYDAW2Ea?=
 =?us-ascii?q?09CARABhHcGIwRiGA0CGA4CAkcQBhOFGROqdn8zGgKKNYEMKAGLdxh4gQeBE?=
 =?us-ascii?q?TOKbIJYBIxUgl6GI0KWGYIplGgbjXwDinctg3+kPCGBWE0uCjuCbIJOF44vN?=
 =?us-ascii?q?jCBBgEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582664"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:42 +0800
Subject: [PATCH 20/32] autofs-5.1.5 - use mp instead of path in mnt_list
 entries
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:42 +0800
Message-ID: <156772696174.5865.1690939887345398622.stgit@mickey.themaw.net>
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

Use the simpler, more instructive mp instead of path in the
mnt_list structure.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 daemon/direct.c   |   18 +++++++-------
 daemon/indirect.c |   22 ++++++++---------
 include/mounts.h  |    4 ++-
 lib/mounts.c      |   70 +++++++++++++++++++++++++++--------------------------
 5 files changed, 58 insertions(+), 57 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 5b0e2b4f..a37862a8 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -26,6 +26,7 @@ xx/xx/2019 autofs-5.1.6
 - use ignore option for offset mounts as well.
 - add config option for "ignore" mount option
 - use bit flags for autofs mount types in mnt_list.
+- use mp instead of path in mnt_list entries.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index b23d0518..43a817d0 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -272,12 +272,12 @@ static int unlink_mount_tree(struct autofs_point *ap, struct list_head *list)
 		mnt = list_entry(p, struct mnt_list, list);
 
 		if (mnt->flags & MNTS_AUTOFS)
-			rv = umount2(mnt->path, MNT_DETACH);
+			rv = umount2(mnt->mp, MNT_DETACH);
 		else
-			rv = spawn_umount(ap->logopt, "-l", mnt->path, NULL);
+			rv = spawn_umount(ap->logopt, "-l", mnt->mp, NULL);
 		if (rv == -1) {
 			debug(ap->logopt,
-			      "can't unlink %s from mount tree", mnt->path);
+			      "can't unlink %s from mount tree", mnt->mp);
 
 			switch (errno) {
 			case EINVAL:
@@ -920,7 +920,7 @@ void *expire_proc_direct(void *arg)
 		 */
 		pthread_cleanup_push(master_source_lock_cleanup, ap->entry);
 		master_source_readlock(ap->entry);
-		me = lookup_source_mapent(ap, next->path, LKP_DISTINCT);
+		me = lookup_source_mapent(ap, next->mp, LKP_DISTINCT);
 		pthread_cleanup_pop(1);
 		if (!me)
 			continue;
@@ -937,7 +937,7 @@ void *expire_proc_direct(void *arg)
 			 */
 			pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &cur_state);
 			if (next->flags & MNTS_INDIRECT) {
-				master_notify_submount(ap, next->path, ap->state);
+				master_notify_submount(ap, next->mp, ap->state);
 				pthread_setcancelstate(cur_state, NULL);
 				continue;
 			}
@@ -968,7 +968,7 @@ void *expire_proc_direct(void *arg)
 			cache_writelock(me->mc);
 			if (me->ioctlfd != -1 && 
 			    fstat(me->ioctlfd, &st) != -1 &&
-			    !count_mounts(ap, next->path, st.st_dev)) {
+			    !count_mounts(ap, next->mp, st.st_dev)) {
 				ops->close(ap->logopt, me->ioctlfd);
 				me->ioctlfd = -1;
 				cache_unlock(me->mc);
@@ -979,7 +979,7 @@ void *expire_proc_direct(void *arg)
 
 			ioctlfd = me->ioctlfd;
 
-			ret = ops->expire(ap->logopt, ioctlfd, next->path, how);
+			ret = ops->expire(ap->logopt, ioctlfd, next->mp, how);
 			if (ret) {
 				left++;
 				pthread_setcancelstate(cur_state, NULL);
@@ -1002,10 +1002,10 @@ void *expire_proc_direct(void *arg)
 		if (ap->state == ST_EXPIRE || ap->state == ST_PRUNE)
 			pthread_testcancel();
 
-		debug(ap->logopt, "send expire to trigger %s", next->path);
+		debug(ap->logopt, "send expire to trigger %s", next->mp);
 
 		pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &cur_state);
-		ret = ops->expire(ap->logopt, ioctlfd, next->path, how);
+		ret = ops->expire(ap->logopt, ioctlfd, next->mp, how);
 		if (ret)
 			left++;
 		pthread_setcancelstate(cur_state, NULL);
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 81844c29..dd80288a 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -49,12 +49,12 @@ static int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
 	this = mnts;
 	while (this) {
 		if (this->flags & MNTS_AUTOFS)
-			rv = umount2(this->path, MNT_DETACH);
+			rv = umount2(this->mp, MNT_DETACH);
 		else
-			rv = spawn_umount(ap->logopt, "-l", this->path, NULL);
+			rv = spawn_umount(ap->logopt, "-l", this->mp, NULL);
 		if (rv == -1) {
 			debug(ap->logopt,
-			      "can't unlink %s from mount tree", this->path);
+			      "can't unlink %s from mount tree", this->mp);
 
 			switch (errno) {
 			case EINVAL:
@@ -446,7 +446,7 @@ void *expire_proc_indirect(void *arg)
 			 */
 			pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &cur_state);
 			if (next->flags & MNTS_INDIRECT)
-				master_notify_submount(ap, next->path, ap->state);
+				master_notify_submount(ap, next->mp, ap->state);
 			else if (next->flags & MNTS_OFFSET) {
 				struct map_source *map;
 				struct mapent_cache *mc = NULL;
@@ -454,13 +454,13 @@ void *expire_proc_indirect(void *arg)
 				struct stat st;
 
 				/* It's got a mount, deal with in the outer loop */
-				if (is_mounted(_PATH_MOUNTED, next->path, MNTS_REAL)) {
+				if (is_mounted(_PATH_MOUNTED, next->mp, MNTS_REAL)) {
 					pthread_setcancelstate(cur_state, NULL);
 					continue;
 				}
 
 				/* Don't touch submounts */
-				if (master_find_submount(ap, next->path)) {
+				if (master_find_submount(ap, next->mp)) {
 					pthread_setcancelstate(cur_state, NULL);
 					continue;
 				}
@@ -471,7 +471,7 @@ void *expire_proc_indirect(void *arg)
 				while (map) {
 					mc = map->mc;
 					cache_writelock(mc);
-					me = cache_lookup_distinct(mc, next->path);
+					me = cache_lookup_distinct(mc, next->mp);
 					if (me)
 						break;
 					cache_unlock(mc);
@@ -513,7 +513,7 @@ void *expire_proc_indirect(void *arg)
 		 * If the mount corresponds to an offset trigger then
 		 * the key is the path, otherwise it's the last component.
 		 */
-		ind_key = strrchr(next->path, '/');
+		ind_key = strrchr(next->mp, '/');
 		if (ind_key)
 			ind_key++;
 
@@ -526,7 +526,7 @@ void *expire_proc_indirect(void *arg)
 		 */
 		pthread_cleanup_push(master_source_lock_cleanup, ap->entry);
 		master_source_readlock(ap->entry);
-		me = lookup_source_mapent(ap, next->path, LKP_DISTINCT);
+		me = lookup_source_mapent(ap, next->mp, LKP_DISTINCT);
 		if (!me && ind_key)
 			me = lookup_source_mapent(ap, ind_key, LKP_NORMAL);
 		pthread_cleanup_pop(1);
@@ -538,10 +538,10 @@ void *expire_proc_indirect(void *arg)
 			cache_unlock(me->mc);
 		}
 
-		debug(ap->logopt, "expire %s", next->path);
+		debug(ap->logopt, "expire %s", next->mp);
 
 		pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &cur_state);
-		ret = ops->expire(ap->logopt, ioctlfd, next->path, how);
+		ret = ops->expire(ap->logopt, ioctlfd, next->mp, how);
 		if (ret)
 			left++;
 		pthread_setcancelstate(cur_state, NULL);
diff --git a/include/mounts.h b/include/mounts.h
index 0a7dd3d6..657fc10d 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -52,7 +52,7 @@ extern const unsigned int t_offset;
 struct mapent;
 
 struct mnt_list {
-	char *path;
+	char *mp;
 	unsigned int flags;
 	/*
 	 * List operations ie. get_mnt_list.
@@ -101,7 +101,7 @@ int ext_mount_remove(struct list_head *, const char *);
 int ext_mount_inuse(const char *);
 struct mnt_list *get_mnt_list(const char *table, const char *path, int include);
 void free_mnt_list(struct mnt_list *list);
-int is_mounted(const char *table, const char *path, unsigned int type);
+int is_mounted(const char *table, const char *mp, unsigned int type);
 void tree_free_mnt_tree(struct mnt_list *tree);
 struct mnt_list *tree_make_mnt_tree(const char *table, const char *path);
 int tree_get_mnt_list(struct mnt_list *mnts, struct list_head *list, const char *path, int include);
diff --git a/lib/mounts.c b/lib/mounts.c
index a731a5f2..609546e1 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -817,8 +817,8 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 	  	     strncmp(mnt->mnt_dir, path, pathlen) != 0)
 			continue;
 
-		/* Not a subdirectory of requested path ? */
-		/* pathlen == 1 => everything is subdir    */
+		/* Not a subdirectory of requested mp? */
+		/* mp_len == 1 => everything is subdir    */
 		if (pathlen > 1 && len > pathlen &&
 				mnt->mnt_dir[pathlen] != '/')
 			continue;
@@ -834,7 +834,7 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 		mptr = list;
 		last = NULL;
 		while (mptr) {
-			if (len >= strlen(mptr->path))
+			if (len >= strlen(mptr->mp))
 				break;
 			last = mptr;
 			mptr = mptr->next;
@@ -847,13 +847,13 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 
 		ent->next = mptr;
 
-		ent->path = malloc(len + 1);
-		if (!ent->path) {
+		ent->mp = malloc(len + 1);
+		if (!ent->mp) {
 			endmntent(tab);
 			free_mnt_list(list);
 			return NULL;
 		}
-		strcpy(ent->path, mnt->mnt_dir);
+		strcpy(ent->mp, mnt->mnt_dir);
 
 		if (!strcmp(mnt->mnt_type, "autofs"))
 			ent->flags |= MNTS_AUTOFS;
@@ -885,23 +885,23 @@ void free_mnt_list(struct mnt_list *list)
 
 		next = this->next;
 
-		if (this->path)
-			free(this->path);
+		if (this->mp)
+			free(this->mp);
 
 		free(this);
 	}
 }
 
-static int table_is_mounted(const char *table, const char *path, unsigned int type)
+static int table_is_mounted(const char *table, const char *mp, unsigned int type)
 {
 	struct mntent *mnt;
 	struct mntent mnt_wrk;
 	char buf[PATH_MAX * 3];
-	size_t pathlen = strlen(path);
+	size_t mp_len = strlen(mp);
 	FILE *tab;
 	int ret = 0;
 
-	if (!path || !pathlen || pathlen >= PATH_MAX)
+	if (!mp || !mp_len || mp_len >= PATH_MAX)
 		return 0;
 
 	tab = open_setmntent_r(table);
@@ -928,7 +928,7 @@ static int table_is_mounted(const char *table, const char *path, unsigned int ty
 					continue;
 		}
 
-		if (pathlen == len && !strncmp(path, mnt->mnt_dir, pathlen)) {
+		if (mp_len == len && !strncmp(mp, mnt->mnt_dir, mp_len)) {
 			ret = 1;
 			break;
 		}
@@ -938,7 +938,7 @@ static int table_is_mounted(const char *table, const char *path, unsigned int ty
 	return ret;
 }
 
-static int ioctl_is_mounted(const char *table, const char *path, unsigned int type)
+static int ioctl_is_mounted(const char *table, const char *mp, unsigned int type)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 	unsigned int mounted;
@@ -947,9 +947,9 @@ static int ioctl_is_mounted(const char *table, const char *path, unsigned int ty
 	/* If the ioctl fails fall back to the potentially resource
 	 * intensive mount table check.
 	 */
-	ret = ops->ismountpoint(LOGOPT_NONE, -1, path, &mounted);
+	ret = ops->ismountpoint(LOGOPT_NONE, -1, mp, &mounted);
 	if (ret == -1)
-		return table_is_mounted(table, path, type);
+		return table_is_mounted(table, mp, type);
 
 	if (mounted) {
 		switch (type) {
@@ -964,14 +964,14 @@ static int ioctl_is_mounted(const char *table, const char *path, unsigned int ty
 	return 0;
 }
 
-int is_mounted(const char *table, const char *path, unsigned int type)
+int is_mounted(const char *table, const char *mp, unsigned int type)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 
 	if (ops->ismountpoint)
-		return ioctl_is_mounted(table, path, type);
+		return ioctl_is_mounted(table, mp, type);
 	else
-		return table_is_mounted(table, path, type);
+		return table_is_mounted(table, mp, type);
 }
 
 /*
@@ -1006,12 +1006,12 @@ void tree_free_mnt_tree(struct mnt_list *tree)
 
 		list_del(&this->self);
 
-		free(this->path);
+		free(this->mp);
 
 		free(this);
 	}
 
-	free(tree->path);
+	free(tree->mp);
 	free(tree);
 }
 
@@ -1062,14 +1062,14 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 		INIT_LIST_HEAD(&ent->entries);
 		INIT_LIST_HEAD(&ent->sublist);
 
-		ent->path = malloc(len + 1);
-		if (!ent->path) {
+		ent->mp = malloc(len + 1);
+		if (!ent->mp) {
 			endmntent(tab);
 			free(ent);
 			tree_free_mnt_tree(tree);
 			return NULL;
 		}
-		strcpy(ent->path, mnt->mnt_dir);
+		strcpy(ent->mp, mnt->mnt_dir);
 
 		if (!strcmp(mnt->mnt_type, "autofs"))
 			ent->flags |= MNTS_AUTOFS;
@@ -1085,8 +1085,8 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 
 		mptr = tree;
 		while (mptr) {
-			int elen = strlen(ent->path);
-			int mlen = strlen(mptr->path);
+			int elen = strlen(ent->mp);
+			int mlen = strlen(mptr->mp);
 
 			if (elen < mlen) {
 				if (mptr->left) {
@@ -1106,7 +1106,7 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 				}
 			}
 
-			eq = strcmp(ent->path, mptr->path);
+			eq = strcmp(ent->mp, mptr->mp);
 			if (eq < 0) {
 				if (mptr->left)
 					mptr = mptr->left;
@@ -1146,7 +1146,7 @@ int tree_get_mnt_list(struct mnt_list *mnts, struct list_head *list, const char
 		return 0;
 
 	plen = strlen(path);
-	mlen = strlen(mnts->path);
+	mlen = strlen(mnts->mp);
 	if (mlen < plen)
 		return tree_get_mnt_list(mnts->right, list, path, include);
 	else {
@@ -1155,10 +1155,10 @@ int tree_get_mnt_list(struct mnt_list *mnts, struct list_head *list, const char
 		tree_get_mnt_list(mnts->left, list, path, include);
 
 		if ((!include && mlen <= plen) ||
-				strncmp(mnts->path, path, plen))
+				strncmp(mnts->mp, path, plen))
 			goto skip;
 
-		if (plen > 1 && mlen > plen && mnts->path[plen] != '/')
+		if (plen > 1 && mlen > plen && mnts->mp[plen] != '/')
 			goto skip;
 
 		INIT_LIST_HEAD(&mnts->list);
@@ -1193,7 +1193,7 @@ int tree_get_mnt_sublist(struct mnt_list *mnts, struct list_head *list, const ch
 		return 0;
 
 	plen = strlen(path);
-	mlen = strlen(mnts->path);
+	mlen = strlen(mnts->mp);
 	if (mlen < plen)
 		return tree_get_mnt_sublist(mnts->right, list, path, include);
 	else {
@@ -1202,10 +1202,10 @@ int tree_get_mnt_sublist(struct mnt_list *mnts, struct list_head *list, const ch
 		tree_get_mnt_sublist(mnts->left, list, path, include);
 
 		if ((!include && mlen <= plen) ||
-				strncmp(mnts->path, path, plen))
+				strncmp(mnts->mp, path, plen))
 			goto skip;
 
-		if (plen > 1 && mlen > plen && mnts->path[plen] != '/')
+		if (plen > 1 && mlen > plen && mnts->mp[plen] != '/')
 			goto skip;
 
 		INIT_LIST_HEAD(&mnts->sublist);
@@ -1237,7 +1237,7 @@ int tree_find_mnt_ents(struct mnt_list *mnts, struct list_head *list, const char
 		return 0;
 
 	plen = strlen(path);
-	mlen = strlen(mnts->path);
+	mlen = strlen(mnts->mp);
 	if (mlen < plen)
 		return tree_find_mnt_ents(mnts->right, list, path);
 	else if (mlen > plen)
@@ -1247,7 +1247,7 @@ int tree_find_mnt_ents(struct mnt_list *mnts, struct list_head *list, const char
 
 		tree_find_mnt_ents(mnts->left, list, path);
 
-		if (!strcmp(mnts->path, path)) {
+		if (!strcmp(mnts->mp, path)) {
 			INIT_LIST_HEAD(&mnts->entries);
 			list_add(&mnts->entries, list);
 		}
@@ -1258,7 +1258,7 @@ int tree_find_mnt_ents(struct mnt_list *mnts, struct list_head *list, const char
 
 			this = list_entry(p, struct mnt_list, self);
 
-			if (!strcmp(this->path, path)) {
+			if (!strcmp(this->mp, path)) {
 				INIT_LIST_HEAD(&this->entries);
 				list_add(&this->entries, list);
 			}

