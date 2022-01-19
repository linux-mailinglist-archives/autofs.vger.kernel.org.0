Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFD74932D6
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350901AbiASCUN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350899AbiASCUI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:08 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA51C061746
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:20:06 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 3459D10027D
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:45 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WdzscXL1sg7C for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:45 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 2BFF6100FCB; Wed, 19 Jan 2022 13:12:45 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id CE683100059;
        Wed, 19 Jan 2022 13:12:44 +1100 (AEDT)
Subject: [PATCH 08/19] autofs-5.1.8 - fix loop under run in
 cache_get_offset_parent()
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:44 +0800
Message-ID: <164255836447.27570.16737275505010605969.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Frank Sorenson <sorenson@redhat.com>

To avoid reading memory outside of the the string
allocated for parent, tail needs to stop when it
reaches or passes parent, even if it doesn't
actually equal parent.

Signed-off-by: Frank Sorenson <sorenson@redhat.com>
---
 CHANGELOG   |    1 +
 lib/cache.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 9af33bf0..3b22937e 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -5,6 +5,7 @@
 - fix root offset error handling.
 - fix nonstrict fail handling of last offset mount.
 - dont fail on duplicate offset entry tree add.
+- fix loop under run in cache_get_offset_parent().
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/cache.c b/lib/cache.c
index 66dda5d9..8aed28ea 100644
--- a/lib/cache.c
+++ b/lib/cache.c
@@ -710,7 +710,7 @@ struct mapent *cache_get_offset_parent(struct mapent_cache *mc, const char *key)
 		*tail = 0;
 
 		tail--;
-		if (tail == parent)
+		if (tail <= parent)
 			break;
 
 		me = cache_lookup_distinct(mc, parent);


