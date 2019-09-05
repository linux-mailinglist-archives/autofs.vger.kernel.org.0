Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D27AAF34
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389449AbfIEXqY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:24 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389423AbfIEXqY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:24 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DtEgAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXIoHhx8JAQEBAQEBAQEBGxkBAgEBhD8CgjYjNwYOAgw?=
 =?us-ascii?q?BAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgREzimyCWASMSgqCXoYjQm6VK4IplGgbjXwDinctg3+?=
 =?us-ascii?q?kOyKBWE0uCjuCbIJOFxWOGjYwgQYBAYQ8iggBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DtEgAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXIoHhx8JAQEBAQEBAQEBGxkBAgEBhD8CgjYjNwYOAgwBAQEEAQEBAQEGA?=
 =?us-ascii?q?wFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgREzimyCWASMSgqCXoYjQm6VK4IplGgbjXwDinctg3+kOyKBWE0uCjuCb?=
 =?us-ascii?q?IJOFxWOGjYwgQYBAYQ8iggBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582752"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:16 +0800
Subject: [PATCH 26/32] autofs-5.1.5 - use single unlink_umount_tree() for
 both direct and indirect mounts
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:16 +0800
Message-ID: <156772699618.5865.16823548842431435629.stgit@mickey.themaw.net>
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

Use the same function, unlink_umount_tree(), for forced unlink of mounts
for both indirect and direct mounts.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG           |    1 +
 daemon/direct.c     |   96 +++++++++++++--------------------------------------
 daemon/indirect.c   |    2 +
 daemon/state.c      |   17 ++-------
 include/automount.h |    2 +
 5 files changed, 30 insertions(+), 88 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 5e0da0ad..60826d8c 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -32,6 +32,7 @@ xx/xx/2019 autofs-5.1.6
 - use local getmntent_r in table_is_mounted().
 - refactor unlink_active_mounts() in direct.c.
 - don't use tree_is_mounted() for mounted checks.
+- use single unlink_umount_tree() for both direct and indirect mounts.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index e567e7ea..f9ffaaae 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -49,6 +49,8 @@ pthread_key_t key_mnt_direct_params;
 pthread_key_t key_mnt_offset_params;
 pthread_once_t key_mnt_params_once = PTHREAD_ONCE_INIT;
 
+int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts);
+
 static void key_mnt_params_destroy(void *arg)
 {
 	struct mnt_params *mp;
@@ -256,64 +258,8 @@ done:
 	return 0;
 }
 
-static int unlink_mount_tree(struct autofs_point *ap, struct list_head *list)
-{
-	struct list_head *p;
-	int rv, ret;
-
-	ret = 1;
-	list_for_each(p, list) {
-		struct mnt_list *mnt;
-
-		mnt = list_entry(p, struct mnt_list, list);
-
-		if (mnt->flags & MNTS_AUTOFS)
-			rv = umount2(mnt->mp, MNT_DETACH);
-		else
-			rv = spawn_umount(ap->logopt, "-l", mnt->mp, NULL);
-		if (rv == -1) {
-			debug(ap->logopt,
-			      "can't unlink %s from mount tree", mnt->mp);
-
-			switch (errno) {
-			case EINVAL:
-				warn(ap->logopt,
-				      "bad superblock or not mounted");
-				break;
-
-			case ENOENT:
-			case EFAULT:
-				ret = 0;
-				warn(ap->logopt, "bad path for mount");
-				break;
-			}
-		}
-	}
-	return ret;
-}
-
-static int unlink_active_mounts(struct autofs_point *ap, struct mnt_list *mnts, struct mapent *me)
-{
-	struct list_head list;
-
-	INIT_LIST_HEAD(&list);
-
-	if (!tree_get_mnt_list(mnts, &list, me->key, 1))
-		return 1;
-
-	if (!unlink_mount_tree(ap, &list)) {
-		debug(ap->logopt,
-		      "already mounted as other than autofs "
-		      "or failed to unlink entry in tree");
-		return 0;
-	}
-
-	return 1;
-}
-
 int do_mount_autofs_direct(struct autofs_point *ap,
-			   struct mnt_list *mnts, struct mapent *me,
-			   time_t timeout)
+			   struct mapent *me, time_t timeout)
 {
 	const char *str_direct = mount_type_str(t_direct);
 	struct ioctl_ops *ops = get_ioctl_ops();
@@ -342,6 +288,8 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 		if (ret == 0)
 			return -1;
 	} else {
+		struct mnt_list *mnts;
+
 		if (ap->state == ST_READMAP && is_mounted(me->key, MNTS_ALL)) {
 			time_t tout = get_exp_timeout(ap, me->source);
 			int save_ioctlfd, ioctlfd;
@@ -367,15 +315,23 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 			return 0;
 		}
 
-		/*
-		 * A return of 1 indicates we successfully unlinked
-		 * the mount tree if there was one. A return of 0
-		 * indicates we failed to unlink the mount tree so
-		 * we have to return a failure.
-		 */
-		ret = unlink_active_mounts(ap, mnts, me);
-		if (!ret)
-			return -1;
+		mnts = get_mnt_list(me->key, 1);
+		if (mnts) {
+			/*
+			 * A return of 1 indicates we successfully unlinked
+			 * the mount tree if there was one. A return of 0
+			 * indicates we failed to unlink the mount tree so
+			 * we have to return a failure.
+			 */
+			ret = unlink_mount_tree(ap, mnts);
+			free_mnt_list(mnts);
+			if (!ret) {
+				error(ap->logopt,
+				      "already mounted as other than autofs "
+				      "or failed to unlink entry in tree");
+				return -1;
+			}
+		}
 
 		if (me->ioctlfd != -1) {
 			error(ap->logopt, "active direct mount %s", me->key);
@@ -494,7 +450,6 @@ int mount_autofs_direct(struct autofs_point *ap)
 	struct map_source *map;
 	struct mapent_cache *nc, *mc;
 	struct mapent *me, *ne, *nested;
-	struct mnt_list *mnts;
 	time_t now = monotonic_time(NULL);
 
 	if (strcmp(ap->path, "/-")) {
@@ -510,8 +465,6 @@ int mount_autofs_direct(struct autofs_point *ap)
 		return -1;
 	}
 
-	mnts = tree_make_mnt_tree("/");
-	pthread_cleanup_push(mnts_cleanup, mnts);
 	pthread_cleanup_push(master_source_lock_cleanup, ap->entry);
 	master_source_readlock(ap->entry);
 	nc = ap->entry->master->nc;
@@ -539,7 +492,7 @@ int mount_autofs_direct(struct autofs_point *ap)
 			if (ne) {
 				if (map->master_line < ne->age) {
 					/* TODO: check return, locking me */
-					do_mount_autofs_direct(ap, mnts, me, timeout);
+					do_mount_autofs_direct(ap, me, timeout);
 				}
 				me = cache_enumerate(mc, me);
 				continue;
@@ -556,7 +509,7 @@ int mount_autofs_direct(struct autofs_point *ap)
 			}
 
 			/* TODO: check return, locking me */
-			do_mount_autofs_direct(ap, mnts, me, timeout);
+			do_mount_autofs_direct(ap, me, timeout);
 
 			me = cache_enumerate(mc, me);
 		}
@@ -565,7 +518,6 @@ int mount_autofs_direct(struct autofs_point *ap)
 	}
 	pthread_cleanup_pop(1);
 	pthread_cleanup_pop(1);
