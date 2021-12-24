Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2896847F148
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344274AbhLXWD0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:26 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53694 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbhLXWD0 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:26 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 5/7] autofs-5.1.8 - add missing include to hash.h for _WORDSIZE
Date:   Fri, 24 Dec 2021 22:02:23 +0000
Message-Id: <20211224220225.2531481-5-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Fixes build failure on musl like:
```
../include/hash.h:22:2: error: #error Wordsize not 32 or 64
   22 | #error Wordsize not 32 or 64
      |  ^~~~~
```

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG      | 1 +
 include/hash.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 3b11b79..edf2d30 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -3,6 +3,7 @@
 - musl: fix missing include in hash.h
 - musl: define fallback dummy NSS config path
 - musl: avoid internal stat.h definitions
+- musl: add missing include to hash.h for _WORDSIZE
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/hash.h b/include/hash.h
index 010acd7..0f1d7b5 100644
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
-- 
2.34.1

