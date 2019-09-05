Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0754AAF49
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390019AbfIEXuo (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:44 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50232
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388314AbfIEXuo (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:44 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DGEQAKnHFd/1230XZlghkCghZtUiE?=
 =?us-ascii?q?SKoQhjwxSAQaBESUTiU4OhUSJZxSBZwkBAQEBAQEBAQEbEAkBAgEBhD8CgjY?=
 =?us-ascii?q?jNgcOAgwBAQEEAQEBAQEGAwFthGtDDEIBEAGEdwYjSxsYCAUCGA4CAiEmEAY?=
 =?us-ascii?q?TGoMJgWoDCRMQqmiBMhoCh34NgiqBDCgBi3cYeIEHgUSFNzwLA4ElEgIRgyG?=
 =?us-ascii?q?CWASMVIJehWBDQpVYQYIphneJc4N+G4I0b4ZNhAwDEIpnhCyLBoZFggaQWwU?=
 =?us-ascii?q?sgVhNLgo7gmwJhitGhE6FTDYwAQEBgQMBAYQ8hzSCVAEB?=
X-IPAS-Result: =?us-ascii?q?A2DGEQAKnHFd/1230XZlghkCghZtUiESKoQhjwxSAQaBE?=
 =?us-ascii?q?SUTiU4OhUSJZxSBZwkBAQEBAQEBAQEbEAkBAgEBhD8CgjYjNgcOAgwBAQEEA?=
 =?us-ascii?q?QEBAQEGAwFthGtDDEIBEAGEdwYjSxsYCAUCGA4CAiEmEAYTGoMJgWoDCRMQq?=
 =?us-ascii?q?miBMhoCh34NgiqBDCgBi3cYeIEHgUSFNzwLA4ElEgIRgyGCWASMVIJehWBDQ?=
 =?us-ascii?q?pVYQYIphneJc4N+G4I0b4ZNhAwDEIpnhCyLBoZFggaQWwUsgVhNLgo7gmwJh?=
 =?us-ascii?q?itGhE6FTDYwAQEBgQMBAYQ8hzSCVAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582477"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:27 +0800
Subject: [PATCH 07/32] autofs-5.1.5 - Update README
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:27 +0800
Message-ID: <156772688690.5865.8497331951503803669.stgit@mickey.themaw.net>
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

From: Andreas P <nurgrak@gmail.com>

Update README

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG |    1 +
 README    |   38 ++++++++++++--------------------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index e5114d50..c44384b4 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -13,6 +13,7 @@ xx/xx/2019 autofs-5.1.6
 - fix typing errors.
 - Explain /etc/auto.master.d usage.
 - plus map includes are only allowed in file sources.
+- Update README.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/README b/README
index 9024e641..2762daa7 100644
--- a/README
+++ b/README
@@ -1,28 +1,23 @@
--*- text -*-
 
-autofs is a kernel-based automounter for Linux.  It performs a job
-similar to amd(8) but relies on a small stub of kernel code instead of
-pretending to be an NFS server.  The result is simpler code, better
-reliability, and much faster operation in the common case (everything
-already mounted.)
-
-An AMD/AutoFS HOWTO is available at:
-
-http://www.Linux-Consulting.com/Amd_AutoFS/autofs.html
-
-... as well as from your favourite HOWTO archive.
+autofs is a kernel-based automounter for Linux. autofs is used to
+automatically mount filesystems on demand. After a period of inactivity
+set by a predefined timeout value, the auto-mounts will be unmounted.
+autofs allows one to provide centrally-managed, consistent file path
+names for users and applications, even in large, frequently changing
+installations.
 
 To build autofs, please run:
 
 	./configure
 
-to configure the system.  See README.options for options that you can
-give configure.
+To discover available configure options, please run:
+
+	./configure --help
 
 After configuring, you can:
 
-	make			... make the daemon and modules
-	make install		... install the daemon and modules
+	make		... make the daemon and modules
+	make install	... install the daemon and modules
 
 Development kernels 2.3.41 and onwards contain the autofs4 as
 standard.  If you're using 2.2, you can apply the patch in
@@ -34,11 +29,8 @@ for a description of the kernel patches.
 If you use autofs as a module, you need to add "alias autofs4 autofs"
 to your modules config file (/etc/modules.conf or /etc/conf.modules).
 
-Limited direct mount functionality has been implemented and a
-describtion of what can be done can be found in README.direct.
-
 autofs was written by H. Peter Anvin of Transmeta Corporation, please
-read the COPYRIGHT file.  autofs 4 is the result of Jeremy
+read the COPYRIGHT file. autofs 4 is the result of Jeremy
 Fitzhardinge's <jeremy@goop.org> work on autofs 3. Further enhancements
 have been made by Ian Kent <raven@themaw.net>.
 
@@ -54,9 +46,3 @@ With the body text:
 Once subscribed you can send patches to:
 
 	autofs@vger.kernel.org
-
-The autofs mailing list archive can be viewed on gmane:
-
-	http://news.gmane.org/gmane.linux.kernel.autofs
-	http://blog.gmane.org/gmane.linux.kernel.autofs
-

