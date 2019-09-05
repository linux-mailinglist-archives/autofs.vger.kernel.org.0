Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27DF0AAF31
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388624AbfIEXqI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:08 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48906
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387487AbfIEXqI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:08 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 19:45:55 EDT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DvFAAYnXFd/1230XZlghuBZy+BPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBEThriHGRJgkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo?=
 =?us-ascii?q?1gQwoAYt3GHiBB4ERM4IqiEKCWASMSgqCXoVFXkJulSuCKYwDiGUbgjSLSAM?=
 =?us-ascii?q?Qimctg3+kPCGBWE0uCjuCbIJOF44vNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2DvFAAYnXFd/1230XZlghuBZy+BPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?ThriHGRJgkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p2fzMaAoo1gQwoAYt3GHiBB?=
 =?us-ascii?q?4ERM4IqiEKCWASMSgqCXoVFXkJulSuCKYwDiGUbgjSLSAMQimctg3+kPCGBW?=
 =?us-ascii?q?E0uCjuCbIJOF44vNjCBBgEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582675"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:48 +0800
Subject: [PATCH 21/32] autofs-5.1.5 - always use PROC_MOUNTS to make mount
 lists
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:48 +0800
Message-ID: <156772696745.5865.4187387096815254650.stgit@mickey.themaw.net>
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

If it's necessary to read a mount table then always use the proc file
system mount table.

This could be very inefficient for cases where the mtab (_PATH_MOUNTED)
is specified but the mtab has been a symlink to the proc mount tables
for quite a while now so it doesn't make any difference always using
the proc tables.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG           |    1 +
 daemon/automount.c  |    6 +++---
 daemon/direct.c     |   14 +++++++-------
 daemon/indirect.c   |    8 ++++----
 daemon/lookup.c     |    4 ++--
 daemon/spawn.c      |    2 +-
 daemon/state.c      |    2 +-
 include/mounts.h    |    6 +++---
 lib/mounts.c        |   40 ++++++++++++++++++++--------------------
 modules/parse_amd.c |    4 ++--
 10 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index a37862a8..6e0bf7c7 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -27,6 +27,7 @@ xx/xx/2019 autofs-5.1.6
 - add config option for "ignore" mount option
 - use bit flags for autofs mount types in mnt_list.
 - use mp instead of path in mnt_list entries.
