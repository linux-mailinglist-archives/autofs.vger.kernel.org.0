Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71D75A2389
	for <lists+autofs@lfdr.de>; Fri, 26 Aug 2022 10:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245280AbiHZItn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 26 Aug 2022 04:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245052AbiHZItm (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 26 Aug 2022 04:49:42 -0400
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [121.200.0.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FA9D5DFA
        for <autofs@vger.kernel.org>; Fri, 26 Aug 2022 01:49:41 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id D090B10032D
        for <autofs@vger.kernel.org>; Fri, 26 Aug 2022 18:49:39 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KEyny2xcL4ql for <autofs@vger.kernel.org>;
        Fri, 26 Aug 2022 18:49:39 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 9B8EA1002AB; Fri, 26 Aug 2022 18:49:39 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 440DF100317;
        Fri, 26 Aug 2022 18:49:39 +1000 (AEST)
Subject: [PATCH v2 4/4] autofs-5.1.8 - configure: LDAP function checks ignore
 implicit declarations
From:   Ian Kent <raven@themaw.net>
To:     ThomasReim <reimth@gmail.com>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 26 Aug 2022 16:49:38 +0800
Message-ID: <166150377887.37723.13058254756034202382.stgit@donald.themaw.net>
In-Reply-To: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
References: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
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


