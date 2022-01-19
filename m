Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839314932BD
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbiASCNY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348337AbiASCNY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:24 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BD6C06161C
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:24 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 263E7100FCD
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:21 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dbPgDPHu5ovc for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:21 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 1FD641009F4; Wed, 19 Jan 2022 13:13:21 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id A773E1009F4;
        Wed, 19 Jan 2022 13:13:20 +1100 (AEDT)
Subject: [PATCH 14/19] autofs-5.1.8 - fix missing include in hash.h
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:20 +0800
Message-ID: <164255840000.27570.14492369632105902288.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Sam James <sam@gentoo.org>

Fixes a build failure with the musl libc:
```
../include/hash.h:74:8: error: unknown type name '__always_inline'
   74 | static __always_inline uint32_t hash_64(uint64_t val, unsigned int bits)
      |        ^~~~~~~~~~~~~~~
```

We need to include stddef.h from linux-headers to ensure _always_inline
is always defined.

Bug: https://bugs.gentoo.org/828918
Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG      |    1 +
 include/hash.h |    1 +
 2 files changed, 2 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index dbce6261..55465d74 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -10,6 +10,7 @@
 - simplify cache_add() a little.
 - fix use after free in tree_mapent_delete_offset_tree().
 - fix bashism in configure.
+- musl: fix missing include in hash.h.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/hash.h b/include/hash.h
index 2447f293..010acd7e 100644
--- a/include/hash.h
+++ b/include/hash.h
@@ -3,6 +3,7 @@
 /* Fast hashing routine for ints,  longs and pointers.
    (C) 2002 Nadia Yvette Chambers, IBM */
 
+#include <linux/stddef.h>
 #include <sys/types.h>
 #include <stdint.h>
 


