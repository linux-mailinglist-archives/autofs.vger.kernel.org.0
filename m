Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26C7AAF48
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390016AbfIEXug (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:36 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50177
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388314AbfIEXug (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:36 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DxEgAKnHFd/1230XZlghkCghZtUiE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXJEmCQEBAQEBAQEBARsMDQECAQGEPwKCNiM3Bg4CDAE?=
 =?us-ascii?q?BAQQBAQEBAQYDAW2Ea0MMQgEQAYR3BiNmGA0CGA4CAkcQBhODI4F2E6p4gTI?=
 =?us-ascii?q?aAoo1gQwoAYt3GHiBB4FEimyCNiIEjzKGI0KWGYIphneNcRuDI4pZA4p3hCy?=
 =?us-ascii?q?kOyKBWE0uCoMnCYkBiAo2MAGBBQEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2DxEgAKnHFd/1230XZlghkCghZtUiESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXJEmCQEBAQEBAQEBARsMDQECAQGEPwKCNiM3Bg4CDAEBAQQBAQEBAQYDA?=
 =?us-ascii?q?W2Ea0MMQgEQAYR3BiNmGA0CGA4CAkcQBhODI4F2E6p4gTIaAoo1gQwoAYt3G?=
 =?us-ascii?q?HiBB4FEimyCNiIEjzKGI0KWGYIphneNcRuDI4pZA4p3hCykOyKBWE0uCoMnC?=
 =?us-ascii?q?YkBiAo2MAGBBQEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582443"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:21 +0800
Subject: [PATCH 06/32] autofs-5.0.5 - plus map includes are only allowed in
 file sources
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:21 +0800
Message-ID: <156772688122.5865.11712654406123941770.stgit@mickey.themaw.net>
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

auto.master(5) doesn't say that plus map includes are only allowed
in file map sources.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG            |    1 +
 man/auto.master.5.in |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 2da66e81..e5114d50 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -12,6 +12,7 @@ xx/xx/2019 autofs-5.1.6
 - fix macro expansion in selector values.
 - fix typing errors.
 - Explain /etc/auto.master.d usage.
+- plus map includes are only allowed in file sources.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index b99b3b8e..061ee396 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -63,8 +63,9 @@ present in the master map by including a line of the form:
 and 
 .BR automount (8)
 will process the map according to the specification described below for
-map entries. Indirect map entries must be unique in the master map so
-second and subsequent entries for an indirect mount point are ignored by
+map entries. Plus map inclusion is only permitted in file map sources.
+Indirect map entries must be unique in the master map so second and
+subsequent entries for an indirect mount point are ignored by
 .BR automount (8).
 .TP
 .B NOTE:

