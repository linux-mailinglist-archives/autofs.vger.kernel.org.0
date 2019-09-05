Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEE0AAF47
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390009AbfIEXua (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:30 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50177
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388314AbfIEXua (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:30 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2D8EgAKnHFd/1230XZlghkCgWcvbVI?=
 =?us-ascii?q?hEiqEIY8MUgEGgRElE4lckSYJAQEBAQEBAQEBGwwNAQIBAYQ/AoI2IzcGDgI?=
 =?us-ascii?q?MAQEBBAEBAQEBBgMBbYRrQwxCARABhHcGI2YYCAUCGA4CAkcQBhODI4F2E6p?=
 =?us-ascii?q?4gTIaAoo1gQwoAYt3GHiBB4FEhyqDQoJYBIwwTII2hUVeQpYZgimGd41xG4M?=
 =?us-ascii?q?jilkDineELA2kLiKBWE0uCoMnCYdfgSKCPoVMNjABgQUBAYQ8hzSCVAEB?=
X-IPAS-Result: =?us-ascii?q?A2D8EgAKnHFd/1230XZlghkCgWcvbVIhEiqEIY8MUgEGg?=
 =?us-ascii?q?RElE4lckSYJAQEBAQEBAQEBGwwNAQIBAYQ/AoI2IzcGDgIMAQEBBAEBAQEBB?=
 =?us-ascii?q?gMBbYRrQwxCARABhHcGI2YYCAUCGA4CAkcQBhODI4F2E6p4gTIaAoo1gQwoA?=
 =?us-ascii?q?Yt3GHiBB4FEhyqDQoJYBIwwTII2hUVeQpYZgimGd41xG4MjilkDineELA2kL?=
 =?us-ascii?q?iKBWE0uCoMnCYdfgSKCPoVMNjABgQUBAYQ8hzSCVAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582422"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:16 +0800
Subject: [PATCH 05/32] autofs-5.1.5 - Explain /etc/auto.master.d usage
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:16 +0800
Message-ID: <156772687551.5865.7074809820783362039.stgit@mickey.themaw.net>
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

From: Ian Kent <Vincent.Mcintyre@csiro.au>

I've noticed people have difficulty fully parsing the rather terse
description in samples/auto.master, eg bugs.debian.org/693782.
Give a specific example of the usage to make understanding easier.

Signed-off-by: Vincent McIntyre <vincent.mcintyre@csiro.au>
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG            |    1 +
 man/auto.master.5.in |   14 ++++++++++++++
 samples/auto.master  |    6 +++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 44ce6b69..2da66e81 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -11,6 +11,7 @@ xx/xx/2019 autofs-5.1.6
 - allow period following macro in selector value.
 - fix macro expansion in selector values.
 - fix typing errors.
+- Explain /etc/auto.master.d usage.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index dace4a1c..b99b3b8e 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -391,6 +391,20 @@ All accesses to paths in the map
 will trigger mounts when they are accessed and the Name Service Switch
 configuration will be used to locate the source of the map
 .IR auto.data .
+.sp
+To avoid making edits to @@autofsmapdir@@/auto.master,
+@@autofsmapdir@@/auto.master.d may be used.
+Files in that directory must have a ".autofs" suffix, e.g.
+.IR @@autofsmapdir@@/auto.master.d/extra.autofs.
+Such files contain lines of the same format as the auto.master file, e.g.
+.sp
+.RS +.2i
+.ta 1.0i
+.nf
+/foo    /etc/auto.foo
+/baz    yp:baz.map
+.fi
+.RE
 .SH "SEE ALSO"
 .BR automount (8),
 .BR autofs (5),
diff --git a/samples/auto.master b/samples/auto.master
index 9a9968a3..5483e3cf 100644
--- a/samples/auto.master
+++ b/samples/auto.master
@@ -13,7 +13,11 @@
 /net	-hosts
 #
 # Include /etc/auto.master.d/*.autofs
-# The included files must conform to the format of this file.
+# To add an extra map using this mechanism you will need to add
+# two configuration items - one /etc/auto.master.d/extra.autofs file
+# (using the same line format as the auto.master file)
+# and a separate mount map (e.g. /etc/auto.extra or an auto.extra NIS map)
+# that is referred to by the extra.autofs file.
 #
 +dir:/etc/auto.master.d
 #

