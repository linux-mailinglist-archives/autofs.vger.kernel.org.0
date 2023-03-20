Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEBE26C094D
	for <lists+autofs@lfdr.de>; Mon, 20 Mar 2023 04:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjCTD0p (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Mar 2023 23:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCTD0p (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Mar 2023 23:26:45 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D5F1A674
        for <autofs@vger.kernel.org>; Sun, 19 Mar 2023 20:26:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 309F51FEA0;
        Mon, 20 Mar 2023 03:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1679282801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=IO788Nu69COk8oGGYNDs6ppU0LYDpjASDRlmXbjRBNA=;
        b=I5bzInsW1Ta477lo/QCXZkbOWI02cPYyLp7L56aIcrOJIL413RGFEwaKGv/gmM8+TMcDSx
        +t3vAEF6KgaKMhiMKaCBGN9d5qjkqk3zYKSoyn44mm7vyn5RbbQaCmnEPq58u34Y2VN4bm
        gtREfzhjP9Wk7WzR/Qkmrw2NeXyp8Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1679282801;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=IO788Nu69COk8oGGYNDs6ppU0LYDpjASDRlmXbjRBNA=;
        b=fj4CPrInjmV5A3D49haSlBukzr7jIhgagImaBhgrwI5Bbo0lziFOogbtD1qzBhfmJZdxqx
        T8O3bcCk3diIdkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E998413912;
        Mon, 20 Mar 2023 03:26:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id N0IAJ2/SF2ReVwAAMHmgww
        (envelope-from <neilb@suse.de>); Mon, 20 Mar 2023 03:26:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: [PATCH] autofs-5.1.8 - add "unshared" option to disable mount propagation.
Date:   Mon, 20 Mar 2023 14:26:35 +1100
Message-id: <167928279599.8008.18190549797975624979@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


[[This is a different approach to meeting my customer's need.
  Thoughts? - thanks.]]

Sometimes it is useful for an autofs mount to be "private" for mount
propagation.  For example, this allows submounts to be moved off with
"mount --move" - such movement is not permitted for shared mounts.

Changing the autofs mount point to "private" with "mount --make-private"
after the automount daemon has started can be problematic.  If the
mount point is already shared there will be another copy that will never
get acted on by automount and so tools accessing it can hang.

So to safely achieve non-shared auto-mountpoints we need to create a
transparent bind mount at the mount point, mark it as private, then
mount the autofs mount there.

This patch does this when the "unshared" option is given in the
auto.master file.

Ideally we would check if the target mountpoint is shared and skip the
extra bind mount in that case.  However checking the propagation status
requires reading /proc/self/mountinfo which is more work than seems
justified in this case.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 daemon/automount.c    | 20 ++++++++++++++++----
 daemon/direct.c       | 26 ++++++++++++++++++++++++++
 daemon/indirect.c     | 18 ++++++++++++++++++
 daemon/master_parse.y |  7 +++++++
 daemon/master_tok.l   |  1 +
 include/automount.h   |  6 ++++++
 man/auto.master.5.in  |  9 +++++++++
 7 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/daemon/automount.c b/daemon/automount.c
index f550bc8fb222..dbc8976550eb 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -32,6 +32,7 @@
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/resource.h>
+#include <sys/mount.h>
 #include <sys/poll.h>
 #include <dirent.h>
 #include <sys/vfs.h>
@@ -1739,7 +1740,7 @@ static void handle_mounts_cleanup(void *arg)
 {
 	struct autofs_point *ap;
 	char buf[MAX_ERR_BUF];
-	unsigned int clean =3D 0, submount, logopt;
+	unsigned int clean =3D 0, clean_bind =3D 0, submount, logopt;
 	unsigned int pending =3D 0;
=20
 	ap =3D (struct autofs_point *) arg;
@@ -1747,9 +1748,12 @@ static void handle_mounts_cleanup(void *arg)
 	logopt =3D ap->logopt;
 	submount =3D ap->submount;
=20
-	if (!submount && strcmp(ap->path, "/-") &&
-	    ap->flags & MOUNT_FLAG_DIR_CREATED)
-		clean =3D 1;
+	if (!submount && strcmp(ap->path, "/-")) {
+		if (ap->flags & MOUNT_FLAG_DIR_CREATED)
+			clean =3D 1;
+		if (ap->flags & MOUNT_FLAG_DID_BIND)
+			clean_bind =3D 1;
+	}
=20
 	if (submount) {
 		struct mnt_list *mnt;
@@ -1787,6 +1791,14 @@ static void handle_mounts_cleanup(void *arg)
 		master_free_mapent(ap->entry);
 	}
=20
+	if (clean_bind) {
+		if (umount2(ap->path, MNT_DETACH)) {
+			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
+			warn(logopt, "failed to remove internal bind mount %s: %s",
+			     ap->path, estr);
+		}
+	}
+
 	if (clean) {
 		if (rmdir(ap->path) =3D=3D -1) {
 			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
diff --git a/daemon/direct.c b/daemon/direct.c
index 316ffd781762..db15689def9d 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -205,6 +205,14 @@ force_umount:
 	} else
 		info(ap->logopt, "umounted direct mount %s", me->key);
=20
+	if (!rv && (me->flags & MOUNT_FLAG_DID_BIND)) {
+		if (umount2(me->key, MNT_DETACH) =3D=3D -1) {
+			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
+			warn(ap->logopt, "failed to unmount internal bind mount %s: %s",
+			     me->key, estr);
+		}
+	}
+
 	if (!rv && me->flags & MOUNT_FLAG_DIR_CREATED) {
 		if  (rmdir(me->key) =3D=3D -1) {
 			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
@@ -400,6 +408,24 @@ int do_mount_autofs_direct(struct autofs_point *ap,
=20
 	map_name =3D me->mc->map->argv[0];
=20
+	me->flags &=3D ~MOUNT_FLAG_DID_BIND;
+	if (ap->flags & MOUNT_FLAG_UNSHARED) {
+		/* Ideally we would check if the mount is shared, but
+		 * that requires reading mountinfo which isn't easy.
+		 */
+		if (mount(me->key, me->key, "none", MS_BIND, NULL) !=3D 0) {
+			error(ap->logopt,
+			      "failed to create internal bind mount for 'unshared': %s",
+			      me->key);
+		} else {
+			if (mount(NULL, me->key, NULL, MS_PRIVATE, NULL) =3D=3D 0)
+				me->flags |=3D MOUNT_FLAG_DID_BIND;
+			else
+				error(ap->logopt,
+				      "failed to make %s private", me->key);
+		}
+	}
+
 	ret =3D mount(map_name, me->key, "autofs", MS_MGC_VAL, mp->options);
 	if (ret) {
 		crit(ap->logopt, "failed to mount autofs path %s", me->key);
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 23ef9f41398d..70c601814f6d 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -108,6 +108,24 @@ static int do_mount_autofs_indirect(struct autofs_point =
*ap, const char *root)
 	if (!type || strcmp(ap->entry->maps->type, "hosts"))
 		map_name =3D ap->entry->maps->argv[0];
=20
+	ap->flags &=3D ~MOUNT_FLAG_DID_BIND;
+	if (ap->flags & MOUNT_FLAG_UNSHARED) {
+		/* Ideally we would check if the mount is shared, but
+		 * that requires reading mountinfo which isn't easy.
+		 */
+		if (mount(root, root, "none", MS_BIND, NULL) !=3D 0) {
+			error(ap->logopt,
+			      "failed to create internal bind mount for 'unshared': %s",
+			      root);
+		} else {
+			if (mount(NULL, root, NULL, MS_PRIVATE, NULL) =3D=3D 0)
+				ap->flags |=3D MOUNT_FLAG_DID_BIND;
+			else
+				error(ap->logopt,
+				      "failed to make %s private", root);
+		}
+	}
+
 	ret =3D mount(map_name, root, "autofs", MS_MGC_VAL, options);
 	if (ret) {
 		crit(ap->logopt,
diff --git a/daemon/master_parse.y b/daemon/master_parse.y
index 469cfe9765ac..9e4e9d0e02ff 100644
--- a/daemon/master_parse.y
+++ b/daemon/master_parse.y
@@ -62,6 +62,7 @@ static long positive_timeout;
 static unsigned symlnk;
 static unsigned strictexpire;
 static unsigned nobind;
+static unsigned unshared;
 static unsigned ghost;
 extern unsigned global_selection_options;
 static unsigned random_selection;
@@ -116,6 +117,7 @@ static int master_fprintf(FILE *, char *, ...);
 %token OPT_TIMEOUT OPT_NTIMEOUT OPT_PTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOS=
T OPT_VERBOSE
 %token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK OPT_MODE
 %token OPT_STRICTEXPIRE OPT_SHARED OPT_SLAVE OPT_PRIVATE
+%token OPT_UNSHARED
 %token COLON COMMA NL DDASH
 %type <strtype> map
 %type <strtype> options
@@ -223,6 +225,7 @@ line:
 	| PATH OPT_SLAVE { master_notify($1); YYABORT; }
 	| PATH OPT_PRIVATE { master_notify($1); YYABORT; }
 	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
+	| PATH OPT_UNSHARED { master_notify($1); YYABORT; }
 	| PATH OPT_GHOST { master_notify($1); YYABORT; }
 	| PATH OPT_NOGHOST { master_notify($1); YYABORT; }
 	| PATH OPT_VERBOSE { master_notify($1); YYABORT; }
@@ -642,6 +645,7 @@ daemon_option: OPT_TIMEOUT NUMBER { timeout =3D $2; }
 	| OPT_SHARED	{ propagation =3D PROPAGATION_SHARED; }
 	| OPT_SLAVE	{ propagation =3D PROPAGATION_SLAVE; }
 	| OPT_PRIVATE	{ propagation =3D PROPAGATION_PRIVATE; }
+	| OPT_UNSHARED  { unshared =3D 1; }
 	| OPT_NOBIND	{ nobind =3D 1; }
 	| OPT_NOGHOST	{ ghost =3D 0; }
 	| OPT_GHOST	{ ghost =3D 1; }
@@ -716,6 +720,7 @@ static void local_init_vars(void)
 	symlnk =3D 0;
 	strictexpire =3D 0;
 	propagation =3D PROPAGATION_SLAVE;
+	unshared =3D 0;
 	nobind =3D 0;
 	ghost =3D defaults_get_browse_mode();
 	random_selection =3D global_selection_options & MOUNT_FLAG_RANDOM_SELECT;
@@ -918,6 +923,8 @@ int master_parse_entry(const char *buffer, unsigned int d=
efault_timeout, unsigne
 	entry->ap->flags &=3D ~(PROPAGATION_MASK);
 	entry->ap->flags |=3D propagation;
=20
+	if (unshared)
+		entry->ap->flags |=3D MOUNT_FLAG_UNSHARED;
 	if (random_selection)
 		entry->ap->flags |=3D MOUNT_FLAG_RANDOM_SELECT;
 	if (use_weight)
diff --git a/daemon/master_tok.l b/daemon/master_tok.l
index e2d15bce8b4d..28b34647ecc6 100644
--- a/daemon/master_tok.l
+++ b/daemon/master_tok.l
@@ -437,6 +437,7 @@ MODE		(--mode{OPTWS}|--mode{OPTWS}=3D{OPTWS})
 	-?shared		{ return(OPT_SHARED); }
 	-?slave			{ return(OPT_SLAVE); }
 	-?private		{ return(OPT_PRIVATE); }
+	-?unshared		{ return(OPT_UNSHARED); }
 	-?strictexpire		{ return(OPT_STRICTEXPIRE); }
 	-g|--ghost|-?browse	{ return(OPT_GHOST); }
 	-v|--verbose		{ return(OPT_VERBOSE); }
diff --git a/include/automount.h b/include/automount.h
index 9387ad1b1ce2..32372c5cabce 100644
--- a/include/automount.h
+++ b/include/automount.h
@@ -548,6 +548,12 @@ struct kernel_mod_version {
 /* Indicator for applications to ignore the mount entry */
 #define MOUNT_FLAG_IGNORE		0x1000
=20
+/* The autofs mount must not be shared */
+#define MOUNT_FLAG_UNSHARED		0x2000
+
+/* The bind mount was created first to change propagation */
+#define MOUNT_FLAG_DID_BIND		0x4000
+
 struct autofs_point {
 	pthread_t thid;
 	char *path;			/* Mount point name */
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index 167170150292..db907b6bc878 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -221,6 +221,15 @@ since the automount target is itself an (unwanted) autom=
ount trigger.
 This option is an autofs pseudo mount option that can be used in the
 master map only.
 .TP
+.I unshared
+This option ensures that the auto-mountpoint created is not shared for
+the purposes of mount propagation.  Marking the mountpoint "private"
+after it is mounted is not safe for auto-mountpoints as it can leave
+orphans auto-mountpoints which will causing any tool accessing them to
+hang.  So automount must ensure the auto-mountpoints are not shared when
+first mounted.  It does this by creating an internal bind mount at the
+target mountpoint which has mount propagation disabled.
+.TP
 .I "\-r, \-\-random-multimount-selection"
 Enables the use of random selection when choosing a host from a
 list of replicated servers. This option is applied to this mount
--=20
2.40.0

