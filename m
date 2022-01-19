Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1A34932D1
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350887AbiASCUJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:09 -0500
Received: from smtp01.aussiebb.com.au ([121.200.0.92]:48564 "EHLO
        smtp01.aussiebb.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350880AbiASCUG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:06 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id F02B3100FC4
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:13 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7A3TBPSDpkjb for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:13 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id E9725100059; Wed, 19 Jan 2022 13:12:13 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 84E50100059;
        Wed, 19 Jan 2022 13:12:13 +1100 (AEDT)
Subject: [PATCH 03/19] autofs-5.1.8 - fix set open file limit
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:13 +0800
Message-ID: <164255833317.27570.5143732088759558330.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

The check of whether the open file limit needs to be changed is not
right, it checks the hard open file limit against what autofs wants
to set it to which is always less than this value. Consequently the
open file limit isn't changed.

autofs should be changing only the soft open file limit but it is
setting both the hard and soft limits. The system hard limit is much
higer than the autofs maximum open files so the hard limit should be
left alone.

While we are here increase the requested maximum soft open file limit
to 20k.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG          |    1 +
 daemon/automount.c |    7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 61090a99..0cbfbe87 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,5 +1,6 @@
 - fix kernel mount status notification.
 - fix fedfs build flags.
+- fix set open file limit.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/automount.c b/daemon/automount.c
index cc286892..b8cbdc1b 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -94,7 +94,7 @@ struct startup_cond suc = {
 pthread_key_t key_thread_stdenv_vars;
 pthread_key_t key_thread_attempt_id = (pthread_key_t) 0L;
 
-#define MAX_OPEN_FILES		10240
+#define MAX_OPEN_FILES		20480
 
 int aquire_flag_file(void);
 void release_flag_file(void);
@@ -2486,9 +2486,10 @@ int main(int argc, char *argv[])
 	}
 
 	res = getrlimit(RLIMIT_NOFILE, &rlim);
-	if (res == -1 || rlim.rlim_max <= MAX_OPEN_FILES)  {
+	if (res == -1 || rlim.rlim_cur <= MAX_OPEN_FILES)  {
 		rlim.rlim_cur = MAX_OPEN_FILES;
-		rlim.rlim_max = MAX_OPEN_FILES;
+		if (rlim.rlim_max < MAX_OPEN_FILES)
+			rlim.rlim_max = MAX_OPEN_FILES;
 	}
 	res = setrlimit(RLIMIT_NOFILE, &rlim);
 	if (res)


