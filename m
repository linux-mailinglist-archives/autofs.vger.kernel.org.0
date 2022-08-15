Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E979859298B
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiHOGW7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiHOGW4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:22:56 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890E5193C2
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id kb8so11988042ejc.4
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0SkoTjEu9rloaAJiSauLwlpv5k0YqRawOgR6xWdQKzU=;
        b=WgE/pDpUS08ODF26OVrMuZfzALMeBP67+B8WK1CstgVG61GYYo8H+P7O79qK/K4Q61
         moMZki8JC8S6pGBt9CMngG7QIu0ATGg5qIJur4sPMAayN3dwvcwFfDnyyjPdAZW3vQ3G
         F0COtTdHuLPcQChuZLQjxbBbKyYZT8xYqCsT4FzbS572I6nC+qbRmq5eZJg4+Bs18X1u
         9/cz3eMBvQvrbzKVHmJ1FSEsNQzFv789Q6nldTSYSNKC4mpzyD8nHyCkuhnVtKuLolPQ
         LpCzN6fLzls+O3p1AQb1w8McM7C3/bgRZSS1yKBltuRQggxSoPKmXlBe1ZSS5vJzzREL
         r8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0SkoTjEu9rloaAJiSauLwlpv5k0YqRawOgR6xWdQKzU=;
        b=C9s5ZyGWuA6AFV26zblWs9QKrWHE5znD+4yU8/XvCpTJFb4pJ9efnfw95VZg90BQob
         wykb8okqDnUIqMt7wnTtlVmJQurQqRxmFBwYBM9Pl+BrmqqMK53dNTJ/NbUFG7H2tiEC
         tOkc0ILgIAt5tsbcHijeXiT1+Ro/KEoKMGFO5u9uK8WlS6kQhVNo8sOZG6eBIq/pAtLH
         IMTl+9bbjGyinEqTw81isxQlzAMeZh83phiZ4vFXrn3616HIR7oubtOer6B8gO6Btc2P
         nFcpTQTKnw7iXzoE2aXizuEHXNjbS47YyYxfISCCwZL4NY4r8MpdC9gDSeAbrJBKcJgs
         7tZw==
X-Gm-Message-State: ACgBeo3kQT0wCMQJLKz5STH2npciCha/C2fdti0Rchp23VwqMKqfHhNu
        MBsx7AWoKqKbBhKLCIIBhbTVMjPLCxql
X-Google-Smtp-Source: AA6agR54LwAwcSkhgQh8i4OQcRQoBHL+LFyrMBBh2qiEnA1yO2HGeJ6xLsfJHQV1puz5DGx6lxG/VA==
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id ww10-20020a170907084a00b0073307352b1amr9725711ejb.290.1660544573562;
        Sun, 14 Aug 2022 23:22:53 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id fu18-20020a170907b01200b007308bdef04bsm3662838ejc.103.2022.08.14.23.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:22:53 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 1/4] autofs-5.1.8 - improve debug logging of LDAP binds
Date:   Mon, 15 Aug 2022 08:22:42 +0200
Message-Id: <20220815062245.1719099-2-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815062245.1719099-1-reimth@gmail.com>
References: <20220815062245.1719099-1-reimth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Thomas Reim <reimth@gmail.com>

automounter only provides very limited debug information when binding
using OpenLDAP. LDAP based directory services currently all increase
communication security, which makes it difficult for system administrators
to find the root cause of failed authentication binds.

Allow users to switch on and configure debug logging for OpenLDAP client
used by automount.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 daemon/automount.c    | 31 ++++++++++++++++++++++++++-----
 include/log.h         |  4 +++-
 lib/log.c             |  9 ++++++++-
 man/automount.8       |  9 +++++++--
 modules/lookup_ldap.c | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/daemon/automount.c b/daemon/automount.c
index 32f95a5..ce79078 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -1413,6 +1413,21 @@ static unsigned long getnumopt(char *str, char option)
 	return val;
 }
 
