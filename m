Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94D859B7DB
	for <lists+autofs@lfdr.de>; Mon, 22 Aug 2022 05:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiHVDFi (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 21 Aug 2022 23:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiHVDFg (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 21 Aug 2022 23:05:36 -0400
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35E118378
        for <autofs@vger.kernel.org>; Sun, 21 Aug 2022 20:05:34 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 13AF81020B7
        for <autofs@vger.kernel.org>; Mon, 22 Aug 2022 12:55:26 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5WBXHpw8OTxI for <autofs@vger.kernel.org>;
        Mon, 22 Aug 2022 12:55:26 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 0D85A1020B1; Mon, 22 Aug 2022 12:55:26 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id AF4AF1020B1;
        Mon, 22 Aug 2022 12:55:25 +1000 (AEST)
Subject: [PATCH 4/4] autofs-5.1.8 - configure: LDAP function checks ignore
 implicit declarations
From:   Ian Kent <raven@themaw.net>
To:     ThomasReim <reimth@gmail.com>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Mon, 22 Aug 2022 10:55:25 +0800
Message-ID: <166113692545.58093.11940893211628268636.stgit@donald.themaw.net>
In-Reply-To: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
References: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Thomas Reim <reimth@gmail.com>

Wrong CFLAGS: gcc handles implicit function declaration as warning with current
flag settings. Missing functions in libldap will not be identified.

Signed-off-by: Thomas Reim <reimth@gmail.com>
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG  |    1 +
 aclocal.m4 |    6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 52da6256..02f059d0 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -32,6 +32,7 @@
 - restore gcc flags after autoconf Kerberos 5 check.
 - prepare for OpenLDAP SASL binding.
 - let OpenLDAP handle SASL binding.
+- configure: LDAP function checks ignore implicit declarations.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/aclocal.m4 b/aclocal.m4
index 91b22dae..9fc20bf1 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -379,6 +379,8 @@ AC_DEFUN([AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL],
 # save current libs
 af_check_ldap_create_page_control_save_libs="$LIBS"
 LIBS="$LIBS -lldap"
+af_check_ldap_create_page_control_save_cflags="$CFLAGS"
+CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 AC_TRY_LINK(
   [ #include <ldap.h> ],
@@ -399,6 +401,7 @@ fi
 
 # restore libs
 LIBS="$af_check_ldap_create_page_control_save_libs"
+CFLAGS="$af_check_ldap_create_page_control_save_cflags"
 ])
 
 dnl --------------------------------------------------------------------------
@@ -412,6 +415,8 @@ AC_DEFUN([AF_CHECK_FUNC_LDAP_PARSE_PAGE_CONTROL],
 # save current libs
 af_check_ldap_parse_page_control_save_libs="$LIBS"
 LIBS="$LIBS -lldap"
+af_check_ldap_parse_page_control_save_cflags="$CFLAGS"
+CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 AC_TRY_LINK(
   [ #include <ldap.h> ],
@@ -432,6 +437,7 @@ fi
 
 # restore libs
 LIBS="$af_check_ldap_parse_page_control_save_libs"
+CFLAGS="$af_check_ldap_parse_page_control_save_cflags"
 ])
 
 dnl --------------------------------------------------------------------------


