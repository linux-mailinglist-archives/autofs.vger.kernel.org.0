Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1488EAAF4C
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390027AbfIEXu5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:57 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50256
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730768AbfIEXu5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:57 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AKFQAKnHFd/1230XZlHgEGBwaBZwK?=
 =?us-ascii?q?BZy9tUiESKoQhjwxSAQaBESUTa4hjDoVEiXuBZwkBAQEBAQEBAQEbDA0BAgE?=
 =?us-ascii?q?BhD8CgjYjOBMCDAEBAQQBAQEBAQYDAW2Ea0MMQgEQAYR3BiNLGxgIBQIYDgI?=
 =?us-ascii?q?CISYQBhODI4FqAwkTEKpogTIaAod+DYIqgQwoAYpZgQEdGHiBB4ERM4IPG4M?=
 =?us-ascii?q?NgWQuAoMhglgEjFQogjaFRV5ClSstQYIphneFDIRng34bgjRvilkDEIpnhCy?=
 =?us-ascii?q?LBohLkGshgVhNLgo7gmwJgkQBF4YliAo2MAGBBQEBhDyHQ4JFAQE?=
X-IPAS-Result: =?us-ascii?q?A2AKFQAKnHFd/1230XZlHgEGBwaBZwKBZy9tUiESKoQhj?=
 =?us-ascii?q?wxSAQaBESUTa4hjDoVEiXuBZwkBAQEBAQEBAQEbDA0BAgEBhD8CgjYjOBMCD?=
 =?us-ascii?q?AEBAQQBAQEBAQYDAW2Ea0MMQgEQAYR3BiNLGxgIBQIYDgICISYQBhODI4FqA?=
 =?us-ascii?q?wkTEKpogTIaAod+DYIqgQwoAYpZgQEdGHiBB4ERM4IPG4MNgWQuAoMhglgEj?=
 =?us-ascii?q?FQogjaFRV5ClSstQYIphneFDIRng34bgjRvilkDEIpnhCyLBohLkGshgVhNL?=
 =?us-ascii?q?go7gmwJgkQBF4YliAo2MAGBBQEBhDyHQ4JFAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582487"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:33 +0800
Subject: [PATCH 08/32] autofs-5.1.5 - fix additional typing errors
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:33 +0800
Message-ID: <156772689260.5865.9700631410316134936.stgit@mickey.themaw.net>
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

Fix some more typing errors.
imk: added changes discussed on mailing list.

Signed-off-by: Andreas P <nurgrak@gmail.com>
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG                      |    1 +
 INSTALL                        |    2 +-
 README.replicated-server       |    2 +-
 man/auto.master.5.in           |   14 +++++++-------
 man/autofs.5                   |    9 ++++-----
 man/autofs.conf.5.in           |   29 ++++++++++++++---------------
 man/autofs_ldap_auth.conf.5.in |    2 +-
 man/automount.8                |    2 +-
 modules/lookup_ldap.c          |    4 ++--
 modules/replicated.c           |    4 ++--
 redhat/autofs.conf.default.in  |   14 +++++++-------
 redhat/autofs.sysconfig        |    2 +-
 samples/autofs.conf.default.in |   10 +++++-----
 13 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index c44384b4..89b1545b 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -14,6 +14,7 @@ xx/xx/2019 autofs-5.1.6
 - Explain /etc/auto.master.d usage.
 - plus map includes are only allowed in file sources.
 - Update README.
+- fix additional typing errors.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/INSTALL b/INSTALL
index 68a4376b..db356c26 100644
--- a/INSTALL
+++ b/INSTALL
@@ -119,7 +119,7 @@ For example, Fedora Core 4 kernel package 2.6.11-1.369_FC4
 would use the 2.6.12 patch because it applies the 2.6.12 release
 candidate revision 6 patch. But the autofs patch doesn't apply
 because the rpm also applies a patch somewhere that changes one
