Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A794D4932BC
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348265AbiASCNQ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbiASCNQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:16 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4916FC061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:16 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id F3921100FCD
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:14 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZlqBTXl5CerO for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:14 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id ECBE71009F4; Wed, 19 Jan 2022 13:13:14 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 7D6CB10029D;
        Wed, 19 Jan 2022 13:13:14 +1100 (AEDT)
Subject: [PATCH 13/19] autofs-5.1.8 - fix bashism in configure
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:14 +0800
Message-ID: <164255839407.27570.2228418318438287245.stgit@mickey.themaw.net>
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
 CHANGELOG    |    1 +
 configure.in |    6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 8d846d32..dbce6261 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -9,6 +9,7 @@
 - fix nfsv4 only mounts should not use rpcbind.
 - simplify cache_add() a little.
 - fix use after free in tree_mapent_delete_offset_tree().
+- fix bashism in configure.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/configure.in b/configure.in
index 750ffb48..723bb30d 100644
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


