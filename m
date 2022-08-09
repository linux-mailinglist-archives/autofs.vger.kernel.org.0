Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A140E58D87C
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243045AbiHIL5V (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243036AbiHIL5S (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:57:18 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6966E24BCC
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:57:16 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id y13so21694434ejp.13
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mplgjpNxH82UyyWvNPvXQLuaqoUAoVf2s/BQXoyHR8c=;
        b=UGbPsLkpGYqJDgGR+4WhY74abwg4/P7MVTh2Wm5ILdIQQmZ1+ddL2jqRXpG2y+Wuaw
         YkrWse5NQy5b9StszbCVeDoqGfTS0cTWll2zgkRkFkWZ68+UeqDpA2tv/dmRh2XXRaNY
         x88r8iGMGE06iFVwhtYVj/wVgmD7Qu5ih12zD4lfP64keDxntV9yJHy5F+9czpnId+9i
         STGHDFkje3MJmB/LsJuhjziqAS1C6qYd/lDaZU1FAq8dQPw7VtHxlz+G5/ki+lRL2+EM
         fz/2+gHFX5U+an7rMh906RpUTtRm4ry3S5tN2/SOBHZEhvmbe0Xzxz4QJ4TaSbiGWfJW
         RwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mplgjpNxH82UyyWvNPvXQLuaqoUAoVf2s/BQXoyHR8c=;
        b=AKd26josBtY8/8XTTfNM6rw3SmJTulxE9NNDSG4PikKM2zDUL3Jyg9ZtQDRMGw82jz
         CvcEOBSabfZbTE/WPpTFQ25SLsiXvEUDz5zLusIWIY80imPdH1Hq+kw/mbDjPsyOKMlb
         7gvxb5WKZvYG/OzmR21lk/aZnV1BFr5xYiNxxKyNDtk3nz65XC9QCplHQhm92vZqVg0K
         NMSPkHtC9nSsWlVbUjkbis1D+dFuFUAKkKa/rbQm+OrcPsKf3xNjq8T7SsuUp88o6Ty0
         FGr2eoDNmJJxMPxgzX22Y00uCXh6g+eJGQm7N59YVJj3IMSHSJqbsyQZqq4zv8fUk1Zb
         S5gQ==
X-Gm-Message-State: ACgBeo1oBhS3YRfdAltjHMQhQ+PbPdyLpc9RHyxq/wRcO+DF6PFGJZxM
        V88Ufa1pd/94Y4yOJyBrnyGQEfUwK2aJ
X-Google-Smtp-Source: AA6agR4r884tBlCJZr6mb1DWx0sSGrdSaI2eVuASlpXrXKBZzSSBHz/muAMQ7QGJaaQ+HYhEOjLopg==
X-Received: by 2002:a17:907:6e22:b0:731:152:2504 with SMTP id sd34-20020a1709076e2200b0073101522504mr13253614ejc.545.1660046234760;
        Tue, 09 Aug 2022 04:57:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id hb9-20020a170906b88900b0072b85a735afsm1039994ejb.113.2022.08.09.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:57:14 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 1/4] autofs-5.1.8 - improve debug logging of LDAP binds
Date:   Tue,  9 Aug 2022 13:57:07 +0200
Message-Id: <20220809115710.108512-2-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809115710.108512-1-reimth@gmail.com>
References: <20220809115710.108512-1-reimth@gmail.com>
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
index 14589c3..df9376e 100644
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
@@ -259,11 +271,36 @@ LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct lookup_conte
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