-area the the patch also changes but this change is not present
+area the patch also changes but this change is not present
 in the 2.6.12 release kernel.
 
 On the other hand, Fedora Core 3 kernel 2.6.12-1.1381_FC3
diff --git a/README.replicated-server b/README.replicated-server
index 1d771d35..a0e742ca 100644
--- a/README.replicated-server
+++ b/README.replicated-server
@@ -34,7 +34,7 @@ the following selection rules.
      - PROXIMITY_OTHER, host is on a network not directlty
        reachable through a local interface.
   
-2) NFS version and protocol is selected by caclculating the largest
+2) NFS version and protocol is selected by calculating the largest
    number of hosts supporting an NFS version and protocol that
    have the closest proximity. These hosts are added to the list
    in response time order. Hosts may have a corresponding weight
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index 061ee396..6e510a59 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -212,12 +212,12 @@ due to application accesses triggered by the expire itself.
 This option allows mount propagation of bind mounts to be set to
 either \fIslave\fP or \fIprivate\fP. This option may be needed when using
 multi-mounts that have bind mounts that bind to a file system that is
-propagation shared. This is becuase the bind mount will have the same
+propagation shared. This is because the bind mount will have the same
 properties as its target which causes problems for offset mounts. When
 this happens an unwanted offset mount is propagated back to the target
 file system resulting in a deadlock when attempting to access the offset.
-This option is a an autofs pseudo mount option that can be used in the
-master map only. By default bind mounts will inherit the mount propagation
+This option is an autofs pseudo mount option that can be used in the
+master map only. By default, bind mounts will inherit the mount propagation
 of the target file system.
 .TP
 .I "\-r, \-\-random-multimount-selection"
@@ -262,7 +262,7 @@ accessing /net/myserver will mount exports from myserver on directories below
 /net/myserver.
 .P
 NOTE: mounts done from a hosts map will be mounted with the "nosuid,nodev,intr" options
-unless overridden by explicily specifying the "suid", "dev" or "nointr" options in the
+unless overridden by explicitly specifying the "suid", "dev" or "nointr" options in the
 master map entry.
 .SH LDAP MAPS
 If the map type \fBldap\fP is specified the mapname is of the form
@@ -278,7 +278,7 @@ configuration, in which case the map name alone must be given.
 .P
 If no schema is set in the autofs configuration then autofs will check
 each of the commonly used schema for a valid entry and if one is found
-it will used for subsequent lookups.
+it will be used for subsequent lookups.
 .P
 There are three common schemas in use:
 .TP
@@ -352,7 +352,7 @@ connection is to be used then the client certificate and private key file
 locations must also be configured within the LDAP client.
 .P
 In OpenLDAP these may be configured in the \fBldap.conf\fP file or in the
-per-user configuration. For example it may be sensible to use the system
+per-user configuration. For example, it may be sensible to use the system
 wide configuration for the location of the Certificate Authority certificate
 and set the location of the client certificate and private key
 in the per-user configuration. The location of these files and the configuration
@@ -414,5 +414,5 @@ Such files contain lines of the same format as the auto.master file, e.g.
 .BR autofs_ldap_auth.conf (5).
 .SH AUTHOR
 This manual page was written by Christoph Lameter <chris@waterf.org>,
-for the Debian GNU/Linux system.  Edited by <hpa@transmeta.com> and
+for the Debian GNU/Linux system. Edited by <hpa@transmeta.com> and
 Ian Kent <raven@themaw.net> .
diff --git a/man/autofs.5 b/man/autofs.5
index 2c224e18..d32e772e 100644
--- a/man/autofs.5
+++ b/man/autofs.5
@@ -64,7 +64,6 @@ can't be mounted.
 .br
 is used to make the weight the sole factor in selecting a server when multiple
 servers are present in a map entry.
-and
 .TP
 .B \-no-use-weight-only
 .br
