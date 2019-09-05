Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041DAAAF2C
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbfIEXqE (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:04 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48906
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725921AbfIEXqE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:04 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 19:45:55 EDT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2D3FAAYnXFd/1230XZlghuCFm1SIRI?=
 =?us-ascii?q?qhCGPDFIBBoEROGuIcZEmCQEBAQEBAQEBARsMDQECAQGEPwKCNiM4EwIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrQwxCARABhHcGIwRiGA0CGA4CAkcQBhODI4F2E6p2fzM?=
 =?us-ascii?q?aAoo1gQwoAYt3GHiBB4ERM4IqhQCDQoJYBIwwTII2hiNClhmCKYZ3jXEbgjR?=
 =?us-ascii?q?vilkDEIpnhCykPCGBWE0uCoMnCYJFF4YliAo2MAGBBQEBhDyHNIJUAQE?=
X-IPAS-Result: =?us-ascii?q?A2D3FAAYnXFd/1230XZlghuCFm1SIRIqhCGPDFIBBoERO?=
 =?us-ascii?q?GuIcZEmCQEBAQEBAQEBARsMDQECAQGEPwKCNiM4EwIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrQwxCARABhHcGIwRiGA0CGA4CAkcQBhODI4F2E6p2fzMaAoo1gQwoAYt3G?=
 =?us-ascii?q?HiBB4ERM4IqhQCDQoJYBIwwTII2hiNClhmCKYZ3jXEbgjRvilkDEIpnhCykP?=
 =?us-ascii?q?CGBWE0uCoMnCYJFF4YliAo2MAGBBQEBhDyHNIJUAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582641"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:30 +0800
Subject: [PATCH 18/32] autofs-5.1.5 - add config option for "ignore" mount
 option
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:30 +0800
Message-ID: <156772695015.5865.3314812015686869617.stgit@mickey.themaw.net>
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

Add a configuration option to control whether the autofs pseudo
mount option is used on autofs mounts.

The default setting is "no" to avoid unexpected behaviour and
so is an opt-in setting for those who understand that, if user
space utilities and libraries honour this, then autofs mounts
will be ommitted from mount table listings.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG                      |    1 +
 include/defaults.h             |    2 ++
 lib/defaults.c                 |   17 +++++++++++++++++
 lib/master.c                   |    3 ++-
 man/autofs.conf.5.in           |    7 +++++++
 redhat/autofs.conf.default.in  |    9 +++++++++
 samples/autofs.conf.default.in |    9 +++++++++
 7 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 9266eca9..9c1fe70c 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -24,6 +24,7 @@ xx/xx/2019 autofs-5.1.6
 - fix amd entry memory leak.
 - fix unlink_mount_tree() not umounting mounts.
 - use ignore option for offset mounts as well.
+- add config option for "ignore" mount option
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/include/defaults.h b/include/defaults.h
index baa4b4c9..69263bfd 100644
--- a/include/defaults.h
+++ b/include/defaults.h
@@ -51,6 +51,7 @@
 
 #define DEFAULT_USE_HOSTNAME_FOR_MOUNTS  "0"
 #define DEFAULT_DISABLE_NOT_FOUND_MESSAGE "0"
+#define DEFAULT_USE_IGNORE_MOUNT_OPTION	 "0"
 
 #define DEFAULT_SSS_MASTER_MAP_WAIT	"0"
 #define DEFAULT_USE_MOUNT_REQUEST_LOG_ID "0"
@@ -174,6 +175,7 @@ const char *defaults_get_auth_conf_file(void);
 unsigned int defaults_get_map_hash_table_size(void);
 unsigned int defaults_use_hostname_for_mounts(void);
 unsigned int defaults_disable_not_found_message(void);
+unsigned int defaults_get_use_ignore_mount_option(void);
 unsigned int defaults_get_sss_master_map_wait(void);
 unsigned int defaults_get_use_mount_request_log_id(void);
 
diff --git a/lib/defaults.c b/lib/defaults.c
index 4ac5a180..1b27ffd5 100644
--- a/lib/defaults.c
+++ b/lib/defaults.c
@@ -77,6 +77,7 @@
 
 #define NAME_USE_HOSTNAME_FOR_MOUNTS	"use_hostname_for_mounts"
 #define NAME_DISABLE_NOT_FOUND_MESSAGE	"disable_not_found_message"
+#define NAME_USE_IGNORE_MOUNT_OPTION	"use_ignore_mount_option"
 
 #define NAME_SSS_MASTER_MAP_WAIT	"sss_master_map_wait"
 #define NAME_USE_MOUNT_REQUEST_LOG_ID	"use_mount_request_log_id"
@@ -364,6 +365,11 @@ static int conf_load_autofs_defaults(void)
 	if (ret == CFG_FAIL)
 		goto error;
 
+	ret = conf_update(sec, NAME_USE_IGNORE_MOUNT_OPTION,
+			  DEFAULT_USE_IGNORE_MOUNT_OPTION, CONF_ENV);
+	if (ret == CFG_FAIL)
+		goto error;
+
 	ret = conf_update(sec, NAME_SSS_MASTER_MAP_WAIT,
 			  DEFAULT_SSS_MASTER_MAP_WAIT, CONF_ENV);
 	if (ret == CFG_FAIL)
@@ -1864,6 +1870,17 @@ unsigned int defaults_disable_not_found_message(void)
 	return res;
 }
 
