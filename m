Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDD6AAF3A
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730501AbfIEXq5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:57 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:49165
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389683AbfIEXq5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:57 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CeDQAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXI8rFIFnCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzQJDgI?=
 =?us-ascii?q?MAQEBBAEBAQEBBgMBbYRrT0IBEAGEdwYjZhgNAhgOAgJHEAYThRkTqnaBMho?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgUSHKh+DI4JYBI8yhiNChzGOaIIplGgbgjSLSAOCH4h?=
 =?us-ascii?q?YhCyLBpkfOIFYTS4KgyeRFDYwgQYBAYQ8hzSCVAEB?=
X-IPAS-Result: =?us-ascii?q?A2CeDQAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXI8rFIFnCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzQJDgIMAQEBBAEBAQEBB?=
 =?us-ascii?q?gMBbYRrT0IBEAGEdwYjZhgNAhgOAgJHEAYThRkTqnaBMhoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgUSHKh+DI4JYBI8yhiNChzGOaIIplGgbgjSLSAOCH4hYhCyLBpkfOIFYT?=
 =?us-ascii?q?S4KgyeRFDYwgQYBAYQ8hzSCVAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582900"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:43:51 +0800
Subject: [PATCH 32/32] autofs-5.1.5 - build without hesiod support
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:43:51 +0800
Message-ID: <156772703057.5865.16486643779242421401.stgit@mickey.themaw.net>
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

The hesiod packages have been removed from Fedora so remove hesiod
support from rpm package build.

Also update build requirements for Fedora 30.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 autofs.spec |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/autofs.spec b/autofs.spec
index 9e64b9a7..51f4d2aa 100644
--- a/autofs.spec
+++ b/autofs.spec
@@ -37,7 +37,9 @@ BuildRequires: systemd-devel
 %if %{with_libtirpc}
 BuildRequires: libtirpc-devel
 %endif
-BuildRequires: autoconf, hesiod-devel, openldap-devel, bison, flex, cyrus-sasl-devel
+BuildRequires: autoconf, openldap-devel, bison, flex, libxml2-devel
+BuildRequires: cyrus-sasl-devel, openssl-devel, util-linux
+BuildRequires: libtirpc-devel, rpcgen, libnsl2-devel, krb5-devel
 Requires: chkconfig
 Requires: /bin/bash sed grep /bin/ps
 %if %{with_systemd}
@@ -98,6 +100,7 @@ LDFLAGS="-Wl,-z,now" \
 	--disable-mount-locking \
 	--enable-ignore-busy \
 	--enable-forced-shutdown \
+	--without-hesiod \
 	%{?systemd_configure_arg:} \
 	%{?libtirpc_configure_arg:} \
 	%{?fedfs_configure_arg:}

