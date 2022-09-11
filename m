Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7CA15B4F73
	for <lists+autofs@lfdr.de>; Sun, 11 Sep 2022 16:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiIKOmB (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 10:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIKOmA (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 10:42:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C4128E07
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 07:41:59 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l14so14653950eja.7
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zePQZrrYjaaKodqPxPsf3EK0n3Yrl3pcXGnq6y0HEiE=;
        b=LgRvEjUP+vaymq76jPSsmUw8l1Y8WQNiZeMSDFfJC8YUx++XqFUNJMxXqONoFIG276
         Ap+0Y79s5t0sg9k62ovknHn5bYijL0LEGr7YNw5BCBs+jU14lE5X15Yg4Zpdgj/xlczb
         ChJhSLtTATXAOhUxGFJ58Jx+Sh6bdUXJVbQBtp3hkRZvwxZkkkqyzu1Ij51feqz356f9
         JXkAWNgqJY/+AJUluFJEICmVbBZlmG4IHjX6U1oGBciKlY2NvQGRGw9W/U7cFYev4UG+
         JDxJoWFSxG7C/KelpEoiVjbdDchz+6OiCcIuPyEl7UNH3b+35fifZ4fxugrSooi5qP4L
         ez4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zePQZrrYjaaKodqPxPsf3EK0n3Yrl3pcXGnq6y0HEiE=;
        b=tlsL5iIxKnQZ5hitZs4Wxfvh/G4INbbMNU63xZ72ypAm701hWI1YeTnjFQm8UsQiAg
         J3DrUgPEpBanoGT+tA2AJ8CJvQSaVn/lkyeuv/WDKfGCjv7FEwGCripw+tmf39gMq4pQ
         PdR5zVoTXpOAUYoJP0D2N02L7lE3ee+j+kxRm94SB9IOxf8SZ3NHChYuqe9IQ9Vv2Tkn
         3yk4V1YzmCUwyTuFdRpskCoo6X/pAubdR9hOTne0y5kDih4xmgNqvAWu7M0CHmFY1dUc
         6NysRkVFep5WCEaF4MZAeo/IlE6+mWc9k61CowNvCrbPXPfrfi0fkU2gguIV121AluZU
         6a/w==
X-Gm-Message-State: ACgBeo1rEWsCD4GZYmywqevjdQtXJktV/o2Xe0ad/KfDnIMgJupy+oTx
        Ge/jLfiBwRKl3gBBjPlZ9bL/WYMxaQ==
X-Google-Smtp-Source: AA6agR5Im4dWQih20z7qW3RecNRhLDDpKiiJalERcSFKOOCppEK1H50/xBe19NgNj9ssUFQRbH7ovQ==
X-Received: by 2002:a17:906:9fc1:b0:761:9192:504f with SMTP id hj1-20020a1709069fc100b007619192504fmr15800845ejc.116.1662907317528;
        Sun, 11 Sep 2022 07:41:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-190-210-194.77.190.pool.telefonica.de. [77.190.210.194])
        by smtp.gmail.com with ESMTPSA id fd2-20020a056402388200b0044ed4d02483sm3993787edb.67.2022.09.11.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:41:57 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for auto-detection
Date:   Sun, 11 Sep 2022 16:41:39 +0200
Message-Id: <20220911144139.3525598-3-reimth@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911144139.3525598-1-reimth@gmail.com>
References: <20220911144139.3525598-1-reimth@gmail.com>
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
 modules/lookup_ldap.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index e4cc32b..160c7a9 100644
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
@@ -1445,20 +1445,40 @@ int parse_ldap_config(unsigned logopt, struct lookup_context *ctxt)
 		goto out;
 	}
 
+#ifndef WITH_LDAP_CYRUS_SASL
 	if (auth_required == LDAP_AUTH_USESIMPLE ||
 	   (authtype && authtype_requires_creds(authtype))) {
+#else
+	if (auth_required == LDAP_AUTH_USESIMPLE ||
+	   (authtype && authtype_requires_creds(authtype)) ||
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
+			else if (authtype)
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
+				      "in %s.", authtype, auth_conf);
+			if (authtype)
+				free(authtype);
 			if (user)
 				free(user);
 			if (s1)
-- 
2.37.2

