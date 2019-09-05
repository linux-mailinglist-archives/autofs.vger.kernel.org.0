Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5AE8AAF44
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388979AbfIEXuN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:13 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50040
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfIEXuN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:13 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DbEgAKnHFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBSYlckSYJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNwYOAgwBAQE?=
 =?us-ascii?q?EAQEBAQEGAwFthGtPQgEQAYR3BiNmGA0CGA4CAkcQBhOFGROqeIEyGgKKNYE?=
 =?us-ascii?q?MKAGLdxh4gQeBEYddg0KCWASPMoVFXkKWGYIplGgbjXwDineELKQ7IoFYTS4?=
 =?us-ascii?q?KgyeRFDYwgQYBAYQ8hzSCVAEB?=
X-IPAS-Result: =?us-ascii?q?A2DbEgAKnHFd/1230XZlghkCghaBPyESKoQhjwxSAQaBS?=
 =?us-ascii?q?YlckSYJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNwYOAgwBAQEEAQEBAQEGAwFth?=
 =?us-ascii?q?GtPQgEQAYR3BiNmGA0CGA4CAkcQBhOFGROqeIEyGgKKNYEMKAGLdxh4gQeBE?=
 =?us-ascii?q?Yddg0KCWASPMoVFXkKWGYIplGgbjXwDineELKQ7IoFYTS4KgyeRFDYwgQYBA?=
 =?us-ascii?q?YQ8hzSCVAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582375"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:40:58 +0800
Subject: [PATCH 02/32] autofs-5.1.5 - allow period following macro in
 selector value
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:40:58 +0800
Message-ID: <156772685819.5865.278854696264733916.stgit@mickey.themaw.net>
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

If a ${} macro is used in a selector (such as hostd) the parser doesn't
permit a period to follow it (such as when the value is a host name).

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG         |    1 +
 modules/amd_tok.l |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index fd6a6274..24534e34 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -8,6 +8,7 @@ xx/xx/2019 autofs-5.1.6
 - log mount call arguments if mount_verbose is set.
 - Fix NFS mount from IPv6 addresses.
 - make expire remaining log level debug.
+- allow period following macro in selector value.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/modules/amd_tok.l b/modules/amd_tok.l
index cb1ebf77..36fc04b1 100644
--- a/modules/amd_tok.l
+++ b/modules/amd_tok.l
@@ -95,7 +95,7 @@ V6MASK		(12[0-8]|1[0-1][0-9]|[1-9][0-9]|[1-9])
 
 FOPT		(({QSTR}|{FSTR}|{MACRO})+)
 OPTS		({OSTR}(=({VSTR}|{MACRO})+)?)
-SOPT		(({SSTR}|{QSTR}|{MACRO})+)
+SOPT		({SSTR}|{QSTR}|{MACRO}(\.|{SSTR}|{QSTR}|{MACRO})+)
 NOPT		({SSTR}|(({IP4ADDR}(\/{V4MASK})?)|({IP6ADDR}(\/{V6MASK})?)))
 
 MAPOPT		(fs|type|maptype|pref|sublink|cache)

