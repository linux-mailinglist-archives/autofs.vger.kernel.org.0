Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195D14932C2
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348509AbiASCNw (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348360AbiASCNv (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:51 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CE6C061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:51 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 59075100066
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:50 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N_1JT6j_150a for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:50 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 50C8310029D; Wed, 19 Jan 2022 13:13:50 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6D7DF100066;
        Wed, 19 Jan 2022 13:13:49 +1100 (AEDT)
Subject: [PATCH 19/19] autofs-5.1.8 - define _SWORD_TYPE for musl
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:49 +0800
Message-ID: <164255842899.27570.14413137613777345350.stgit@mickey.themaw.net>
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
 CHANGELOG          |    1 +
 daemon/automount.c |   10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 762d3d1c..410df3ae 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -15,6 +15,7 @@
 - musl: avoid internal stat.h definitions.
 - musl: add missing include to hash.h for _WORDSIZE.
 - musl: add missing include to log.h for pid_t.
+- musl: define _SWORD_TYPE.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/automount.c b/daemon/automount.c
index b47c485b..e59ef65d 100644
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