+static long getsnumopt(char *str, char option)
+{
+	long val;
+	char *end;
+
+	val = strtol(str, &end, 0);
+	if (!*str || *end) {
+		fprintf(stderr,
+			"%s: option -%c requires a numeric argument, got %s\n",
+			program, option, str);
+		exit(1);
+	}
+	return val;
+}
+
 static void do_master_cleanup_unlock(void *arg)
 {
 	int status;
@@ -2017,7 +2032,9 @@ static void usage(void)
 	        "			maximum wait time (seconds) for master\n"
 	        "			map to become available\n"
 		"	-v --verbose	be verbose\n"
-		"	-d --debug	log debuging info\n"
+		"	-d[level]\n"
+		"	--debug[=level]\n"
+		"			log debugging info\n"
 		"	-Dvariable=value, --define variable=value\n"
 		"			define global macro variable\n"
 		"	-S --systemd-service\n"
@@ -2282,18 +2299,19 @@ int main(int argc, char *argv[])
 	int logpri = -1;
 	unsigned int flags;
 	unsigned int logging;
+	int debug_level = 0;
 	unsigned master_read;
 	int master_wait;
 	time_t timeout;
 	time_t age = monotonic_time(NULL);
 	struct rlimit rlim;
-	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFUM:";
+	const char *options = "+hp:t:vmd::D:SfVrO:l:n:CFUM:";
 	static const struct option long_options[] = {
 		{"help", 0, 0, 'h'},
 		{"pid-file", 1, 0, 'p'},
 		{"timeout", 1, 0, 't'},
 		{"verbose", 0, 0, 'v'},
-		{"debug", 0, 0, 'd'},
+		{"debug", 2, 0, 'd'},
 		{"define", 1, 0, 'D'},
 		{"systemd-service", 0, 0, 'S'},
 		{"foreground", 0, 0, 'f'},
@@ -2363,6 +2381,8 @@ int main(int argc, char *argv[])
 
 		case 'd':
 			logging |= LOGOPT_DEBUG;
+			if (optarg)
+				debug_level = getsnumopt(optarg, opt);
 			break;
 
 		case 'D':
@@ -2439,7 +2459,8 @@ int main(int argc, char *argv[])
 
 		case '?':
 		case ':':
-			printf("%s: Ambiguous or unknown options\n", program);
+			fprintf(stderr, "%s: Ambiguous or unknown options\n", program);
+			fprintf(stderr, "Try `%s --help` for more information\n", program);
 			exit(1);
 		}
 	}
@@ -2448,7 +2469,7 @@ int main(int argc, char *argv[])
 		set_log_verbose();
 
 	if (logging & LOGOPT_DEBUG)