+- always use PROC_MOUNTS to make mount lists.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/automount.c b/daemon/automount.c
index 4628f20c..8ec4ac5e 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -333,7 +333,7 @@ static int walk_tree(const char *base, int (*fn) (struct autofs_point *ap,
 	struct stat st, *pst = &st;
 	int ret;
 
-	if (!is_mounted(_PATH_MOUNTED, base, MNTS_REAL))
+	if (!is_mounted(base, MNTS_REAL))
 		ret = lstat(base, pst);
 	else {
 		pst = NULL;
@@ -593,11 +593,11 @@ static int umount_subtree_mounts(struct autofs_point *ap, const char *path, unsi
 	 * If this is the root of a multi-mount we've had to umount
 	 * it already to ensure it's ok to remove any offset triggers.
 	 */
-	if (!is_mm_root && is_mounted(_PATH_MOUNTED, path, MNTS_REAL)) {
+	if (!is_mm_root && is_mounted(path, MNTS_REAL)) {
 		struct amd_entry *entry;
 		debug(ap->logopt, "unmounting dir = %s", path);
 		if (umount_ent(ap, path) &&
-		    is_mounted(_PATH_MOUNTED, path, MNTS_REAL)) {
+		    is_mounted(path, MNTS_REAL)) {
 			warn(ap->logopt, "could not umount dir %s", path);
 			left++;
 			goto done;
diff --git a/daemon/direct.c b/daemon/direct.c
index 43a817d0..c0fc222c 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -207,7 +207,7 @@ int umount_autofs_direct(struct autofs_point *ap)
 	struct mnt_list *mnts;
 	struct mapent *me, *ne;
 
-	mnts = tree_make_mnt_tree(_PROC_MOUNTS, "/");
+	mnts = tree_make_mnt_tree("/");
 	pthread_cleanup_push(mnts_cleanup, mnts);
 	nc = ap->entry->master->nc;
 	cache_readlock(nc);
@@ -515,7 +515,7 @@ int mount_autofs_direct(struct autofs_point *ap)
 		return -1;
 	}
 
-	mnts = tree_make_mnt_tree(_PROC_MOUNTS, "/");
+	mnts = tree_make_mnt_tree("/");
 	pthread_cleanup_push(mnts_cleanup, mnts);
 	pthread_cleanup_push(master_source_lock_cleanup, ap->entry);
 	master_source_readlock(ap->entry);
@@ -583,7 +583,7 @@ int umount_autofs_offset(struct autofs_point *ap, struct mapent *me)
 	int opened = 0;
 
 	if (me->ioctlfd != -1) {
-		if (is_mounted(_PATH_MOUNTED, me->key, MNTS_REAL)) {
+		if (is_mounted(me->key, MNTS_REAL)) {
 			error(ap->logopt,
 			      "attempt to umount busy offset %s", me->key);
 			return 1;
@@ -591,7 +591,7 @@ int umount_autofs_offset(struct autofs_point *ap, struct mapent *me)
 		ioctlfd = me->ioctlfd;
 	} else {
 		/* offset isn't mounted, return success and try to recover */
-		if (!is_mounted(_PROC_MOUNTS, me->key, MNTS_AUTOFS)) {
+		if (!is_mounted(me->key, MNTS_AUTOFS)) {
 			debug(ap->logopt,
 			      "offset %s not mounted",
 			      me->key);
@@ -707,7 +707,7 @@ int mount_autofs_offset(struct autofs_point *ap, struct mapent *me, const char *
 		if (!(ret == -1 && errno == ENOENT))
 			return MOUNT_OFFSET_FAIL;
 	} else {
-		if (is_mounted(_PROC_MOUNTS, me->key, MNTS_AUTOFS)) {
+		if (is_mounted(me->key, MNTS_AUTOFS)) {
 			if (ap->state != ST_READMAP)
 				warn(ap->logopt,
 				     "trigger %s already mounted", me->key);
@@ -781,7 +781,7 @@ int mount_autofs_offset(struct autofs_point *ap, struct mapent *me, const char *
 			 * the kernel NFS client.
 			 */
 			if (me->multi != me &&
-			    is_mounted(_PROC_MOUNTS, mountpoint, MNTS_REAL))
+			    is_mounted(mountpoint, MNTS_REAL))
 				return MOUNT_OFFSET_IGNORE;
 
 			/* 
@@ -901,7 +901,7 @@ void *expire_proc_direct(void *arg)
 
 	left = 0;
 
-	mnts = tree_make_mnt_tree(_PROC_MOUNTS, "/");
+	mnts = tree_make_mnt_tree("/");
 	pthread_cleanup_push(mnts_cleanup, mnts);
 
 	/* Get a list of mounts select real ones and expire them if possible */
diff --git a/daemon/indirect.c b/daemon/indirect.c
index dd80288a..37f564be 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -104,7 +104,7 @@ static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
 		if (ret == 0)
 			return -1;
 	} else {
-		mnts = get_mnt_list(_PROC_MOUNTS, ap->path, 1);
+		mnts = get_mnt_list(ap->path, 1);
 		if (mnts) {
 			ret = unlink_mount_tree(ap, mnts);
 			free_mnt_list(mnts);
@@ -433,7 +433,7 @@ void *expire_proc_indirect(void *arg)
 	left = 0;
 
 	/* Get a list of real mounts and expire them if possible */
-	mnts = get_mnt_list(_PROC_MOUNTS, ap->path, 0);
+	mnts = get_mnt_list(ap->path, 0);
 	pthread_cleanup_push(mnts_cleanup, mnts);
 	for (next = mnts; next; next = next->next) {
 		char *ind_key;
@@ -454,7 +454,7 @@ void *expire_proc_indirect(void *arg)
 				struct stat st;
 
 				/* It's got a mount, deal with in the outer loop */
-				if (is_mounted(_PATH_MOUNTED, next->mp, MNTS_REAL)) {
+				if (is_mounted(next->mp, MNTS_REAL)) {
 					pthread_setcancelstate(cur_state, NULL);
 					continue;
 				}
@@ -563,7 +563,7 @@ void *expire_proc_indirect(void *arg)
 	pthread_cleanup_pop(1);
 
 	count = offsets = submnts = 0;
-	mnts = get_mnt_list(_PROC_MOUNTS, ap->path, 0);
+	mnts = get_mnt_list(ap->path, 0);
 	pthread_cleanup_push(mnts_cleanup, mnts);
 	/* Are there any real mounts left */
 	for (next = mnts; next; next = next->next) {
diff --git a/daemon/lookup.c b/daemon/lookup.c
index bc8bbb7f..60a48f3f 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -1425,7 +1425,7 @@ void lookup_prune_one_cache(struct autofs_point *ap, struct mapent_cache *mc, ti
 			valid = NULL;
 		}
 		if (!valid &&
-		    is_mounted(_PATH_MOUNTED, path, MNTS_REAL)) {
+		    is_mounted(path, MNTS_REAL)) {
 			debug(ap->logopt, "prune posponed, %s mounted", path);
 			free(key);
 			free(path);
@@ -1448,7 +1448,7 @@ void lookup_prune_one_cache(struct autofs_point *ap, struct mapent_cache *mc, ti
 
 		if (valid)
 			cache_delete(mc, key);
-		else if (!is_mounted(_PROC_MOUNTS, path, MNTS_AUTOFS)) {
+		else if (!is_mounted(path, MNTS_AUTOFS)) {
 			dev_t devid = ap->dev;
 			status = CHE_FAIL;
 			if (ap->type == LKP_DIRECT)
diff --git a/daemon/spawn.c b/daemon/spawn.c
index 4eb268ab..7992c5ab 100644
--- a/daemon/spawn.c
+++ b/daemon/spawn.c
@@ -427,7 +427,7 @@ static int do_spawn(unsigned logopt, unsigned int wait,
 			if (!is_bind)
 				goto done;
 
-			if (is_mounted(_PROC_MOUNTS, argv[loc], MNTS_AUTOFS)) {
+			if (is_mounted(argv[loc], MNTS_AUTOFS)) {
 				fprintf(stderr,
 				     "error: can't bind to an autofs mount\n");
 				close(STDOUT_FILENO);
diff --git a/daemon/state.c b/daemon/state.c
index ca9534c4..b9081d8e 100644
--- a/daemon/state.c
+++ b/daemon/state.c
@@ -475,7 +475,7 @@ static void *do_readmap(void *arg)
 		struct mapent *me;
 		unsigned int append_alarm = !ap->exp_runfreq;
 
-		mnts = tree_make_mnt_tree(_PROC_MOUNTS, "/");
+		mnts = tree_make_mnt_tree("/");
 		pthread_cleanup_push(tree_mnts_cleanup, mnts);
 		nc = ap->entry->master->nc;
 		cache_readlock(nc);
diff --git a/include/mounts.h b/include/mounts.h
index 657fc10d..f7bc4589 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -99,11 +99,11 @@ char *make_mnt_name_string(char *path);
 int ext_mount_add(struct list_head *, const char *, unsigned int);
 int ext_mount_remove(struct list_head *, const char *);
 int ext_mount_inuse(const char *);
-struct mnt_list *get_mnt_list(const char *table, const char *path, int include);
+struct mnt_list *get_mnt_list(const char *path, int include);
 void free_mnt_list(struct mnt_list *list);
-int is_mounted(const char *table, const char *mp, unsigned int type);
+int is_mounted(const char *mp, unsigned int type);
 void tree_free_mnt_tree(struct mnt_list *tree);
-struct mnt_list *tree_make_mnt_tree(const char *table, const char *path);
+struct mnt_list *tree_make_mnt_tree(const char *path);
 int tree_get_mnt_list(struct mnt_list *mnts, struct list_head *list, const char *path, int include);
 int tree_get_mnt_sublist(struct mnt_list *mnts, struct list_head *list, const char *path, int include);
 int tree_find_mnt_ents(struct mnt_list *mnts, struct list_head *list, const char *path);
diff --git a/lib/mounts.c b/lib/mounts.c
index 609546e1..530a26f4 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -789,7 +789,7 @@ done:
 /*
  * Get list of mounts under path in longest->shortest order
  */
-struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
+struct mnt_list *get_mnt_list(const char *path, int include)
 {
 	FILE *tab;
 	size_t pathlen = strlen(path);
@@ -803,7 +803,7 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 	if (!path || !pathlen || pathlen > PATH_MAX)
 		return NULL;
 
-	tab = open_setmntent_r(table);
+	tab = open_setmntent_r(_PROC_MOUNTS);
 	if (!tab) {
 		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
 		logerr("setmntent: %s", estr);
@@ -892,7 +892,7 @@ void free_mnt_list(struct mnt_list *list)
 	}
 }
 
-static int table_is_mounted(const char *table, const char *mp, unsigned int type)
+static int table_is_mounted(const char *mp, unsigned int type)
 {
 	struct mntent *mnt;
 	struct mntent mnt_wrk;
@@ -904,7 +904,7 @@ static int table_is_mounted(const char *table, const char *mp, unsigned int type
 	if (!mp || !mp_len || mp_len >= PATH_MAX)
 		return 0;
 
-	tab = open_setmntent_r(table);
+	tab = open_setmntent_r(_PROC_MOUNTS);
 	if (!tab) {
 		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
 		logerr("setmntent: %s", estr);
@@ -938,7 +938,7 @@ static int table_is_mounted(const char *table, const char *mp, unsigned int type
 	return ret;
 }
 
-static int ioctl_is_mounted(const char *table, const char *mp, unsigned int type)
+static int ioctl_is_mounted(const char *mp, unsigned int type)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 	unsigned int mounted;
@@ -949,7 +949,7 @@ static int ioctl_is_mounted(const char *table, const char *mp, unsigned int type
 	 */
 	ret = ops->ismountpoint(LOGOPT_NONE, -1, mp, &mounted);
 	if (ret == -1)
-		return table_is_mounted(table, mp, type);
+		return table_is_mounted(mp, type);
 
 	if (mounted) {
 		switch (type) {
@@ -964,14 +964,14 @@ static int ioctl_is_mounted(const char *table, const char *mp, unsigned int type
 	return 0;
 }
 
-int is_mounted(const char *table, const char *mp, unsigned int type)
+int is_mounted(const char *mp, unsigned int type)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 
 	if (ops->ismountpoint)
-		return ioctl_is_mounted(table, mp, type);
+		return ioctl_is_mounted(mp, type);
 	else
-		return table_is_mounted(table, mp, type);
+		return table_is_mounted(mp, type);
 }
 
 /*
@@ -1018,7 +1018,7 @@ void tree_free_mnt_tree(struct mnt_list *tree)
 /*
  * Make tree of system mounts in /proc/mounts.
  */
-struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
+struct mnt_list *tree_make_mnt_tree(const char *path)
 {
 	FILE *tab;
 	struct mntent mnt_wrk;
@@ -1029,7 +1029,7 @@ struct mnt_list *tree_make_mnt_tree(const char *table, const char *path)
 	size_t plen;
 	int eq;
 
-	tab = open_setmntent_r(table);
+	tab = open_setmntent_r(_PROC_MOUNTS);
 	if (!tab) {
 		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
 		logerr("setmntent: %s", estr);
@@ -1281,7 +1281,7 @@ int tree_is_mounted(struct mnt_list *mnts, const char *path, unsigned int type)
 	int mounted = 0;
 
 	if (ops->ismountpoint)
-		return ioctl_is_mounted(_PROC_MOUNTS, path, type);
+		return ioctl_is_mounted(path, type);
 
 	INIT_LIST_HEAD(&list);
 
@@ -1856,7 +1856,7 @@ void set_indirect_mount_tree_catatonic(struct autofs_point *ap)
 	struct mapent_cache *mc;
 	struct mapent *me;
 
-	if (!is_mounted(_PROC_MOUNTS, ap->path, MNTS_AUTOFS))
+	if (!is_mounted(ap->path, MNTS_AUTOFS))
 		return;
 
 	map = entry->maps;
@@ -1922,7 +1922,7 @@ int umount_ent(struct autofs_point *ap, const char *path)
 		 * so that we do not try to call rmdir_path on the
 		 * directory.
 		 */
-		if (!rv && is_mounted(_PATH_MOUNTED, path, MNTS_REAL)) {
+		if (!rv && is_mounted(path, MNTS_REAL)) {
 			crit(ap->logopt,
 			     "the umount binary reported that %s was "
 			     "unmounted, but there is still something "
@@ -2055,7 +2055,7 @@ int mount_multi_triggers(struct autofs_point *ap, struct mapent *me,
 		 */
 		if (ap->state == ST_READMAP && ap->flags & MOUNT_FLAG_REMOUNT) {
 			if (oe->ioctlfd != -1 ||
-			    is_mounted(_PROC_MOUNTS, oe->key, MNTS_REAL)) {
+			    is_mounted(oe->key, MNTS_REAL)) {
 				char oe_root[PATH_MAX + 1];
 				strcpy(oe_root, root);
 				strcat(oe_root, offset); 
@@ -2144,7 +2144,7 @@ int umount_multi_triggers(struct autofs_point *ap, struct mapent *me, char *root
 		left += umount_multi_triggers(ap, oe, root, oe_base);
 
 		if (oe->ioctlfd != -1 ||
-		    is_mounted(_PROC_MOUNTS, oe->key, MNTS_REAL)) {
+		    is_mounted(oe->key, MNTS_REAL)) {
 			left++;
 			continue;
 		}
@@ -2187,10 +2187,10 @@ int umount_multi_triggers(struct autofs_point *ap, struct mapent *me, char *root
 		 * delete the offsets from the cache and we need to put
 		 * the offset triggers back.
 		 */
-		if (is_mounted(_PATH_MOUNTED, root, MNTS_REAL)) {
+		if (is_mounted(root, MNTS_REAL)) {
 			info(ap->logopt, "unmounting dir = %s", root);
 			if (umount_ent(ap, root) &&
-			    is_mounted(_PATH_MOUNTED, root, MNTS_REAL)) {
+			    is_mounted(root, MNTS_REAL)) {
 				if (mount_multi_triggers(ap, me, root, strlen(root), "/") < 0)
 					warn(ap->logopt,
 					     "failed to remount offset triggers");
@@ -2290,9 +2290,9 @@ int clean_stale_multi_triggers(struct autofs_point *ap,
 		 * ESTALE errors when attempting list the directory.
 		 */
 		if (oe->ioctlfd != -1 ||
-		    is_mounted(_PROC_MOUNTS, oe->key, MNTS_REAL)) {
+		    is_mounted(oe->key, MNTS_REAL)) {
 			if (umount_ent(ap, oe->key) &&
-			    is_mounted(_PROC_MOUNTS, oe->key, MNTS_REAL)) {
+			    is_mounted(oe->key, MNTS_REAL)) {
 				debug(ap->logopt,
 				      "offset %s has active mount, invalidate",
 				      oe->key);
diff --git a/modules/parse_amd.c b/modules/parse_amd.c
index 7703be5b..d8b9ea24 100644
--- a/modules/parse_amd.c
+++ b/modules/parse_amd.c
@@ -1173,7 +1173,7 @@ static int do_generic_mount(struct autofs_point *ap, const char *name,
 		 * multiple times since they are outside of
 		 * the automount filesystem.
 		 */
-		if (!is_mounted(_PATH_MOUNTED, entry->fs, MNTS_REAL)) {
+		if (!is_mounted(entry->fs, MNTS_REAL)) {
 			ret = do_mount(ap, entry->fs, "/", 1,
 				       target, entry->type, opts);
 			if (ret)
@@ -1223,7 +1223,7 @@ static int do_nfs_mount(struct autofs_point *ap, const char *name,
 					     target, entry->type, opts,
 					     mount_nfs->context);
 	} else {
-		if (!is_mounted(_PATH_MOUNTED, entry->fs, MNTS_REAL)) {
+		if (!is_mounted(entry->fs, MNTS_REAL)) {
 			ret = mount_nfs->mount_mount(ap, entry->fs, "/", 1,
 						target, entry->type, opts,
 						mount_nfs->context);

