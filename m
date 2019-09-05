Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2187AAF42
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbfIEXuG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:06 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50040
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfIEXuG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:06 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CeDQAKnHFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNAkOAgw?=
 =?us-ascii?q?BAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnh/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgUSKbIJYBI8yhiNClhmCKZRoG418A4p3hCykJTiBWE0?=
 =?us-ascii?q?uCoMngk4Xji82MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2CeDQAKnHFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNAkOAgwBAQEEAQEBAQEGA?=
 =?us-ascii?q?wFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnh/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgUSKbIJYBI8yhiNClhmCKZRoG418A4p3hCykJTiBWE0uCoMngk4Xji82M?=
 =?us-ascii?q?IEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582364"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:40:53 +0800
Subject: [PATCH 01/32] autofs-5.1.5 - make expire remaining log level debug
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:40:53 +0800
Message-ID: <156772685295.5865.9652057164657803576.stgit@mickey.themaw.net>
In-Reply-To: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

The log message listing the remaining mounts should be log level
debug not info.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 daemon/direct.c   |    2 +-
 daemon/indirect.c |    4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index c8a3dec2..fd6a6274 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -7,6 +7,7 @@ xx/xx/2019 autofs-5.1.6
 - optionally log mount requestor process info.
 - log mount call arguments if mount_verbose is set.
 - Fix NFS mount from IPv6 addresses.
+- make expire remaining log level debug.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index 42992220..ad540b08 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -1000,7 +1000,7 @@ void *expire_proc_direct(void *arg)
 	pthread_cleanup_pop(1);
 
 	if (left)
-		info(ap->logopt, "%d remaining in %s", left, ap->path);
+		debug(ap->logopt, "%d remaining in %s", left, ap->path);
 
 	ec.status = left;
 
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 8719960e..e19c0bbf 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -588,7 +588,7 @@ void *expire_proc_indirect(void *arg)
 	pthread_cleanup_pop(1);
 
 	if (submnts)
-		info(ap->logopt,
+		debug(ap->logopt,
 		     "%d submounts remaining in %s", submnts, ap->path);
 
 	/* 
@@ -596,7 +596,7 @@ void *expire_proc_indirect(void *arg)
 	 * words) the umounts are done by the time we reach here
 	 */
 	if (count)
-		info(ap->logopt, "%d remaining in %s", count, ap->path);
+		debug(ap->logopt, "%d remaining in %s", count, ap->path);
 
 	ec.status = left;
 

