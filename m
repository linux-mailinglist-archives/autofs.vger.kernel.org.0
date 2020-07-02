Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8531212508
	for <lists+autofs@lfdr.de>; Thu,  2 Jul 2020 15:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbgGBNoE (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 2 Jul 2020 09:44:04 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:37583 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgGBNoE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 2 Jul 2020 09:44:04 -0400
Received: by mail-vk1-f176.google.com with SMTP id d64so6336429vke.4
        for <autofs@vger.kernel.org>; Thu, 02 Jul 2020 06:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rJzfMEODNSX1lSKbGxlzqejnfv4QTTeKCW6OrQtg5KM=;
        b=AAeki2+ECWdWm49akE4UnXWJjl1bOb/2e+g9J+HjlGaCkOE12/UeOgdnS4Ms1K8MTX
         psHOd6pnrY2S8GVSYK+ZQrGDciF/fNL69GanHgnnV8YWNby+rIlmYAcV1TlcmbnC+vvk
         Zxo5nXfLn9lpIacniVbZqtXBrhboDT2veSOWDa9/v4seBpjiyU23VA4QkJNXIrIK9gqu
         3uw3oryPKKJzI6jFDCwgerzBqAwJgHzH7nNVDVSJzrfOHK3iradZ07iyL1SwyzXQJ/0j
         EZz58MtEOxAm/5e9yO7wUfyUmOJGEFLz5wSsGUt1yX+AXCluggLpcFPtHwaAE97loUnN
         yP8g==
X-Gm-Message-State: AOAM532+5s2QuR2gVY3J9HZp7W68ro7OXgqzIP41nPOoyfVxFpaLWJ9K
        1WAnUUBbWZtQYg3xR5pcjMjKP078S12ypdsmAN4nQolw
X-Google-Smtp-Source: ABdhPJxKclTBKkMWEIJSrMGh6pWOHKEPTqcPLevHNxMv1CGz0FqW+i4yQwFdEyh0qNKEj9nuUZIQ94H3tka095AuKxo=
X-Received: by 2002:a1f:9144:: with SMTP id t65mr13616921vkd.50.1593697443177;
 Thu, 02 Jul 2020 06:44:03 -0700 (PDT)
MIME-Version: 1.0
From:   Hugh McMaster <hugh.mcmaster@outlook.com>
Date:   Thu, 2 Jul 2020 23:43:50 +1000
Message-ID: <CAN9BcdtuGxQBNWhsCdhTjqw=jr5CoHvVFxD1Nw1k5o-xF0PSog@mail.gmail.com>
Subject: [PATCH 3/3] Use PKG_CHECK_MODULES to detect libxml2
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This patch removes the use of xml2-config and instead uses
PKG_CHECK_MODULES to detect the libxml2 library.

As noted in [1], Debian is removing xml2-config and is progressively
updating its repository to use pkg-config and its helper macros.

This patch builds on Andreas Hasenack's initial patch in [1] and
addresses feedback from Ian Kent [2].

[1] https://www.spinics.net/lists/autofs/msg02204.html
[2] https://www.spinics.net/lists/autofs/msg02206.html


--- a/Makefile.conf.in
+++ b/Makefile.conf.in
@@ -36,7 +36,7 @@ SSSD = @HAVE_SSS_AUTOFS@

 # SASL support: yes (1) no (0)
 XML_LIBS = @XML_LIBS@
-XML_FLAGS = @XML_FLAGS@
+XML_CFLAGS = @XML_CFLAGS@
 SASL = @HAVE_SASL@
 LIBSASL= @LIBSASL@
 SASL_FLAGS = @SASL_FLAGS@
diff --git a/aclocal.m4 b/aclocal.m4
index ec362bb..33561aa 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -272,38 +272,6 @@ else
 fi])
 ])

