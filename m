Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1775FB480
	for <lists+autofs@lfdr.de>; Tue, 11 Oct 2022 16:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiJKOZa (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 11 Oct 2022 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiJKOZ3 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 11 Oct 2022 10:25:29 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5CE3DF08
        for <autofs@vger.kernel.org>; Tue, 11 Oct 2022 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:message-id:subject:mime-version:
   content-transfer-encoding;
  bh=SYaKsEVVRBimurTKJ+2ku9BU7+EQJ2ZP8AEwKIF7l3g=;
  b=tZ1FErFHzvo40FPZRGi0ifotBisbKd9c2YK6q2Aj9c0rYYL2YuJ8b6Y+
   CSW8mN+gMZV8JHbWWAxCUHWa3PEPY2w7rA98MOaQ6OWFjalwr6JE+DdaZ
   matBtSKJMkHangOPEptXI/v99l5eiVQu71HwQTBpBw3skXk+uXc1b6yt1
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=alexandre.merlin@inria.fr; spf=None smtp.helo=postmaster@zcs-store1.inria.fr
Received-SPF: SoftFail (mail2-relais-roc.national.inria.fr:
  domain of alexandre.merlin@inria.fr is inclined to not
  designate 128.93.142.28 as permitted sender)
  identity=mailfrom; client-ip=128.93.142.28;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="alexandre.merlin@inria.fr";
  x-sender="alexandre.merlin@inria.fr"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  ip4:192.134.164.0/24 mx ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs-store1.inria.fr) identity=helo;
  client-ip=128.93.142.28;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="alexandre.merlin@inria.fr";
  x-sender="postmaster@zcs-store1.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; 
   d="scan'208";a="58720456"
X-MGA-submission: =?us-ascii?q?MDFFMon6CQQGu/MUfV8vv9RXFuguWHQPTdGtZH?=
 =?us-ascii?q?qijNFKTW0Y2sYhZjQmH7vVMjzTEdTvRKpQPoP8p3Vn95LcwIDOAjiNJY?=
 =?us-ascii?q?paf2jq24zST/NoXQwyCxcpjcytNR7L6JFFganVia9BusByR8+yDCthVK?=
 =?us-ascii?q?bjzNJom4LqN1Al4j6nfbPQgg=3D=3D?=
Received: from zcs-store1.inria.fr ([128.93.142.28])
  by mail2-relais-roc.national.inria.fr with ESMTP; 11 Oct 2022 16:25:21 +0200
Date:   Tue, 11 Oct 2022 16:25:21 +0200 (CEST)
From:   Alexandre Merlin <alexandre.merlin@inria.fr>
To:     autofs@vger.kernel.org
Message-ID: <298565857.11643783.1665498321494.JavaMail.zimbra@inria.fr>
Subject: autofs regression due to positive_timeout (valid timeout feature)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [152.81.8.62]
X-Mailer: Zimbra 8.8.15_GA_4372 (ZimbraWebClient - FF105 (Linux)/8.8.15_GA_4372)
Thread-Index: NegQOBTiyfwoGBlTaOpT/kUvWuvgOg==
Thread-Topic: autofs regression due to positive_timeout (valid timeout feature)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello,

TL;DR: Because of our use of a script-based map that dynamically creates exports server-side based on user's rights, we are experiencing a regression since commit 2f562f63a (autofs-5.1.6 - use a valid timeout in lookup_prune_one_cache()). Creating an option for a configurable  positive_timeout, as mentioned in the commit comment, would be an efficient solution for us.

We are working for the Grid'5000 scientific testbed (see https://www.grid5000.fr/w/Grid5000:Home). Our users can reserve nodes to make their experiments, and from these nodes, they can access to different NFS shares if they are granted access to use them.

We use autofs to mount these filesystems on the fly, using a map based on a script which checks that the user is granted, and which asks for the creation of the appropriate export file on the corresponding NFS server.

