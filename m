Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652C74932BB
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348213AbiASCNK (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbiASCNK (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:10 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699E0C061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:10 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 1E949100FCC
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:09 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N0YOE81OSYCT for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:09 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 16F41100FCD; Wed, 19 Jan 2022 13:13:09 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id AF49910029D;
        Wed, 19 Jan 2022 13:13:08 +1100 (AEDT)
Subject: [PATCH 12/19] autofs-5.1.8 - fix use after free in
 tree_mapent_delete_offset_tree()
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:08 +0800
Message-ID: <164255838831.27570.4771114115516905142.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

The key field of the map entry of the root of the map entry tree to be
deleted can't be used for the key parameter, fix it.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |   16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 53831d48..8d846d32 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -8,6 +8,7 @@
 - fix loop under run in cache_get_offset_parent().
 - fix nfsv4 only mounts should not use rpcbind.
 - simplify cache_add() a little.
+- fix use after free in tree_mapent_delete_offset_tree().
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/mounts.c b/lib/mounts.c
index 451849a6..c731f464 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1666,16 +1666,26 @@ static int tree_mapent_delete_offset_tree(struct tree_node *root)
 	 */
 	if (MAPENT_ROOT(me) != MAPENT_NODE(me)) {
 		struct tree_node *root = MAPENT_ROOT(me);
+		char *key;
 
-		debug(logopt, "deleting offset key %s", me->key);
+		key = strdup(me->key);
+		if (!key) {
+			char buf[MAX_ERR_BUF];
+			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
+			error(logopt, "strdup: %s", estr);
+			return 0;
+		}
+
+		debug(logopt, "deleting offset key %s", key);
 
 		/* cache_delete won't delete an active offset */
 		MAPENT_SET_ROOT(me, NULL);
-		ret = cache_delete(me->mc, me->key);
+		ret = cache_delete(me->mc, key);
 		if (ret != CHE_OK) {
 			MAPENT_SET_ROOT(me, root);
-			warn(logopt, "failed to delete offset %s", me->key);
+			warn(logopt, "failed to delete offset %s", key);
 		}
+		free(key);
 	} else {
 		MAPENT_SET_ROOT(me, NULL);
 		MAPENT_SET_PARENT(me, NULL);