-		set_log_debug();
+		set_log_debug(debug_level);
 
 	if (geteuid() != 0) {
 		fprintf(stderr, "%s: this program must be run by root.\n",
diff --git a/include/log.h b/include/log.h
index a7b09f9..3ec8f0c 100644
--- a/include/log.h
+++ b/include/log.h
@@ -31,12 +31,14 @@ struct autofs_point;
 
 extern void set_log_norm(void);
 extern void set_log_verbose(void);
-extern void set_log_debug(void);
+extern void set_log_debug(int level);
 extern void set_log_norm_ap(struct autofs_point *ap);
 extern void set_log_verbose_ap(struct autofs_point *ap);
 extern void set_log_debug_ap(struct autofs_point *ap);
 extern void set_mnt_logging(unsigned global_logopt);
 
+extern int get_log_debug_level(void);
+
 extern void open_log(void);
 extern void log_to_stderr(void);
  
diff --git a/lib/log.c b/lib/log.c
index 43eccc0..9567460 100644
--- a/lib/log.c
+++ b/lib/log.c
@@ -31,6 +31,7 @@ static unsigned int logging_to_syslog = 0;
 /* log notification level */
 static unsigned int do_verbose = 0;		/* Verbose feedback option */
 static unsigned int do_debug = 0;		/* Full debug output */
+static unsigned int debug_level = 0;		/* Level for libldap debug output */
 
 static char *prepare_attempt_prefix(const char *msg)
 {
@@ -57,6 +58,11 @@ static char *prepare_attempt_prefix(const char *msg)
 	return prefixed_msg;
 }
 
+int get_log_debug_level(void)
+{
+	return debug_level;
+}
+
 void set_log_norm(void)
 {
 	do_verbose = 0;
@@ -70,9 +76,10 @@ void set_log_verbose(void)
 	return;
 }
 
-void set_log_debug(void)
+void set_log_debug(int level)
 {
 	do_debug = 1;
+	debug_level = level;
 	return;
 }
 
diff --git a/man/automount.8 b/man/automount.8
index 1061c9d..2d2b56f 100644
--- a/man/automount.8
+++ b/man/automount.8
@@ -48,9 +48,14 @@ Set the default timeout for caching failed key lookups. The default is 60 second
 Enables logging of general status and progress messages for all
 autofs managed mounts.
 .TP
-.I "\-d, \-\-debug"
+\fB\-d\fR[\fILEVEL\fR], \fB\-\-debug\fR[=\fILEVEL\fR]
 Enables logging of general status and progress messages as well as
-debugging messages for all autofs managed mounts.
+debugging messages for all autofs managed mounts. The default \fILEVEL\fR is 0.
+automounter must perform OpenLDAP authenticated binds for optional argument
+\fILEVEL\fR to have any effect. OpenLDAP uses a bitmap to enable debugging for
+specific components. Debug \fILEVEL\fR=0 disables libldap deugging.
+For further details see
+.BR slapd (8).
 .TP
 .I "\-Dvariable=value, --define variable=value"
 Define a global macro substitution variable. Global definitions
diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index 3e43fc0..c174426 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -155,6 +155,18 @@ int ldap_parse_page_control(LDAP *ldap, LDAPControl **controls,
 }
 #endif /* HAVE_LDAP_PARSE_PAGE_CONTROL */
 
+static void autofs_ldap_debug(const char *buf)
+{
+	char *msg;
+
+	if (buf) {
+		msg = strdup(buf);
+		msg[strcspn(msg, "\n")] = '\0';
+		log_debug(LOGOPT_DEBUG, "libldap: %s", msg);
+		free(msg);
+	}
+}
+
 static void ldapinit_mutex_lock(void)
 {
 	int status = pthread_mutex_lock(&ldapinit_mutex);
@@ -257,11 +269,36 @@ LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct lookup_conte
 	LDAP *ldap = NULL;
 	struct timeval timeout     = { ctxt->timeout, 0 };
 	struct timeval net_timeout = { ctxt->network_timeout, 0 };
+	int ldap_library_debug_level;
 	int rv;
 
 	ctxt->version = 3;
 
+	ldap_library_debug_level = get_log_debug_level();
+	if (ldap_library_debug_level == -1 || ldap_library_debug_level > 0) {
+		rv = ber_set_option(NULL, LBER_OPT_DEBUG_LEVEL,
+		                    &ldap_library_debug_level);
+		if (rv != LBER_OPT_SUCCESS)
+			info(logopt, MODPREFIX
+			     "failed to set LBER debug level to %d, ignored",
+			     ldap_library_debug_level);
+		rv = ber_set_option(NULL, LBER_OPT_LOG_PRINT_FN,
+		                    autofs_ldap_debug);
+		if (rv != LBER_OPT_SUCCESS)
+			info(logopt, MODPREFIX
+			     "Failed to set LBER_OPT_LOG_PRINT_FN, ignored");
+		rv = ldap_set_option(NULL, LDAP_OPT_DEBUG_LEVEL,
+		                     &ldap_library_debug_level);
+		if (rv != LDAP_OPT_SUCCESS)
+			info(logopt, MODPREFIX
+			     "failed to set LDAP debug level to %d, ignored",
+			     ldap_library_debug_level);
+	}
+
 	/* Initialize the LDAP context. */
+	debug(logopt, MODPREFIX
+	      "ldap_initialize( %s )",
+	      uri ? uri : "default");
 	rv = ldap_initialize(&ldap, uri);
 	if (rv != LDAP_OPT_SUCCESS) {
 		info(logopt, MODPREFIX
-- 
2.37.1