When the reservation is done, we signal the node's automount daemon using the USR1 and HUP signals in order  to forget what was automounted by the user (as compute nodes may be shared by different users, we want to ensure that the previously mounted resource is no more in the running configuration).

For this to work, our granting access script must be called each time a user request to access a mounted point. But since the commit [2f562f63a] introducing the positive timeout, when a user tries to access a mounted point, the cache is used if a another user used the same mounted point within the positive timeout timeframe (120s).

So we need a way to disable the cache to be sure that our granting script is called. It can be done for the NEGATIVE_TIMEOUT but not yet for the POSITIVE_TIMEOUT.

Since it is mentioned in the commit message that "The valid timeout probably should become configurable at some point too", we wonder if it would be possible to include it in a future release. You will find attached a patch introducing this new option.

Respectfully,
Alexandre MERLIN, for the Grid'5000 Team


daemon/automount.c             | 10 +++++++++-
daemon/lookup.c                |  6 ++++--
daemon/master.c                |  6 ++++++
daemon/master_parse.y          |  4 +++-
include/automount.h            |  1 +
include/defaults.h             |  2 ++
lib/defaults.c                 | 12 ++++++++++++
man/autofs.conf.5.in           |  6 ++++++
redhat/autofs.conf.default.in  |  5 +++++
samples/autofs.conf.default.in |  5 +++++
10 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/daemon/automount.c b/daemon/automount.c
index e703ec2..622b004 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -66,6 +66,7 @@ static char *pid_file = NULL;		/* File in which to keep pid */
 unsigned int global_selection_options;
 
 long global_negative_timeout = -1;
+long global_positive_timeout = -1;
 int do_force_unlink = 0;		/* Forceably unlink mount tree at startup */
 
 static int start_pipefd[2] = {-1, -1};
@@ -2011,6 +2012,8 @@ static void usage(void)
 		"			dump automounter maps and exit\n"
 		"	-n --negative-timeout n\n"
 		"			set the timeout for failed key lookups.\n"
+		"	-P --positive-timeout n\n"
+		"			set the positive timeout for key lookups.\n"
 		"	-O --global-options\n"
 		"			specify global mount options\n"
 		"	-l --set-log-priority priority path [path,...]\n"
@@ -2269,7 +2272,7 @@ int main(int argc, char *argv[])
 	time_t timeout;
 	time_t age = monotonic_time(NULL);
 	struct rlimit rlim;
