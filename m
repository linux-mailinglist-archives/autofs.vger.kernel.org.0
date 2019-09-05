Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C92AAF4F
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390052AbfIEXvL (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:51:11 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50344
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389851AbfIEXvL (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:51:11 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DnFAAKnHFd/1230XZlghuCFoE/IRI?=
 =?us-ascii?q?qhCGPDFIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrT0IBEAGEdwYjZhgNAhgOAgJHEAYThRkTqniBMhoCijW?=
 =?us-ascii?q?BDCgBi3cYeIEHgREzimyCWASMVIJehiNClhmCKZRoG4I0i0gDinctg3+LBpk?=
 =?us-ascii?q?2IYFYTS4KO4Jsgk4Xji82MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DnFAAKnHFd/1230XZlghuCFoE/IRIqhCGPDFIBBoERO?=
 =?us-ascii?q?IlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrT0IBEAGEdwYjZhgNAhgOAgJHEAYThRkTqniBMhoCijWBDCgBi3cYeIEHg?=
 =?us-ascii?q?REzimyCWASMVIJehiNClhmCKZRoG4I0i0gDinctg3+LBpk2IYFYTS4KO4Jsg?=
 =?us-ascii?q?k4Xji82MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582570"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:56 +0800
Subject: [PATCH 12/32] autofs-5.1.5 - remove unused function
 has_fstab_option()
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:56 +0800
Message-ID: <156772691555.5865.13670707808006091615.stgit@mickey.themaw.net>
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

This function is not used, remove it.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG        |    1 +
 include/mounts.h |    1 -
 lib/mounts.c     |   29 -----------------------------
 3 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 9bb5343d..bcb025d4 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -18,6 +18,7 @@ xx/xx/2019 autofs-5.1.6
 - update autofs(8) offset map entry update description.
 - increase group buffer size geometrically.
 - also use strictexpire for offsets.
+- remove unused function has_fstab_option().
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/include/mounts.h b/include/mounts.h
index 74b23db6..4914cde9 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -103,7 +103,6 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include);
 struct mnt_list *reverse_mnt_list(struct mnt_list *list);
 void free_mnt_list(struct mnt_list *list);
 int is_mounted(const char *table, const char *path, unsigned int type);
-int has_fstab_option(const char *opt);
 void tree_free_mnt_tree(struct mnt_list *tree);
 struct mnt_list *tree_make_mnt_tree(const char *table, const char *path);
 int tree_get_mnt_list(struct mnt_list *mnts, struct list_head *list, const char *path, int include);
diff --git a/lib/mounts.c b/lib/mounts.c
index 5a8e8cdb..b1cbf39a 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1026,35 +1026,6 @@ int is_mounted(const char *table, const char *path, unsigned int type)
 		return table_is_mounted(table, path, type);
 }
 
-int has_fstab_option(const char *opt)
-{
-	struct mntent *mnt;
-	struct mntent mnt_wrk;
-	char buf[PATH_MAX * 3];
-	FILE *tab;
-	int ret = 0;
-
-	if (!opt)
-		return 0;
-
-	tab = open_setmntent_r(_PATH_MNTTAB);
-	if (!tab) {
-		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
-		logerr("setmntent: %s", estr);
-		return 0;
-	}
-
-	while ((mnt = getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
-		if (hasmntopt(mnt, opt)) {
-			ret = 1;
-			break;
-		}
-	}
-	endmntent(tab);
-
-	return ret;
-}
-
 /*
  * Since we have to look at the entire mount tree for direct
  * mounts (all mounts under "/") and we may have a large number

