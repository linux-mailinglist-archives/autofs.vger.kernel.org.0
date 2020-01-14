Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BAD13B499
	for <lists+autofs@lfdr.de>; Tue, 14 Jan 2020 22:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgANVpr (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 14 Jan 2020 16:45:47 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:35832 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgANVpr (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 14 Jan 2020 16:45:47 -0500
Received: by mail-lf1-f50.google.com with SMTP id 15so11055083lfr.2
        for <autofs@vger.kernel.org>; Tue, 14 Jan 2020 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yueV4ajrz1P0UF2dctvR+ENu78mGrdt50pJvL6O9Cao=;
        b=f9JyW6DlRoAXSdVyth6sG+zPPsas4bOVXyWMR6HJfnHqWb2WKw3ZGur21Um0uWNXQL
         6r/mjZB6Ek5DSjg21a1zdaNCq2U2Y4N5Tc1DRowxkBrJxKa8qFZ8+AG0vGcvDyHsrgO6
         upr0es0wbTCzIGUHGDvEDHaPkRt4qYu+Ngs9taGcsP5wrwF6Zyie+p65piyR53d4vmVh
         ud+Xq/XQ6eYKH++aijYp7AjovE3BBjpoKOdtKJs5fHD76nDyWF7L/4KYIy7gdO0jeb4x
         s2ngiVfU+KiEdoy6GRar2MJaFtupYnQtbWsHAAzc2xORFRH6jPpZTYgDM2dKcgZGFD61
         HDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yueV4ajrz1P0UF2dctvR+ENu78mGrdt50pJvL6O9Cao=;
        b=jkba7Zinp2BptJav+kSS9C4bb2O8QvBEYhIrZgy4efumDxSxJ5sW/D1CYB8Ox7r0JP
         VsYtJaB+b7SE8Qqf2xFx/EtvZqeo/KrDTarJh3EMkLRlQo9alknJ3eHP+ohJnfQeNkPL
         Iy1LsAltWnPiHrFSwnAyrfTWw/sji0xmQOgR2X4amVRc7RsBk8CoRK67b9q28kWzHGzW
         f65OkWGxKHRJ65CO2nh2cM7SvZNvbkZAOetnkaOrIWCHV02BWcCAyJ1lpYoasP4pjPmR
         gRWiGURluZFozbjLWFvkNRLaTHYJzlKPCr2C6mNiUKCzcJpfve9JrBZVGmv6SA7qsJmq
         m2jg==
X-Gm-Message-State: APjAAAXKxC8wfewUNhONB+dTlIYYOKqIpfshXv4c1e2dxqd/WIoRgxja
        ZCl/6izXFHAXDKqnpzetVBftJrteGJvN7xAaIbh2RrFWi28=
X-Google-Smtp-Source: APXvYqx52iPugraCKl2V06OUiVo5iG3RDZc3yahAAG4V50O3D4MPOEGo93WAcpnlHXZU/GYUW/h+dMqIUwGWk+0/BQU=
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr3031085lfp.106.1579038344184;
 Tue, 14 Jan 2020 13:45:44 -0800 (PST)
MIME-Version: 1.0
From:   Andreas P <nurgrak@gmail.com>
Date:   Tue, 14 Jan 2020 22:45:33 +0100
Message-ID: <CABPfrkzxRo-zATezdNQgtuUDypLU+UPkpoHh6bE6J=mWBH8OFw@mail.gmail.com>
Subject: [PATCH] Fix typing errors and formatting
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Fixing multiple typing errors across the board. Combined with adding
correct formatting for various configuration parameters in
redhat/autofs.conf.default.in and samples/autofs.conf.default.in. For
example force_standard_program_map_env.

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
---
diff --git a/README.active-restart b/README.active-restart
index 95e9862..0f98172 100644
--- a/README.active-restart
+++ b/README.active-restart
@@ -6,7 +6,7 @@ The initial release of autofs version 5 used the
"umount -l" (lazy
 umount) to clear stale mounts at startup so that new mounts could
 be made with a clean slate. This proved to be a bad choice because
 the lazy umount removes the mount from the kernel mount tree. While
-the mount itself persists (invisibe to further VFS lookups) until
+the mount itself persists (invisible to further VFS lookups) until
 the mount isn't busy anymore the kernel function d_path(), used to
 calculate the path from the mount point to the root, isn't able to
 perform its function any more. This leads to things that use d_path(),
@@ -106,7 +106,7 @@ or be set to permissive mode.
 Patches for several recent kernel that don't have the implementation
 can be found in the patches directory. They have "dev-ioctl" in their
 name. Note that, to use these patches, you should be using a kernel
-patched with all the current autofs bug fixes since, apart from porobably
+patched with all the current autofs bug fixes since, apart from probably
 not working, the patch probably won't apply either. The bug fix patches
 can also be found in the patches directory and they have "v5-update" in
 their names.
diff --git a/README.amd-maps b/README.amd-maps
index d933a67..7c518da 100644
--- a/README.amd-maps
+++ b/README.amd-maps
@@ -35,7 +35,7 @@ map name given in the master map entry will override
a "map_name"
 option in the amd per-mount section.

 If an amd per-mount section is used alone then not giving the "map_type"
-option will alow the use of nsswicth for map selection.
+option will alow the use of nsswitch for map selection.

 See below for an example of an amd per-mount configuration entry.

diff --git a/README.autofs-schema b/README.autofs-schema
index c121e1c..05c05f0 100644
--- a/README.autofs-schema
+++ b/README.autofs-schema
@@ -4,7 +4,7 @@ autofs schema
 The distribution file samples/autofs.schema is very old and is
 incorrect.

-This schema was added to the discribution long ago when it was
+This schema was added to the distribution long ago when it was
 not clear what schema to use for Linux autofs information.

 The schema was corrected somewhere along the line but the autofs
@@ -12,7 +12,7 @@ distribution copy was never updated. The schema has now been
 updated but it is not recommended for use as the schema for autofs
 map information.

-The rfc2307 or, preferably the, rfc2307bis schema is the recommened
+The rfc2307 or, preferably the, rfc2307bis schema is the recommended
 schema to use.

 Ian
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 3225732..e2c7d8d 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -112,7 +112,7 @@ static int do_mount_autofs_indirect(struct
autofs_point *ap, const char *root)
                  root);
             goto out_err;
         }
