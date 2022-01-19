Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0664932C0
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348417AbiASCNm (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348360AbiASCNl (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:41 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E98EC061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:41 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 7A21E10029D
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:38 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Bdyun6b8aDlI for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:38 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 72AB3100059; Wed, 19 Jan 2022 13:13:38 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 2C38B100059;
        Wed, 19 Jan 2022 13:13:38 +1100 (AEDT)
Subject: [PATCH 17/19] autofs-5.1.8 - add missing include to hash.h for
 _WORDSIZE
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:37 +0800
Message-ID: <164255841793.27570.9275402232122765423.stgit@mickey.themaw.net>
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

Fixes build failure on musl like:
```
../include/hash.h:22:2: error: #error Wordsize not 32 or 64
   22 | #error Wordsize not 32 or 64
      |  ^~~~~
```

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG      |    1 +
 include/hash.h |    5 +++++
 2 files changed, 6 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 1a126350..b77c71e5 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -13,6 +13,7 @@
 - musl: fix missing include in hash.h.
 - musl: define fallback dummy NSS config path
 - musl: avoid internal stat.h definitions.
+- musl: add missing include to hash.h for _WORDSIZE.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/hash.h b/include/hash.h
index 010acd7e..0f1d7b5d 100644
--- a/include/hash.h
+++ b/include/hash.h
@@ -3,6 +3,11 @@
 /* Fast hashing routine for ints,  longs and pointers.
    (C) 2002 Nadia Yvette Chambers, IBM */
 
+#ifdef __GLIBC__
+#include <bits/wordsize.h>
+#else
+#include <bits/reg.h>
+#endif
 #include <linux/stddef.h>
 #include <sys/types.h>
 #include <stdint.h>


