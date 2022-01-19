Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B504932BA
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbiASCNH (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbiASCNH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:07 -0500
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 Jan 2022 18:13:07 PST
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD00C061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:06 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 336FD10029D
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:04 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mYl5SgO2I0uG for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:04 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 2B34E100FCC; Wed, 19 Jan 2022 13:13:04 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id BC347100059;
        Wed, 19 Jan 2022 13:13:02 +1100 (AEDT)
Subject: [PATCH 11/19] autofs-5.1.8 - simplify cache_add() a little
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:02 +0800
Message-ID: <164255838229.27570.11017826664218505896.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

If a map entry is being added to an existing hash chain there's an
unneccessarily complicted setting of ->next of the last entry.

Just initialize the map entry ->next field instead and remove the
confusing assignment.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG   |    1 +
 lib/cache.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 950eb7e7..53831d48 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -7,6 +7,7 @@
 - dont fail on duplicate offset entry tree add.
 - fix loop under run in cache_get_offset_parent().
 - fix nfsv4 only mounts should not use rpcbind.
+- simplify cache_add() a little.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/cache.c b/lib/cache.c
index 8aed28ea..4f908daf 100644
--- a/lib/cache.c
+++ b/lib/cache.c
@@ -564,6 +564,7 @@ int cache_add(struct mapent_cache *mc, struct map_source *ms, const char *key, c
 	me->dev = (dev_t) -1;
 	me->ino = (ino_t) -1;
 	me->flags = 0;
+	me->next = NULL;
 
 	/* 
 	 * We need to add to the end if values exist in order to
@@ -583,7 +584,6 @@ int cache_add(struct mapent_cache *mc, struct map_source *ms, const char *key, c
 
 			existing = next;
 		}
-		me->next = existing->next;
 		existing->next = me;
 	}
 	return CHE_OK;


