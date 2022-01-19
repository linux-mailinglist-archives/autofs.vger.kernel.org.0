Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4194932BF
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbiASCNg (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:13:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348360AbiASCNe (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:13:34 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A03BC061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:13:34 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id E2F70100FD1
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:13:32 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BS6e2Hc12-ug for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:13:32 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id D9449100FD0; Wed, 19 Jan 2022 13:13:32 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 8BBC5100FCC;
        Wed, 19 Jan 2022 13:13:32 +1100 (AEDT)
Subject: [PATCH 16/19] autofs-5.1.8 - avoid internal stat.h definitions
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:13:32 +0800
Message-ID: <164255841232.27570.13099856694971841980.stgit@mickey.themaw.net>
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

Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 CHANGELOG              |    1 +
 daemon/lookup.c        |    6 +++---
 modules/lookup_multi.c |    4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 6f53e597..1a126350 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -12,6 +12,7 @@
 - fix bashism in configure.
 - musl: fix missing include in hash.h.
 - musl: define fallback dummy NSS config path
+- musl: avoid internal stat.h definitions.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/lookup.c b/daemon/lookup.c
index 0b281f83..4a286d6b 100644
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
index fadd2ea6..cf109de9 100644
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


