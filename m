Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9144D5914A0
	for <lists+autofs@lfdr.de>; Fri, 12 Aug 2022 19:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235479AbiHLRJ5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 12 Aug 2022 13:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiHLRJ4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 12 Aug 2022 13:09:56 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4829EB1B8B
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 10:09:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y3so2096090eda.6
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HXnIFSzZ6DI9I91ylRMXmU0MaSGwzKPakSTeWatAA0k=;
        b=jPVbIsl1VG9NmV9UiCysthCiSA4qBX/KMAUQm7XrMVykn5kvqm+QMaxN64v9TtyRU1
         kPkKQ/apim1qCKQjUY9i4Z4Z3zKe67COS+gfK9VwOcUZbN1gORY/L5rFRYoDGCXhjHAG
         hdsTzcpEDTIKiONDtbgn4SWLvz+kSRCiESTSBvpYuNO5+I1C2IuLe0CaElcz9YQBUlRT
         c5CE/hCNQP7VNeB0OH8YBibrEXkcGzRErrHWLQyhWSjYzKdSIrtITZbcv1JGZYBFqxzM
         2UhCEUpz/21L08Zu3u/l9T7IoZZ6CaWrYn6DxbozaN7N72Gqd6h3prrd+7CvI39sEokt
         EU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HXnIFSzZ6DI9I91ylRMXmU0MaSGwzKPakSTeWatAA0k=;
        b=SAgierfZTs33rLaKBA6dKr/q49VjwMbXz++uOZdFYblLwpVz1bGjWmYuxsK4vV+1XM
         NdDkiMRWPj4aMjaQ3HadfZfvmOgmhoD2vnwdtWFJetmYvVBF3Yg5egSTmdRZxZDP6zu0
         pPjdo+NH13EXAcjlz075IKYzsfElpYEfwSnfI6IbX/bcmiczhEbguUM6bUjfo41jWmGx
         CjFB/RvaPFmz0MGe5Z0LjT0jbmhgkzg/ojYVpvJdVMnH4y0OdWlljSbyrkhddelCVmf4
         JKEPWmsGXmRxAcuU4NTZWrj4shxB/mkUirxUQ+XfXXJ+tdkIvTNek+4vvByFzNzMqmfC
         Wpvg==
X-Gm-Message-State: ACgBeo179gBkIEHaerGVOWU5S9FeoXZ/xrhYnq/fv0+9BYOLPVwyQEnw
        l9pB30fXJUL4Pmrb6uSeOAVNFF+e/dkK
X-Google-Smtp-Source: AA6agR6vG6qA+KEWIcNqcZ7T5j/TvnUr1vSeWNQuYc8SmrcSeHILCoEV5YhqRMF4VyE2JObuw86LSQ==
X-Received: by 2002:a05:6402:1d55:b0:440:7104:240c with SMTP id dz21-20020a0564021d5500b004407104240cmr4493048edb.207.1660324193682;
        Fri, 12 Aug 2022 10:09:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-182-183-173.77.182.pool.telefonica.de. [77.182.183.173])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709060ec900b0072ed9efc9dfsm1000042eji.48.2022.08.12.10.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 10:09:53 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: Re: [PATCH 2/4] autofs-5.1.8 - improve debug logging of SASL binds
Date:   Fri, 12 Aug 2022 19:08:44 +0200
Message-Id: <20220812170843.1515844-1-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <bf794c89-d959-f475-3577-b1897cdd0aa8@themaw.net>
References: <bf794c89-d959-f475-3577-b1897cdd0aa8@themaw.net>
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
 modules/cyrus-sasl.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index ae046e0..4806734 100644
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
@@ -745,10 +745,11 @@ sasl_conn_t *
 sasl_bind_mech(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt, const char *mech)
 {
 	sasl_conn_t *conn;
-	char *tmp, *host = NULL;
+	char *tmp, *host, *data = NULL;
 	const char *clientout;
 	unsigned int clientoutlen;
 	const char *chosen_mech;
+	sasl_ssf_t *ssf;
 	int result;
 
 	if (!strncmp(mech, "GSSAPI", 6)) {
@@ -812,6 +813,20 @@ sasl_bind_mech(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt, const c
 	result = do_sasl_bind(logopt, ldap, conn,
 			 &clientout, &clientoutlen, chosen_mech, result);
 	if (result == 0) {
+		/* Conversation was completed successfully by now */
+		result = sasl_getprop(conn, SASL_USERNAME, (const void **)(char *) &data);
+		if (result == SASL_OK && data && *data)
+			debug(logopt, "SASL username: %s", data);
+		result = ldap_get_option(ldap, LDAP_OPT_X_SASL_AUTHCID, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data)
+			debug(logopt, "SASL authcid: %s", data);
+		result = ldap_get_option(ldap, LDAP_OPT_X_SASL_AUTHZID, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data)
+			debug(logopt, "SASL authzid: %s", data);
+		ssf = NULL;
+		result = sasl_getprop(conn, SASL_SSF, (const void **)(char *) &ssf);
+		if (result == SASL_OK)
+			debug(logopt, "SASL SSF: %lu", (unsigned long) *ssf);
 		ldap_memfree(host);
 		debug(logopt, "sasl bind with mechanism %s succeeded",
 		      chosen_mech);
-- 
2.37.1

