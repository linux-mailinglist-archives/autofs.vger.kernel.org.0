Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBB46AFE9B
	for <lists+autofs@lfdr.de>; Wed,  8 Mar 2023 06:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjCHFwT (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 8 Mar 2023 00:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCHFwS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 8 Mar 2023 00:52:18 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746DFA72AD
        for <autofs@vger.kernel.org>; Tue,  7 Mar 2023 21:52:16 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2F5281FE38;
        Wed,  8 Mar 2023 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678254735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zv6A2VmrpMnmMS3aC086YDvId+9XpDiz6Nk7rWgrWwU=;
        b=RfFZ4Tu2u0fbMnfXkdCEhvFFETu0twRcHMaIawOukco2FTLDYWSQ15nHkdNjQJosG8G4xP
        +aJvVXuJOT80wQoHs6Yb4vPnKs7SKorCxn4EHUoR+YLtXnQA2ToiEFlx6oHlKvicvqstOy
        PR2lhtZ3W7gsCRM0cUffe4PVQUQNo24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678254735;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zv6A2VmrpMnmMS3aC086YDvId+9XpDiz6Nk7rWgrWwU=;
        b=DNWblspMQEpwBsdlP7U32tAwIXlLSb/aklIuaOTYiTP8mqUe0DCwOXFgoyZin+I9ex73SZ
        h3w8Ip/V9/5t24Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6EF713596;
        Wed,  8 Mar 2023 05:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IXItJo0iCGTCRQAAMHmgww
        (envelope-from <neilb@suse.de>); Wed, 08 Mar 2023 05:52:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
Date:   Wed, 08 Mar 2023 16:52:10 +1100
Message-id: <167825473018.8008.14797686282321546235@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


New flags in the master map:
  autofsshared
  autofsprivate
  autofsslave

cause the corresponding mount propagation flags to be set on the autofs
mount point.  If none are specified the current behaviour of inheriting
from the parent unchanged.

For example specify "autofsprivate" allows mount points to be moved
away from autofs using "mount -M .....".  This is not supported by the
kernel for the normal default of "shared".

Better flag names should be chosen.  I would have liked to use "shared",
"private", and "slave", but they are already in use and only affect bind
mounts.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 daemon/direct.c       | 18 ++++++++++++++++++
 daemon/indirect.c     | 18 ++++++++++++++++++
 daemon/master_parse.y | 20 ++++++++++++++++++++
 daemon/master_tok.l   |  3 +++
 include/automount.h   |  5 +++++
 man/auto.master.5.in  |  9 +++++++++
 6 files changed, 73 insertions(+)

diff --git a/daemon/direct.c b/daemon/direct.c
index 316ffd781762..c11e27816990 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -285,6 +285,7 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 	int status, ret, ioctlfd;
 	const char *map_name;
 	time_t runfreq;
+	int flags;
 	int err;
=20
 	if (timeout) {
@@ -406,6 +407,23 @@ int do_mount_autofs_direct(struct autofs_point *ap,
 		goto out_err;
 	}
=20
+	flags =3D 0;
+	if (ap->flags & MOUNT_FLAG_AUTOFS_PRIVATE)
+		flags =3D MS_PRIVATE;
+	if (ap->flags & MOUNT_FLAG_AUTOFS_SHARED)
+		flags =3D MS_SHARED;
+	if (ap->flags & MOUNT_FLAG_AUTOFS_SLAVE)
+		flags =3D MS_SLAVE;
+	if (flags) {
+		ret =3D mount(NULL, me->key, NULL, flags, NULL);
+		if (ret =3D=3D -1) {
+			error(ap->logopt,
+			      "failed to set mount propagatoin %s",
+			      me->key);
+			goto out_umount;
+		}
+	}
+
 	ret =3D stat(me->key, &st);
 	if (ret =3D=3D -1) {
 		error(ap->logopt,
diff --git a/daemon/indirect.c b/daemon/indirect.c
index 23ef9f41398d..f521c66ba109 100644
--- a/daemon/indirect.c
+++ b/daemon/indirect.c
@@ -50,6 +50,7 @@ static int do_mount_autofs_indirect(struct autofs_point *ap=
, const char *root)
 	const char *map_name =3D hosts_map_name;
 	const char *type;
 	struct stat st;
+	int flags;
 	int ret;
 	int err;
=20
@@ -118,6 +119,23 @@ static int do_mount_autofs_indirect(struct autofs_point =
*ap, const char *root)
 	free(options);
 	options =3D NULL;
=20
+	flags =3D 0;
+	if (ap->flags & MOUNT_FLAG_AUTOFS_PRIVATE)
+		flags =3D MS_PRIVATE;
+	if (ap->flags & MOUNT_FLAG_AUTOFS_SHARED)
+		flags =3D MS_SHARED;
+	if (ap->flags & MOUNT_FLAG_AUTOFS_SLAVE)
+		flags =3D MS_SLAVE;
+	if (flags) {
+		ret =3D mount(NULL, root, NULL, flags, NULL);
+		if (ret =3D=3D -1) {
+			error(ap->logopt,
+			      "failed to set mount propagatoin %s",
+			      ap->path);
+			goto out_umount;
+		}
+	}
+
 	ret =3D stat(root, &st);
 	if (ret =3D=3D -1) {
 		crit(ap->logopt,
diff --git a/daemon/master_parse.y b/daemon/master_parse.y
index 469cfe9765ac..0b4ac6117390 100644
--- a/daemon/master_parse.y
+++ b/daemon/master_parse.y
@@ -72,6 +72,7 @@ static int tmp_argc;
 static char **local_argv;
 static int local_argc;
=20
+/* Propagation flags for bind mounts */
 #define PROPAGATION_SHARED	MOUNT_FLAG_SHARED
 #define PROPAGATION_SLAVE	MOUNT_FLAG_SLAVE
 #define PROPAGATION_PRIVATE	MOUNT_FLAG_PRIVATE
@@ -80,6 +81,15 @@ static int local_argc;
 				 MOUNT_FLAG_PRIVATE)
 static unsigned int propagation;
=20
+/* Propagation flags for autofs mount points */
+#define PROPAGATION_AUTOFS_SHARED	MOUNT_FLAG_AUTOFS_SHARED
+#define PROPAGATION_AUTOFS_SLAVE	MOUNT_FLAG_AUTOFS_SLAVE
+#define PROPAGATION_AUTOFS_PRIVATE	MOUNT_FLAG_AUTOFS_PRIVATE
+#define PROPAGATION_AUTOFS_MASK		(MOUNT_FLAG_AUTOFS_SHARED | \
+					 MOUNT_FLAG_AUTOFS_SLAVE | \
+					 MOUNT_FLAG_AUTOFS_PRIVATE)
+static unsigned int autofs_propagation;
+
 static char errstr[MAX_ERR_LEN];
 static int errlen;
=20
@@ -116,6 +126,7 @@ static int master_fprintf(FILE *, char *, ...);
 %token OPT_TIMEOUT OPT_NTIMEOUT OPT_PTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOS=
T OPT_VERBOSE
 %token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK OPT_MODE
 %token OPT_STRICTEXPIRE OPT_SHARED OPT_SLAVE OPT_PRIVATE
+%token OPT_AUTOFS_SHARED OPT_AUTOFS_SLAVE OPT_AUTOFS_PRIVATE
 %token COLON COMMA NL DDASH
 %type <strtype> map
 %type <strtype> options
@@ -222,6 +233,9 @@ line:
 	| PATH OPT_SHARED { master_notify($1); YYABORT; }
 	| PATH OPT_SLAVE { master_notify($1); YYABORT; }
 	| PATH OPT_PRIVATE { master_notify($1); YYABORT; }
+	| PATH OPT_AUTOFS_SHARED { master_notify($1); YYABORT; }
+	| PATH OPT_AUTOFS_SLAVE { master_notify($1); YYABORT; }
+	| PATH OPT_AUTOFS_PRIVATE { master_notify($1); YYABORT; }
 	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
 	| PATH OPT_GHOST { master_notify($1); YYABORT; }
 	| PATH OPT_NOGHOST { master_notify($1); YYABORT; }
@@ -642,6 +656,9 @@ daemon_option: OPT_TIMEOUT NUMBER { timeout =3D $2; }
 	| OPT_SHARED	{ propagation =3D PROPAGATION_SHARED; }
 	| OPT_SLAVE	{ propagation =3D PROPAGATION_SLAVE; }
 	| OPT_PRIVATE	{ propagation =3D PROPAGATION_PRIVATE; }
+	| OPT_AUTOFS_SHARED { autofs_propagation =3D PROPAGATION_AUTOFS_SHARED; }
+	| OPT_AUTOFS_SLAVE { autofs_propagation =3D PROPAGATION_AUTOFS_SLAVE; }
+	| OPT_AUTOFS_PRIVATE { autofs_propagation =3D PROPAGATION_AUTOFS_PRIVATE; }
 	| OPT_NOBIND	{ nobind =3D 1; }
 	| OPT_NOGHOST	{ ghost =3D 0; }
 	| OPT_GHOST	{ ghost =3D 1; }
@@ -716,6 +733,7 @@ static void local_init_vars(void)
 	symlnk =3D 0;
 	strictexpire =3D 0;
 	propagation =3D PROPAGATION_SLAVE;
+	autofs_propagation =3D 0;
 	nobind =3D 0;
 	ghost =3D defaults_get_browse_mode();
 	random_selection =3D global_selection_options & MOUNT_FLAG_RANDOM_SELECT;
@@ -917,6 +935,8 @@ int master_parse_entry(const char *buffer, unsigned int d=
efault_timeout, unsigne
 	}
 	entry->ap->flags &=3D ~(PROPAGATION_MASK);
 	entry->ap->flags |=3D propagation;
+	entry->ap->flags &=3D ~(PROPAGATION_AUTOFS_MASK);
+	entry->ap->flags |=3D autofs_propagation;
=20
 	if (random_selection)
 		entry->ap->flags |=3D MOUNT_FLAG_RANDOM_SELECT;
diff --git a/daemon/master_tok.l b/daemon/master_tok.l
index e2d15bce8b4d..e995f96d0df9 100644
--- a/daemon/master_tok.l
+++ b/daemon/master_tok.l
@@ -437,6 +437,9 @@ MODE		(--mode{OPTWS}|--mode{OPTWS}=3D{OPTWS})
 	-?shared		{ return(OPT_SHARED); }
 	-?slave			{ return(OPT_SLAVE); }
 	-?private		{ return(OPT_PRIVATE); }
+	-?autofsshared		{ return(OPT_AUTOFS_SHARED); }
+	-?autofsslave		{ return(OPT_AUTOFS_SLAVE); }
+	-?autofsprivate		{ return(OPT_AUTOFS_PRIVATE); }
 	-?strictexpire		{ return(OPT_STRICTEXPIRE); }
 	-g|--ghost|-?browse	{ return(OPT_GHOST); }
 	-v|--verbose		{ return(OPT_VERBOSE); }
diff --git a/include/automount.h b/include/automount.h
index 9387ad1b1ce2..142c6ecb36cc 100644
--- a/include/automount.h
+++ b/include/automount.h
@@ -548,6 +548,11 @@ struct kernel_mod_version {
 /* Indicator for applications to ignore the mount entry */
 #define MOUNT_FLAG_IGNORE		0x1000
=20
+/* Propagation flag to be used on the autofs mount point */
+#define MOUNT_FLAG_AUTOFS_SHARED	0x2000
+#define MOUNT_FLAG_AUTOFS_SLAVE		0x4000
+#define MOUNT_FLAG_AUTOFS_PRIVATE	0x8000
+
 struct autofs_point {
 	pthread_t thid;
 	char *path;			/* Mount point name */
diff --git a/man/auto.master.5.in b/man/auto.master.5.in
index 167170150292..343a78470d8c 100644
--- a/man/auto.master.5.in
+++ b/man/auto.master.5.in
@@ -221,6 +221,15 @@ since the automount target is itself an (unwanted) autom=
ount trigger.
 This option is an autofs pseudo mount option that can be used in the
 master map only.
 .TP
+.I autofsslave\fP, \fIautofsprivate\fP, or \fIautofsshared\fP
+These options allow mount propagation of the automount point
+itself to be set to one of \fIslave\fP, \fIprivate\fP, or=20
+\fIshared\fP.  This will be inherited by whatever is mounted there.
+If none are specified the propagation of the automount point
+will be inherted from its parent.
+This option is an autofs pseudo mount option that can be used in the
+master map only.
+.TP
 .I "\-r, \-\-random-multimount-selection"
 Enables the use of random selection when choosing a host from a
 list of replicated servers. This option is applied to this mount
--=20
2.39.2

