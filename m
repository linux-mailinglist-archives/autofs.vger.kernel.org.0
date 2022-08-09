Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E070958D870
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbiHIL4i (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242939AbiHIL4h (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:56:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6F4CE24
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:56:36 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id tl27so21794150ejc.1
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+ZsD3do6KiAWTmVyav62iuvkqSZA42NFGPe0XmHWzIg=;
        b=FuJ6dFK6P85N3nt3GKxTftMyUEv7BT4oPWezcl5YYrVoY3ofJXqKBS4lmIMasDl3WM
         gszhOqHfiNC0HABPfv8ytZdfI1PpNLPVdNPeQUWKYebRmSacHMqbCkLtojceqLCP90nW
         WEy8tstN8h4gf6ZIxiJvSUgwKDsejIXzHwvHYJolN22ugeZwMGSOmv3NQkJlV0MHnzOo
         uKiJVqz76LhZJmBpYafDCLw9d070juQZdVeoWYWGsPnqiEkwuGskA3Rlwslv5GgR0AfS
         K7h7Q0LcIOGVgM9Fqt/RBkpH1G6Ha4MoxIAGoOz54rHILMNzDJoTPMxtIs03QHjnQXz7
         BV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+ZsD3do6KiAWTmVyav62iuvkqSZA42NFGPe0XmHWzIg=;
        b=UwOkNfkA8xvI60XVwrCzGJLRZdUk59sDEunS8okquhkOq+WMzndbigrjoi2pXeK4bx
         4gmEFgayqjOsfCod7rvFp3FahE5pYyhVwzdwwlI0AZcAzGUaPxs6sr4oeMw2gHLnbeSY
         97VASsFGEnB6Oprbd/FMYL4U5+UqjQ4hEfkGO4tsp0/kc5ZQjKuQaEyHsQNTApH4IoN2
         y4MZyimaqMGETqrJfAsmNKMJCQzwFxfWCc8sUXHJbZK17KM2iZ4EecrUsmfUBTh3zEkO
         N3CsEf9e35ZaPvN716jkKiFdG4U8gK4oMJdd2GdTkb/681OUkDtliKJfCWGsDn2AljrE
         s5ZA==
X-Gm-Message-State: ACgBeo15sQ17+FOU+/n1FWVpQ6/dn3jlN5Ub8+9UXDCmGIQmp6od5nDa
        mFlYO1kt2b/AM80kLI/UzZJYSLtJZaJD
X-Google-Smtp-Source: AA6agR6RJsNxCAwmcaguwJlK3rU/K5hUhCMArzGpwKAPecQRMCd/IjPg6HsinsSLnKnL4rEmNP7PxA==
X-Received: by 2002:a17:906:5a4f:b0:730:825a:d860 with SMTP id my15-20020a1709065a4f00b00730825ad860mr16299150ejc.143.1660046195300;
        Tue, 09 Aug 2022 04:56:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b007304bdf18cfsm1048488ejb.136.2022.08.09.04.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:56:35 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 2/4] autofs-5.1.8 - prepare for OpenLDAP SASL binding
Date:   Tue,  9 Aug 2022 13:56:06 +0200
Message-Id: <20220809115608.107767-3-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809115608.107767-1-reimth@gmail.com>
References: <20220809115608.107767-1-reimth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Thomas Reim <reimth@gmail.com>

autofs prefers OpenLDAP as LDAP client library and Cyrus as SASL library.
OpenLDAP also uses Cyrus SASL and is fully capable of providing SASL
authentication and binding to clients. OpenLDAP SASL interface is actively
maintained and provides latest security features, e. g. SASL data security
layer.

It does not make much sense to implement and use an own SASL interface in
autofs if OpenLDAP is used, which already has a powerful SASL implementation.

Prepare conditional compilation for use of OpenLDAP for SASL authentication
and binding.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 aclocal.m4          | 43 +++++++++++++++++++++++++++++++++++++++++++
 configure.in        |  5 ++++-
 include/config.h.in |  3 +++
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/aclocal.m4 b/aclocal.m4
index c671b5b..91b22da 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -325,6 +325,49 @@ AC_TRY_LINK(
 LIBS="$af_check_hesiod_save_libs"
 ])
 
