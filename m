Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F154B58D87A
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243022AbiHIL5U (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbiHIL5S (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:57:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E885924BD0
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:57:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z20so12865151edb.9
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=W9cLkPmnv59hkUmcmNvZMVP9S4Ws8rL04Lu9lbAt71c=;
        b=EecITYgtrHgt8gJDgntEtt0DJf+aOciFEVbQkeSdaBEsHS23FuMQr7ARPEHHzxQtKW
         jzufddZnwNqeLVNPEHa8iCVKx0JeAddVkv5IcilFsTQU6T5IedTTOi6Rx3K7nvmAb/nR
         aVogi1ptTDIl/rXaF3sauc5hJvpNy1XPFpSglBahtqkz+8aTFFraMpUKmKwUvDJRSJfZ
         uwPpu24Goo59CnqM17WoQV9NKab+wyHhQGa2+yN+H5KAxpitEOB+VWO8Nrdj7jAEZtHe
         jnqBPKJkYWrd6yik2+d86eZ1+2pQ7ds748KmuMvFuFyGJp/P2bz1JSDp6flwN16sjHQN
         EjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=W9cLkPmnv59hkUmcmNvZMVP9S4Ws8rL04Lu9lbAt71c=;
        b=3A1sfPXmwPRbyZ8S0pGJWO0DTbo65Bu3Dd2/HAgFD+MKfE7AR1F5pFv9uJLDWhCe0W
         m0+ULVZb6dQkl2of7RIJsEZBu0qF3mviXzdJmHzO6B5EVKLEgt4WcGYhq/kTLfolbIrJ
         1ljHFnC/ZtSEog/vem4PDQY+lMlVPpAAXWatLNMfvsruEjbU7dNc4woD+YBmK7RiLMwN
         w3BBk/7SCxIMIQkPIOLzV6osQq+QR7WA+0aA8mZHH02ttVRwDtHo3I7nmjekc2PuiOFE
         bZ8DY5SpTC/kkoZ1PPadjbdy35i0zxbW9iEOOCtg+Zqawa0aHqGeQ2I7CMdH/2N6AS7T
         Y7jQ==
X-Gm-Message-State: ACgBeo1Jlw4rCrgqIzbsPrGtNMQy8+Yr9/hTVq2FSMEPGsOjHLBj58bO
        TdXKZjW7PJqRxZHoI4Nacd28GbpfohZi
X-Google-Smtp-Source: AA6agR5g8tmGVRhyfsFRVkRmpalvSYqwykIGePAlo6w/HLfgXI2Qpxoo25x3Ylp6Js/jc9C/xnp2LA==
X-Received: by 2002:a05:6402:26d0:b0:43d:6f63:e6b with SMTP id x16-20020a05640226d000b0043d6f630e6bmr21962216edd.61.1660046235412;
        Tue, 09 Aug 2022 04:57:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id hb9-20020a170906b88900b0072b85a735afsm1039994ejb.113.2022.08.09.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:57:15 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 2/4] autofs-5.1.8 - improve debug logging of SASL binds
Date:   Tue,  9 Aug 2022 13:57:08 +0200
Message-Id: <20220809115710.108512-3-reimth@gmail.com>
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
using Cyrus SASL. LDAP based directory services currently all increase
communication security, which makes it difficult for system administrators
to find the root cause of failed authentication binds.

Log Cyrus SASL binding parameters and result.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 modules/cyrus-sasl.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index 3736d12..8984f0f 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -136,7 +136,7 @@ sasl_log_func(void *context, int level, const char *message)
 	case SASL_LOG_DEBUG:
 	case SASL_LOG_TRACE:
 	case SASL_LOG_PASS:
-		debug(LOGOPT_DEBUG, "%s", message);
+		debug(LOGOPT_NONE, "%s", message);
 		break;
 	default:
 		break;
@@ -960,6 +960,26 @@ sasl_bind_mech(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt, const c
 	result = do_sasl_bind(logopt, ldap, conn,
 			 &clientout, &clientoutlen, chosen_mech, result);
 	if (result == 0) {
+		/* Conversation was completed successfully by now */
+		char *data;
+		sasl_ssf_t *ssf;
+		result = sasl_getprop(conn, SASL_USERNAME, (const void **)(char *) &data);
+		if (result == SASL_OK && data && *data) {
+			debug(logopt, "SASL username: %s", data);
+		}
+		result = ldap_get_option(ldap, LDAP_OPT_X_SASL_AUTHCID, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data) {
+			debug(logopt, "SASL authcid: %s", data);
+		}
+		result = ldap_get_option(ldap, LDAP_OPT_X_SASL_AUTHZID, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data) {
+			debug(logopt, "SASL authzid: %s", data);
+		}
+		ssf = NULL;
+		result = sasl_getprop(conn, SASL_SSF, (const void **)(char *) &ssf);
+		if (result == SASL_OK) {
+			debug(logopt, "SASL SSF: %lu", (unsigned long) *ssf);
+		}
 		ldap_memfree(host);
 		debug(logopt, "sasl bind with mechanism %s succeeded",
 		      chosen_mech);
-- 
2.37.1

