Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2542E47F14A
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352296AbhLXWDc (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:32 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53706 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbhLXWDc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:32 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 7/7] autofs-5.1.8 - define _SWORD_TYPE for musl
Date:   Fri, 24 Dec 2021 22:02:25 +0000
Message-Id: <20211224220225.2531481-7-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Copy the definition from glibc. Fixes build failures like:
```
automount.c:280:35: error: '__SWORD_TYPE' undeclared (first use in this function)
  280 |                 if (fs.f_type != (__SWORD_TYPE) AUTOFS_SUPER_MAGIC) {
      |                                   ^~~~~~~~~~~~
automount.c:280:35: note: each undeclared identifier is reported only once for each function it appears in
automount.c:280:48: error: expected ')' before numeric constant
  280 |                 if (fs.f_type != (__SWORD_TYPE) AUTOFS_SUPER_MAGIC) {
      |                    ~                           ^
      |                                                )
```

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 daemon/automount.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/daemon/automount.c b/daemon/automount.c
index cc28689..5dffce0 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -48,6 +48,16 @@
 #endif
 #endif
 
+#ifndef __SWORD_TYPE
+#if __WORDSIZE == 32
+# define __SWORD_TYPE	int
+#elif __WORDSIZE == 64
+# define __SWORD_TYPE	long int
+#else
+#error
+#endif
+#endif
+
 const char *program;		/* Initialized with argv[0] */
 const char *version = VERSION_STRING;	/* Program version */
 const char *libdir = AUTOFS_LIB_DIR;	/* Location of library modules */
-- 
2.34.1

