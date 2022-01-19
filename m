Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E344932BE
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348337AbiASCNa (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbiASCNa (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:30 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A67C061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:30 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6D9B9100FD0
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:27 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TXU3cWSTvx8K for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:27 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 5FDCB100FD1; Wed, 19 Jan 2022 13:13:27 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id C7D8B100FCD;
        Wed, 19 Jan 2022 13:13:26 +1100 (AEDT)
Subject: [PATCH 15/19] autofs-5.1.8 - define fallback dummy NSS config path
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:26 +0800
Message-ID: <164255840613.27570.2982848490337281830.stgit@mickey.themaw.net>
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

On musl, _PATH_NSSWITCH_CONF won't be defined (it doesn't support NSS),
so let's give it a dummy path when it's not defined by glibc.

Fixes build failures like:
```
../include/nsswitch.h:27:23: error: '_PATH_NSSWITCH_CONF' undeclared (first use in this function)
   27 | #define NSSWITCH_FILE _PATH_NSSWITCH_CONF
      |                       ^~~~~~~~~~~~~~~~~~~
```

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG          |    1 +
 include/nsswitch.h |    4 ++++
 2 files changed, 5 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 55465d74..6f53e597 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -11,6 +11,7 @@
 - fix use after free in tree_mapent_delete_offset_tree().
 - fix bashism in configure.
 - musl: fix missing include in hash.h.
+- musl: define fallback dummy NSS config path
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/nsswitch.h b/include/nsswitch.h
index d3e40277..8376113e 100644
--- a/include/nsswitch.h
+++ b/include/nsswitch.h
@@ -24,6 +24,10 @@
 #include <netdb.h>
 #include "list.h"
 
+#ifndef _PATH_NSSWITCH_CONF
+#define _PATH_NSSWITCH_CONF "/dev/null"
+#endif
+
 #define NSSWITCH_FILE _PATH_NSSWITCH_CONF
 
 enum nsswitch_status {


