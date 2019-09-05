Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9883CAAF33
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389527AbfIEXqP (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:15 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389423AbfIEXqP (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:15 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DjFAAYnXFd/1230XZlHgEGBwaBZwK?=
 =?us-ascii?q?BZy+BPyESKoQhjwxSAQaBETiJXJEmCQEBAQEBAQEBARsZAQIBAYQ/AoI2Izg?=
 =?us-ascii?q?TAgwBAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ?=
 =?us-ascii?q?/MxoCijWBDCgBi3cYeIEHgREzimyCWASMMBoKgl6GI0JulSuCKZRoG418A4p?=
 =?us-ascii?q?3LYN/pDwhgVhNLgo7gmyCTheOLzYwgQYBAYQ8iggBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DjFAAYnXFd/1230XZlHgEGBwaBZwKBZy+BPyESKoQhj?=
 =?us-ascii?q?wxSAQaBETiJXJEmCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzgTAgwBAQEEAQEBA?=
 =?us-ascii?q?QEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi?=
 =?us-ascii?q?3cYeIEHgREzimyCWASMMBoKgl6GI0JulSuCKZRoG418A4p3LYN/pDwhgVhNL?=
 =?us-ascii?q?go7gmyCTheOLzYwgQYBAYQ8iggBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582743"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:11 +0800
Subject: [PATCH 25/32] autofs-5.1.5 - don't use tree_is_mounted() for
 mounted checks
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:11 +0800
Message-ID: <156772699047.5865.14397995284537268421.stgit@mickey.themaw.net>
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

Always use is_mounted() for mounted checks.

If the proc mount table actually needs to be used this could be
very inefficient but the miscelaneous device ioctl interface
has been available to quite a few years now so it really needs
to be used to avoid the scanning of mount tables.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG           |    1 +
 daemon/direct.c     |   12 ++++--------
 daemon/state.c      |    4 ++--
 include/automount.h |    2 +-
 include/mounts.h    |    1 -
 lib/mounts.c        |   40 ----------------------------------------
 6 files changed, 8 insertions(+), 52 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 8fad194a..5e0da0ad 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -31,6 +31,7 @@ xx/xx/2019 autofs-5.1.6
 - add glibc getmntent_r().
 - use local getmntent_r in table_is_mounted().
 - refactor unlink_active_mounts() in direct.c.
+- don't use tree_is_mounted() for mounted checks.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index f74cfe5f..e567e7ea 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -82,7 +82,7 @@ static void mnts_cleanup(void *arg)
 	return;
 }
 
-int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, struct mapent *me)
+int do_umount_autofs_direct(struct autofs_point *ap, struct mapent *me)
 {
 	struct ioctl_ops *ops = get_ioctl_ops();
 	char buf[MAX_ERR_BUF];
@@ -98,7 +98,7 @@ int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, stru
 
 	if (me->ioctlfd != -1) {
 		if (ap->state == ST_READMAP &&
-		    tree_is_mounted(mnts, me->key, MNTS_REAL)) {
+		    is_mounted(me->key, MNTS_REAL)) {
 			error(ap->logopt,
 			      "attempt to umount busy direct mount %s",
 			      me->key);
@@ -204,11 +204,8 @@ int umount_autofs_direct(struct autofs_point *ap)
 {
 	struct map_source *map;
 	struct mapent_cache *nc, *mc;
-	struct mnt_list *mnts;
 	struct mapent *me, *ne;
 
-	mnts = tree_make_mnt_tree("/");
-	pthread_cleanup_push(mnts_cleanup, mnts);
 	nc = ap->entry->master->nc;
 	cache_readlock(nc);
 	pthread_cleanup_push(cache_lock_cleanup, nc);
@@ -233,7 +230,7 @@ int umount_autofs_direct(struct autofs_point *ap)
 			 * catatonic regardless of the reason for the
 			 * failed umount.
 			 */
-			error = do_umount_autofs_direct(ap, mnts, me);
+			error = do_umount_autofs_direct(ap, me);
 			if (!error)
 				goto done;
 
@@ -246,7 +243,6 @@ done:
 		map = map->next;
 	}
 	pthread_cleanup_pop(1);
-	pthread_cleanup_pop(1);
 
 	close(ap->state_pipe[0]);
 	close(ap->state_pipe[1]);
@@ -947,7 +943,7 @@ void *expire_proc_direct(void *arg)
 			}
 
 			/* It's got a mount, deal with in the outer loop */
-			if (tree_is_mounted(mnts, me->key, MNTS_REAL)) {
+			if (is_mounted(me->key, MNTS_REAL)) {
 				pthread_setcancelstate(cur_state, NULL);
 				continue;
 			}
diff --git a/daemon/state.c b/daemon/state.c
index b9081d8e..77844401 100644
--- a/daemon/state.c
+++ b/daemon/state.c
@@ -414,8 +414,8 @@ static void do_readmap_mount(struct autofs_point *ap, struct mnt_list *mnts,
 				else
 					ap->exp_runfreq = runfreq;
 			}
-		} else if (!tree_is_mounted(mnts, me->key, MNTS_REAL))
-			do_umount_autofs_direct(ap, mnts, me);
+		} else if (!is_mounted(me->key, MNTS_REAL))
+			do_umount_autofs_direct(ap, me);
 		else
 			debug(ap->logopt,
 			      "%s is mounted", me->key);
diff --git a/include/automount.h b/include/automount.h
index d02410f3..896c6114 100644
--- a/include/automount.h
+++ b/include/automount.h
@@ -614,7 +614,7 @@ void submount_signal_parent(struct autofs_point *ap, unsigned int success);
 void close_mount_fds(struct autofs_point *ap);
 int umount_autofs(struct autofs_point *ap, const char *root, int force);
 int umount_autofs_indirect(struct autofs_point *ap, const char *root);
-int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, struct mapent *me);
+int do_umount_autofs_direct(struct autofs_point *ap, struct mapent *me);
 int umount_autofs_direct(struct autofs_point *ap);
 int umount_autofs_offset(struct autofs_point *ap, struct mapent *me);
 int handle_packet_expire_indirect(struct autofs_point *ap, autofs_packet_expire_indirect_t *pkt);
