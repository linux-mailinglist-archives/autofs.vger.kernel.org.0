Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2863D591465
	for <lists+autofs@lfdr.de>; Fri, 12 Aug 2022 18:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237639AbiHLQ4F (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 12 Aug 2022 12:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236964AbiHLQ4C (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 12 Aug 2022 12:56:02 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F277537FAD
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 09:56:00 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id uj29so3055864ejc.0
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Eji3LrUuUHgk/+mpsXNC0sfNA3YehLMJ5IWIhZqbwnY=;
        b=O57T1UVvZyIz3BSjjsSIN4H0qySgLvc9GJcfMGMOPy5+glOSlnL1HTUwQZ0SkYuI7i
         ZrgO/vcQ6RlLRwbp2DWrU+VXgMuhqw94T8xeTWpRI2UWeb4kjbibKwKj5MeSKBlq1MY3
         0wJ1GVvmDIqftOsOf/qRjdI6ajF3Sgungf5ndYRavUeEOMqDvD879wB+C9GxlL7dJpnT
         S2jnt+tzZfT9Y0GTUbwQwZoMdFIE5gOAbtgZvLHy3xe6NEP6NBQwZqgIvX+Qy79OnDtj
         FCxYRQztfR8PDzJojm93+e5gdQieSX0dPCwBBni5I3lTIb/tHq2peHJcDUxWzYnQts6z
         Ti3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Eji3LrUuUHgk/+mpsXNC0sfNA3YehLMJ5IWIhZqbwnY=;
        b=Vyp+OoVPwGFDRN/bro7dcyyagpUcJHlzpZ7ecKSdnmHNW+MS2P9uQBsyb/olbW/ir/
         oBPTdz7CVUBSwMCnNo8luv4phsHC69tCG0RrjA49gvVZzgd3CADJVJGezQfThnZRBLUa
         TQqr/wmp1yhGR0YX1S/JN8sfN3yopZmevHQKDuEESdgfbIeGY/kYUMfdaksvLAOUxQ9A
         772GQQswI43IKxytY3AO0kJAvqmT5J6T9hlAoPH/x/VrXUyLpgMZ5lp3D6fxdaLPkX9s
         EnKdAhPeXnRoRtUxP+wBqAcb8tw6TXlRSUn8amyPi+oJoJvnXR6cxRtBdjOWibaNBatI
         nlpw==
X-Gm-Message-State: ACgBeo02iJSStldHfAlGhyi/VkWvyyWkjztMlrE8fD7udZ5YDO8fK9TG
        SXuDxeBtEpfaoeNTBPxKyrlYciAAtPII
X-Google-Smtp-Source: AA6agR7ZBf/DlVlykOAJAYR0Opjaz+EJ9OqfVAPmpJqxLQq+yo9GL6YY4pDRz+BBuwzG5BIGk9cn1g==
X-Received: by 2002:a17:907:7637:b0:730:6a9b:148f with SMTP id jy23-20020a170907763700b007306a9b148fmr3303757ejc.273.1660323359490;
        Fri, 12 Aug 2022 09:55:59 -0700 (PDT)
Received: from localhost.localdomain ([77.182.183.173])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090680c500b00734b2169222sm954406ejx.186.2022.08.12.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:55:58 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: Re: [PATCH 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
Date:   Fri, 12 Aug 2022 18:52:46 +0200
Message-Id: <20220812165244.1505738-1-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <19933e9c-1cb0-e087-948a-0bae8fa67cff@gmail.com>
References: <19933e9c-1cb0-e087-948a-0bae8fa67cff@gmail.com>
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

Please find in the following how the provide patch would be changed
after review:


---
 modules/cyrus-sasl.c  | 70 +++++++++++++++++++++++--------------------
 modules/lookup_ldap.c | 57 ++++++++++++++++++++++++-----------
 2 files changed, 77 insertions(+), 50 deletions(-)

diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index 0c4ee58..ee350be 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -243,35 +243,40 @@ typedef struct autofs_ldap_sasl_defaults_s {
 } ldapSASLdefaults;
 
 
-void
-autofs_ldap_sasl_freedefs(void *defaults)
+void autofs_ldap_sasl_freedefs(void *defaults)
 {
 	ldapSASLdefaults *defs = defaults;
 
 	assert(defs != NULL);
 
-	if (defs->mech) ber_memfree(defs->mech);
-	if (defs->realm) ber_memfree(defs->realm);
-	if (defs->authcid) ber_memfree(defs->authcid);
-	if (defs->passwd) ber_memfree(defs->passwd);
-	if (defs->authzid) ber_memfree(defs->authzid);
+	if (defs->mech)
+		ber_memfree(defs->mech);
+	if (defs->realm)
+		ber_memfree(defs->realm);
+	if (defs->authcid)
+		ber_memfree(defs->authcid);
+	if (defs->passwd)
+		ber_memfree(defs->passwd);
+	if (defs->authzid)
+		ber_memfree(defs->authzid);
 
 	ber_memfree(defs);
 }
 
 void *
 autofs_ldap_sasl_defaults(LDAP *ld,
-                    char *mech,
-                    char *realm,
-                    char *authcid,
-                    char *passwd,
-                    char *authzid)
+			  char *mech,
+			  char *realm,
+			  char *authcid,
+			  char *passwd,
+			  char *authzid)
 {
 	ldapSASLdefaults *defaults;
 
 	defaults = ber_memalloc(sizeof(ldapSASLdefaults));
 
-	if (defaults == NULL) return NULL;
+	if (defaults == NULL)
+		return NULL;
 
 	defaults->mech = mech ? ber_strdup(mech) : NULL;
 	defaults->realm = realm ? ber_strdup(realm) : NULL;
@@ -279,26 +284,22 @@ autofs_ldap_sasl_defaults(LDAP *ld,
 	defaults->passwd = passwd ? ber_strdup(passwd) : NULL;
 	defaults->authzid = authzid ? ber_strdup(authzid) : NULL;
 
-	if (defaults->mech == NULL) {
+	if (defaults->mech == NULL)
 		ldap_get_option(ld, LDAP_OPT_X_SASL_MECH, &defaults->mech);
-	}
-	if (defaults->realm == NULL) {
-	ldap_get_option(ld, LDAP_OPT_X_SASL_REALM, &defaults->realm);
-	}
-	if (defaults->authcid == NULL) {
+	if (defaults->realm == NULL)
+		ldap_get_option(ld, LDAP_OPT_X_SASL_REALM, &defaults->realm);
+	if (defaults->authcid == NULL)
 		ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHCID, &defaults->authcid);
-	}
-	if (defaults->authzid == NULL) {
+	if (defaults->authzid == NULL)
 		ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHZID, &defaults->authzid);
-	}
 
 	return defaults;
 }
 
 static int
 interaction(unsigned flags,
-            sasl_interact_t *interact,
-            ldapSASLdefaults *defaults)
+	    sasl_interact_t *interact,
+	    ldapSASLdefaults *defaults)
 {
 	switch (interact->id) {
 	case SASL_CB_GETREALM:
@@ -346,14 +347,15 @@ interaction(unsigned flags,
 	return LDAP_SUCCESS;
 }
 
-int autofs_ldap_sasl_interact(LDAP *ld,
-                        unsigned flags,
-                        void *defaults,
-                        void *interact)
+int
+autofs_ldap_sasl_interact(LDAP *ld,
+			  unsigned flags,
+			  void *defaults,
+			  void *interact)
 {
-	int rc = LDAP_SUCCESS;
-	sasl_interact_t *in = (sasl_interact_t*) interact;
 	ldapSASLdefaults *deflts = (ldapSASLdefaults*) defaults;
+	sasl_interact_t *in = (sasl_interact_t*) interact;
+	int rc = LDAP_SUCCESS;
 
 	if (!ld)
 		return LDAP_PARAM_ERROR;
@@ -364,14 +366,15 @@ int autofs_ldap_sasl_interact(LDAP *ld,
 		case SASL_CB_ECHOPROMPT:
 			return LDAP_UNAVAILABLE;
 		default:
-		int rc = interaction(flags, in, deflts);
-			if (rc)  return rc;
+			rc = interaction(flags, in, deflts);
+			if (rc)
+				return rc;
 			break;
 		}
 		in++;
 	}
 
-	return LDAP_SUCCESS;
+	return rc;
 }
 #endif
 
@@ -1131,6 +1134,7 @@ void autofs_sasl_dispose(struct ldap_conn *conn, struct lookup_context *ctxt)
 			fatal(status);
 		return;
 	}
