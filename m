Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3067A4932D2
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350880AbiASCUK (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:10 -0500
Received: from smtp01.aussiebb.com.au ([121.200.0.92]:48556 "EHLO
        smtp01.aussiebb.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350885AbiASCUH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:07 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 24D6E100FC5
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:21 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id C5Iq_y8keysw for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:21 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 1DEF810027D; Wed, 19 Jan 2022 13:12:21 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 66655100059;
        Wed, 19 Jan 2022 13:12:20 +1100 (AEDT)
Subject: [PATCH 04/19] autofs-5.1.8 - improve descriptor open error reporting
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:19 +0800
Message-ID: <164255833902.27570.7493328325837440159.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Add error message reporting to the descriptor open functions.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG                |    1 +
 daemon/automount.c       |    3 ---
 daemon/spawn.c           |   29 +++++++++++++++++++++++++++++
 lib/mounts.c             |   10 ++--------
 modules/lookup_program.c |    5 +----
 5 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 0cbfbe87..870fd8f3 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,6 +1,7 @@
 - fix kernel mount status notification.
 - fix fedfs build flags.
 - fix set open file limit.
+- improve descriptor open error reporting.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/automount.c b/daemon/automount.c
index b8cbdc1b..b47c485b 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -868,9 +868,6 @@ static int create_logpri_fifo(struct autofs_point *ap)
 
 	fd = open_fd(fifo_name, O_RDWR|O_NONBLOCK);
 	if (fd < 0) {
-		char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
-		crit(ap->logopt,
-		     "Failed to open %s: %s", fifo_name, estr);
 		unlink(fifo_name);
 		ret = -1;
 		goto out_free;
diff --git a/daemon/spawn.c b/daemon/spawn.c
index 7992c5ab..914e5288 100644
--- a/daemon/spawn.c
+++ b/daemon/spawn.c
@@ -94,7 +94,12 @@ int open_fd(const char *path, int flags)
 #endif
 	fd = open(path, flags);
 	if (fd == -1) {
+		char buf[MAX_ERR_BUF];
+		char *estr;
+
 		open_mutex_unlock();
+		estr = strerror_r(errno, buf, sizeof(buf));
+		logerr("failed to open file: %s", estr);
 		return -1;
 	}
 	check_cloexec(fd);
@@ -113,7 +118,12 @@ int open_fd_mode(const char *path, int flags, int mode)
 #endif
 	fd = open(path, flags, mode);
 	if (fd == -1) {
+		char buf[MAX_ERR_BUF];
+		char *estr;
+
 		open_mutex_unlock();
+		estr = strerror_r(errno, buf, sizeof(buf));
+		logerr("failed to open file: %s", estr);
 		return -1;
 	}
 	check_cloexec(fd);
@@ -123,6 +133,8 @@ int open_fd_mode(const char *path, int flags, int mode)
 
 int open_pipe(int pipefd[2])
 {
+	char buf[MAX_ERR_BUF];
+	char *estr;
 	int ret;
 
 	open_mutex_lock();
@@ -145,6 +157,8 @@ done:
 	return 0;
 err:
 	open_mutex_unlock();
+	estr = strerror_r(errno, buf, sizeof(buf));
+	logerr("failed to open pipe: %s", estr);
 	return -1;
 }
 
@@ -159,7 +173,12 @@ int open_sock(int domain, int type, int protocol)
 #endif
 	fd = socket(domain, type, protocol);
 	if (fd == -1) {
+		char buf[MAX_ERR_BUF];
+		char *estr;
+
 		open_mutex_unlock();
+		estr = strerror_r(errno, buf, sizeof(buf));
+		logerr("failed to open socket: %s", estr);
 		return -1;
 	}
 	check_cloexec(fd);
@@ -184,7 +203,12 @@ FILE *open_fopen_r(const char *path)
 #endif
 	f = fopen(path, "r");
 	if (f == NULL) {
+		char buf[MAX_ERR_BUF];
+		char *estr;
+
 		open_mutex_unlock();
+		estr = strerror_r(errno, buf, sizeof(buf));
+		logerr("failed to open file: %s", estr);
 		return NULL;
 	}
 	check_cloexec(fileno(f));
@@ -209,7 +233,12 @@ FILE *open_setmntent_r(const char *table)
 #endif
 	tab = fopen(table, "r");
 	if (tab == NULL) {
+		char buf[MAX_ERR_BUF];
+		char *estr;
+
 		open_mutex_unlock();
+		estr = strerror_r(errno, buf, sizeof(buf));
+		logerr("failed to open mount table: %s", estr);
 		return NULL;
 	}
 	check_cloexec(fileno(tab));
diff --git a/lib/mounts.c b/lib/mounts.c
index 4c866885..39b7fe81 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -2169,11 +2169,8 @@ struct mnt_list *get_mnt_list(const char *path, int include)
 		return NULL;
 
 	tab = open_fopen_r(_PROC_MOUNTS);
-	if (!tab) {
-		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
-		logerr("fopen: %s", estr);
+	if (!tab)
 		return NULL;
-	}
 
 	while ((mnt = local_getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
 		len = strlen(mnt->mnt_dir);
@@ -2280,11 +2277,8 @@ static int table_is_mounted(const char *mp, unsigned int type)
 		return 0;
 
 	tab = open_fopen_r(_PROC_MOUNTS);
-	if (!tab) {
-		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
-		logerr("fopen: %s", estr);
+	if (!tab)
 		return 0;
-	}
 
 	while ((mnt = local_getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
 		size_t len = strlen(mnt->mnt_dir);
diff --git a/modules/lookup_program.c b/modules/lookup_program.c
index 691abedb..b5eb1117 100644
--- a/modules/lookup_program.c
+++ b/modules/lookup_program.c
@@ -214,11 +214,8 @@ static char *lookup_one(struct autofs_point *ap,
 	 * want to send stderr to the syslog, and we don't use spawnl()
 	 * because we need the pipe hooks
 	 */
-	if (open_pipe(pipefd)) {
-		char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
-		logerr(MODPREFIX "pipe: %s", estr);
+	if (open_pipe(pipefd))
 		goto out_error;
-	}
 	if (open_pipe(epipefd)) {
 		close(pipefd[0]);
 		close(pipefd[1]);


