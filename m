Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99FF59B7D9
	for <lists+autofs@lfdr.de>; Mon, 22 Aug 2022 05:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbiHVDFJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 21 Aug 2022 23:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiHVDFF (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 21 Aug 2022 23:05:05 -0400
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [121.200.0.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58ECA1839C
        for <autofs@vger.kernel.org>; Sun, 21 Aug 2022 20:05:04 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 7E31C1020AF
        for <autofs@vger.kernel.org>; Mon, 22 Aug 2022 12:55:15 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LRBZsTFPW_ej for <autofs@vger.kernel.org>;
        Mon, 22 Aug 2022 12:55:15 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 73AE51004DB; Mon, 22 Aug 2022 12:55:15 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 9E0B01004CE;
        Mon, 22 Aug 2022 12:55:14 +1000 (AEST)
Subject: [PATCH 2/4] autofs-5.1.8 - prepare for OpenLDAP SASL binding
From:   Ian Kent <raven@themaw.net>
To:     ThomasReim <reimth@gmail.com>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Mon, 22 Aug 2022 10:55:14 +0800
Message-ID: <166113691430.58093.13690762349501795039.stgit@donald.themaw.net>
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
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG           |    1 +
 aclocal.m4          |   43 ++++++++++++++++++++++++++++++++++++++++
 configure           |   55 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 configure.in        |    5 ++++-
 include/config.h.in |    3 +++
 5 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 68365e86..98ec78a9 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -30,6 +30,7 @@
 - fix missing unlock in sasl_do_kinit_ext_cc().
 - fix a couple of null cache locking problems.
 - restore gcc flags after autoconf Kerberos 5 check.
+- prepare for OpenLDAP SASL binding.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/aclocal.m4 b/aclocal.m4
index c671b5b0..91b22dae 100644
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
diff --git a/configure b/configure
index 90ce6e0e..91be1e14 100755
--- a/configure
+++ b/configure
@@ -4481,6 +4481,9 @@ _ACEOF
 fi
 done
 
+
+  CFLAGS="$SAVE_CFLAGS"
+  LIBS="$SAVE_LIBS"
 fi
 
 { $as_echo "$as_me:${as_lineno-$LINENO}: checking for library containing versionsort" >&5
@@ -5347,6 +5350,7 @@ CFLAGS="$af_check_nis_header_save_cflags"
 # OpenLDAP support?  Expect that this may have a special directory...
 #
 AF_tmp_ldflags="$LDFLAGS"
+AF_tmp_libs="$LIBS"
 LIBLDAP=''
 HAVE_LDAP=''
 
@@ -5413,7 +5417,54 @@ fi
 
 $as_echo "#define WITH_LDAP 1" >>confdefs.h
 
-	fi
+	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for cyrus sasl support in openldap" >&5
+$as_echo_n "checking for cyrus sasl support in openldap... " >&6; }
+    have_openldap_cyrus_sasl=no
+    # save current libs
+    af_check_ldap_support_sasl_save_libs="$LIBS"
+    LIBS="$LIBLDAP"
+
+    if test "$cross_compiling" = yes; then :
+  have_openldap_sasl=yes
+else
+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+  #include <stdlib.h>
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
+          }
+_ACEOF
+if ac_fn_c_try_run "$LINENO"; then :
+  have_openldap_sasl=yes
+else
+  have_openldap_sasl=no
+fi
+rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+  conftest.$ac_objext conftest.beam conftest.$ac_ext
+fi
+
+
+    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_openldap_sasl" >&5
+$as_echo "$have_openldap_sasl" >&6; }
+    if test "$have_openldap_sasl" = "yes"; then
+
+$as_echo "#define WITH_LDAP_CYRUS_SASL 1" >>confdefs.h
+
+    fi
+
+    # restore libs
+    LIBS="$af_check_ldap_parse_page_control_save_libs"
+
 	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ldap_create_page_control in -lldap" >&5
 $as_echo_n "checking for ldap_create_page_control in -lldap... " >&6; }
 
@@ -5500,12 +5551,14 @@ fi
 # restore libs
 LIBS="$af_check_ldap_parse_page_control_save_libs"
 
+    fi
 fi
 
 
 
 
 LDFLAGS="${AF_tmp_ldflags}"
+LIBS="${AF_tmp_libs}"
 
 #
 # SASL support
diff --git a/configure.in b/configure.in
index 68cbd44a..45f32340 100644
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
index 4f8daa86..7dab82ee 100644
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
 


