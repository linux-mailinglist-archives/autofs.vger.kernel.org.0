Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE7EB6B320E
	for <lists+autofs@lfdr.de>; Fri, 10 Mar 2023 00:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjCIX1O (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 9 Mar 2023 18:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjCIX1N (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 9 Mar 2023 18:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC461033A1
        for <autofs@vger.kernel.org>; Thu,  9 Mar 2023 15:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678404389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1ues5INZSDB1Dc5ATXpLpIhZ6zID3xSYlL34+g8iPyk=;
        b=Xj/Fdxv+ABdChIiX85AW0DgWxmhlqVS2VbnTSbG/z7V9VaeRfKsIp3L59LLhWzdiiLleh0
        LCp6cyjUl3UxdSlyEn3buxFlSvT8/gfoyNMjnHCJhlVUSCKZQbZ6ltRIqQxJ6v4Me6HSt1
        rLX5pMJH0xaq95PYiMOkHOWk5ikI21A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-5tvlx_15NKmG3x9QaIQW0g-1; Thu, 09 Mar 2023 18:26:28 -0500
X-MC-Unique: 5tvlx_15NKmG3x9QaIQW0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 021FB811E6E
        for <autofs@vger.kernel.org>; Thu,  9 Mar 2023 23:26:28 +0000 (UTC)
Received: from x1carbon.redhat.com (unknown [10.45.224.6])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2916D440DE;
        Thu,  9 Mar 2023 23:26:26 +0000 (UTC)
From:   Arjun Shankar <arjun@redhat.com>
To:     autofs@vger.kernel.org
Cc:     Arjun Shankar <arjun@redhat.com>
Subject: [PATCH] autofs-5.1.8 - define LDAP_DEPRECATED during LDAP configure check
Date:   Fri, 10 Mar 2023 00:26:18 +0100
Message-Id: <20230309232618.22517-1-arjun@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This commit defines LDAP_DEPRECATED as 1 during a configure check for
ldap_parse_page_control.  This is in line with how lookup_ldap.c is
compiled at build time.

The configure script is regenerated with autoconf 2.69.

The regeneration of the configure script also includes changes due to
commit 69fda4f090e3.  That commit intended to run checks with implicit
function declaration warnings enabled in order to recognize missing
libldap functions.  However, the in-tree copy of the configure script
was not regenerated at that time.

Signed-off-by: Arjun Shankar <arjun@redhat.com>
---
This patch is a result of efforts to port Fedora to modern C:

https://fedoraproject.org/wiki/Changes/PortingToModernC
https://fedoraproject.org/wiki/Toolchain/PortingToModernC

A configure regeneration after 69fda4f090e3 would cause the check for
ldap_parse_page_control to fail, as would using a compiler that expects C99
by default.
---
 aclocal.m4 | 3 ++-
 configure  | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/aclocal.m4 b/aclocal.m4
index 9fc20bf..3b49599 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -419,7 +419,8 @@ af_check_ldap_parse_page_control_save_cflags="$CFLAGS"
 CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 AC_TRY_LINK(
-  [ #include <ldap.h> ],
+  [ #define LDAP_DEPRECATED 1
+    #include <ldap.h> ],
   [ LDAP *ld;
     ber_int_t ct;
     struct berval *c;
diff --git a/configure b/configure
index 91be1e1..bbd2586 100755
--- a/configure
+++ b/configure
@@ -5471,6 +5471,8 @@ $as_echo_n "checking for ldap_create_page_control in -lldap... " >&6; }
 # save current libs
 af_check_ldap_create_page_control_save_libs="$LIBS"
 LIBS="$LIBS -lldap"
+af_check_ldap_create_page_control_save_cflags="$CFLAGS"
+CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
@@ -5507,6 +5509,7 @@ fi
 
 # restore libs
 LIBS="$af_check_ldap_create_page_control_save_libs"
+CFLAGS="$af_check_ldap_create_page_control_save_cflags"
 
 	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ldap_parse_page_control in -lldap" >&5
 $as_echo_n "checking for ldap_parse_page_control in -lldap... " >&6; }
@@ -5514,10 +5517,13 @@ $as_echo_n "checking for ldap_parse_page_control in -lldap... " >&6; }
 # save current libs
 af_check_ldap_parse_page_control_save_libs="$LIBS"
 LIBS="$LIBS -lldap"
+af_check_ldap_parse_page_control_save_cflags="$CFLAGS"
+CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 /* end confdefs.h.  */
- #include <ldap.h>
+ #define LDAP_DEPRECATED 1
+    #include <ldap.h>
 int
 main ()
 {
@@ -5550,6 +5556,7 @@ fi
 
 # restore libs
 LIBS="$af_check_ldap_parse_page_control_save_libs"
+CFLAGS="$af_check_ldap_parse_page_control_save_cflags"
 
     fi
 fi
-- 
2.39.1