+
 #ifndef WITH_LDAP_CYRUS_SASL
 	if (conn && conn->sasl_conn) {
 		sasl_dispose(&conn->sasl_conn);
diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index 68b42d4..5f10498 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -580,14 +580,18 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 
 #ifdef WITH_SASL
 #ifdef WITH_LDAP_CYRUS_SASL
+	unsigned int sasl_flags = LDAP_SASL_AUTOMATIC;
 	LDAP_SASL_INTERACT_PROC *proc = NULL;
 	LDAPMessage *ldap_res = NULL;
-	void *defaults;
 	const char *chosen_mech = NULL;
 	const char *rmech = NULL;
-	unsigned sasl_flags = LDAP_SASL_AUTOMATIC;
-	int msgid, err;
+	char *part_dn = NULL;
 	char *info = NULL;
+	int msgid, err;
+	void *defaults;
+	char *data;
+	ber_len_t *ssf;
+
 #endif
 	debug(logopt, MODPREFIX "auth_required: %d, sasl_mech %s",
 	      ctxt->auth_required, ctxt->sasl_mech);
@@ -620,11 +624,15 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 		 *  auth mechanism.
 		 */
 
-		defaults = autofs_ldap_sasl_defaults(conn->ldap, ctxt->sasl_mech, NULL, ctxt->user, ctxt->secret, NULL);
+		defaults = autofs_ldap_sasl_defaults(conn->ldap, ctxt->sasl_mech, NULL,
+						     ctxt->user, ctxt->secret, NULL);
 		do {
-			rv = ldap_sasl_interactive_bind(conn->ldap, NULL, ctxt->sasl_mech,
-			                                NULL, NULL, sasl_flags, autofs_ldap_sasl_interact, defaults,
-			                                ldap_res, &rmech, &msgid);
+			rv = ldap_sasl_interactive_bind(conn->ldap, NULL,
+							ctxt->sasl_mech, NULL, NULL,
+							sasl_flags,
+							autofs_ldap_sasl_interact,
+							defaults, ldap_res,
+							&rmech, &msgid);
 			if (rmech) {
 				chosen_mech = rmech;
 			}
@@ -632,6 +640,7 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 				break;
 
 			ldap_msgfree(ldap_res);
+			ldap_res = NULL;
 
 			if (ldap_result(conn->ldap, msgid, LDAP_MSG_ALL, NULL, &ldap_res) == -1 || !ldap_res) {
 				ldap_get_option(conn->ldap, LDAP_OPT_RESULT_CODE, (void*)&err);
@@ -640,6 +649,7 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 				      err);
 				debug(logopt, "ldap_sasl_interactive_bind: %s", info);
 				ldap_memfree(info);
+				ldap_msgfree(ldap_res);
 				return 0;
 			}
 		} while ( rv == LDAP_SASL_BIND_IN_PROGRESS );
