Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD6947F147
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhLXWDZ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:25 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53690 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbhLXWDY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:24 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 3/7] autofs-5.1.8 - define fallback dummy NSS config path
Date:   Fri, 24 Dec 2021 22:02:21 +0000
Message-Id: <20211224220225.2531481-3-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

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
 CHANGELOG          | 1 +
 include/nsswitch.h | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 93d8c83..0eabf30 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,6 +1,7 @@
 
 - fix bashism in configure
 - musl: fix missing include in hash.h
+- musl: define fallback dummy NSS config path
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/nsswitch.h b/include/nsswitch.h
index d3e4027..8376113 100644
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
-- 
2.34.1

