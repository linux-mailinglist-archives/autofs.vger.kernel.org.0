Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD91459B7D8
	for <lists+autofs@lfdr.de>; Mon, 22 Aug 2022 05:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbiHVDFH (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 21 Aug 2022 23:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbiHVDFF (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 21 Aug 2022 23:05:05 -0400
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [121.200.0.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEBB18378
        for <autofs@vger.kernel.org>; Sun, 21 Aug 2022 20:05:04 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 4BB621004A4
        for <autofs@vger.kernel.org>; Mon, 22 Aug 2022 12:55:10 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GOWpJCs6qQsw for <autofs@vger.kernel.org>;
        Mon, 22 Aug 2022 12:55:10 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 426D71004DB; Mon, 22 Aug 2022 12:55:10 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 11C4710038E;
        Mon, 22 Aug 2022 12:55:09 +1000 (AEST)
Subject: [PATCH 1/4] autofs-5.1.8 - restore gcc flags after autoconf Kerberos
 5 check
From:   Ian Kent <raven@themaw.net>
To:     ThomasReim <reimth@gmail.com>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Mon, 22 Aug 2022 10:55:08 +0800
Message-ID: <166113690874.58093.1520434820653890437.stgit@donald.themaw.net>
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

Heavily modified LIBS and CFLAGS harm succeeding configure checks

Signed-off-by: Thomas Reim <reimth@gmail.com>
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG  |    1 +
 aclocal.m4 |    3 +++
 2 files changed, 4 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 5bb47099..68365e86 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -29,6 +29,7 @@
 - handle innetgr() not present in musl.
 - fix missing unlock in sasl_do_kinit_ext_cc().
 - fix a couple of null cache locking problems.
+- restore gcc flags after autoconf Kerberos 5 check.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/aclocal.m4 b/aclocal.m4
index 33561aae..c671b5b0 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -296,6 +296,9 @@ else
   LIBS="$LIBS $KRB5_LIBS"
 
   AC_CHECK_FUNCS([krb5_principal_get_realm])
+
+  CFLAGS="$SAVE_CFLAGS"
+  LIBS="$SAVE_LIBS"
 fi])
 
 dnl --------------------------------------------------------------------------