@@ -652,31 +662,44 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 			      rv);
 			debug(logopt, "ldap_sasl_interactive_bind: %s", info);
 			ldap_memfree(info);
+			ldap_msgfree(ldap_res);
 			return 0;
 		}
+		/* Parse the result and check for errors, then free result */
+		if (ldap_res) {
+			rv = ldap_parse_result(conn->ldap, ldap_res, &err, &part_dn, &info, NULL, NULL, 1);
+			if ( rv != LDAP_SUCCESS ) {
+				error(logopt,
+				      MODPREFIX "ldap_sasl_interactive_bind parse result failed with error %d",
+				      err);
+				debug(logopt, "ldap_sasl_interactive_bind matched DN: %s", part_dn);
+				debug(logopt, "ldap_sasl_interactive_bind parse result: %s", info);
+				ldap_memfree(info);
+				ldap_memfree(part_dn);
+				return 0;
+			}
+		}
+		if (info)
+			ldap_memfree(info);
+		if (part_dn)
+			ldap_memfree(part_dn);
 
 		/* Conversation was completed successfully by now */
-		char *data;
-		ber_len_t *ssf;
 		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_USERNAME, &data);
-		if (result == LDAP_OPT_SUCCESS && data && *data) {
+		if (result == LDAP_OPT_SUCCESS && data && *data)
 			debug(logopt, "SASL username: %s", data );
-		}
 		data = NULL;
 		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_AUTHCID, &data);
-		if (result == LDAP_OPT_SUCCESS && data && *data) {
+		if (result == LDAP_OPT_SUCCESS && data && *data)
 			debug(logopt, "SASL authcid: %s", data);
-		}
 		data = NULL;
 		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_AUTHZID, &data);
-		if (result == LDAP_OPT_SUCCESS && data && *data) {
+		if (result == LDAP_OPT_SUCCESS && data && *data)
 			debug(logopt, "SASL authzid: %s", data);
-		}
 		ssf = NULL;
 		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_SSF, &ssf);
-		if (result == LDAP_OPT_SUCCESS && ssf) {
+		if (result == LDAP_OPT_SUCCESS && ssf)
 			debug(logopt, "SASL SSF: %lu", (unsigned long) ssf);
-		}
 
 		debug(logopt, "sasl bind with mechanism %s succeeded",
 		      chosen_mech);
-- 
2.37.1

