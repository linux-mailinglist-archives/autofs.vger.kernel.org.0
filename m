Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE6358D872
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237249AbiHIL4m (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbiHIL4j (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:56:39 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C85DFD7
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:56:37 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id uj29so21879035ejc.0
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cCcSPWy5/QRCySLgC/7Kfd5uDxEAPFnlilMAwfeKqW0=;
        b=GuVY8WKIWaAKAs4sHpSGWXG/mDWDXQTvwWDxhV0KcEkGp2KMP5X6t4diuDHq8VUf7n
         eR6u3BchDrQ6+WSpBdavtHuXMgLgkzD8UGXofn+QQ9fv6tYyI8b+QBwqfP9dVkj+ghpf
         Nn1t5AfaWhDQ18x3yCUrD+vbzNvGFsGAx+3Umjl6gwd9crFHSYzzwB0N9Su192UdYJSs
         cWRa8IWQRtZxzUU8QI72hpc6buPoUw+9XLyQlLvkvTx7PzJoeH4ymd72u5KVtTp+6QP8
         PeSsIdE63XB6N94D+Vi1P/zanY1RV/nDbcVG3MU33SOa8SMnh54l9ynOoSAhfIBEJKfw
         SF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cCcSPWy5/QRCySLgC/7Kfd5uDxEAPFnlilMAwfeKqW0=;
        b=vSAN9oED9dReeaYPuAGx9Sh8pDLkvcO+IfLrFrR3DeFsBRS8w6dqqGed9X5lm6/btf
         jW6Jv1Cwq3enrwcDb8w/SlDs1kq24IGQeHIR8ttuXMyNPlEmzRQNGjNEpYS8eHiHE80y
         p4af6VVu2huLaDuOQsL90cWwr6IDRkynBLIeyHt3roRvgM4mopxZv5XglCH7+ZbB+qsd
         Q0AUjrnRkG/4UfoIeRTBgW6qOiU8BM8p1X8b6fMXN7N3JV1L2QpSeU+ClEedUla3/qhr
         ZnoxFgGefFp5Pj9+dotrxGlf5QSpkMKemJH8vP+gjemkHfksmkIMMBjn8uFWnD8G0jbD
         +7QA==
X-Gm-Message-State: ACgBeo1PffIDddZNHLGwgR14JErrJQdYeedOLq+RytATkJ5Cxq1mL3E2
        H+hKUT2PsO8cuqg7K/ux/dyLzNPHmM0Y
X-Google-Smtp-Source: AA6agR7hrxP2LwEHs8/j9RY3yFAXLypt35LXGUDjK6Gq1iwoGzE/VNGOCv20tIe5aNEqJBEj3oGckw==
X-Received: by 2002:a17:906:98c8:b0:730:7f77:9558 with SMTP id zd8-20020a17090698c800b007307f779558mr16489326ejb.467.1660046195966;
        Tue, 09 Aug 2022 04:56:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b007304bdf18cfsm1048488ejb.136.2022.08.09.04.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:56:35 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
Date:   Tue,  9 Aug 2022 13:56:07 +0200
Message-Id: <20220809115608.107767-4-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809115608.107767-1-reimth@gmail.com>
References: <20220809115608.107767-1-reimth@gmail.com>
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

Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode using an
SASL data security layer according to IETF RFC 2078. This security layer
provides for traffic encryption during authentication and authorization towards
an OpenLDAP based server and for subsequent encryption of data traffic for the
LDAP session. Current automounter does not implement SASL security layer
encryption and only relies on TLS to protect LDAP communication.

OpenLDAP libldap if compiled with Cyrus SASL supports negotiation of an SASL
data security layer based encryption of LDAP traffic. libldap also provides
automatic negotiation of the best suited SASL mechanism taking into account
application required defaults.

Since version 4.4 Samba AD domain controllers default settings only allow for
simple SASL binds over TLS encrypted connections or SASL binds with sign or
seal, i. e. data security layer encryption, over unencrypted connections.
Therefore, current automounter cannot fetch autofs maps from Samba AD DCs
using SASL anymore without setting Samba configuration parameter "ldap server
require strong auth" to "no" or "allow_sasl_over_tls".

This patch updates automounter to let OpenLDAP and Cyrus SASL handle SASL
binding and traffic security configuration. Proposed changes are backward
compatible for clients that use LDAP libaries different from LDAP. When using
SASL mechanism GSSAPI or simple authentication with TLS encryption automounter
seamlessly interworks with latest Samba AD DCs.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 include/lookup_ldap.h |   6 ++
 modules/cyrus-sasl.c  | 148 +++++++++++++++++++++++++++++++++++++++++-
 modules/lookup_ldap.c | 102 ++++++++++++++++++++++++++++-
 3 files changed, 253 insertions(+), 3 deletions(-)

diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
index 3a10778..9c3e862 100644
--- a/include/lookup_ldap.h
+++ b/include/lookup_ldap.h
@@ -129,6 +129,12 @@ int autofs_sasl_bind(unsigned logopt, struct ldap_conn *conn, struct lookup_cont
 void autofs_sasl_unbind(struct ldap_conn *conn, struct lookup_context *ctxt);
 void autofs_sasl_dispose(struct ldap_conn *conn, struct lookup_context *ctxt);
 void autofs_sasl_done(void);
+int sasl_do_kinit(unsigned logopt, struct lookup_context *ctxt);
+#ifdef WITH_LDAP_CYRUS_SASL
+void autofs_ldap_sasl_freedefs(void *defaults);
+void *autofs_ldap_sasl_defaults(LDAP *ld, char *mech, char *realm, char *authcid, char *passwd, char *authzid );
+int autofs_ldap_sasl_interact(LDAP *ld, unsigned flags, void *defaults, void *in );
+#endif
 /* cyrus-sasl-extern */
 int do_sasl_extern(LDAP *ldap, struct lookup_context *ctxt);
 #endif
diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index ae046e0..0c4ee58 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -233,6 +233,148 @@ get_server_SASL_mechanisms(unsigned logopt, LDAP *ld)
 	return mechanisms;
 }
 
+#ifdef WITH_LDAP_CYRUS_SASL
+typedef struct autofs_ldap_sasl_defaults_s {
+	char *mech;
+	char *realm;
+	char *authcid;
+	char *passwd;
+	char *authzid;
+} ldapSASLdefaults;
+
+
+void
+autofs_ldap_sasl_freedefs(void *defaults)
+{
+	ldapSASLdefaults *defs = defaults;
+
+	assert(defs != NULL);
+
+	if (defs->mech) ber_memfree(defs->mech);
+	if (defs->realm) ber_memfree(defs->realm);
+	if (defs->authcid) ber_memfree(defs->authcid);
+	if (defs->passwd) ber_memfree(defs->passwd);
+	if (defs->authzid) ber_memfree(defs->authzid);
+
+	ber_memfree(defs);
+}
+
+void *
+autofs_ldap_sasl_defaults(LDAP *ld,
+                    char *mech,
+                    char *realm,
+                    char *authcid,
+                    char *passwd,
+                    char *authzid)
+{
+	ldapSASLdefaults *defaults;
+
+	defaults = ber_memalloc(sizeof(ldapSASLdefaults));
+
+	if (defaults == NULL) return NULL;
+
+	defaults->mech = mech ? ber_strdup(mech) : NULL;
+	defaults->realm = realm ? ber_strdup(realm) : NULL;
+	defaults->authcid = authcid ? ber_strdup(authcid) : NULL;
+	defaults->passwd = passwd ? ber_strdup(passwd) : NULL;
+	defaults->authzid = authzid ? ber_strdup(authzid) : NULL;
+
+	if (defaults->mech == NULL) {
+		ldap_get_option(ld, LDAP_OPT_X_SASL_MECH, &defaults->mech);
+	}
+	if (defaults->realm == NULL) {
+	ldap_get_option(ld, LDAP_OPT_X_SASL_REALM, &defaults->realm);
+	}
+	if (defaults->authcid == NULL) {
+		ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHCID, &defaults->authcid);
+	}
+	if (defaults->authzid == NULL) {
+		ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHZID, &defaults->authzid);
+	}
+
+	return defaults;
+}
+
+static int
+interaction(unsigned flags,
+            sasl_interact_t *interact,
+            ldapSASLdefaults *defaults)
+{
+	switch (interact->id) {
+	case SASL_CB_GETREALM:
+		if (defaults->realm) {
+			interact->result = defaults->realm;
+		} else if (interact->defresult) {
+			interact->result = interact->defresult;
+		} else {
+			interact->result = "";
+		}
+		interact->len = strlen(interact->result);
+		break;
+	case SASL_CB_USER:
+		if (defaults->authzid) {
+			interact->result = defaults->authzid;
+		} else if (interact->defresult) {
+			interact->result = interact->defresult;
+		} else {
+			interact->result = "";
+		}
+		interact->len = strlen(interact->result);
+		break;
+	case SASL_CB_PASS:
+		if (defaults->passwd) {
+			interact->result = defaults->passwd;
+		} else if (interact->defresult) {
+			interact->result = interact->defresult;
+		} else {
+			interact->result = "";
+		}
+		interact->len = strlen(interact->result);
+		break;
+	case SASL_CB_AUTHNAME:
+		if (defaults->authcid) {
+			interact->result = defaults->authcid;
+		} else if (interact->defresult) {
+			interact->result = interact->defresult;
+		} else {
+			interact->result = "";
+		}
+		interact->len = strlen(interact->result);
+		break;
+	}
+
+	return LDAP_SUCCESS;
+}
+
+int autofs_ldap_sasl_interact(LDAP *ld,
+                        unsigned flags,
+                        void *defaults,
+                        void *interact)
+{
+	int rc = LDAP_SUCCESS;
+	sasl_interact_t *in = (sasl_interact_t*) interact;
+	ldapSASLdefaults *deflts = (ldapSASLdefaults*) defaults;
+
+	if (!ld)
+		return LDAP_PARAM_ERROR;
+
+	while (in->id != SASL_CB_LIST_END) {
+		switch (in->id) {
+		case SASL_CB_NOECHOPROMPT:
+		case SASL_CB_ECHOPROMPT:
+			return LDAP_UNAVAILABLE;
+		default:
+		int rc = interaction(flags, in, deflts);
+			if (rc)  return rc;
+			break;
+		}
+		in++;
+	}
+
+	return LDAP_SUCCESS;
+}
+#endif
+
 /*
  *  Returns 0 upon successful connect, -1 on failure.
  */