-        /* If we recieve an error, and it's EEXIST or EROFS we know
+        /* If we receive an error, and it's EEXIST or EROFS we know
            the directory was not created. */
         ap->flags &= ~MOUNT_FLAG_DIR_CREATED;
     } else {
diff --git a/daemon/lookup.c b/daemon/lookup.c
index 60a48f3..8489d26 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -765,7 +765,7 @@ int lookup_ghost(struct autofs_point *ap, const char *root)
                 goto next;

             /* This will also take care of amd "/defaults" entry as
-             * amd map keys are not allowd to start with "/"
+             * amd map keys are not allowed to start with "/"
              */
             if (*me->key == '/') {
                 if (map->flags & MAP_FLAG_FORMAT_AMD)
diff --git a/daemon/state.c b/daemon/state.c
index 95d87fc..86a3e50 100644
--- a/daemon/state.c
+++ b/daemon/state.c
@@ -359,7 +359,7 @@ static void do_readmap_mount(struct autofs_point *ap,
          * TODO: how do we recognise these orphaned map instances. We
          * can't just delete these instances when the cache becomes
          * empty because that is a valid state for a master map entry.
-         * This is becuase of the requirement to continue running with
+         * This is because of the requirement to continue running with
          * an empty cache awaiting a map re-load.
          */
         valid = lookup_source_valid_mapent(ap, me->key, LKP_DISTINCT);
diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
index 3a7aba7..861f6d7 100644
--- a/include/lookup_ldap.h
+++ b/include/lookup_ldap.h
@@ -65,7 +65,7 @@ struct lookup_context {
       * uri is the list of servers to attempt connection to and is
       * used only if server, above, is NULL. The head of the list
       * is the server which we are currently connected to.
-      * cur_host tracks chnages to connected server, triggering
+      * cur_host tracks changes to connected server, triggering
       * a scan of basedns when it changes.
       * sdns is the list of basdns to check, done in the order
       * given in configuration.
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index 6e510a5..6e43a64 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -102,7 +102,7 @@ The map is a regular text file.
 .B program
 The map is an executable program, which is passed a key on the command
 line and returns an entry (everything besides the key) on stdout if successful.
-Optinally, the keyword exec may be used as a synonym for program to avoid
+Optionally, the keyword exec may be used as a synonym for program to avoid
 confusion with amd formated maps mount type program.
 .TP
 .B yp
diff --git a/man/autofs.5 b/man/autofs.5
index d32e772..63c96ac 100644
--- a/man/autofs.5
+++ b/man/autofs.5
@@ -241,7 +241,7 @@ Multiple hosts, some with same path, some with another
 Multiple replicated hosts, different (potentially) paths:
 <path> host1:/path/pathA host2:/path/pathB

-Mutliple weighted, replicated hosts same path:
+Multiple weighted, replicated hosts same path:
 <path> host1(5),host2(6),host3(1):/path/path

 Multiple weighted, replicated hosts different (potentially) paths:
diff --git a/man/autofs_ldap_auth.conf.5.in b/man/autofs_ldap_auth.conf.5.in
index 2357566..7b01c68 100644
--- a/man/autofs_ldap_auth.conf.5.in
+++ b/man/autofs_ldap_auth.conf.5.in
@@ -55,7 +55,7 @@ This option tells whether an authenticated
connection to the ldap server is
 required in order to perform ldap queries. If the flag is set to yes, only
 sasl authenticated connections will be allowed. If it is set to no then
 authentication is not needed for ldap server connections. If it is set to
-autodetect then the ldap server will be queried to establish a suitable sasl
+autodetect then the ldap server will be queried to establish a suitable SASL
 authentication mechanism. If no suitable mechanism can be found, connections
 to the ldap server are made without authentication. Finally, if it is set to
 simple, then simple authentication will be used instead of SASL.
diff --git a/modules/lookup_program.c b/modules/lookup_program.c
index fcb1af7..241602e 100644
--- a/modules/lookup_program.c
+++ b/modules/lookup_program.c
@@ -532,7 +532,7 @@ static int match_key(struct autofs_point *ap,
     /*
      * Now strip successive directory components and try a
      * match against map entries ending with a wildcard and
-     * finally try the wilcard entry itself.
+     * finally try the wildcard entry itself.
      */
     while ((prefix = strrchr(lkp_key, '/'))) {
         char *match;
diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
index 09bb5dd..c413a02 100644
--- a/redhat/autofs.conf.default.in
+++ b/redhat/autofs.conf.default.in
@@ -79,7 +79,7 @@ mount_nfs_default_protocol = 4
 #            in a language that can load components from,
 #            for example, a user home directory.
 #
-# force_standard_program_map_env = no
+#force_standard_program_map_env = no
 #
 # use_mount_request_log_id - Set whether to use a mount request log
 #            id so that log entries for specific mount
@@ -186,7 +186,7 @@ mount_nfs_default_protocol = 4
 # use_ignore_mount_option - This option is used to enable the use of autofs
 #            pseudo option "disable". This option is used as a
 #            hint to user space that the mount entry should be
-#            ommitted from mount table listings. The default is
+#            omitted from mount table listings. The default is
 #            "no" to avoid unexpected changes in behaviour and
 #            so is an opt-in setting.
 #
@@ -333,7 +333,7 @@ mount_nfs_default_protocol = 4
 #    machines without having to modify centrally managed maps.
 #    It is empty by default.
 #
-# search_path - colon seperated paths to search for maps that
+# search_path - colon separated paths to search for maps that
 #    are not specified as a full path.
 #
 # dismount_interval - is equivalent to the autofs timeout option. It
@@ -377,7 +377,7 @@ mount_nfs_default_protocol = 4
 # ldap_hostports - has no default value set. It must be set to
 #    the URI of the LDAP server to be used for lookups when
 #    ldap is used a map source. It may contain a comma or
-#    space seperated list of LDAP URIs.
+#    space separated list of LDAP URIs.
 #
 # hesiod_base - the base name used for hesiod map sources.
 #
diff --git a/redhat/autofs.sysconfig b/redhat/autofs.sysconfig
index 0171696..8e3dcbf 100644
--- a/redhat/autofs.sysconfig
+++ b/redhat/autofs.sysconfig
@@ -1,7 +1,7 @@
 #
 # Init system options
 #
-# If the kernel supports using the autofs miscellanous device
+# If the kernel supports using the autofs miscellaneous device
 # and you wish to use it you must set this configuration option
 # to "yes" otherwise it will not be used.
 #
diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
index 4a18f6f..bae885c 100644
--- a/samples/autofs.conf.default.in
+++ b/samples/autofs.conf.default.in
@@ -78,7 +78,7 @@ browse_mode = no
 #            in a language that can load components from,
 #            for example, a user home directory.
 #
-# force_standard_program_map_env = no
+#force_standard_program_map_env = no
 #
 # use_mount_request_log_id - Set whether to use a mount request log
 #            id so that log entries for specific mount
@@ -185,7 +185,7 @@ browse_mode = no
 # use_ignore_mount_option - This option is used to enable the use of autofs
 #            pseudo option "disable". This option is used as a
 #            hint to user space that the mount entry should be
-#            ommitted from mount table listings. The default is
+#            omitted from mount table listings. The default is
 #            "no" to avoid unexpected changes in behaviour and
 #            so is an opt-in setting.
 #
@@ -332,7 +332,7 @@ browse_mode = no
 #    machines without having to modify centrally managed maps.
 #    It is empty by default.
 #
-# search_path - colon seperated paths to search for maps that
+# search_path - colon separated paths to search for maps that
 #    are not specified as a full path.
 #
 # dismount_interval - is equivalent to the autofs timeout option. It
@@ -376,7 +376,7 @@ browse_mode = no
 # ldap_hostports - has no default value set. It must be set to
 #    the URI of the LDAP server to be used for lookups when
 #    ldap is used a map source. It may contain a comma or
-#    space seperated list of LDAP URIs.
+#    space separated list of LDAP URIs.
 #
 # hesiod_base - the base name used for hesiod map sources.
 #
@@ -408,10 +408,10 @@ dismount_interval = 300
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
diff --git a/samples/rc.autofs.in b/samples/rc.autofs.in
index 487669f..7601717 100644
--- a/samples/rc.autofs.in
+++ b/samples/rc.autofs.in
@@ -30,7 +30,7 @@ PATH=/sbin:/usr/sbin:/bin:/usr/bin
 export PATH

 #
-# load customized configuation settings
+# load customized configuration settings
 #
 if [ -r $confdir/autofs ]; then
     . $confdir/autofs
