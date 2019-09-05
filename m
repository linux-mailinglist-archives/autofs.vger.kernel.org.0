Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF81AAF29
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfIEXp4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:45:56 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48906
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725921AbfIEXp4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:45:56 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 19:45:55 EDT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CeDQAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNAkOAgw?=
 =?us-ascii?q?BAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgUSHKoNCglgEjzKGI0KWGYIplGgbjXwDineELKQlOIF?=
 =?us-ascii?q?YTS4KgyeCTheOLzYwgQYBAYQ8hzSCVAEB?=
X-IPAS-Result: =?us-ascii?q?A2CeDQAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNAkOAgwBAQEEAQEBAQEGA?=
 =?us-ascii?q?wFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgUSHKoNCglgEjzKGI0KWGYIplGgbjXwDineELKQlOIFYTS4KgyeCTheOL?=
 =?us-ascii?q?zYwgQYBAYQ8hzSCVAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582600"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:13 +0800
Subject: [PATCH 15/32] autofs-5.1.5 - fix amd entry memory leak
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:13 +0800
Message-ID: <156772693281.5865.6633002612473107354.stgit@mickey.themaw.net>
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

Fix an incorrect free of an amd_entry structure.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/master.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 1a48209e..ecfbd2c9 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -21,6 +21,7 @@ xx/xx/2019 autofs-5.1.6
 - remove unused function has_fstab_option().
 - remove unused function reverse_mnt_list().
 - remove a couple of old debug messages.
+- fix amd entry memory leak.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/lib/master.c b/lib/master.c
index e0bd34ab..24abb296 100644
--- a/lib/master.c
+++ b/lib/master.c
@@ -155,7 +155,7 @@ void master_free_autofs_point(struct autofs_point *ap)
 			ext_mount_remove(&entry->ext_mount, entry->fs);
 		if (!list_empty(&entry->entries))
 			list_del(&entry->entries);
-		free(entry);
+		free_amd_entry(entry);
 	}
 	mounts_mutex_unlock(ap);
 

