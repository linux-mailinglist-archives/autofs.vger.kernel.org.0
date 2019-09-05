Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13774AAF4E
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390049AbfIEXvC (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:51:02 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50256
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730768AbfIEXvC (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:51:02 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DzFAAKnHFd/1230XZlghuCFoE/IRI?=
 =?us-ascii?q?qhCGPDFIBBoERJROJXJBPA1QJAQEBAQEBAQEBGxkBAgEBhD8CgjYjOBMCDAE?=
 =?us-ascii?q?BAQQBAQEBAQYDAW2Ea09CARABhHcGI2YYCAUCGA4CAkcQBhOFGROqeIEyGgK?=
 =?us-ascii?q?KNYEMKAGLdxh4gQeBRIcqEYMxglgEjzKGI0KWGYIplGgbgjSLSAOKd4Qsiwa?=
 =?us-ascii?q?ZNiE3gSFNLgqDJ4JOF44vNjCBBgEBhDyHNAElgi4BAQ?=
X-IPAS-Result: =?us-ascii?q?A2DzFAAKnHFd/1230XZlghuCFoE/IRIqhCGPDFIBBoERJ?=
 =?us-ascii?q?ROJXJBPA1QJAQEBAQEBAQEBGxkBAgEBhD8CgjYjOBMCDAEBAQQBAQEBAQYDA?=
 =?us-ascii?q?W2Ea09CARABhHcGI2YYCAUCGA4CAkcQBhOFGROqeIEyGgKKNYEMKAGLdxh4g?=
 =?us-ascii?q?QeBRIcqEYMxglgEjzKGI0KWGYIplGgbgjSLSAOKd4QsiwaZNiE3gSFNLgqDJ?=
 =?us-ascii?q?4JOF44vNjCBBgEBhDyHNAElgi4BAQ?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582535"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:45 +0800
Subject: [PATCH 10/32] autofs-5.1.5 - Increase group buffer size
 geometrically
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:44 +0800
Message-ID: <156772690407.5865.2354161580004723703.stgit@mickey.themaw.net>
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

From: Joel Ebel <jbebel@google.com>

Increase group buffer size geometrically rather than linearly
when its found to be small.

This prevents package to eat the cpu if you have large groups.
---
 CHANGELOG    |    1 +
 lib/mounts.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 64eb0926..b72711cb 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -16,6 +16,7 @@ xx/xx/2019 autofs-5.1.6
 - Update README.
 - fix additional typing errors.
 - update autofs(8) offset map entry update description.
+- increase group buffer size geometrically.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/lib/mounts.c b/lib/mounts.c
index e4092d2f..5a8e8cdb 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1539,7 +1539,7 @@ void set_tsd_user_vars(unsigned int logopt, uid_t uid, gid_t gid)
 		status = getgrgid_r(gid, pgr, gr_tmp, tmplen, ppgr);
 		if (status != ERANGE)
 			break;
-		tmplen += grplen;
+		tmplen *= 2;
 
 		/* Don't tempt glibc to alloca() larger than is (likely)
 		 * available on the stack if limit-getgrgid-size is enabled.

