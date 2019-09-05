Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFAD5AAF4B
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388314AbfIEXuv (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:51 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50256
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730768AbfIEXuv (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:51 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DxEgAKnHFd/1230XZlghkCghZtUiE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXJEmCQEBAQEBAQEBARsIEQECAQGEPwKCNiM3Bg4CDAE?=
 =?us-ascii?q?BAQQBAQEBAQYDAW2Ea0MMQgEQAYR3BiNmGA0CGA4CAkcQBhODI4F2E6p4gTI?=
 =?us-ascii?q?aAoo1gQwoAYt3GHiBB4FEimyCWASMSIJqhiNCbpUrgimGd41xG4I0b4pZA4p?=
 =?us-ascii?q?3hCyLBpk1IoFYTS4KgycJgnGGEIgKNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2DxEgAKnHFd/1230XZlghkCghZtUiESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXJEmCQEBAQEBAQEBARsIEQECAQGEPwKCNiM3Bg4CDAEBAQQBAQEBAQYDA?=
 =?us-ascii?q?W2Ea0MMQgEQAYR3BiNmGA0CGA4CAkcQBhODI4F2E6p4gTIaAoo1gQwoAYt3G?=
 =?us-ascii?q?HiBB4FEimyCWASMSIJqhiNCbpUrgimGd41xG4I0b4pZA4p3hCyLBpk1IoFYT?=
 =?us-ascii?q?S4KgycJgnGGEIgKNjCBBgEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582514"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:38 +0800
Subject: [PATCH 09/32] autofs-5.1.5 - update autofs(8) offset map entry
 update description
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:38 +0800
Message-ID: <156772689839.5865.7283001077042699778.stgit@mickey.themaw.net>
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

The autofs(8) man page imples that map entries that have offsets will
be updated in the ame way as top level map keys.

This isn't correct, if a map entry has offsets and is in use when the
map is updated the mount must expire before it will see the update.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG       |    1 +
 man/autofs.8.in |    5 +++++
 2 files changed, 6 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 89b1545b..64eb0926 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -15,6 +15,7 @@ xx/xx/2019 autofs-5.1.6
 - plus map includes are only allowed in file sources.
 - Update README.
 - fix additional typing errors.
+- update autofs(8) offset map entry update description.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/man/autofs.8.in b/man/autofs.8.in
index 9f03eada..909bdfd3 100644
--- a/man/autofs.8.in
+++ b/man/autofs.8.in
@@ -56,6 +56,11 @@ map is modified then the
 .B autofs
 service control reload action must be rerun to activate the changes.
 .P
+However, if a map entry has offsets and is currently is use the offset
+mounts cannot be updated due to potential mount dependencies. In this
+case the map entry offsets will not be updated until after the map
+entry has expired.
+.P
 .B @@initdir@@/autofs status
 or
 .B systemctl autofs.service status