diff --git a/include/mounts.h b/include/mounts.h
index f7bc4589..3e2c2665 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -107,7 +107,6 @@ struct mnt_list *tree_make_mnt_tree(const char *path);
 int tree_get_mnt_list(struct mnt_list *mnts, struct list_head *list, const char *path, int include);
 int tree_get_mnt_sublist(struct mnt_list *mnts, struct list_head *list, const char *path, int include);
 int tree_find_mnt_ents(struct mnt_list *mnts, struct list_head *list, const char *path);
-int tree_is_mounted(struct mnt_list *mnts, const char *path, unsigned int type);
 void set_tsd_user_vars(unsigned int, uid_t, gid_t);
 const char *mount_type_str(unsigned int);
 void set_exp_timeout(struct autofs_point *ap, struct map_source *source, time_t timeout);
diff --git a/lib/mounts.c b/lib/mounts.c
index 26265bb7..10827710 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1368,46 +1368,6 @@ int tree_find_mnt_ents(struct mnt_list *mnts, struct list_head *list, const char
 	return 0;
 }
 
-int tree_is_mounted(struct mnt_list *mnts, const char *path, unsigned int type)
-{
-	struct ioctl_ops *ops = get_ioctl_ops();
-	struct list_head *p;
-	struct list_head list;
-	int mounted = 0;
-
-	if (ops->ismountpoint)
-		return ioctl_is_mounted(path, type);
-
-	INIT_LIST_HEAD(&list);
-
-	if (!tree_find_mnt_ents(mnts, &list, path))
-		return 0;
-
-	list_for_each(p, &list) {
-		struct mnt_list *mptr;
-
-		mptr = list_entry(p, struct mnt_list, entries);
-
-		if (type) {
-			if (type & MNTS_REAL) {
-				if (mptr->flags & MNTS_AUTOFS) {
-					mounted = 1;
-					break;
-				}
-			} else if (type & MNTS_AUTOFS) {
-				if (mptr->flags & MNTS_AUTOFS) {
-					mounted = 1;
-					break;
-				}
-			} else {
-				mounted = 1;
-				break;
-			}
-		}
-	}
-	return mounted;
-}
-
 void set_tsd_user_vars(unsigned int logopt, uid_t uid, gid_t gid)
 {
 	struct thread_stdenv_vars *tsv;

