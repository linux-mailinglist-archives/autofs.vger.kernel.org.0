Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60ECE58D87B
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243032AbiHIL5U (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243047AbiHIL5S (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:57:18 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B7524958
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:57:17 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id qn6so9949431ejc.11
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vQ9L5yx38lyFC5+N7Ob7ZIluwOIK6rPkPEHcxr6/X4g=;
        b=qZNelyh3DD3ghXVabqLPA4iBPSku+g+/OXnqalfABb2oM6hG0HnMnnT70v3JltOuUL
         oam/y6xY0W3N7KuEbUBMwa8qZT5o1jpTLlLerEB13SSCfKbxpkq7mniff8PjNGRjLK11
         jwXTVShEoInL/uthq+oiaY0f/uAKcxzqiHYLBErrJMsTQmcK7kLHmcaGd42I2Hd/vEsl
         gnFdcE2u0cV2dcMU205GPFE0BNXsnhu7XGr6ikiX4eZA1VP2dA1YhrtStbtOOHpc1suz
         ld54BvXQduZ3+wWF7larqIvVat58YSyQyiLrnAl4NKIlXz1bUa7fe6dPb42FEXz4SCoY
         CbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vQ9L5yx38lyFC5+N7Ob7ZIluwOIK6rPkPEHcxr6/X4g=;
        b=VnOLyh7nOPRetymPjp6ID2Jkl9wT9grSrMprvo6ehVGs2F4ytwDsAFyTKJGfHhmz5o
         71u9Ma7md7B9b84c7VPMIDeBtHBaPetUBSU3jxaGmPL+KrkDpe8Qq5bbJID0yOaPAlvO
         oMrXQ24OVATkB7WnlZGLFEmqettnd9WhRHeSh4SgOmU/EhDTIhLPC/4G+YUM9hpK7YW+
         RsFOAzSBryP1z1lcfuNPwqkCwpnaa5jRjA2ifpwWRTe0WW+4uWX5OZP5UOkg/TFqwRLN
         7OLX7trb+z7KER3mbCnKri++aKK/19PED7jijNsglj8PO1UAK6nLEfCEGNbqoICEg/qm
         pgFQ==
X-Gm-Message-State: ACgBeo0tSWZZcTcqnffeiJAymOZ+s5fI6hGXZOXGReXoPCFkY476gudH
        sNuCxQnm98oziGSsar44xprCc7El5gIk
X-Google-Smtp-Source: AA6agR6oO8w3BshXGx/ULkgDz6CjLHJY2+ozsnrsH5Qt8QpTrmBSz3//QvK0uO6OWj6TU8nk2b67/Q==
X-Received: by 2002:a17:907:a0c6:b0:731:87ce:5289 with SMTP id hw6-20020a170907a0c600b0073187ce5289mr2961456ejc.465.1660046236018;
        Tue, 09 Aug 2022 04:57:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id hb9-20020a170906b88900b0072b85a735afsm1039994ejb.113.2022.08.09.04.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:57:15 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 3/4] autofs-5.1.8 - internal SASL logging only in debug log mode
Date:   Tue,  9 Aug 2022 13:57:09 +0200
Message-Id: <20220809115710.108512-4-reimth@gmail.com>
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
 modules/cyrus-sasl.c | 17 +++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

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
index 8984f0f..9059b54 100644
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
@@ -1243,6 +1250,7 @@ static void sasl_mutex_dispose(void *mutex __attribute__((unused)))
  */
 int autofs_sasl_client_init(unsigned logopt)
 {
+	int result;
 
 	sasl_set_mutex(sasl_mutex_new,
 		       sasl_mutex_lock,
@@ -1250,7 +1258,12 @@ int autofs_sasl_client_init(unsigned logopt)
 		       sasl_mutex_dispose);
 
 	/* Start up Cyrus SASL--only needs to be done at library load. */
-	if (sasl_client_init(callbacks) != SASL_OK) {
+	if (have_log_debug()) {
+		result = sasl_client_init(debug_callbacks);
+	} else {
+		result = sasl_client_init(callbacks);
+	}
+	if (result != SASL_OK) {
 		error(logopt, "sasl_client_init failed");
 		return 0;
 	}
-- 
2.37.1