-	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFUM:";
+	const char *options = "+hp:t:vmdD:SfVrO:l:n:P:CFUM:";
 	static const struct option long_options[] = {
 		{"help", 0, 0, 'h'},
 		{"pid-file", 1, 0, 'p'},
@@ -2281,6 +2284,7 @@ int main(int argc, char *argv[])
 		{"foreground", 0, 0, 'f'},
 		{"random-multimount-selection", 0, 0, 'r'},
 		{"negative-timeout", 1, 0, 'n'},
+		{"positive-timeout", 1, 0, 'P'},
 		{"dumpmaps", 0, 0, 'm'},
 		{"global-options", 1, 0, 'O'},
 		{"version", 0, 0, 'V'},
@@ -2369,6 +2373,10 @@ int main(int argc, char *argv[])
 			global_negative_timeout = getnumopt(optarg, opt);
 			break;
 
+		case 'P':
+			global_positive_timeout = getnumopt(optarg, opt);
+			break;
+
 		case 'm':
 			flags |= DAEMON_FLAGS_DUMP_MAPS;
 			break;
diff --git a/daemon/lookup.c b/daemon/lookup.c
index 2fea0c0..1903e0a 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -25,6 +25,8 @@
 #include "automount.h"
 #include "nsswitch.h"
 
+extern long global_positive_timeout;
+
 static void nsslist_cleanup(void *arg)
 {
 	struct list_head *nsslist = (struct list_head *) arg;
@@ -1362,11 +1364,11 @@ void lookup_prune_one_cache(struct autofs_point *ap, struct mapent_cache *mc, ti
 
 			/* If the map hasn't been read (nobrowse
 			 * indirect mounts) then keep cached entries
-			 * for POSITIVE_TIMEOUT.
+			 * for ap->positive_timeout.
 			 */
 			if (!(ap->flags & (MOUNT_FLAG_GHOST |
 					   MOUNT_FLAG_AMD_CACHE_ALL))) {
-				time_t until = me->age + POSITIVE_TIMEOUT;
+				time_t until = me->age + ap->positive_timeout;
 				if ((long) age - (long) until < 0) {
 					me = cache_enumerate(mc, me);
 					continue;
diff --git a/daemon/master.c b/daemon/master.c
index da527a6..bdb4fba 100644
--- a/daemon/master.c
+++ b/daemon/master.c
@@ -32,6 +32,7 @@ struct master *master_list = NULL;
 
 extern const char *global_options;
 extern long global_negative_timeout;
+extern long global_positive_timeout;
 
 /* Attribute to create a joinable thread */
 extern pthread_attr_t th_attr;
@@ -94,11 +95,16 @@ int master_add_autofs_point(struct master_mapent *entry, unsigned logopt,
 	/*
 	 * Program command line option overrides config.
 	 * We can't use 0 negative timeout so use default.
+	 * We can't use <0 positive timeout so use default.
 	 */
 	if (global_negative_timeout <= 0)
 		ap->negative_timeout = defaults_get_negative_timeout();
 	else
 		ap->negative_timeout = global_negative_timeout;
+	if (global_positive_timeout < 0)
+		ap->positive_timeout = defaults_get_positive_timeout();
+	else
+		ap->positive_timeout = global_positive_timeout;
 	ap->exp_timeout = defaults_get_timeout();
 	ap->exp_runfreq = 0;
 	ap->flags = 0;
diff --git a/daemon/master_parse.y b/daemon/master_parse.y
index 08e44b5..0a0b1af 100644
--- a/daemon/master_parse.y
+++ b/daemon/master_parse.y
@@ -57,6 +57,7 @@ static char *type;
 static char *format;
 static long timeout;
 static long negative_timeout;
+static long positive_timeout;
 static unsigned symlnk;
 static unsigned strictexpire;
 static unsigned nobind;
@@ -110,7 +111,7 @@ static int master_fprintf(FILE *, char *, ...);
 
 %token COMMENT
 %token MAP
-%token OPT_TIMEOUT OPT_NTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VERBOSE
+%token OPT_TIMEOUT OPT_NTIMEOUT OPT_PTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VERBOSE
 %token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK OPT_MODE
 %token OPT_STRICTEXPIRE OPT_SHARED OPT_SLAVE OPT_PRIVATE
 %token COLON COMMA NL DDASH
@@ -627,6 +628,7 @@ option: daemon_option
 
 daemon_option: OPT_TIMEOUT NUMBER { timeout = $2; }
 	| OPT_NTIMEOUT NUMBER { negative_timeout = $2; }
+	| OPT_PTIMEOUT NUMBER { positive_timeout = $2; }
 	| OPT_SYMLINK	{ symlnk = 1; }
 	| OPT_STRICTEXPIRE { strictexpire = 1; }
 	| OPT_SHARED	{ propagation = PROPAGATION_SHARED; }
diff --git a/include/automount.h b/include/automount.h
index 1ae4078..66eae4f 100644
--- a/include/automount.h
+++ b/include/automount.h
@@ -560,6 +560,7 @@ struct autofs_point {
 	time_t exp_timeout;		/* Indirect mount expire timeout */
 	time_t exp_runfreq;		/* Frequency for polling for timeouts */
 	time_t negative_timeout;	/* timeout in secs for failed mounts */
+	time_t positive_timeout;	/* timeout in secs for using cache for map entries */
 	unsigned int flags;		/* autofs mount flags */
 	unsigned int logopt;		/* Per map logging */
 	pthread_t exp_thread;		/* Thread that is expiring */
diff --git a/include/defaults.h b/include/defaults.h
index 69263bf..a9db04e 100644
--- a/include/defaults.h
+++ b/include/defaults.h
@@ -27,6 +27,7 @@
 #define DEFAULT_TIMEOUT			"600"
 #define DEFAULT_MASTER_WAIT		"10"
 #define DEFAULT_NEGATIVE_TIMEOUT	"60"
+#define DEFAULT_POSITIVE_TIMEOUT	"120"
 #define DEFAULT_MOUNT_VERBOSE		"0"
 #define DEFAULT_MOUNT_WAIT		"-1"
 #define DEFAULT_UMOUNT_WAIT		"12"
@@ -160,6 +161,7 @@ int defaults_master_set(void);
 unsigned int defaults_get_timeout(void);
 int defaults_get_master_wait(void);
 unsigned int defaults_get_negative_timeout(void);
+unsigned int defaults_get_positive_timeout(void);
 unsigned int defaults_get_browse_mode(void);
 unsigned int defaults_get_logging(void);
 unsigned int defaults_force_std_prog_map_env(void);
diff --git a/lib/defaults.c b/lib/defaults.c
index 25ddaa2..062f156 100644
--- a/lib/defaults.c
+++ b/lib/defaults.c
@@ -50,6 +50,7 @@
 #define NAME_TIMEOUT			"timeout"
 #define NAME_MASTER_WAIT		"master_wait"
 #define NAME_NEGATIVE_TIMEOUT		"negative_timeout"
+#define NAME_POSITIVE_TIMEOUT		"positive_timeout"
 #define NAME_BROWSE_MODE		"browse_mode"
 #define NAME_LOGGING			"logging"
 #define NAME_FORCE_STD_PROG_MAP_ENV	"force_standard_program_map_env"
@@ -1703,6 +1704,17 @@ unsigned int defaults_get_negative_timeout(void)
 	return (unsigned int) n_timeout;
 }
 
+unsigned int defaults_get_positive_timeout(void)
+{
+	long p_timeout;
+
+	p_timeout = conf_get_number(autofs_gbl_sec, NAME_POSITIVE_TIMEOUT);
+	if (p_timeout <= 0)
+		p_timeout = atol(DEFAULT_POSITIVE_TIMEOUT);
+
+	return (unsigned int) p_timeout;
+}
+
 unsigned int defaults_get_browse_mode(void)
 {
 	int res;
diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
index 71041e2..4e42345 100644
--- a/man/autofs.conf.5.in
+++ b/man/autofs.conf.5.in
@@ -43,6 +43,12 @@ Set the default timeout for caching failed key lookups (program default
 60). If the equivalent command line option is given it will override this
 setting.
 .TP
+.B positive_timeout
+.br
+Set the default timeout for using cached map entries (program default
+120). If the equivalent command line option is given it will override this
+setting.
+.TP
 .B mount_verbose
 .br
 Use the verbose flag when spawning mount(8), and log some process info
diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
index 7595b3d..9cca906 100644
--- a/redhat/autofs.conf.default.in
+++ b/redhat/autofs.conf.default.in
@@ -29,6 +29,11 @@ timeout = 300
 #
 #negative_timeout = 60
 #
+# positive_timeout - set the default positive timeout for
+# 		     using cached map entries (default 120).
+#
+#positive_timeout = 120
+#
 # mount_verbose - use the -v flag when calling mount(8) and log some
 #		  process information about the requestor and its
 #		  parent.
diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
index 7077683..d8bcc5a 100644
--- a/samples/autofs.conf.default.in
+++ b/samples/autofs.conf.default.in
@@ -29,6 +29,11 @@ timeout = 300
 #
 #negative_timeout = 60
 #
+# positive_timeout - set the default positive timeout for
+# 		     using cached map entries (default 120).
+#
+#positive_timeout = 120
+#
 # mount_verbose - use the -v flag when calling mount(8) and log some
 #		  process information about the requestor and its
 #		  parent

