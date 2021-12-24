Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF68447F149
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351940AbhLXWDa (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:30 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53698 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbhLXWDa (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:30 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 6/7] autofs-5.1.8 - add missing include to log.h for pid_t
Date:   Fri, 24 Dec 2021 22:02:24 +0000
Message-Id: <20211224220225.2531481-6-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Fixes build failures on musl like:
```
../include/log.h:49:8: error: unknown type name 'pid_t'
   49 | extern pid_t log_pidinfo(struct autofs_point *ap, pid_t pid, char *label);
      |        ^~~~~
../include/log.h:49:51: error: unknown type name 'pid_t'; did you mean 'gid_t'?
   49 | extern pid_t log_pidinfo(struct autofs_point *ap, pid_t pid, char *label);
      |                                                   ^~~~~
      |                                                   gid_t
```

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG     | 1 +
 include/log.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index edf2d30..56b9cd9 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -4,6 +4,7 @@
 - musl: define fallback dummy NSS config path
 - musl: avoid internal stat.h definitions
 - musl: add missing include to hash.h for _WORDSIZE
+- musl: add missing include to log.h for pid_t
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/log.h b/include/log.h
index 69eed96..a7b09f9 100644
--- a/include/log.h
+++ b/include/log.h
@@ -17,6 +17,8 @@
 #ifndef LOG_H
 #define LOG_H
 
+#include <unistd.h>
+
 /* Define logging functions */
 
 #define LOGOPT_NONE	0x0000
-- 
2.34.1

