Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D7A47F144
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbhLXWDR (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:17 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53672 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbhLXWDR (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:17 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 1/7] autofs-5.1.8 - fix missing include in hash.h
Date:   Fri, 24 Dec 2021 22:02:19 +0000
Message-Id: <20211224220225.2531481-1-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

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
 CHANGELOG      | 3 +++
 include/hash.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 3be6119..e4e3362 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,3 +1,6 @@
+
+- musl: fix missing include in hash.h
+
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
 - remove mount.x and rpcgen dependencies.
diff --git a/include/hash.h b/include/hash.h
index 2447f29..010acd7 100644
--- a/include/hash.h
+++ b/include/hash.h
@@ -3,6 +3,7 @@
 /* Fast hashing routine for ints,  longs and pointers.
    (C) 2002 Nadia Yvette Chambers, IBM */
 
+#include <linux/stddef.h>
 #include <sys/types.h>
 #include <stdint.h>
 
-- 
2.34.1

