Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11AA1AAF32
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387487AbfIEXqK (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:10 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732047AbfIEXqK (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:10 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DzFAAYnXFd/1230XZlghuBZy+BPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXIoHhx8JAQEBAQEBAQEBGxkBAgEBhD8CgjYjOBMCDAE?=
 =?us-ascii?q?BAQQBAQEBAQYDAW2Ea09CARABhHcGIwRAIhgNAhgOAgJHEAYThRkTqnZ/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgUSCKohCglgEjEoHA4JehiNCbpUrgimUaBuCNItIAxC?=
 =?us-ascii?q?KZy2Df6Q8IYFYTS4KO4JskRQ2MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DzFAAYnXFd/1230XZlghuBZy+BPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXIoHhx8JAQEBAQEBAQEBGxkBAgEBhD8CgjYjOBMCDAEBAQQBAQEBAQYDA?=
 =?us-ascii?q?W2Ea09CARABhHcGIwRAIhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgUSCKohCglgEjEoHA4JehiNCbpUrgimUaBuCNItIAxCKZy2Df6Q8IYFYT?=
 =?us-ascii?q?S4KO4JskRQ2MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582726"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:05 +0800
Subject: [PATCH 24/32] autofs-5.1.5 - refactor unlink_active_mounts() in
 direct_c
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:05 +0800
Message-ID: <156772698470.5865.6070564540578098019.stgit@mickey.themaw.net>
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

In daemon/direct.c:unlink_active_mounts() the tree_get_mnt_list() call
returns 1 for a non-empty list which amounts to a mounted check and then
handles the case where the map is being read.

But the check that's carried out is to distinguish between a readmap
and a mount activity which should be handled by the caller instead of
burying the check away in the unlink_active_mounts() function.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG       |    1 +
 daemon/direct.c |   63 +++++++++++++++++++++++++++----------------------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 3986e23c..8fad194a 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -30,6 +30,7 @@ xx/xx/2019 autofs-5.1.6
 - always use PROC_MOUNTS to make mount lists.
 - add glibc getmntent_r().
 - use local getmntent_r in table_is_mounted().
+- refactor unlink_active_mounts() in direct.c.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index c0fc222c..f74cfe5f 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -298,37 +298,12 @@ static int unlink_mount_tree(struct autofs_point *ap, struct list_head *list)
 
 static int unlink_active_mounts(struct autofs_point *ap, struct mnt_list *mnts, struct mapent *me)
 {
-	struct ioctl_ops *ops = get_ioctl_ops();
 	struct list_head list;
 
 	INIT_LIST_HEAD(&list);
 
-	if (tree_get_mnt_list(mnts, &list, me->key, 1)) {
-		if (ap->state == ST_READMAP) {
-			time_t tout = get_exp_timeout(ap, me->source);
-			int save_ioctlfd, ioctlfd;
-
-			save_ioctlfd = ioctlfd = me->ioctlfd;
-
-			if (ioctlfd == -1)
-				ops->open(ap->logopt,
-					  &ioctlfd, me->dev, me->key);
-
-			if (ioctlfd < 0) {
-				error(ap->logopt,
-				     "failed to create ioctl fd for %s",
-				     me->key);
-				return 0;
-			}
-
-			ops->timeout(ap->logopt, ioctlfd, tout);
-
-			if (save_ioctlfd == -1)
-				ops->close(ap->logopt, ioctlfd);
-
-			return 0;
-		}
-	}
+	if (!tree_get_mnt_list(mnts, &list, me->key, 1))
+		return 1;
 
 	if (!unlink_mount_tree(ap, &list)) {
 		debug(ap->logopt,
@@ -371,16 +346,40 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 		if (ret == 0)
 			return -1;
 	} else {
+		if (ap->state == ST_READMAP && is_mounted(me->key, MNTS_ALL)) {
+			time_t tout = get_exp_timeout(ap, me->source);
+			int save_ioctlfd, ioctlfd;
+
+			save_ioctlfd = ioctlfd = me->ioctlfd;
+
+			if (ioctlfd == -1)
+				ops->open(ap->logopt,
+					  &ioctlfd, me->dev, me->key);
+
+			if (ioctlfd < 0) {
+				error(ap->logopt,
+				     "failed to create ioctl fd for %s",
+				     me->key);
+				return 0;
+			}
+
+			ops->timeout(ap->logopt, ioctlfd, tout);
+
+			if (save_ioctlfd == -1)
+				ops->close(ap->logopt, ioctlfd);
+
+			return 0;
+		}
+
 		/*
-		 * A return of 0 indicates we're re-reading the map.
 		 * A return of 1 indicates we successfully unlinked
-		 * the mount tree if there was one. A return of -1
-		 * inducates we failed to unlink the mount tree so
+		 * the mount tree if there was one. A return of 0
+		 * indicates we failed to unlink the mount tree so
 		 * we have to return a failure.
 		 */
 		ret = unlink_active_mounts(ap, mnts, me);
-		if (ret == -1 || ret == 0)
-			return ret;
+		if (!ret)
+			return -1;
 
 		if (me->ioctlfd != -1) {
 			error(ap->logopt, "active direct mount %s", me->key);

