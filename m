Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8184932D7
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350896AbiASCUN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350894AbiASCUI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:08 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC20C06173E
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:20:04 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 510E3100FC9
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:39 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hlXUjVT28B5O for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:39 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 4472110027D; Wed, 19 Jan 2022 13:12:39 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 9A17C10027D;
        Wed, 19 Jan 2022 13:12:38 +1100 (AEDT)
Subject: [PATCH 07/19] autofs-5.1.8 - dont fail on duplicate host export entry
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:38 +0800
Message-ID: <164255835812.27570.1567472047753902802.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

If we encounter a duplicate host export entry don't fail, just ignore
it and return the duplicate.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |    6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 2df69f40..9af33bf0 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -4,6 +4,7 @@
 - improve descriptor open error reporting.
 - fix root offset error handling.
 - fix nonstrict fail handling of last offset mount.
+- dont fail on duplicate offset entry tree add.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/mounts.c b/lib/mounts.c
index b4229908..451849a6 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1341,7 +1341,7 @@ static struct tree_node *tree_add_node(struct tree_node *root, void *ptr)
 	}
 
 	if (!eq)
-		error(LOGOPT_ANY, "cannot add duplicate entry to tree");
+		return p;
 	else {
 		if (eq < 0)
 			return tree_add_left(p, ptr);
@@ -1515,8 +1515,10 @@ static int tree_host_cmp(struct tree_node *n, void *ptr)
 	int eq;
 
 	eq = strcmp(exp->dir, n_exp->dir);
-	if (!eq)
+	if (!eq) {
+		error(LOGOPT_ANY, "duplicate entry %s ignored", exp->dir);
 		return 0;
+	}
 	return (exp_len < n_exp_len) ? -1 : 1;
 }
 


