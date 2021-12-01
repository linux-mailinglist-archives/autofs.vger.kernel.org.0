Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C56464A67
	for <lists+autofs@lfdr.de>; Wed,  1 Dec 2021 10:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbhLAJRF (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 1 Dec 2021 04:17:05 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:46590 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348217AbhLAJPR (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 1 Dec 2021 04:15:17 -0500
From:   Yixun Lan <dlan@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     Ian Kent <raven@themaw.net>, Yixun Lan <dlan@gentoo.org>
Subject: [PATCH] fix dmalloc compiling error
Date:   Wed,  1 Dec 2021 17:11:31 +0800
Message-Id: <20211201091131.7005-1-dlan@gentoo.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

with dmalloc enabled, it will cause internal member of structure changed,
thus got a compiling error, change to a different name will fix this issue

Signed-off-by: Yixun Lan <dlan@gentoo.org>

---
the obvious error message as:

mounts.c: In function ‘tree_free’:
mounts.c:1363:12: error: ‘struct tree_ops’ has no member named ‘dmalloc_free’
 1363 |         ops->free(root);
      |            ^~
make[1]: *** [../Makefile.rules:69: mounts.o] Error 1
---
 include/mounts.h | 2 +-
 lib/mounts.c     | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/mounts.h b/include/mounts.h
index ddb7e4c..854e1fb 100644
--- a/include/mounts.h
+++ b/include/mounts.h
@@ -84,7 +84,7 @@ typedef void (*tree_free_t) (struct tree_node *n);
 struct tree_ops {
 	tree_new_t new;
 	tree_cmp_t cmp;
-	tree_free_t free;
+	tree_free_t set_free;
 };
 
 typedef int (*tree_work_fn_t) (struct tree_node *n, void *ptr);
diff --git a/lib/mounts.c b/lib/mounts.c
index 4c86688..1e54a33 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -75,7 +75,7 @@ static void tree_mnt_free(struct tree_node *n);
 static struct tree_ops mnt_ops = {
 	.new = tree_mnt_new,
 	.cmp = tree_mnt_cmp,
-	.free = tree_mnt_free,
+	.set_free = tree_mnt_free,
 };
 static struct tree_ops *tree_mnt_ops = &mnt_ops;
 
@@ -86,7 +86,7 @@ static void tree_host_free(struct tree_node *n);
 static struct tree_ops host_ops = {
 	.new = tree_host_new,
 	.cmp = tree_host_cmp,
-	.free = tree_host_free,
+	.set_free = tree_host_free,
 };
 static struct tree_ops *tree_host_ops = &host_ops;
 
@@ -97,7 +97,7 @@ static void tree_mapent_free(struct tree_node *n);
 static struct tree_ops mapent_ops = {
 	.new = tree_mapent_new,
 	.cmp = tree_mapent_cmp,
-	.free = tree_mapent_free,
+	.set_free = tree_mapent_free,
 };
 static struct tree_ops *tree_mapent_ops = &mapent_ops;
 
@@ -1360,7 +1360,7 @@ void tree_free(struct tree_node *root)
 		tree_free(root->right);
 	if (root->left)
 		tree_free(root->left);
-	ops->free(root);
+	ops->set_free(root);
 }
 
 int tree_traverse_inorder(struct tree_node *n, tree_work_fn_t work, void *ptr)
-- 
2.34.1