+dnl --------------------------------------------------------------------------
+dnl AF_CHECK_FUNC_LDAP_SUPPORT_SASL
+dnl
+dnl Check for sasl support in ldap
+dnl --------------------------------------------------------------------------
+AC_DEFUN(
+  [AF_CHECK_FUNC_LDAP_SUPPORT_SASL],
+  [AC_MSG_CHECKING(for cyrus sasl support in openldap)
+    have_openldap_cyrus_sasl=no
+    # save current libs
+    af_check_ldap_support_sasl_save_libs="$LIBS"
+    LIBS="$LIBLDAP"
+
+    AC_RUN_IFELSE(
+      [ AC_LANG_SOURCE(
+        [ #include <stdlib.h>
+          #include <ldap.h>
+          int main (int argc, char **argv) {
+            LDAP *ldap = NULL;
+            int lret = 0;
+
+            lret = ldap_initialize(&ldap, NULL);
+            if (lret != LDAP_OPT_SUCCESS) {
+              exit(1);
+            }
+            lret = ldap_set_option(ldap, LDAP_OPT_X_SASL_NOCANON,
+                                   LDAP_OPT_ON);
+            exit(lret == LDAP_OPT_SUCCESS ? 0 : 1);
+          } ])],
+      have_openldap_sasl=yes,
+      have_openldap_sasl=no,
+      have_openldap_sasl=yes)
+
+    AC_MSG_RESULT($have_openldap_sasl)
+    if test "$have_openldap_sasl" = "yes"; then
+      AC_DEFINE(WITH_LDAP_CYRUS_SASL,1,
+         [Define if OpenLDAP was built with Cyrus SASL])
+    fi
+
+    # restore libs
+    LIBS="$af_check_ldap_parse_page_control_save_libs"
+  ])
+
 dnl --------------------------------------------------------------------------
 dnl AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL
 dnl
diff --git a/configure.in b/configure.in
index 68cbd44..45f3234 100644
--- a/configure.in
+++ b/configure.in
@@ -279,6 +279,7 @@ AF_CHECK_NIS_HEADER()
 # OpenLDAP support?  Expect that this may have a special directory...
 #
 AF_tmp_ldflags="$LDFLAGS"
+AF_tmp_libs="$LIBS"
 LIBLDAP=''
 HAVE_LDAP=''
 AC_ARG_WITH(openldap,
@@ -303,15 +304,17 @@ if test -z "$HAVE_LDAP" -o "$HAVE_LDAP" != "0"; then
 	if test "$HAVE_LDAP" = "1"; then
 		AC_DEFINE(WITH_LDAP,1,
 			[Define if using LDAP as a source of automount maps])
-	fi
+	AF_CHECK_FUNC_LDAP_SUPPORT_SASL()
 	AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL()
 	AF_CHECK_FUNC_LDAP_PARSE_PAGE_CONTROL()
+    fi
 fi
 
 AC_SUBST(LDAP_FLAGS)
 AC_SUBST(HAVE_LDAP)
 AC_SUBST(LIBLDAP)
 LDFLAGS="${AF_tmp_ldflags}"
+LIBS="${AF_tmp_libs}"
 
 #
 # SASL support
diff --git a/include/config.h.in b/include/config.h.in
index 4f8daa8..7dab82e 100644
--- a/include/config.h.in
+++ b/include/config.h.in
@@ -162,6 +162,9 @@
 /* Define if using LDAP as a source of automount maps */
 #undef WITH_LDAP
 
+/* Define if OpenLDAP was built with Cyrus SASL */
+#undef WITH_LDAP_CYRUS_SASL
+
 /* Define to 1 if you have the libtirpc library installed */
 #undef WITH_LIBTIRPC
 
-- 
2.37.1

