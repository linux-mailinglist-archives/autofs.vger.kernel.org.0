Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBF2AAF35
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389562AbfIEXq1 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:27 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389423AbfIEXq1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:27 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BGBQAYnXFd/1230XZlHgEGBwaBVgY?=
 =?us-ascii?q?LAQGCFoE/IRIqhCGPDFIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwK?=
 =?us-ascii?q?CNiM3Bg4CDAEBAQQBAQEBAQYDAW2Ea09CARABhHcGIwRiGA0CGA4CAkcQBhO?=
 =?us-ascii?q?FGROqdn8zGgKKNYEMKAGLdxh4gQeBETOKbIJYBIxUgl6GI0KWGYIpjAOIZRu?=
 =?us-ascii?q?NfAOKdy2Df6Q7IoFYTS4KO4Jsgk4Xji82MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2BGBQAYnXFd/1230XZlHgEGBwaBVgYLAQGCFoE/IRIqh?=
 =?us-ascii?q?CGPDFIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM3Bg4CDAEBA?=
 =?us-ascii?q?QQBAQEBAQYDAW2Ea09CARABhHcGIwRiGA0CGA4CAkcQBhOFGROqdn8zGgKKN?=
 =?us-ascii?q?YEMKAGLdxh4gQeBETOKbIJYBIxUgl6GI0KWGYIpjAOIZRuNfAOKdy2Df6Q7I?=
 =?us-ascii?q?oFYTS4KO4Jsgk4Xji82MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582774"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:22 +0800
Subject: [PATCH 27/32] autofs-5.1.5 - move unlink_mount_tree() to
 lib/mounts.c
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:22 +0800
Message-ID: <156772700194.5865.6679098968396475376.stgit@mickey.themaw.net>
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

Both daemon/direct.c and daemon/indirect.c use the same function to
lazy umount a list of mounts, move that function to lib/mounts.c.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 daemon/direct.c   |    2 --
 daemon/indirect.c |   34 ----------------------------------
 include/mounts.h  |    1 +
 lib/mounts.c      |   35 +++++++++++++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 60826d8c..023bfdf7 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -33,6 +33,7 @@ xx/xx/2019 autofs-5.1.6
 - refactor unlink_active_mounts() in direct.c.
 - don't use tree_is_mounted() for mounted checks.
 - use single unlink_umount_tree() for both direct and indirect mounts.
+- move unlink_mount_tree() to lib/mounts.c.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index f9ffaaae..1cc66237 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -49,8 +49,6 @@ pthread_key_t key_mnt_direct_params;
 pthread_key_t key_mnt_offset_params;
 pthread_once_t key_mnt_params_once = PTHREAD_ONCE_INIT;
 
-int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts);
-
 static void key_mnt_params_destroy(void *arg)
 {
 	struct mnt_params *mp;
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 750a563f..1ef481ee 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -40,40 +40,6 @@
 /* Attribute to create detached thread */
 extern pthread_attr_t th_attr_detached;
 
-int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
-{
-	struct mnt_list *this;
-	int rv, ret;
-
-	ret = 1;
-	this = mnts;
-	while (this) {
-		if (this->flags & MNTS_AUTOFS)
-			rv = umount2(this->mp, MNT_DETACH);
-		else
-			rv = spawn_umount(ap->logopt, "-l", this->mp, NULL);
-		if (rv == -1) {
-			debug(ap->logopt,
-			      "can't unlink %s from mount tree", this->mp);
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
-		this = this->next;
-	}
-	return ret;
-}
-
 static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
 {
 	const char *str_indirect = mount_type_str(t_indirect);
diff --git a/include/mounts.h b/include/mounts.h
index 3e2c2665..27a224c7 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -100,6 +100,7 @@ int ext_mount_add(struct list_head *, const char *, unsigned int);
 int ext_mount_remove(struct list_head *, const char *);
 int ext_mount_inuse(const char *);
 struct mnt_list *get_mnt_list(const char *path, int include);
+int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts);
 void free_mnt_list(struct mnt_list *list);
 int is_mounted(const char *mp, unsigned int type);
 void tree_free_mnt_tree(struct mnt_list *tree);
diff --git a/lib/mounts.c b/lib/mounts.c
index 10827710..64924737 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -881,6 +881,41 @@ local_getmntent_r(FILE *tab, struct mntent *mnt, char *buf, int size)
 	return mnt;
 }
 
+int unlink_mount_tree(struct autofs_point *ap, struct mnt_list *mnts)
+{
+	struct mnt_list *this;
+	int rv, ret;
+
+	ret = 1;
+	this = mnts;
+	while (this) {
+		if (this->flags & MNTS_AUTOFS)
+			rv = umount2(this->mp, MNT_DETACH);
+		else
+			rv = spawn_umount(ap->logopt, "-l", this->mp, NULL);
+		if (rv == -1) {
+			debug(ap->logopt,
+			      "can't unlink %s from mount tree", this->mp);
+
+			switch (errno) {
+			case EINVAL:
+				warn(ap->logopt,
+				      "bad superblock or not mounted");
+				break;
+
+			case ENOENT:
+			case EFAULT:
+				ret = 0;
+				warn(ap->logopt, "bad path for mount");
+				break;
+			}
+		}
+		this = this->next;
+	}
+
+	return ret;
+}
+
 /*
  * Get list of mounts under path in longest->shortest order
  */

