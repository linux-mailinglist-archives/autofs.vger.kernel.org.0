Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B401E47F146
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 23:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240336AbhLXWDZ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 17:03:25 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53688 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbhLXWDY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 17:03:24 -0500
From:   Sam James <sam@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     dlan@gentoo.org, Sam James <sam@gentoo.org>
Subject: [PATCH 4/7] autofs-5.1.8 - avoid internal stat.h definitions
Date:   Fri, 24 Dec 2021 22:02:22 +0000
Message-Id: <20211224220225.2531481-4-sam@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG              | 1 +
 daemon/lookup.c        | 6 +++---
 modules/lookup_multi.c | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 0eabf30..3b11b79 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -2,6 +2,7 @@
 - fix bashism in configure
 - musl: fix missing include in hash.h
 - musl: define fallback dummy NSS config path
+- musl: avoid internal stat.h definitions
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/lookup.c b/daemon/lookup.c
index 0b281f8..4a286d6 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -397,7 +397,7 @@ static int read_file_source_instance(struct autofs_point *ap, struct map_source
 		return NSS_STATUS_NOTFOUND;
 	}
 
-	if (st.st_mode & __S_IEXEC)
+	if (st.st_mode & S_IEXEC)
 		type = src_prog;
 	else
 		type = src_file;
@@ -930,7 +930,7 @@ static int lookup_name_file_source_instance(struct autofs_point *ap, struct map_
 		return NSS_STATUS_NOTFOUND;
 	}
 
-	if (st.st_mode & __S_IEXEC)
+	if (st.st_mode & S_IEXEC)
 		type = src_prog;
 	else
 		type = src_file;
@@ -1077,7 +1077,7 @@ static struct map_source *lookup_get_map_source(struct master_mapent *entry)
 	if (!S_ISREG(st.st_mode))
 		return NULL;
 
-	if (st.st_mode & __S_IEXEC)
+	if (st.st_mode & S_IEXEC)
 		type = "program";
 	else
 		type = "file";
diff --git a/modules/lookup_multi.c b/modules/lookup_multi.c
index fadd2ea..cf109de 100644
--- a/modules/lookup_multi.c
+++ b/modules/lookup_multi.c
@@ -247,7 +247,7 @@ static struct lookup_mod *nss_open_lookup(const char *format, int argc, const ch
 				continue;
 			}
 
-			if (st.st_mode & __S_IEXEC)
+			if (st.st_mode & S_IEXEC)
 				type = src_prog;
 			else
 				type = src_file;
@@ -452,7 +452,7 @@ int lookup_reinit(const char *my_mapfmt,
 					continue;
 				}
 
-				if (st.st_mode & __S_IEXEC)
+				if (st.st_mode & S_IEXEC)
 					type = src_prog;
 				else
 					type = src_file;
-- 
2.34.1

