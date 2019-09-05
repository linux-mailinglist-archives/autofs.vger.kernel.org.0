Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC525AAF53
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390062AbfIEXvU (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:51:20 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50380
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389851AbfIEXvU (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:51:20 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DrFAAKnHFd/1230XZlghuCFoE/IRI?=
 =?us-ascii?q?qhCGPDFIBBoEROIlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p4fzMaAoo?=
 =?us-ascii?q?1gQwoAYt3GHiBB4ERM4psglgEjFSCXoYjQpYZgimUaBuNfAOKdy2Df6Q8IYF?=
 =?us-ascii?q?YTS4KO4Jsgk4Xji82MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DrFAAKnHFd/1230XZlghuCFoE/IRIqhCGPDFIBBoERO?=
 =?us-ascii?q?IlcigeHHwkBAQEBAQEBAQEbGQECAQGEPwKCNiM4EwIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p4fzMaAoo1gQwoAYt3GHiBB?=
 =?us-ascii?q?4ERM4psglgEjFSCXoYjQpYZgimUaBuNfAOKdy2Df6Q8IYFYTS4KO4Jsgk4Xj?=
 =?us-ascii?q?i82MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582581"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:01 +0800
Subject: [PATCH 13/32] autofs-5.1.5 - remove unused function
 reverse_mnt_list()
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:01 +0800
Message-ID: <156772692126.5865.4942459223225396891.stgit@mickey.themaw.net>
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
 lib/mounts.c     |   21 ---------------------
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index bcb025d4..9fc4a0d1 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -19,6 +19,7 @@ xx/xx/2019 autofs-5.1.6
 - increase group buffer size geometrically.
 - also use strictexpire for offsets.
 - remove unused function has_fstab_option().
+- remove unused function reverse_mnt_list().
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/include/mounts.h b/include/mounts.h
index 4914cde9..ec85ae94 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -100,7 +100,6 @@ int ext_mount_add(struct list_head *, const char *, unsigned int);
 int ext_mount_remove(struct list_head *, const char *);
 int ext_mount_inuse(const char *);
 struct mnt_list *get_mnt_list(const char *table, const char *path, int include);
-struct mnt_list *reverse_mnt_list(struct mnt_list *list);
 void free_mnt_list(struct mnt_list *list);
 int is_mounted(const char *table, const char *path, unsigned int type);
 void tree_free_mnt_tree(struct mnt_list *tree);
diff --git a/lib/mounts.c b/lib/mounts.c
index b1cbf39a..4bc7a4d2 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -894,27 +894,6 @@ struct mnt_list *get_mnt_list(const char *table, const char *path, int include)
 	return list;
 }
 
-/*
- * Reverse a list of mounts
- */
-struct mnt_list *reverse_mnt_list(struct mnt_list *list)
-{
-	struct mnt_list *next, *last;
-
-	if (!list)
-		return NULL;
-
-	next = list;
-	last = NULL;
-	while (next) {
-		struct mnt_list *this = next;
-		next = this->next;
-		this->next = last;
-		last = this;
-	}
-	return last;
-}
-
 void free_mnt_list(struct mnt_list *list)
 {
 	struct mnt_list *next;

