Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E85CCAAF39
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389678AbfIEXqr (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:47 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730501AbfIEXqr (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:47 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CeDQAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNAkOAgw?=
 =?us-ascii?q?BAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgUSKbIJYBI8yhiNClhmCKZRoG418A4p3LYN/pCU4gVh?=
 =?us-ascii?q?NLgqDJ5EUNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2CeDQAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNAkOAgwBAQEEAQEBAQEGA?=
 =?us-ascii?q?wFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgUSKbIJYBI8yhiNClhmCKZRoG418A4p3LYN/pCU4gVhNLgqDJ5EUNjCBB?=
 =?us-ascii?q?gEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582873"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:45 +0800
Subject: [PATCH 31/32] autofs-5.1.5 - fix missing initialization of
 autofs_point flags
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:45 +0800
Message-ID: <156772702490.5865.17733323096670824026.stgit@mickey.themaw.net>
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

When adding the "use_ignore_mount_option" configuration option I added
a "use without initialization" for ap->flags.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/master.c |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 05acd16a..ba165710 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -37,6 +37,7 @@ xx/xx/2019 autofs-5.1.6
 - use local_getmntent_r() for unlink_mount_tree().
 - use local getmntent_r() in get_mnt_list().
 - use local getmntent_r() in tree_make_mnt_list().
+- fix missing initialization of autofs_point flags.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/lib/master.c b/lib/master.c
index 186b1479..da02feec 100644
--- a/lib/master.c
+++ b/lib/master.c
@@ -101,6 +101,8 @@ int master_add_autofs_point(struct master_mapent *entry, unsigned logopt,
 		ap->negative_timeout = global_negative_timeout;
 	ap->exp_timeout = defaults_get_timeout();
 	ap->exp_runfreq = 0;
+	ap->flags = 0;
+
 	if (defaults_get_use_ignore_mount_option())
 		ap->flags = MOUNT_FLAG_IGNORE;
 	if (ghost)

