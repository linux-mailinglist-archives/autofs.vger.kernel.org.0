Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8619AAF30
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387634AbfIEXqI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:08 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48934
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732047AbfIEXqH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:07 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CDEAAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXIoHhSSBewkBAQEBAQEBAQEbGQECAQGEPwKCNiM1CA4?=
 =?us-ascii?q?CDAEBAQQBAQEBAQYDAW2Ea09CARABhHcGIwRiGA0CGA4CAkcQBhOFGROqdn8?=
 =?us-ascii?q?zGgKKNYEMKAGLdxh4gQeBRIpsglgEjzKGI0KWGYIplGgbjXwDinctg3+kJgE?=
 =?us-ascii?q?2gVhNLgqDJ5EUNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2CDEAAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXIoHhSSBewkBAQEBAQEBAQEbGQECAQGEPwKCNiM1CA4CDAEBAQQBAQEBA?=
 =?us-ascii?q?QYDAW2Ea09CARABhHcGIwRiGA0CGA4CAkcQBhOFGROqdn8zGgKKNYEMKAGLd?=
 =?us-ascii?q?xh4gQeBRIpsglgEjzKGI0KWGYIplGgbjXwDinctg3+kJgE2gVhNLgqDJ5EUN?=
 =?us-ascii?q?jCBBgEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582700"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:59 +0800
Subject: [PATCH 23/32] autofs-5.1.5 - use local getmntent_r in
 table_is_mounted()
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:59 +0800
Message-ID: <156772697891.5865.2458356779124083333.stgit@mickey.themaw.net>
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

Use the local_getmntent_r() funtion copied from glibc in the function
table_is_mounted() so that if glibc is changed to support the autofs
"ignore" hint automount(8) won't be affected.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 28651a40..3986e23c 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -29,6 +29,7 @@ xx/xx/2019 autofs-5.1.6
 - use mp instead of path in mnt_list entries.
 - always use PROC_MOUNTS to make mount lists.
 - add glibc getmntent_r().
+- use local getmntent_r in table_is_mounted().
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/lib/mounts.c b/lib/mounts.c
index d7f409d6..26265bb7 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -999,14 +999,14 @@ static int table_is_mounted(const char *mp, unsigned int type)
 	if (!mp || !mp_len || mp_len >= PATH_MAX)
 		return 0;
 
-	tab = open_setmntent_r(_PROC_MOUNTS);
+	tab = open_fopen_r(_PROC_MOUNTS);
 	if (!tab) {
 		char *estr = strerror_r(errno, buf, PATH_MAX - 1);
-		logerr("setmntent: %s", estr);
+		logerr("fopen: %s", estr);
 		return 0;
 	}
 
-	while ((mnt = getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
+	while ((mnt = local_getmntent_r(tab, &mnt_wrk, buf, PATH_MAX * 3))) {
 		size_t len = strlen(mnt->mnt_dir);
 
 		if (type) {
@@ -1028,7 +1028,7 @@ static int table_is_mounted(const char *mp, unsigned int type)
 			break;
 		}
 	}
-	endmntent(tab);
+	fclose(tab);
 
 	return ret;
 }