@@ -989,12 +1131,12 @@ void autofs_sasl_dispose(struct ldap_conn *conn, struct lookup_context *ctxt)
 			fatal(status);
 		return;
 	}
-
+#ifndef WITH_LDAP_CYRUS_SASL
 	if (conn && conn->sasl_conn) {
 		sasl_dispose(&conn->sasl_conn);
 		conn->sasl_conn = NULL;
 	}
-
+#endif
 	if (ctxt->kinit_successful) {
 		if (--krb5cc_in_use || ctxt->client_cc)
 			ret = krb5_cc_close(ctxt->krb5ctxt, ctxt->krb5_ccache);
@@ -1095,7 +1237,9 @@ int autofs_sasl_client_init(unsigned logopt)
  */
 void autofs_sasl_done(void)
 {
+#ifndef WITH_LDAP_CYRUS_SASL
 	sasl_done();
+#endif
 	return;
 }
 
diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index 3e43fc0..68b42d4 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -223,11 +223,13 @@ int __unbind_ldap_connection(unsigned logopt,
 	if (ctxt->use_tls == LDAP_TLS_RELEASE)
 		ctxt->use_tls = LDAP_TLS_INIT;
 #ifdef WITH_SASL
+#ifndef WITH_LDAP_CYRUS_SASL
 	if (ctxt->auth_required & LDAP_NEED_AUTH)
 		autofs_sasl_unbind(conn, ctxt);
 	/* No, sasl_dispose does not release the ldap connection
 	 * unless it's using sasl EXTERNAL
 	 */
+#endif
 #endif
 	if (conn->ldap) {
 		rv = ldap_unbind_ext(conn->ldap, NULL, NULL);
@@ -574,15 +576,111 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
 		   const char *uri, struct lookup_context *ctxt)
 {
 	char *host = NULL, *nhost;
-	int rv;
+	int rv, result;
 
 #ifdef WITH_SASL
+#ifdef WITH_LDAP_CYRUS_SASL
+	LDAP_SASL_INTERACT_PROC *proc = NULL;
+	LDAPMessage *ldap_res = NULL;
+	void *defaults;
+	const char *chosen_mech = NULL;
+	const char *rmech = NULL;
+	unsigned sasl_flags = LDAP_SASL_AUTOMATIC;
+	int msgid, err;
+	char *info = NULL;
+#endif
 	debug(logopt, MODPREFIX "auth_required: %d, sasl_mech %s",
 	      ctxt->auth_required, ctxt->sasl_mech);
 
 	if (ctxt->auth_required & LDAP_NEED_AUTH) {
+#ifndef WITH_LDAP_CYRUS_SASL
 		rv = autofs_sasl_bind(logopt, conn, ctxt);
 		debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
+#else
+		if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 6)) {
+			rv = sasl_do_kinit(logopt, ctxt);
+			if (rv != 0)
+				return 0;
+			sasl_flags = LDAP_SASL_QUIET;
+		}
+
+		debug(logopt, "Attempting sasl bind with mechanism %s", ctxt->sasl_mech);
+
+		if (ctxt->auth_required & LDAP_AUTH_AUTODETECT) {
+			if (ctxt->sasl_mech) {
+				free(ctxt->sasl_mech);
+				ctxt->sasl_mech = NULL;
+			}
+		}
+
+		/*
+		 *  If LDAP_AUTH_AUTODETECT is set, it means that there was no
+		 *  mechanism specified in the configuration file or auto
+		 *  selection has been requested, so try to auto-select an
+		 *  auth mechanism.
+		 */
+
+		defaults = autofs_ldap_sasl_defaults(conn->ldap, ctxt->sasl_mech, NULL, ctxt->user, ctxt->secret, NULL);
+		do {
+			rv = ldap_sasl_interactive_bind(conn->ldap, NULL, ctxt->sasl_mech,
+			                                NULL, NULL, sasl_flags, autofs_ldap_sasl_interact, defaults,
+			                                ldap_res, &rmech, &msgid);
+			if (rmech) {
+				chosen_mech = rmech;
+			}
+			if (rv != LDAP_SASL_BIND_IN_PROGRESS)
+				break;
+
+			ldap_msgfree(ldap_res);
+
+			if (ldap_result(conn->ldap, msgid, LDAP_MSG_ALL, NULL, &ldap_res) == -1 || !ldap_res) {
+				ldap_get_option(conn->ldap, LDAP_OPT_RESULT_CODE, (void*)&err);
+				ldap_get_option(conn->ldap, LDAP_OPT_DIAGNOSTIC_MESSAGE, (void*)&info);
+				error(logopt, MODPREFIX "ldap_sasl_interactive_bind failed with error %d",
+				      err);
+				debug(logopt, "ldap_sasl_interactive_bind: %s", info);
+				ldap_memfree(info);
+				return 0;
+			}
+		} while ( rv == LDAP_SASL_BIND_IN_PROGRESS );
+
+		autofs_ldap_sasl_freedefs(defaults);
+
+		if (rv != LDAP_SUCCESS) {
+			ldap_get_option(conn->ldap, LDAP_OPT_DIAGNOSTIC_MESSAGE, (void*)&info );
+			error(logopt, MODPREFIX "ldap_sasl_interactive_bind failed with error %d",
+			      rv);
+			debug(logopt, "ldap_sasl_interactive_bind: %s", info);
+			ldap_memfree(info);
+			return 0;
+		}
+
+		/* Conversation was completed successfully by now */
+		char *data;
+		ber_len_t *ssf;
+		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_USERNAME, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data) {
+			debug(logopt, "SASL username: %s", data );
+		}
+		data = NULL;
+		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_AUTHCID, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data) {
+			debug(logopt, "SASL authcid: %s", data);
+		}
+		data = NULL;
+		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_AUTHZID, &data);
+		if (result == LDAP_OPT_SUCCESS && data && *data) {
+			debug(logopt, "SASL authzid: %s", data);
+		}
+		ssf = NULL;
+		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_SSF, &ssf);
+		if (result == LDAP_OPT_SUCCESS && ssf) {
+			debug(logopt, "SASL SSF: %lu", (unsigned long) ssf);
+		}
+
+		debug(logopt, "sasl bind with mechanism %s succeeded",
+		      chosen_mech);
+#endif
 	} else {
 		rv = bind_ldap_simple(logopt, conn->ldap, uri, ctxt);
 		debug(logopt, MODPREFIX "ldap simple bind returned %d", rv);
@@ -1793,6 +1891,7 @@ static int do_init(const char *mapfmt,
 	}
 
 #ifdef WITH_SASL
+#ifndef WITH_LDAP_CYRUS_SASL
 	/* Init the sasl callbacks */
 	ldapinit_mutex_lock();
 	if (!autofs_sasl_client_init(LOGOPT_NONE)) {
@@ -1801,6 +1900,7 @@ static int do_init(const char *mapfmt,
 		return 1;
 	}
 	ldapinit_mutex_unlock();
+#endif
 #endif
 
 	if (is_amd_format)
-- 
2.37.1