@@ -192,7 +191,7 @@ SHOST	Short hostname (domain part removed if present)
 .sp
 If a program map is used these standard environment variables will have
 a prefix of "AUTOFS_" to prevent interpreted languages like python from
-being able to load and execute arbitray code from a user home directory.
+being able to load and execute arbitrary code from a user home directory.
 .RE
 .sp
 Additional entries can be defined with the \-Dvariable=Value map-option to
@@ -293,10 +292,10 @@ may be negated with the \fB!\fP.
 For a \fBlocation\fP to be selected for a mount attempt all of its \fBselectors\fP
 must evaluate to true. If a \fBlocation\fP is selected for a mount attempt
 and succeeds the lookup is completed and returns success. If the mount
-attempt fails the proceedure continues with the next \fBlocation\fP until
+attempt fails the procedure continues with the next \fBlocation\fP until
 they have all been tried.
 
-In addition some \fBselectors\fP take no argumenets, some one argument
+In addition, some \fBselectors\fP take no arguments, some one argument
 and others optionally take two arguments.
 
 The \fBselectors\fP that take no arguments are:
@@ -584,7 +583,7 @@ In the first line we have an NFS remote mount of the exported directory
 another nfs mount for the exported directory /work/util from host zeus.
 This would be mounted on /test/util.
 
-Finally we have an example of the use of the \fBsublink\fP option. In
+Finally, we have an example of the use of the \fBsublink\fP option. In
 this case the filesystem bilbo:/shared would be mounted on a path
 external the automount directory (under the direcory given by
 configuration option auto_dir) and the path /test/local either
diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
index 95ff7dd0..7691fd12 100644
--- a/man/autofs.conf.5.in
+++ b/man/autofs.conf.5.in
@@ -89,7 +89,7 @@ set default log level "none", "verbose" or "debug" (program default "none").
 .B force_standard_program_map_env
 .br
 override the use of a prefix with standard environment variables when a
-program map is executed. Since program maps are run as the privileded
+program map is executed. Since program maps are run as the privileged
 user setting these standard environment variables opens automount(8) to
 potential user privilege escalation when the program map is written in a
 language that can load components from, for example, a user home directory
@@ -108,16 +108,15 @@ and a direct map with 8000 entries would result in each slot
 containing an average of 8 entries, which should be acceptable.
 
 However, if excessive CPU usage is observed during automount lookups
-increasing this option can reduce the CPU overhead considerably becuase
+increasing this option can reduce the CPU overhead considerably because
 it reduces the length of the search chains.
 
 Note that the number of entries in a map doesn't necessarily relate
 to the number of entries used in the map entry cache.
 
-There are three distinct cases, direct maps and indirect maps that
-use the "browse" option must be read in their entirity at program
-start so, in these two cases the map size does retate directly to
-the map entry cache size.
+There are two distinct cases where the map hash table can make a
+significant difference, direct maps and indirect maps that use the
+"browse" option.
 
 For indirect maps that do not use the "browse" option entries are
 added to the map entry cache at lookup so the number of active cache
@@ -161,7 +160,7 @@ don't wait.
 .B use_mount_request_log_id
 .br
 Set whether to use a mount request log id so that log entries for specific
-mount requests can be easily identified in logs that have multiple conncurrent
+mount requests can be easily identified in logs that have multiple concurrent
 requests. Default is don't use mount request log ids.
 .SS LDAP Configuration
 .P
@@ -170,7 +169,7 @@ Configuration settings available are:
 .B ldap_timeout
 .br
 Set the network response timeout (default 8).
-Set timeout value for the synchronous API  calls. The default is the LDAP
+Set timeout value for the synchronous API calls. The default is the LDAP
 library default of an infinite timeout.
 .TP
 .B ldap_network_timeout
@@ -310,7 +309,7 @@ cleaned on re-load, which is done when map changes are detected
 so these configuration entries are not used by autofs. An
 exception to this is the case where the map is large. In this
 case it may be necessary to read the whole map at startup even if
