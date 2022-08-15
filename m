Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A1759298A
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiHOGXA (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiHOGW4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:22:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99C9193C5
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id dc19so11943176ejb.12
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HXnIFSzZ6DI9I91ylRMXmU0MaSGwzKPakSTeWatAA0k=;
        b=BYfvsLYn27Ccgv8hk2zgllSWVUj6dUeaYU+NjWL4VIPias05w1ZVspQmyX1FliLNqW
         GBh1bTYUzdCaYz4eR9SI+eJzTj72ezboOXOsmQjANl+Ll4936GZLa1BWzldAABZCh3eJ
         p4kv4/Nj4ZWyOIS/2PAblG4FDbXcKOpzupqjDpWXMUh/N9fTCm141Siv5VqjcohDU9kC
         4KCycG8tc/MeOXSrgeLRmhuDXut37ugYEL6seis/yx1lSxpW9erM/JLUwhY718dACK06
         ZnpoowS2ESr9jf0aNhJG+HUo4k5bUhPnu8LD+LqZTBFJ3HZWNMPtIC1yTvQjKYzhAL8D
         YxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HXnIFSzZ6DI9I91ylRMXmU0MaSGwzKPakSTeWatAA0k=;
        b=3M/9Mq2WlCo6VW0W/dmi/q/xkKWke/5lOkvRLP92bE6Wv2Cl0dWB48I01fker/Dg97
         SsNoZYj59un67YlbEFBRnXweR/TIoEzVKGEBvMmQtsy37VJSUidoLU7+KQ9IckiVx9Xx
         d8HyuCb+2w2fXdjS9Qs9mI1idFUBV/obTfr+zU4UZGQyvcQYhL+tom7K5djWd69SueE3
         8G78MfBm1TRAxxHCWjFMFPl5QOm/5/0aMBUD6sQEHy2VxTdQZci+ILDVqBzy8LyeXmjW
         77MvcFY8kHr7nxAAl/p4DYDuQyXx3PJXKRg+Ly64I9lKUfgxi5fQGdylkIhaNBMXPG0Q
         5bDw==
X-Gm-Message-State: ACgBeo1TOIhnY83JFvwuL62w30cQtDm/C80TG5J8TCUesXDgGibIlE8n
        /wCdXj/iT2WYnhb9rbmNUb7+9iLX4SnR
X-Google-Smtp-Source: AA6agR63QmJ32UndrmU4TH0lkM8RYwugpiPt3PQ+pCOG+i3ZqHhLrPORq74L5Efd5P06qRQPT3p86A==
X-Received: by 2002:a17:907:94d2:b0:730:87c1:e86d with SMTP id dn18-20020a17090794d200b0073087c1e86dmr9894996ejc.37.1660544574225;
        Sun, 14 Aug 2022 23:22:54 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id fu18-20020a170907b01200b007308bdef04bsm3662838ejc.103.2022.08.14.23.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:22:53 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 2/4] autofs-5.1.8 - improve debug logging of SASL binds
Date:   Mon, 15 Aug 2022 08:22:43 +0200
Message-Id: <20220815062245.1719099-3-reimth@gmail.com>
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

