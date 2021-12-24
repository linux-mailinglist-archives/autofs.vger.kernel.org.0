Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3305947F145
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239476AbhLXWDY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:24 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53686 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbhLXWDX (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:23 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 2/7] autofs-5.1.8 - fix bashism in configure
Date:   Fri, 24 Dec 2021 22:02:20 +0000
Message-Id: <20211224220225.2531481-2-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

configure scripts need to work with a POSIX-compliant shell,
so let's not use a bashism here.

```
checking for res_query in -lresolv... yes
checking for libhesiod... no
./configure: 4880: test: 0: unexpected operator
checking how to run the C preprocessor... gcc -E
```

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG    | 1 +
 configure.in | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index e4e3362..93d8c83 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,4 +1,5 @@
 
+- fix bashism in configure
 - musl: fix missing include in hash.h
 
 19/10/2021 autofs-5.1.8
diff --git a/configure.in b/configure.in
index 750ffb4..723bb30 100644
--- a/configure.in
+++ b/configure.in
@@ -262,7 +262,7 @@ if test -z "$HAVE_HESIOD" -o "$HAVE_HESIOD" != "0"
 then
 	HAVE_HESIOD=0
 	AF_CHECK_LIBHESIOD()
-	if test "$HAVE_HESIOD" == "1"; then
+	if test "$HAVE_HESIOD" = "1"; then
 		AC_DEFINE(WITH_HESIOD,1,
 			[Define if using Hesiod as a source of automount maps])
 	fi
@@ -337,11 +337,11 @@ AC_ARG_WITH(sasl,
 		SASL_FLAGS="-I${withval}/include"
 	fi
 )
-if test -z "$HAVE_SASL" -o "$HAVE_SASL" != "0" -a "$HAVE_LIBXML" == "1"
+if test -z "$HAVE_SASL" -o "$HAVE_SASL" != "0" -a "$HAVE_LIBXML" = "1"
 then
 	HAVE_SASL=0
 	AC_CHECK_LIB(sasl2, sasl_client_start, HAVE_SASL=1 LIBSASL="$LIBSASL -lsasl2", , -lsasl2 $LIBS)
-	if test "$HAVE_SASL" == "1"; then
+	if test "$HAVE_SASL" = "1"; then
 		AC_DEFINE(WITH_SASL,1,
 			[Define if using SASL authentication with the LDAP module])
 	fi
-- 
2.34.1