-browsing is is not enabled. Adding the cache:=all option to
+browsing is not enabled. Adding the cache:=all option to
 map_options can be used to for this.
 .TP
 .B localhost_address
@@ -377,14 +376,14 @@ and that will be done.
 Allow map keys to be shown in directory listings. This option
 can have values of "yes" or "no". The default is "no". A variation
 of this option, "browsable", can be used as a pseudo mount option
-in type "auto" map entries to provide provide browsing funtionality
+in type "auto" map entries to provide browsing functionality
 in sub-mounts. The amd "browsable_dirs = full" option cannot be
 implemented within the current autofs framework and is not supported.
 .TP
 .B exec_map_timeout
 .br
-A timeout is not currently used for for program maps, might be
-implemented.
+A timeout is not currently used for program maps but this might be
+implemented in the future.
 .TP
 .B tag
 .br
@@ -460,7 +459,7 @@ its official host name.
 .TP
 .B domain_strip
 .br
-If set to "yes" the domain name part of the host is strippped
+If set to "yes" the domain name part of the host is stripped
 when normalizing hostnames. This can be useful when using of
 the same maps in a multiple domain environment.
 .TP
@@ -484,8 +483,8 @@ that is used for queries if ldap is to be used as a map source.
 .B ldap_hostports
 .br
 This option has no default value set. It must be set to the URI
-of the LDAP server to be used for lookups wheni ldap is used a
-map source. It may contain a comma or space separated list of
+of the LDAP server to be used for lookups when ldap is used as
+a map source. It may contain a comma or space separated list of
 LDAP URIs.
 .TP
 .B hesiod_base
diff --git a/man/autofs_ldap_auth.conf.5.in b/man/autofs_ldap_auth.conf.5.in
index e035ebe5..2357566c 100644
--- a/man/autofs_ldap_auth.conf.5.in
+++ b/man/autofs_ldap_auth.conf.5.in
@@ -56,7 +56,7 @@ required in order to perform ldap queries. If the flag is set to yes, only
 sasl authenticated connections will be allowed. If it is set to no then
 authentication is not needed for ldap server connections. If it is set to
 autodetect then the ldap server will be queried to establish a suitable sasl
-authentication  mechanism. If no suitable mechanism can be found, connections
+authentication mechanism. If no suitable mechanism can be found, connections
 to the ldap server are made without authentication. Finally, if it is set to
 simple, then simple authentication will be used instead of SASL.
 .TP
diff --git a/man/automount.8 b/man/automount.8
index 9f92288e..1cca6ef8 100644
--- a/man/automount.8
+++ b/man/automount.8
@@ -89,7 +89,7 @@ that would be used by autofs for the whole multi-map will be listed.
 .TP
 .I "\-O, \-\-global-options"
 Allows the specification of global mount options used for all master
-map entries. These options will either replace or be appened to options
+map entries. These options will either replace or be appended to options
 given in a master map entry depending on the APPEND_OPTIONS configuration
 setting.
 .TP
diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index f7432a2a..3624dd86 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -1320,11 +1320,11 @@ auth_fail:
 		ret |= get_property(logopt, root, "external_key",  &extern_key);
 		/*
 		 * For EXTERNAL auth to function we need a client certificate
-		 * and and certificate key. The ca certificate used to verify
+		 * and certificate key. The ca certificate used to verify
 		 * the server certificate must also be set correctly in the
 		 * global configuration as the connection must be encrypted
 		 * and the server and client certificates must have been
-		 * verified for the EXTERNAL method to be offerred by the
+		 * verified for the EXTERNAL method to be offered by the
 		 * server. If the cert and key have not been set in the autofs
 		 * configuration they must be set in the ldap rc file.
 		 */
