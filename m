Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC235B5261
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 02:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiILA6m (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 20:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiILA6k (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 20:58:40 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2EA27DEF
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:58:39 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso9957388wmc.0
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gJsyjI1kdsTyQgvKjZ5mG7yLLlX2TyJ6ydMcuPff0E0=;
        b=aRRD/BvQBpJ3AR/xu4T4xIFgbqexnVvGQ5QJCRC8764RhMlVFXewUh1OSqVTwDkEW9
         hV1Bid1/kdQqAjV2HWZYdKEpXDHPt9l2W6BMRV6aqoUczDKj0F7fOfYrNFiI3nXJXhgy
         JWkv4hvTqG0Q8m8HhY0dXgzhTqfaWTHAp3i9+X0UQYq5S2OI4P+rZNKtzZ4ZmV2e+wL8
         Kn0cZyt9aGaS8UqMIH2mkr8JZY03L+qQ/86+cui0CiHOJtsvylEgDhSq4KKCnlCVx4sW
         t79ioRkup1jxSing7htokclew8Zg+dgAu11/0ngfKzMUGGTqMwzJ63DF1b6ZIAPKLwel
         ZVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gJsyjI1kdsTyQgvKjZ5mG7yLLlX2TyJ6ydMcuPff0E0=;
        b=1Z0lXBNUsZ6XQxIrLL2QnBkc0/L8v9QwjF9MAmKrp19Wau0QrwLWgvIQ2KsH2F27It
         ePuuuxAISdLiHUhKPU9dW947hJp7tb44tWNOeYl38TPMCxkDRha4PmtQPQ3Fbj3JeQIt
         eE7vstuyXWginOPd/hD/NwgpEFTsubcF6bBW5rVZe2wq9KoQ5AyUH7Yew6wX7nZCWpB0
         VLgJfokMyx7WCUZoALNWr8clCnKY/XTNgcLRWLcWdKXX8ELybx4u3ljpJn89Wc8vE6al
         CHiuo9LylHS91bWTKFw/VZcqaZJM5SWCniY7Rog4PgB/7t02svXbfZHGsbdPeFnW4kFF
         qViA==
X-Gm-Message-State: ACgBeo1hplk5/U4CpCXolFOi8NArqjEMn/088FINCW0Bszr5j6ZrWJEn
        IcRfEzN4XcdpOh8cO7XQX6zbtV1uGQ==
X-Google-Smtp-Source: AA6agR5oyO2Ht9tN48l7m7YUDHUedUyGZbK/Hau5jsxKnMN7IAgLdq6Y6HyKCQ3BP67H3HYrVZymEg==
X-Received: by 2002:a7b:c447:0:b0:3b4:8977:4186 with SMTP id l7-20020a7bc447000000b003b489774186mr738615wmi.74.1662944318411;
        Sun, 11 Sep 2022 17:58:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-190-097-057.77.190.pool.telefonica.de. [77.190.97.57])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c4e8a00b003b31fc77407sm8790814wmq.30.2022.09.11.17.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 17:58:38 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for auto-detection
Date:   Mon, 12 Sep 2022 02:58:22 +0200
Message-Id: <20220912005822.3947426-3-reimth@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220912005822.3947426-1-reimth@gmail.com>
References: <20220912005822.3947426-1-reimth@gmail.com>
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

SASL mechanism auto-selection using ldap_sasl_interactive_bind() is tricky.
The behaviour and the required information depend not only on the capablities
of Cyrus SASL on the client machine but also on supportedSASLmechanisms on the
LDAP server. The latter information will be requested by libldap during SASL
mechanism negotiation. Current OpenLDAP libldap implementation is to prefer
user credential based SCRAM-* mechanisms on token based GSSAPI. Only exception
are SASL bind requests to servers, e. g. Active Directory domain controllers,
that have disabled all SASL mechanisms, which rely on user credential transfer
between client and directory server.

Current autofs implementation fetches user credential information from LDAP
authentication configuration file for LDAP simple binds or if users explicitly
specify a user credential based authentication mechanism (authtype).

This patch makes specification of user credentials mandatory for SASL mechanism
auto-detection using ldap_sasl_interactive_bind(). Users can then omit SASL
authtype specification and automount will auto-select the best suited user
credential based SASL mechanism supported by client and LDAP server.
If authtype="GSSAPI" is specified together with authrequired="autodetect"
automount will obtain a Kerberos ticket-granting ticket and bind to all Active
Directory servers or use the specified user credentials to bind to all other
LDAP servers that also support user credential based SASL mechanisms.

The patch is backward compatible to implementations that use autofs function
sasl_choose_mech(). The strategy of this function is to force users to specify
the SASL mechanism (authtype) if user credentials shall be used for SASL binding
and only perform auto-selection for server supported mechanisms, which are not
based on user credentials.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 modules/lookup_ldap.c | 45 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index e4cc32b..f2e553a 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -644,14 +644,14 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 			sasl_flags = LDAP_SASL_QUIET;
 		}
 
