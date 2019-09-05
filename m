Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87AA1AAF2B
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbfIEXqD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:03 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48934
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732047AbfIEXqD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:03 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ClEQAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNgcOAgw?=
 =?us-ascii?q?BAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgUSKbIJYBI8yhiNClhmCKZRoG418A4p3hCykLAgpgVh?=
 =?us-ascii?q?NLgo7gmyRFDYwgQYBAYQ8iggBAQ?=
X-IPAS-Result: =?us-ascii?q?A2ClEQAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNgcOAgwBAQEEAQEBAQEGA?=
 =?us-ascii?q?wFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgUSKbIJYBI8yhiNClhmCKZRoG418A4p3hCykLAgpgVhNLgo7gmyRFDYwg?=
 =?us-ascii?q?QYBAYQ8iggBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582623"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:25 +0800
Subject: [PATCH 17/32] autofs-5.1.5 - use ignore option for offset mounts as
 well
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:25 +0800
Message-ID: <156772694438.5865.12297849801180117446.stgit@mickey.themaw.net>
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

The pseudo option "ignore" (that's used as a hint that applications
should ignore this mount when reporting a list of mounts) has been
added to direct and indirect mounts but hasn't been added to offset
mounts.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG       |    1 +
 daemon/direct.c |   10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 5c255756..9266eca9 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -23,6 +23,7 @@ xx/xx/2019 autofs-5.1.6
 - remove a couple of old debug messages.
 - fix amd entry memory leak.
 - fix unlink_mount_tree() not umounting mounts.
+- use ignore option for offset mounts as well.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/daemon/direct.c b/daemon/direct.c
index 5b532a53..a11801be 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -756,6 +756,16 @@ int mount_autofs_offset(struct autofs_point *ap, struct mapent *me, const char *
 				mp->options = tmp;
 			}
 		}
+
+		if ((ap->flags & MOUNT_FLAG_IGNORE) &&
+		    ((get_kver_major() == 5 && get_kver_minor() > 4) ||
+		     (get_kver_major() > 5))) {
+			char *tmp = realloc(mp->options, strlen(mp->options) + 7);
+			if (tmp) {
+				strcat(tmp, ",ignore");
+				mp->options = tmp;
+			}
+		}
 	}
 
 	strcpy(mountpoint, root);