+unsigned int defaults_get_use_ignore_mount_option(void)
+{
+	int res;
+
+	res = conf_get_yesno(autofs_gbl_sec, NAME_USE_IGNORE_MOUNT_OPTION);
+	if (res < 0)
+		res = atoi(DEFAULT_USE_IGNORE_MOUNT_OPTION);
+
+	return res;
+}
+
 unsigned int defaults_get_sss_master_map_wait(void)
 {
 	int res;
diff --git a/lib/master.c b/lib/master.c
index 24abb296..186b1479 100644
--- a/lib/master.c
+++ b/lib/master.c
@@ -101,7 +101,8 @@ int master_add_autofs_point(struct master_mapent *entry, unsigned logopt,
 		ap->negative_timeout = global_negative_timeout;
 	ap->exp_timeout = defaults_get_timeout();
 	ap->exp_runfreq = 0;
-	ap->flags = MOUNT_FLAG_IGNORE;
+	if (defaults_get_use_ignore_mount_option())
+		ap->flags = MOUNT_FLAG_IGNORE;
 	if (ghost)
 		ap->flags |= MOUNT_FLAG_GHOST;
 
diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
index 7691fd12..39239d4e 100644
--- a/man/autofs.conf.5.in
+++ b/man/autofs.conf.5.in
@@ -150,6 +150,13 @@ That produces, IMHO, unnecessary noise in the log so a configuration option
 has been added to provide the ability to turn it off. The default is "no"
 to maintain the current behaviour.
 .TP
+.B use_ignore_mount_option
+.br
+An option to enable the use of autofs pseudo option "disable". This option
+is used as a hint to user space that the mount entry should be ommitted from
+mount table listings. The default is "no" to avoid unexpected changes in
+behaviour and so is an opt-in setting.
+.TP
 .B sss_master_map_wait
 .br
 Set the time to wait and retry if sssd returns "no such entry" when starting
diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
index e6e73f61..d3c59a24 100644
--- a/redhat/autofs.conf.default.in
+++ b/redhat/autofs.conf.default.in
@@ -183,6 +183,15 @@ mount_nfs_default_protocol = 4
 #
 #disable_not_found_message = "no"
 #
+# use_ignore_mount_option - This option is used to enable the use of autofs
+#			pseudo option "disable". This option is used as a
+#			hint to user space that the mount entry should be
+#			ommitted from mount table listings. The default is
+#			"no" to avoid unexpected changes in behaviour and
+#			so is an opt-in setting.
+#
+#use_ignore_mount_option = no
+#
 # sss_master_map_wait - When sssd is starting up it can sometimes return
 #			"no such entry" for a short time until it has read
 # 			in the LDAP map information. Internal default is 0
diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
index e27d0d22..607718f4 100644
--- a/samples/autofs.conf.default.in
+++ b/samples/autofs.conf.default.in
@@ -182,6 +182,15 @@ browse_mode = no
 #
 #disable_not_found_message = "no"
 #
+# use_ignore_mount_option - This option is used to enable the use of autofs
+#			pseudo option "disable". This option is used as a
+#			hint to user space that the mount entry should be
+#			ommitted from mount table listings. The default is
+#			"no" to avoid unexpected changes in behaviour and
+#			so is an opt-in setting.
+#
+#use_ignore_mount_option = no
+#
 # sss_master_map_wait - When sssd is starting up it can sometimes return
 #			"no such entry" for a short time until it has read
 # 			in the LDAP map information. Internal default is 0

