Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C5D5914AB
	for <lists+autofs@lfdr.de>; Fri, 12 Aug 2022 19:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238796AbiHLROt (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 12 Aug 2022 13:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbiHLROt (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 12 Aug 2022 13:14:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893BFB1BA1
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 10:14:47 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t5so2092399edc.11
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xA8xWTPNqOvNwdRenR6zie/wYMWA3xv0eY4XlWlfO4o=;
        b=dIdZMhu35TMrki5DRR6vMrddKti8dbEI3qxM3frfJgETxWqHZgehgRhZrIThuGUoFY
         xW66WngbuZP+wsdZkNTMG8bBfxIz3ZjydC59IcZvqrDawbP5RDM1AsZITibcJU3O70Hr
         9jUE5vkvrRE5vvZqvZxkCVXl5P+Gvxc2klFP6NJhIIEbof9Dmlwaa5RIkAdYZlbjJyDr
         SJlX6kbvzn4y47Gs7zissd3ZBz24zO2brgorUWCike0zrK88Pk05IhjIIS11ran0HLiI
         EWTMooSSI6DxZdeFP4fdOk5/i/A3c+BgNjlo/GMb5g93Fj2MkCJbpcFKCkYngNeK1Di8
         xp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xA8xWTPNqOvNwdRenR6zie/wYMWA3xv0eY4XlWlfO4o=;
        b=rKfnZ7PMIWGzR5cU38qEAAMd+CH5sovlnqgMabqChsAF1OdLhQUjAUMYfwO7EzbTnC
         gdzEWXzJrZgrysG7r8yO7AQtEvzm1MFvfw4R/IX/wX3Wj9MKRFgieDL1lkBBwf4vLu/v
         MfW6wzSSL9AC1dBxgQHtw+DlwKlrhNwHK0Wjfz9Mwk3/G6tHnrqoIQwQIQgkbz5HXiZI
         QsFd6c80+rFoS++SmGpVGzRViz6koo4doNBO8aFnN+oClXtzS5xQJYNxK8+recy2SIM3
         X0mi3ROp6PMuZmjS39klHsa3Hk6lvATEDE6OX0dQVd96r+v5mMzzzy5eEjkVkNmnpyUS
         T5Lg==
X-Gm-Message-State: ACgBeo3IKoAzckkMRmc6ECZurBpADoHWY9OWYq8u/vty9BWfmQv6FUNW
        FHomYFOrEhzrXndQgZuOx5K2MF4wc0OP
X-Google-Smtp-Source: AA6agR5pBnsb6s8ZWuRa1ZJi0SquK3Jx0sQsPUAlzgyk7g6ESVJ7xdPGZ58CBwcjrTdOfyvqyeT6Qw==
X-Received: by 2002:a05:6402:2741:b0:434:fe8a:1f96 with SMTP id z1-20020a056402274100b00434fe8a1f96mr4548952edd.331.1660324486148;
        Fri, 12 Aug 2022 10:14:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-182-183-173.77.182.pool.telefonica.de. [77.182.183.173])
        by smtp.gmail.com with ESMTPSA id r30-20020a50d69e000000b0043bbc9503ddsm1616700edi.76.2022.08.12.10.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 10:14:45 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: Re: [PATCH 3/4] autofs-5.1.8 - internal SASL logging only in debug log mode
Date:   Fri, 12 Aug 2022 19:12:46 +0200
Message-Id: <20220812171245.1518395-1-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4d3d7cd0-6a6a-fade-5eaa-457d4a6de0ef@themaw.net>
References: <4d3d7cd0-6a6a-fade-5eaa-457d4a6de0ef@themaw.net>
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

