Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF56859297C
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240945AbiHOGTf (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241055AbiHOGTE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:19:04 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC321A3A6
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:19:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id tl27so11972355ejc.1
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+ZsD3do6KiAWTmVyav62iuvkqSZA42NFGPe0XmHWzIg=;
        b=g8NgdmJj5sbzy6N+LP7E2OTHs9kF2+BxppmXmHZKsrM45jEEBOyWcSuxFoUdpuh3bW
         J1sAJogq2hslV4XxAuD6lK0Nb5uyV+pypbF5dA2LsGdsYOANvz54Ka4fSQHieQ1mqQkG
         TpcblIrScQRcyOffvlgqQlw2yPyxwqfxk9xaXgTDMyK+5isnaHJ/wu1/Tgz+aDcWk5PN
         7JT7gDi0q2OIvjw51+GrEt1VZ12uSRbHB0ESV6hjh1XoGTnf+JR4cjoCgpGnYV5OXFHv
         4/jSzZrZ8TsITSgFu6leU7sL5p/soYzXX3id91OTYPGn5Tstq18vpdyZf3FqR+UFYZBv
         QwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+ZsD3do6KiAWTmVyav62iuvkqSZA42NFGPe0XmHWzIg=;
        b=m/95HwM+TLpl1TE9Bxy+ZoyHFP5uD+aGJhs13V5xCgchXc13Dk1I0ZdbyExJ85aMtb
         vNF5t4TXXMC2Z2TxdZof0HHS5g2bag+9O9gqnxMRSU2Fa08DuudT4jnFiIU5b4b/ftXm
         MuVgKdcX8uSEz8aUZI7a6GrAA+Wg9mc+YNyUHJ+hQ9fzc6InQd844S1iZG8O01edRut7
         qIQ8CVaxO8/CqVZMnP2SvXh6vwqi6cEJ2AqJqrK0QSPD6zyFESjs7oxJZ0E9pi3O7afK
         XFdettKR4LziPBMYbIu0S9ChyaQsZfUjp9PcHBUV09/OgD4/YRA2ZGhvvn4vJfgG8EGL
         gYTg==
X-Gm-Message-State: ACgBeo1HdJct8A/OFIFg7XRsF6sDqq9YSc583mMYyeJtJkcY0GhiPsSi
        8wZqEwUpMwmn3S9KGRqjt3MLMo3OvUdf
X-Google-Smtp-Source: AA6agR6hDlouGuL3xaZ47PztUaVMmQdGz9dHVN3cv2perfJT2rWaVgtKGXMpoBuKixBvrrPIht5gDQ==
X-Received: by 2002:a17:907:b19:b0:730:b0d8:750 with SMTP id h25-20020a1709070b1900b00730b0d80750mr9477030ejl.46.1660544341688;
        Sun, 14 Aug 2022 23:19:01 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7d5d4000000b0043c92c44c53sm5984916eds.93.2022.08.14.23.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:19:01 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 2/4] autofs-5.1.8 - prepare for OpenLDAP SASL binding
Date:   Mon, 15 Aug 2022 08:18:46 +0200
Message-Id: <20220815061848.1718068-3-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815061848.1718068-1-reimth@gmail.com>
References: <20220815061848.1718068-1-reimth@gmail.com>
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