diff --git a/modules/replicated.c b/modules/replicated.c
index e99e32a9..91fce882 100644
--- a/modules/replicated.c
+++ b/modules/replicated.c
@@ -24,11 +24,11 @@
  *        - PROXIMITY_OTHER, host is on a network not directlty
  *          reachable through a local interface.
  *
- *   2) NFS version and protocol is selected by caclculating the largest
+ *   2) NFS version and protocol is selected by calculating the largest
  *      number of hosts supporting an NFS version and protocol that
  *      have the closest proximity. These hosts are added to the list
  *      in response time order. Hosts may have a corresponding weight
- *      which essentially increaes response time and so influences the
+ *      which essentially increases response time and so influences the
  *      host order.
  *
  *   3) Hosts at further proximity that support the selected NFS version
diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
index 59b9dfdd..e6e73f61 100644
--- a/redhat/autofs.conf.default.in
+++ b/redhat/autofs.conf.default.in
@@ -76,7 +76,7 @@ mount_nfs_default_protocol = 4
 #			are run as the privileged user this opens
 #			automount(8) to potential user privilege
 #			escalation when the program map is written
-#			in a language that  can load components from,
+#			in a language that can load components from,
 #			for example, a user home directory.
 #
 # force_standard_program_map_env = no
@@ -84,7 +84,7 @@ mount_nfs_default_protocol = 4
 # use_mount_request_log_id - Set whether to use a mount request log
 #			id so that log entries for specific mount
 #			requests can be easily identified in logs
-#			that have multiple conncurrent requests.
+#			that have multiple concurrent requests.
 #
 #use_mount_request_log_id = no
 #
@@ -400,10 +400,10 @@ dismount_interval = 300
 # appears to work reasonably well most of the time without the
 # update).
 #
-# autofs_use_lofs = yes
+#autofs_use_lofs = yes
 #
 # Several configuration options can be set per mount point.
-# In particulr map_type, map_name, map_defaults, search_path,
+# In particular map_type, map_name, map_defaults, search_path,
 # browsable_dirs, dismount_interval and selectors_in_defaults
 # (not all of which are currently implemented, see above).
 #
@@ -412,6 +412,6 @@ dismount_interval = 300
 # master map entry and the format will be inherited for type
 # "auto" mounts.
 #
-# [ /expamle/mount ]
-# dismount_interval = 60
-# map_type = nis
+#[ /example/mount ]
+#dismount_interval = 60
+#map_type = nis
diff --git a/redhat/autofs.sysconfig b/redhat/autofs.sysconfig
index 2ca53ffb..01716964 100644
--- a/redhat/autofs.sysconfig
+++ b/redhat/autofs.sysconfig
@@ -1,5 +1,5 @@
 #
-# Init syatem options
+# Init system options
 #
 # If the kernel supports using the autofs miscellanous device
 # and you wish to use it you must set this configuration option
diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
index e0c5e320..e27d0d22 100644
--- a/samples/autofs.conf.default.in
+++ b/samples/autofs.conf.default.in
@@ -75,7 +75,7 @@ browse_mode = no
 #			are run as the privileged user this opens
 #			automount(8) to potential user privilege
 #			escalation when the program map is written
-#			in a language that  can load components from,
+#			in a language that can load components from,
 #			for example, a user home directory.
 #
 # force_standard_program_map_env = no
@@ -83,7 +83,7 @@ browse_mode = no
 # use_mount_request_log_id - Set whether to use a mount request log
 #			id so that log entries for specific mount
 #			requests can be easily identified in logs
-#			that have multiple conncurrent requests.
+#			that have multiple concurrent requests.
 #
 #use_mount_request_log_id = no
 #
@@ -411,6 +411,6 @@ dismount_interval = 300
 # master map entry and the format will be inherited for type
 # "auto" mounts.
 #
-# [ /expamle/mount ]
-# dismount_interval = 60
-# map_type = nis
+#[ /example/mount ]
+#dismount_interval = 60
+#map_type = nis

