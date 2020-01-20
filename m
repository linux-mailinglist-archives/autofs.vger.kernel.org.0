Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D971431A1
	for <lists+autofs@lfdr.de>; Mon, 20 Jan 2020 19:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgATSlg (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Jan 2020 13:41:36 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:36928 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgATSlf (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Jan 2020 13:41:35 -0500
Received: by mail-lj1-f172.google.com with SMTP id o13so164944ljg.4
        for <autofs@vger.kernel.org>; Mon, 20 Jan 2020 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ns/VIWpu3tkkyFi35wX2OB29d+zi0B2G+7AK4VzTSaA=;
        b=tRSJZKVRGQUDDKyM3Rp4IyLjrHqaf+1EHgXrVhOm0ZL4+rdkpm24kEVE2une4MqIGS
         G+5v9sRrVIKFqXXgaNicnn/J8fWnn9EQxpJHyelovMFAwOZ3G+NinKIq/B5uPt21gcbv
         +rf22HebY+8Ie0KMTfuDrjZmPpja/pGrks5h/p2cuHl+Vppc0WYgm8D3ShZA33lJ22sk
         cyuW5OqCZrjBnWB74yOuzMAA04cj6hHc/JcJp+5F9Mphen0MVbvdUjNum/ZGbGO5V2dH
         5XnqK/42TpiNwslQLRGeIlFSAQoJjehbM8I8qLCHQHz05MsiX1QXR674eDB9VgsYo4k1
         cw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ns/VIWpu3tkkyFi35wX2OB29d+zi0B2G+7AK4VzTSaA=;
        b=AXns4IJZCxyTGFqYHeMWZisB1vmf1u6xIdZpMqqaTpZZAP7oDQoyMH0354WVE22y0o
         dqr9285Nsfk3u/BGUWI36UUMW9KpvSow4HMkg/io9kp/W8HttTIGDl+BpDzCsqxCczR/
         lD9GologmNOwYtJI0qG6+TViI+F1KG868Iwjrk/8N9HIRT/osfs+dQVIkJ0wwScCSzOH
         vInheELzqj0Vlw7Yl+zaZr5vdKoS4z+odElL1QUflK/nTA0Td7sHx9WOjdjtGSbW6Zc/
         kfJHL5n6+79DPmEoWS4ZdZvk6LtE0mEDj48aDeiVK9o2KvekDR/UYQ+WmP3tZ3TKbUY+
         KEUw==
X-Gm-Message-State: APjAAAVc3YrjA38x0ann+gYYug0Q5cYxCIwI68YV05NZXtiXV6KsDqxx
        F6WhrHd+YNs8iK1z6WuuL+Fn0mei++H4hKpZG9qj+pnWQm8=
X-Google-Smtp-Source: APXvYqy4ExR64G2b3MGWEUP79lxbdAaXtHpELKAXaE4OcCEwvAY+gqd46GM5u77o1FQ4WftIpBmDDUGzy39/7idQ3IY=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr1917762ljk.37.1579545691553;
 Mon, 20 Jan 2020 10:41:31 -0800 (PST)
MIME-Version: 1.0
From:   Andreas P <nurgrak@gmail.com>
Date:   Mon, 20 Jan 2020 19:41:20 +0100
Message-ID: <CABPfrkx3dUvRy6SK+mj6qqq21jPzrvTvcntxBpFYBNPUDRkB-A@mail.gmail.com>
Subject: [PATCH][v2] Fix typing errors and formatting
To:     "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>,
        Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Here is the updated version of the patch. Including Vincents changes.

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
---

diff --git a/README.active-restart b/README.active-restart
index 95e9862..0c0b90f 100644
--- a/README.active-restart
+++ b/README.active-restart
@@ -6,9 +6,9 @@ The initial release of autofs version 5 used the
"umount -l" (lazy
 umount) to clear stale mounts at startup so that new mounts could
 be made with a clean slate. This proved to be a bad choice because
 the lazy umount removes the mount from the kernel mount tree. While
-the mount itself persists (invisibe to further VFS lookups) until
-the mount isn't busy anymore the kernel function d_path(), used to
-calculate the path from the mount point to the root, isn't able to
+the mount itself persists (invisible to further VFS lookups) until
+the mount isn't busy anymore, the kernel function d_path() (used to
+calculate the path from the mount point to the root) isn't able to
 perform its function any more. This leads to things that use d_path(),
 such as /bin/pwd, the contents of the link /proc/<pid>/cwd, and so on.

@@ -103,10 +103,10 @@ in the autofs configuration. In addition, if
selinux is being used,
 it will likely need to allow operations on the autofs device file
 or be set to permissive mode.

-Patches for several recent kernel that don't have the implementation
+Patches for several recent kernels that don't have the implementation
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
index 3a7aba7..3fb13a1 100644
--- a/include/lookup_ldap.h
+++ b/include/lookup_ldap.h
@@ -65,9 +65,9 @@ struct lookup_context {
       * uri is the list of servers to attempt connection to and is
       * used only if server, above, is NULL. The head of the list
       * is the server which we are currently connected to.
-      * cur_host tracks chnages to connected server, triggering
+      * cur_host tracks changes to connected server, triggering
       * a scan of basedns when it changes.
-      * sdns is the list of basdns to check, done in the order
+      * sdns is the list of basedns to check, done in the order
       * given in configuration.
       */
     pthread_mutex_t uris_mutex;
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index 6e510a5..668c875 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -102,8 +102,8 @@ The map is a regular text file.
 .B program
 The map is an executable program, which is passed a key on the command
 line and returns an entry (everything besides the key) on stdout if successful.
-Optinally, the keyword exec may be used as a synonym for program to avoid
-confusion with amd formated maps mount type program.
+Optionally, the keyword exec may be used as a synonym for program to avoid
+confusion with amd formatted maps mount type program.
 .TP
 .B yp
 The map is a NIS (YP) database.
@@ -137,7 +137,7 @@ which name is started with "." is also ignored.
 .br
 Format of the map data; currently the formats recognized are \fBsun\fP,
 which is a subset of the Sun automounter map format, \fBhesiod\fP, for
-hesiod filesys entries and \fBamd\fP for amd formated map entries.
+hesiod filesys entries and \fBamd\fP for amd formatted map entries.
 If the format is left unspecified, it defaults to \fBsun\fP for all map
 types except \fBhesiod\fP unless it is a top level \fBamd\fP mount that
 has a configuration entry for the mount point path, in which case the
diff --git a/man/autofs.5 b/man/autofs.5
index d32e772..e77fed2 100644
--- a/man/autofs.5
+++ b/man/autofs.5
@@ -225,7 +225,7 @@ If present, the per-mountpoint mount-options are
appended to the
 default mount-options. This behaviour may be overridden by the append_options
 configuration setting.
 .SS Replicated Server
-A mount location can specify multiple hosts for a location, portentially
+A mount location can specify multiple hosts for a location, potentially
 with a different export path for the same file system. Historically these
 different locations are read-only and provide the same replicated file system.
 .sp
@@ -241,10 +241,10 @@ Multiple hosts, some with same path, some with another
 Multiple replicated hosts, different (potentially) paths:
 <path> host1:/path/pathA host2:/path/pathB

-Mutliple weighted, replicated hosts same path:
+Multiple weighted, replicated hosts; same path:
 <path> host1(5),host2(6),host3(1):/path/path

-Multiple weighted, replicated hosts different (potentially) paths:
+Multiple weighted, replicated hosts; different (potentially) paths:
 <path> host1(3):/path/pathA host2(5):/path/pathB

 Anything else is questionable and unsupported, but these variations
will also work:
@@ -360,7 +360,7 @@ The local host name, without the domain part, as
given by gethostname(2).
 .B hostd
 .br
 The full host name. If \fBsub_domain\fP is given in the configuration
-this is set to the contatenation of \fBhost\fP and \fBsub_domain\fP deperated
+this is set to the concatenation of \fBhost\fP and \fBsub_domain\fP deperated
 by a \fB.\fP. If \fBsub_domain\fP is not set in the configuration the value
 of \fBdomain\fP is used instead of \fBsub_domain\fP.
 .TP
@@ -405,7 +405,7 @@ the network the interface is connected to.
 .B xhost(hostname)
 .br
 The \fBxhost()\fP selector compares \fBhostname\fP to the \fB${host}\fP
-and if it doesn't match it attempts to lookup the cannonical name
+and if it doesn't match it attempts to lookup the canonical name
 of \fBhostname\fP and compares it to \f${host}\fP as well.
 .TP
 .B exists(filename)
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
diff --git a/modules/lookup_yp.c b/modules/lookup_yp.c
index 38f7549..580ec3f 100644
--- a/modules/lookup_yp.c
+++ b/modules/lookup_yp.c
@@ -541,7 +541,7 @@ static int match_key(struct autofs_point *ap,
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
