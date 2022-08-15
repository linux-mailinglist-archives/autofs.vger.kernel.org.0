Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A44F59298C
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiHOGXB (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiHOGW6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:22:58 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757BA1900F
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id qn6so11923260ejc.11
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xA8xWTPNqOvNwdRenR6zie/wYMWA3xv0eY4XlWlfO4o=;
        b=cs2aRcAILhdvtCLfWoCVecthA0hAd93WFYyxM5kXLUsMfKLUocZooNSqgx7u7Vtsu3
         3G/14Er8dizW2R9Wpg/t1FH1/vltPqvNzvURnRx/68jZO3SXbaBfbJJCXYDDIGzwIIKM
         XtYW3Agu2QJEBFYinfpeFM+R0QU6wtRbtubj9V7DrNGJ3AO28tfEMNctykzQhdWuUCtG
         xJO9etGq6bquH/gpnvojgx3lq86CBZ2Z7fyG4fD6n9jSL9z3IwMzbFEAfkafOPgsXblE
         2oWgwHBedDeT5kouRF627Gv8Y6eESQxWd/gyETaXgK8toKzImrlCF7vqs3kl326iYJFU
         /QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xA8xWTPNqOvNwdRenR6zie/wYMWA3xv0eY4XlWlfO4o=;
        b=ytYJ/CysbzZcRgKwjQgP6Uy9nL+xhtVw9i9ogzVK/F64J82amTL9QgPuIwRB/2x0ZZ
         1gb1WrKHAQYbjsgtfF9VN7vIshlNsEfAr77Oqug6QQKZ9f5nEEOLvIEClKNwJwWbBGQq
         R1LI5i39PXzOJaGGXxIWbc84NnCJoAzhH4bpDQbViozf2kb9ro1CvW+oa5pZXRP4xAEL
         kfFHTxCYwR81n63je+0LGoU1VYPblgiSYMalaGI/4pDCt3FaFnezV0NN47mHnRwl3UWp
         tA/C2L7x0D7IP+V+kTuT7T0J1vgd+CDIOCQiqrPpRhvt4PrWzpnMU0CSHfzOokg6OUpE
         AKqA==
X-Gm-Message-State: ACgBeo2ijQt/ThGXgNyDClUQEPGzcu7R9LnCbP9IjThgoWUdpwl/brL5
        ixygalZMiv59kf4JlvR/10oqC0VFScOX
X-Google-Smtp-Source: AA6agR7CnQ6Ai08VHX4ZKhFB6xEd7T1ojrzP/sEwF0ia/tdMyHQtAgZEbqNgOP8FnRM00NAuZ+6/Dg==
X-Received: by 2002:a17:907:7619:b0:730:d709:a2f0 with SMTP id jx25-20020a170907761900b00730d709a2f0mr9662901ejc.673.1660544575045;
        Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id fu18-20020a170907b01200b007308bdef04bsm3662838ejc.103.2022.08.14.23.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:22:54 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 3/4] autofs-5.1.8 - internal SASL logging only in debug log mode
Date:   Mon, 15 Aug 2022 08:22:44 +0200
Message-Id: <20220815062245.1719099-4-reimth@gmail.com>
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

Cyrus SASL library is known for useless error notifications of internal
events that can and will be easily handled by the applications. By default
automounter provides a logging callback to the SASL library, which displays
annoying SASL error messages to users for internal library issues that do
not harm SASL authentication operation.

OpenLDAP only provides a logging callback to SASL library for its server
application. Client side applications won't see any internal SASL
notifcations.

Choose a compromise and provide SASL internal logging messages only if user
requests debug logging mode.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 include/log.h        |  2 ++
 lib/log.c            | 10 ++++++++++
 modules/cyrus-sasl.c | 16 ++++++++++++++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/log.h b/include/log.h
index 3ec8f0c..f073300 100644
--- a/include/log.h
+++ b/include/log.h
@@ -37,6 +37,8 @@ extern void set_log_verbose_ap(struct autofs_point *ap);
 extern void set_log_debug_ap(struct autofs_point *ap);
 extern void set_mnt_logging(unsigned global_logopt);
 
+extern unsigned int have_log_verbose(void);
+extern unsigned int have_log_debug(void);
 extern int get_log_debug_level(void);
 
 extern void open_log(void);
diff --git a/lib/log.c b/lib/log.c
index 9567460..1c5b3da 100644
--- a/lib/log.c
+++ b/lib/log.c
@@ -58,6 +58,16 @@ static char *prepare_attempt_prefix(const char *msg)
 	return prefixed_msg;
 }
 
+unsigned int have_log_verbose(void)
+{
+	return do_verbose;
+}
+
+unsigned int have_log_debug(void)
+{
+	return do_debug;
+}
+
 int get_log_debug_level(void)
 {
 	return debug_level;
diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index 4806734..358813a 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -109,6 +109,13 @@ static int getpass_func(sasl_conn_t *, void *, int, sasl_secret_t **);
 static int getuser_func(void *, int, const char **, unsigned *);
 
 static sasl_callback_t callbacks[] = {
+	{ SASL_CB_USER, &getuser_func, NULL },
+	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
+	{ SASL_CB_PASS, &getpass_func, NULL },
+	{ SASL_CB_LIST_END, NULL, NULL },
+};
+
+static sasl_callback_t debug_callbacks[] = {
 	{ SASL_CB_LOG, &sasl_log_func, NULL },
 	{ SASL_CB_USER, &getuser_func, NULL },
 	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
@@ -136,7 +143,7 @@ sasl_log_func(void *context, int level, const char *message)
 	case SASL_LOG_DEBUG:
 	case SASL_LOG_TRACE:
 	case SASL_LOG_PASS:
-		debug(LOGOPT_NONE, "%s", message);
+		log_debug(LOGOPT_NONE, "libsasl2: %s", message);
 		break;
 	default:
 		break;
@@ -1090,6 +1097,7 @@ static void sasl_mutex_dispose(void *mutex __attribute__((unused)))
  */
 int autofs_sasl_client_init(unsigned logopt)
 {
+	int result;
 
 	sasl_set_mutex(sasl_mutex_new,
 		       sasl_mutex_lock,
@@ -1097,7 +1105,11 @@ int autofs_sasl_client_init(unsigned logopt)
 		       sasl_mutex_dispose);
 
 	/* Start up Cyrus SASL--only needs to be done at library load. */
-	if (sasl_client_init(callbacks) != SASL_OK) {
+	if (have_log_debug())
+		result = sasl_client_init(debug_callbacks);
+	else
+		result = sasl_client_init(callbacks);
+	if (result != SASL_OK) {
 		error(logopt, "sasl_client_init failed");
 		return 0;
 	}
-- 
2.37.1