-	pthread_cleanup_pop(1);
 
 	return 0;
 }
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 37f564be..750a563f 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -40,7 +40,7 @@
 /* Attribute to create detached thread */
 extern pthread_attr_t th_attr_detached;
 
-static int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
+int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
 {
 	struct mnt_list *this;
 	int rv, ret;
diff --git a/daemon/state.c b/daemon/state.c
index 77844401..95d87fcb 100644
--- a/daemon/state.c
+++ b/daemon/state.c
@@ -326,14 +326,7 @@ static void do_readmap_cleanup(void *arg)
 	return;
 }
 
-static void tree_mnts_cleanup(void *arg)
-{
-	struct mnt_list *mnts = (struct mnt_list *) arg;
-	tree_free_mnt_tree(mnts);
-	return;
-}
-
-static void do_readmap_mount(struct autofs_point *ap, struct mnt_list *mnts,
+static void do_readmap_mount(struct autofs_point *ap,
 			     struct map_source *map, struct mapent *me, time_t now)
 {
 	struct mapent_cache *nc;
@@ -420,7 +413,7 @@ static void do_readmap_mount(struct autofs_point *ap, struct mnt_list *mnts,
 			debug(ap->logopt,
 			      "%s is mounted", me->key);
 	} else
-		do_mount_autofs_direct(ap, mnts, me, get_exp_timeout(ap, map));
+		do_mount_autofs_direct(ap, me, get_exp_timeout(ap, map));
 
 	return;
 }
@@ -431,7 +424,6 @@ static void *do_readmap(void *arg)
 	struct map_source *map;
 	struct mapent_cache *nc, *mc;
 	struct readmap_args *ra;
-	struct mnt_list *mnts;
 	int status;
 	time_t now;
 
@@ -475,8 +467,6 @@ static void *do_readmap(void *arg)
 		struct mapent *me;
 		unsigned int append_alarm = !ap->exp_runfreq;
 
-		mnts = tree_make_mnt_tree("/");
-		pthread_cleanup_push(tree_mnts_cleanup, mnts);
 		nc = ap->entry->master->nc;
 		cache_readlock(nc);
 		pthread_cleanup_push(cache_lock_cleanup, nc);
@@ -494,7 +484,7 @@ static void *do_readmap(void *arg)
 			cache_readlock(mc);
 			me = cache_enumerate(mc, NULL);
 			while (me) {
-				do_readmap_mount(ap, mnts, map, me, now);
+				do_readmap_mount(ap, map, me, now);
 				me = cache_enumerate(mc, me);
 			}
 			lookup_prune_one_cache(ap, map->mc, now);
@@ -514,7 +504,6 @@ static void *do_readmap(void *arg)
 
 		pthread_cleanup_pop(1);
 		pthread_cleanup_pop(1);
-		pthread_cleanup_pop(1);
 	}
 
 	pthread_cleanup_pop(1);
diff --git a/include/automount.h b/include/automount.h
index 896c6114..4fd0ba96 100644
--- a/include/automount.h
+++ b/include/automount.h
@@ -607,7 +607,7 @@ void *expire_proc_indirect(void *);
 void *expire_proc_direct(void *);
 int expire_offsets_direct(struct autofs_point *ap, struct mapent *me, int now);
 int mount_autofs_indirect(struct autofs_point *ap, const char *root);
-int do_mount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, struct mapent *me, time_t timeout);
+int do_mount_autofs_direct(struct autofs_point *ap, struct mapent *me, time_t timeout);
 int mount_autofs_direct(struct autofs_point *ap);
 int mount_autofs_offset(struct autofs_point *ap, struct mapent *me, const char *root, const char *offset);
 void submount_signal_parent(struct autofs_point *ap, unsigned int success);

