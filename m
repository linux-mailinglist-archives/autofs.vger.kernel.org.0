Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC7EAAF52
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390054AbfIEXvS (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:51:18 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50380
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389851AbfIEXvS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:51:18 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DYFgAKnHFd/1230XZlHgEfBgeBTgI?=
 =?us-ascii?q?BghWBPwwVEiqEIY8MUgEGgRE4iVyPP4FnCQEBAQEBAQEBARsZAQIBAYQ/AoI?=
 =?us-ascii?q?2IzcGDgIMAQEBBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4U?=
 =?us-ascii?q?ZE6p4fzMaAoo1gQwoAYt3GHiBB4FEh0mDI4JYBI8yhiNClhmCKZRoG418A4p?=
 =?us-ascii?q?3hCykOyKBWE0uCoMnkRQ2MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DYFgAKnHFd/1230XZlHgEfBgeBTgIBghWBPwwVEiqEI?=
 =?us-ascii?q?Y8MUgEGgRE4iVyPP4FnCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzcGDgIMAQEBB?=
 =?us-ascii?q?AEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p4fzMaAoo1g?=
 =?us-ascii?q?QwoAYt3GHiBB4FEh0mDI4JYBI8yhiNClhmCKZRoG418A4p3hCykOyKBWE0uC?=
 =?us-ascii?q?oMnkRQ2MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582592"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:07 +0800
Subject: [PATCH 14/32] autofs-5.1.5 - remove a couple of old debug messages
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:07 +0800
Message-ID: <156772692705.5865.4278189852816113972.stgit@mickey.themaw.net>
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

Remove a couple of debug log messages from lookup_ghost().
These messages have not shown a problem here and should be
removed.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG       |    1 +
 daemon/lookup.c |    5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 9fc4a0d1..1a48209e 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -20,6 +20,7 @@ xx/xx/2019 autofs-5.1.6
 - also use strictexpire for offsets.
 - remove unused function has_fstab_option().
 - remove unused function reverse_mnt_list().
+- remove a couple of old debug messages.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/lookup.c b/daemon/lookup.c
index 18df9352..bc8bbb7f 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -793,11 +793,6 @@ int lookup_ghost(struct autofs_point *ap, const char *root)
 
 			/* Directory already exists? */
 			if (!ret) {
-				/* Shouldn't need this
-				me->dev = st.st_dev;
-				me->ino = st.st_ino;
-				*/
-				debug(ap->logopt, "me->dev %d me->ino %d", me->dev, me->ino);
 				free(fullpath);
 				goto next;
 			}