-		debug(logopt, "Attempting sasl bind with mechanism %s", ctxt->sasl_mech);
-
 		if (ctxt->auth_required & LDAP_AUTH_AUTODETECT) {
 			if (ctxt->sasl_mech) {
 				free(ctxt->sasl_mech);
 				ctxt->sasl_mech = NULL;
 			}
-		}
+			debug(logopt, "Attempting sasl bind with mechanism auto-select");
+		} else
+			debug(logopt, "Attempting sasl bind with mechanism %s", ctxt->sasl_mech);
 
 		/*
 		 *  If LDAP_AUTH_AUTODETECT is set, it means that there was no
@@ -1445,20 +1445,47 @@ int parse_ldap_config(unsigned logopt, struct lookup_context *ctxt)
 		goto out;
 	}
 
+#ifndef WITH_LDAP_CYRUS_SASL
 	if (auth_required == LDAP_AUTH_USESIMPLE ||
 	   (authtype && authtype_requires_creds(authtype))) {
+#else
+	/*
+	 * OpenLDAP with Cyrus SASL needs user credentials for
+	 * SASL mechanism auto-selection in following cases:
+	 * (a) LDAP_AUTH_AUTODETECT
+	 * (b) LDAP_AUTH_REQUIRED but no SASL mechanism specified
+	 */
+	if (auth_required == LDAP_AUTH_USESIMPLE ||
+	   (authtype && authtype_requires_creds(authtype)) ||
+	   (!authtype && (auth_required & LDAP_AUTH_REQUIRED)) ||
+	   (auth_required & LDAP_AUTH_AUTODETECT)) {
+#endif
 		char *s1 = NULL, *s2 = NULL;
 		ret = get_property(logopt, root, "user",  &user);
 		ret |= get_property(logopt, root, "secret", &s1);
 		ret |= get_property(logopt, root, "encoded_secret", &s2);
 		if (ret != 0 || (!user || (!s1 && !s2))) {
 auth_fail:
-			error(logopt,
-			      MODPREFIX
-			      "%s authentication type requires a username "
-			      "and a secret.  Please fix your configuration "
-			      "in %s.", authtype, auth_conf);
-			free(authtype);
+			if (auth_required == LDAP_AUTH_USESIMPLE)
+				error(logopt,
+				      MODPREFIX
+				      "Simple authentication method requires a username "
+				      "and a secret.  Please fix your configuration "
+				      "in %s.", auth_conf);
+			else if (authtype && authtype_requires_creds(authtype))
+				error(logopt,
+				      MODPREFIX
+				      "%s authentication type requires a username "
+				      "and a secret.  Please fix your configuration "
+				      "in %s.", authtype, auth_conf);
+			else
+				error(logopt,
+				      MODPREFIX
+				      "SASL authentication type auto-selection requires a "
+				      "username and a secret.  Please fix your configuration "
+				      "in %s.", auth_conf);
+			if (authtype)
+				free(authtype);
 			if (user)
 				free(user);
 			if (s1)
-- 
2.37.2