-dnl --------------------------------------------------------------------------
-dnl AF_CHECK_LIBXML
-dnl
-dnl Check for lib xml
-dnl --------------------------------------------------------------------------
-AC_DEFUN([AF_CHECK_LIBXML],
-[AC_PATH_PROGS(XML_CONFIG, xml2-config, no)
-AC_MSG_CHECKING(for libxml2)
-if test "$XML_CONFIG" = "no"
-then
-  AC_MSG_RESULT(no)
-  HAVE_LIBXML=0
-else
-  AC_MSG_RESULT(yes)
-  HAVE_LIBXML=1
-  XML_LIBS=`$XML_CONFIG --libs`
-  XML_FLAGS=`$XML_CONFIG --cflags`
-  XML_VER=`$XML_CONFIG --version`
-  XML_MAJOR=`echo $XML_VER|cut -d\. -f1`
-  if test $XML_MAJOR -le 99
-  then
-    XML_MINOR=`echo $XML_VER|cut -d\. -f2`
-    if test $XML_MINOR -le 99
-    then
-      XML_REV=`echo $XML_VER|cut -d\. -f3`
-      if test $XML_REV -le 99; then
-        AC_DEFINE(LIBXML2_WORKAROUND,1, [Use libxml2 tsd usage workaround])
-      fi
-    fi
-  fi
-fi])
-
 dnl --------------------------------------------------------------------------
 dnl AF_CHECK_KRB5
 dnl
diff --git a/configure.in b/configure.in
index 525f79b..9e211c9 100644
--- a/configure.in
+++ b/configure.in
@@ -210,7 +210,11 @@ fi
 AC_SUBST(ENABLE_FEDFS)

 # LDAP SASL auth needs libxml and Kerberos
-AF_CHECK_LIBXML()
+PKG_CHECK_MODULES([XML], [libxml-2.0], [
+  HAVE_LIBXML=1
+  AC_DEFINE(LIBXML2_WORKAROUND, 1, [Use libxml2 tsd usage workaround])
+], [HAVE_LIBXML=0])
+
 AF_CHECK_KRB5()

 AC_SEARCH_LIBS([versionsort],[])
@@ -344,7 +348,7 @@ then
     fi
 fi

-AC_SUBST(XML_FLAGS)
+AC_SUBST(XML_CFLAGS)
 AC_SUBST(XML_LIBS)
 AC_SUBST(SASL_FLAGS)
 AC_SUBST(HAVE_SASL)
diff --git a/daemon/Makefile b/daemon/Makefile
index a7ce430..d8e2d6a 100644
--- a/daemon/Makefile
+++ b/daemon/Makefile
@@ -28,7 +28,7 @@ ifeq ($(SYSTEMD), 1)
 endif

 ifeq ($(LDAP), 1)
-    CFLAGS += $(XML_FLAGS)
+    CFLAGS += $(XML_CFLAGS)
     LIBS += $(XML_LIBS)
 endif

diff --git a/lib/Makefile b/lib/Makefile
index 518b483..b20b95b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -25,7 +25,7 @@ CFLAGS += -DAUTOFS_MAP_DIR=\"$(autofsmapdir)\"
 CFLAGS += -DAUTOFS_CONF_DIR=\"$(autofsconfdir)\"

 ifeq ($(LDAP), 1)
-  CFLAGS += $(XML_FLAGS) $(XML_LIBS)
+  CFLAGS += $(XML_CFLAGS) $(XML_LIBS)
 endif

 .PHONY: all install clean
diff --git a/modules/Makefile b/modules/Makefile
index 0447559..989c6c1 100644
--- a/modules/Makefile
+++ b/modules/Makefile
@@ -47,7 +47,7 @@ endif
 ifeq ($(LDAP), 1)
   SRCS += lookup_ldap.c
   MODS += lookup_ldap.so
-  LDAP_FLAGS += $(XML_FLAGS) -DLDAP_THREAD_SAFE
+  LDAP_FLAGS += $(XML_CFLAGS) -DLDAP_THREAD_SAFE
   LIBLDAP += $(XML_LIBS)
   ifeq ($(SASL), 1)
     SASL_OBJ = cyrus-sasl.o cyrus-sasl-extern.o
