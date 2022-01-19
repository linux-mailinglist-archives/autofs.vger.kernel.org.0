Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504F54932D5
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350891AbiASCUN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350896AbiASCUI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:08 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DB3C06173F
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:20:04 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 14A76100FC8
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:33 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JpTDImWEQ5wp for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:33 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 0B8791009F4; Wed, 19 Jan 2022 13:12:33 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 71E8910027D;
        Wed, 19 Jan 2022 13:12:32 +1100 (AEDT)
Subject: [PATCH 06/19] autofs-5.1.8 - fix nonstrict fail handling of last
 offset mount
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:31 +0800
Message-ID: <164255835190.27570.1463740144676300836.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

When mounting a list of multi-mount offsets the offset mount should
succeed even if there's a mount failure for the non-strict case (the
default).

But currently if the last offset mount fails the multi-mount fails
regardless of whether the mount is non-strict or not.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 6f18a0bb..2df69f40 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -3,6 +3,7 @@
 - fix set open file limit.
 - improve descriptor open error reporting.
 - fix root offset error handling.
+- fix nonstrict fail handling of last offset mount.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/mounts.c b/lib/mounts.c
index 39b7fe81..b4229908 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1940,7 +1940,7 @@ static int tree_mapent_mount_offsets_work(struct tree_node *n, void *ptr)
 			tree_mapent_mount_offsets(oe, !ctxt->strict);
 	}
 
-	return ret;
+	return (ctxt->strict ? ret : 1);
 }
 
 int tree_mapent_mount_offsets(struct mapent *oe, int nonstrict)


