Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643035A139B
	for <lists+autofs@lfdr.de>; Thu, 25 Aug 2022 16:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241937AbiHYOan (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 25 Aug 2022 10:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241090AbiHYOa1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 25 Aug 2022 10:30:27 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C276B14F
        for <autofs@vger.kernel.org>; Thu, 25 Aug 2022 07:30:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id b5so20582324wrr.5
        for <autofs@vger.kernel.org>; Thu, 25 Aug 2022 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=jmhSJza2noSDlNFgLR/4G/PySh4jVcN1XpwrmzVoLGo=;
        b=qKputv3TsjzB6XSKGqo2PeV9ZYDU1a8Rtt9D5mjf7W/HGNiEqb8K88Pnpe24J+syqL
         kltm+RvvRHyueFRPRk2faBXmpJJ32VJcHY4QxkpVRLsZYmgkoYbUdNc9Z9z4QkjrQRaW
         GnSQ+1Fj0qXbrq25tXRjOW8E5mf1Yh2xUgfBv2YEUU0Nv8BWh51R6lxi6zgG2q0BLzFv
         2Zxg1j398L2/q/fzczPivJlc5Hoc7+rmMYw20HHgZEhvHGgAz/l71pgFpqHoV3MAWiM3
         btoo+FHnIENJipaBkKOYKu8hGFgfB/ocdMynM4L4aPt+ciAJh1ZNwsV8iqJLuuRZAPLc
         8Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=jmhSJza2noSDlNFgLR/4G/PySh4jVcN1XpwrmzVoLGo=;
        b=DAeQDUkK7hN6JlN6ZXzByHuS/ybyDBKSot1ksw6wBco2fgj7JTFdZK13dBlzdr8daO
         4cRX9ZcLAtJ0d6WY3NqjBcJStdKkFCB5yYTYv7VMA4wplJsOsAXYWYt9Qg1KjG/K4jNv
         QXVcBOJjN5BCKYTN5XJTcUYn/PAr5yPljpDZb+7KhD9VHghmO80yUJppx2HlFcto1KYp
         wGjj4pQQvpNbL/ziTjM7Aeq5mwF1m/dqnZZ7ojtqtb7Os4s8r/5b2ET/nR3Te+eST+h8
         posnU4nNG5QjFvPZ8/Sb5mILJsccdleJcANiPIcplR6SE6phEIK7Xf4SIEN8zSWyO1Zu
         ZxWw==
X-Gm-Message-State: ACgBeo0rlpD18Dum/9b5TWfWH2sLOml04LFj6eHwqby446zd28zVP9I5
        IzQ//JoXEomXq39riL8nXcw+53tpMbTw
X-Google-Smtp-Source: AA6agR6NJWLUn/MPraa3OU4AvD3XTc5MIotliexoa2x6shFIpy9OyzQqE1YFah8C0oybKdgd+x3y0g==
X-Received: by 2002:a5d:4d8f:0:b0:225:589f:6079 with SMTP id b15-20020a5d4d8f000000b00225589f6079mr2468075wru.495.1661437824267;
        Thu, 25 Aug 2022 07:30:24 -0700 (PDT)
Received: from [192.168.254.199] ([77.189.178.192])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c4fcb00b003a5f2cc2f1dsm5726628wmq.42.2022.08.25.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:30:23 -0700 (PDT)
Message-ID: <f23a351a-5513-1a7d-3cf7-29bc496507bd@gmail.com>
Date:   Thu, 25 Aug 2022 16:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
Content-Language: en-US
To:     autofs mailing list <autofs@vger.kernel.org>
Cc:     ", Ian Kent" <raven@themaw.net>
References: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
 <166113691987.58093.12438823131830507736.stgit@donald.themaw.net>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <166113691987.58093.12438823131830507736.stgit@donald.themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian,

the updated patch works fine except for a core dump due to a double-free 
of memory (see below)

On 22/08/2022 04:55, Ian Kent wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> From: Thomas Reim <reimth@gmail.com>
>
> Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode using an
> SASL data security layer according to IETF RFC 2078. This security layer
> provides for traffic encryption during authentication and authorization towards
> an OpenLDAP based server and for subsequent encryption of data traffic for the
> LDAP session. Current automounter does not implement SASL security layer
> encryption and only relies on TLS to protect LDAP communication.
>
> OpenLDAP libldap if compiled with Cyrus SASL supports negotiation of an SASL
> data security layer based encryption of LDAP traffic. libldap also provides
> automatic negotiation of the best suited SASL mechanism taking into account
> application required defaults.
>
> Since version 4.4 Samba AD domain controllers default settings only allow for
> simple SASL binds over TLS encrypted connections or SASL binds with sign or
> seal, i. e. data security layer encryption, over unencrypted connections.
> Therefore, current automounter cannot fetch autofs maps from Samba AD DCs
> using SASL anymore without setting Samba configuration parameter "ldap server
> require strong auth" to "no" or "allow_sasl_over_tls".
>
> This patch updates automounter to let OpenLDAP and Cyrus SASL handle SASL
> binding and traffic security configuration. Proposed changes are backward
> compatible for clients that use LDAP libaries different from LDAP. When using
> SASL mechanism GSSAPI or simple authentication with TLS encryption automounter
> seamlessly interworks with latest Samba AD DCs.
>
> Signed-off-by: Thomas Reim <reimth@gmail.com>
> Signed-off-by: Ian Kent <raven@themaw.net>
> ---
>   CHANGELOG             |    1
>   include/lookup_ldap.h |    6 ++
>   modules/cyrus-sasl.c  |  150 +++++++++++++++++++++++++++++++++++++++++++++++++
>   modules/lookup_ldap.c |  137 ++++++++++++++++++++++++++++++++++++++++++++-
>   4 files changed, 292 insertions(+), 2 deletions(-)
>
> diff --git a/CHANGELOG b/CHANGELOG
> index 98ec78a9..52da6256 100644
> --- a/CHANGELOG
> +++ b/CHANGELOG
> @@ -31,6 +31,7 @@
>   - fix a couple of null cache locking problems.
>   - restore gcc flags after autoconf Kerberos 5 check.
>   - prepare for OpenLDAP SASL binding.
> +- let OpenLDAP handle SASL binding.
>   
>   19/10/2021 autofs-5.1.8
>   - add xdr_exports().
> diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
> index 3a107782..9c3e8627 100644
> --- a/include/lookup_ldap.h
> +++ b/include/lookup_ldap.h
> @@ -129,6 +129,12 @@ int autofs_sasl_bind(unsigned logopt, struct ldap_conn *conn, struct lookup_cont
>   void autofs_sasl_unbind(struct ldap_conn *conn, struct lookup_context *ctxt);
>   void autofs_sasl_dispose(struct ldap_conn *conn, struct lookup_context *ctxt);
>   void autofs_sasl_done(void);
> +int sasl_do_kinit(unsigned logopt, struct lookup_context *ctxt);
> +#ifdef WITH_LDAP_CYRUS_SASL
> +void autofs_ldap_sasl_freedefs(void *defaults);
> +void *autofs_ldap_sasl_defaults(LDAP *ld, char *mech, char *realm, char *authcid, char *passwd, char *authzid );
> +int autofs_ldap_sasl_interact(LDAP *ld, unsigned flags, void *defaults, void *in );
> +#endif
>   /* cyrus-sasl-extern */
>   int do_sasl_extern(LDAP *ldap, struct lookup_context *ctxt);
>   #endif
> diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
> index 738e363f..11e3f76a 100644
> --- a/modules/cyrus-sasl.c
> +++ b/modules/cyrus-sasl.c
> @@ -233,6 +233,151 @@ get_server_SASL_mechanisms(unsigned logopt, LDAP *ld)
>   	return mechanisms;
>   }
>   
> +#ifdef WITH_LDAP_CYRUS_SASL
> +typedef struct autofs_ldap_sasl_defaults_s {
> +	char *mech;
> +	char *realm;
> +	char *authcid;
> +	char *passwd;
> +	char *authzid;
> +} ldapSASLdefaults;
> +
> +
> +void autofs_ldap_sasl_freedefs(void *defaults)
> +{
> +	ldapSASLdefaults *defs = defaults;
> +
> +	assert(defs != NULL);
> +
> +	if (defs->mech)
> +		ber_memfree(defs->mech);
> +	if (defs->realm)
> +		ber_memfree(defs->realm);
> +	if (defs->authcid)
> +		ber_memfree(defs->authcid);
> +	if (defs->passwd)
> +		ber_memfree(defs->passwd);
> +	if (defs->authzid)
> +		ber_memfree(defs->authzid);
> +
> +	ber_memfree(defs);
> +}
> +
> +void *
> +autofs_ldap_sasl_defaults(LDAP *ld,
> +			  char *mech,
> +			  char *realm,
> +			  char *authcid,
> +			  char *passwd,
> +			  char *authzid)
> +{
> +	ldapSASLdefaults *defaults;
> +
> +	defaults = ber_memalloc(sizeof(ldapSASLdefaults));
> +
> +	if (defaults == NULL)
> +		return NULL;
> +
> +	defaults->mech = mech ? ber_strdup(mech) : NULL;
> +	defaults->realm = realm ? ber_strdup(realm) : NULL;
> +	defaults->authcid = authcid ? ber_strdup(authcid) : NULL;
> +	defaults->passwd = passwd ? ber_strdup(passwd) : NULL;
> +	defaults->authzid = authzid ? ber_strdup(authzid) : NULL;
> +
> +	if (defaults->mech == NULL)
> +		ldap_get_option(ld, LDAP_OPT_X_SASL_MECH, &defaults->mech);
> +	if (defaults->realm == NULL)
> +		ldap_get_option(ld, LDAP_OPT_X_SASL_REALM, &defaults->realm);
> +	if (defaults->authcid == NULL)
> +		ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHCID, &defaults->authcid);
> +	if (defaults->authzid == NULL)
> +		ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHZID, &defaults->authzid);
> +
> +	return defaults;
> +}
> +
> +static int
> +interaction(unsigned flags,
> +	    sasl_interact_t *interact,
> +	    ldapSASLdefaults *defaults)
> +{
> +	switch (interact->id) {
> +	case SASL_CB_GETREALM:
> +		if (defaults->realm)
> +			interact->result = defaults->realm;
> +		else if (interact->defresult)
> +			interact->result = interact->defresult;
> +		else
> +			interact->result = "";
> +		interact->len = strlen(interact->result);
> +		break;
> +
> +	case SASL_CB_USER:
> +		if (defaults->authzid)
> +			interact->result = defaults->authzid;
> +		else if (interact->defresult)
> +			interact->result = interact->defresult;
> +		else
> +			interact->result = "";
> +		interact->len = strlen(interact->result);
> +		break;
> +
> +	case SASL_CB_PASS:
> +		if (defaults->passwd)
> +			interact->result = defaults->passwd;
> +		else if (interact->defresult)
> +			interact->result = interact->defresult;
> +		else
> +			interact->result = "";
> +		interact->len = strlen(interact->result);
> +		break;
> +
> +	case SASL_CB_AUTHNAME:
> +		if (defaults->authcid)
> +			interact->result = defaults->authcid;
> +		else if (interact->defresult)
> +			interact->result = interact->defresult;
> +		else
> +			interact->result = "";
> +		interact->len = strlen(interact->result);
> +		break;
> +	}
> +
> +	return LDAP_SUCCESS;
> +}
> +
> +int
> +autofs_ldap_sasl_interact(LDAP *ld,
> +			  unsigned flags,
> +			  void *defaults,
> +			  void *interact)
> +{
> +	ldapSASLdefaults *deflts = (ldapSASLdefaults*) defaults;
> +	sasl_interact_t *in = (sasl_interact_t*) interact;
> +	int rc = LDAP_SUCCESS;
> +
> +	if (!ld)
> +		return LDAP_PARAM_ERROR;
> +
> +	while (in->id != SASL_CB_LIST_END) {
> +		switch (in->id) {
> +		case SASL_CB_NOECHOPROMPT:
> +		case SASL_CB_ECHOPROMPT:
> +			return LDAP_UNAVAILABLE;
> +
> +		default:
> +			rc = interaction(flags, in, deflts);
> +			if (rc)
> +				return rc;
> +			break;
> +		}
> +		in++;
> +	}
> +
> +	return rc;
> +}
> +#endif
> +
>   /*
>    *  Returns 0 upon successful connect, -1 on failure.
>    */
> @@ -994,11 +1139,12 @@ void autofs_sasl_dispose(struct ldap_conn *conn, struct lookup_context *ctxt)
>   		return;
>   	}
>   
> +#ifndef WITH_LDAP_CYRUS_SASL
>   	if (conn && conn->sasl_conn) {
>   		sasl_dispose(&conn->sasl_conn);
>   		conn->sasl_conn = NULL;
>   	}
> -
> +#endif
>   	if (ctxt->kinit_successful) {
>   		if (--krb5cc_in_use || ctxt->client_cc)
>   			ret = krb5_cc_close(ctxt->krb5ctxt, ctxt->krb5_ccache);
> @@ -1099,7 +1245,9 @@ int autofs_sasl_client_init(unsigned logopt)
>    */
>   void autofs_sasl_done(void)
>   {
> +#ifndef WITH_LDAP_CYRUS_SASL
>   	sasl_done();
> +#endif
>   	return;
>   }
>   
> diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
> index 3e43fc01..1031330a 100644
> --- a/modules/lookup_ldap.c
> +++ b/modules/lookup_ldap.c
> @@ -223,11 +223,13 @@ int __unbind_ldap_connection(unsigned logopt,
>   	if (ctxt->use_tls == LDAP_TLS_RELEASE)
>   		ctxt->use_tls = LDAP_TLS_INIT;
>   #ifdef WITH_SASL
> +#ifndef WITH_LDAP_CYRUS_SASL
>   	if (ctxt->auth_required & LDAP_NEED_AUTH)
>   		autofs_sasl_unbind(conn, ctxt);
>   	/* No, sasl_dispose does not release the ldap connection
>   	 * unless it's using sasl EXTERNAL
>   	 */
> +#endif
>   #endif
>   	if (conn->ldap) {
>   		rv = ldap_unbind_ext(conn->ldap, NULL, NULL);
> @@ -574,15 +576,146 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
>   		   const char *uri, struct lookup_context *ctxt)
>   {
>   	char *host = NULL, *nhost;
> -	int rv;
> +	int rv, result;
>   
>   #ifdef WITH_SASL
> +#ifdef WITH_LDAP_CYRUS_SASL
> +	unsigned int sasl_flags = LDAP_SASL_AUTOMATIC;
> +	LDAPMessage *ldap_res = NULL;
> +	const char *chosen_mech = NULL;
> +	const char *rmech = NULL;
> +	char *part_dn = NULL;
> +	char *info = NULL;
> +	int msgid, err;
> +	void *defaults;
> +	char *data;
> +	ber_len_t *ssf;
> +
> +#endif
>   	debug(logopt, MODPREFIX "auth_required: %d, sasl_mech %s",
>   	      ctxt->auth_required, ctxt->sasl_mech);
>   
>   	if (ctxt->auth_required & LDAP_NEED_AUTH) {
> +#ifndef WITH_LDAP_CYRUS_SASL
>   		rv = autofs_sasl_bind(logopt, conn, ctxt);
>   		debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
> +#else
> +		if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 6)) {
> +			rv = sasl_do_kinit(logopt, ctxt);
> +			if (rv != 0)
> +				return 0;
> +			sasl_flags = LDAP_SASL_QUIET;
> +		}
> +
> +		debug(logopt, "Attempting sasl bind with mechanism %s", ctxt->sasl_mech);
> +
> +		if (ctxt->auth_required & LDAP_AUTH_AUTODETECT) {
> +			if (ctxt->sasl_mech) {
> +				free(ctxt->sasl_mech);
> +				ctxt->sasl_mech = NULL;
> +			}
> +		}
> +
> +		/*
> +		 *  If LDAP_AUTH_AUTODETECT is set, it means that there was no
> +		 *  mechanism specified in the configuration file or auto
> +		 *  selection has been requested, so try to auto-select an
> +		 *  auth mechanism.
> +		 */
> +
> +		defaults = autofs_ldap_sasl_defaults(conn->ldap, ctxt->sasl_mech, NULL,
> +						     ctxt->user, ctxt->secret, NULL);
> +		do {
> +			rv = ldap_sasl_interactive_bind(conn->ldap, NULL,
> +							ctxt->sasl_mech, NULL, NULL,
> +							sasl_flags,
> +							autofs_ldap_sasl_interact,
> +							defaults, ldap_res,
> +							&rmech, &msgid);
> +
> +			if (rmech)
> +				chosen_mech = rmech;
> +
> +			if (rv != LDAP_SASL_BIND_IN_PROGRESS)
> +				break;
> +
> +			if (ldap_res) {
> +				ldap_msgfree(ldap_res);
> +				ldap_res = NULL;
> +			}
> +
> +			if (ldap_result(conn->ldap, msgid, LDAP_MSG_ALL, NULL, &ldap_res) == -1 || !ldap_res) {
> +				ldap_get_option(conn->ldap, LDAP_OPT_RESULT_CODE, (void*) &err);
> +				ldap_get_option(conn->ldap, LDAP_OPT_DIAGNOSTIC_MESSAGE, (void*) &info);
> +				error(logopt, MODPREFIX "ldap_sasl_interactive_bind failed with error %d",
> +				      err);
> +				debug(logopt, "ldap_sasl_interactive_bind: %s", info);
> +				ldap_memfree(info);
> +				if (ldap_res)
> +					ldap_msgfree(ldap_res);
> +				return 0;
> +			}
> +		} while (rv == LDAP_SASL_BIND_IN_PROGRESS);
> +
> +		autofs_ldap_sasl_freedefs(defaults);
> +
> +		if (rv != LDAP_SUCCESS) {
> +			ldap_get_option(conn->ldap, LDAP_OPT_DIAGNOSTIC_MESSAGE, (void*) &info);
> +			error(logopt, MODPREFIX "ldap_sasl_interactive_bind failed with error %d",
> +			      rv);
> +			debug(logopt, "ldap_sasl_interactive_bind: %s", info);
> +			ldap_memfree(info);
> +			if (ldap_res)
> +				ldap_msgfree(ldap_res);
> +			return 0;
> +		}
> +
> +		/* Parse the result and check for errors, then free result */
> +		if (ldap_res) {
> +			rv = ldap_parse_result(conn->ldap, ldap_res, &err, &part_dn, &info, NULL, NULL, 1);

As outlined in the comment above the last parameter (value 1) of the 
function call requests OpenLDAP to free LDAPMessage memory pointed by 
ldap_res.

If you prefer, we can add an integer variable:

in freeit = 1;

and replace value 1 of the function call by the new variable.

> +			if (rv != LDAP_SUCCESS) {
> +				error(logopt,
> +				      MODPREFIX "ldap_sasl_interactive_bind parse result failed with error %d",
> +				      err);
> +				debug(logopt, "ldap_sasl_interactive_bind matched DN: %s", part_dn);
> +				debug(logopt, "ldap_sasl_interactive_bind parse result: %s", info);
> +				ldap_memfree(info);
> +				ldap_memfree(part_dn);
> +				ldap_msgfree(ldap_res);

ldap_msgfree(ldap_res) needs to be removed, as function ldap_parse_result() frees memory in error case, too-


> +				return 0;
> +			}

We could add here:

ldap_res = NULL;

as function ldap_parse_result() frees the allocated memory for us.


> +		}
> +
> +		if (info)
> +			ldap_memfree(info);
> +		if (part_dn)
> +			ldap_memfree(part_dn);
> +		if (ldap_res)
> +			ldap_msgfree(ldap_res);

This is the overkill that runs libldap into a core dump.


> +
> +		/* Conversation was completed successfully by now */
> +		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_USERNAME, &data);
> +		if (result == LDAP_OPT_SUCCESS && data && *data)
> +			debug(logopt, "SASL username: %s", data );
> +
> +		data = NULL;
> +		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_AUTHCID, &data);
> +		if (result == LDAP_OPT_SUCCESS && data && *data)
> +			debug(logopt, "SASL authcid: %s", data);
> +
> +		data = NULL;
> +		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_AUTHZID, &data);
> +		if (result == LDAP_OPT_SUCCESS && data && *data)
> +			debug(logopt, "SASL authzid: %s", data);
> +
> +		ssf = NULL;
> +		result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_SSF, &ssf);
> +		if (result == LDAP_OPT_SUCCESS && ssf)
> +			debug(logopt, "SASL SSF: %lu", (unsigned long) ssf);
> +
> +		debug(logopt, "sasl bind with mechanism %s succeeded",
> +		      chosen_mech);
> +#endif
>   	} else {
>   		rv = bind_ldap_simple(logopt, conn->ldap, uri, ctxt);
>   		debug(logopt, MODPREFIX "ldap simple bind returned %d", rv);
> @@ -1793,6 +1926,7 @@ static int do_init(const char *mapfmt,
>   	}
>   
>   #ifdef WITH_SASL
> +#ifndef WITH_LDAP_CYRUS_SASL
>   	/* Init the sasl callbacks */
>   	ldapinit_mutex_lock();
>   	if (!autofs_sasl_client_init(LOGOPT_NONE)) {
> @@ -1801,6 +1935,7 @@ static int do_init(const char *mapfmt,
>   		return 1;
>   	}
>   	ldapinit_mutex_unlock();
> +#endif
>   #endif
>   
>   	if (is_amd_format)
>
I've tested successfully this patch including the changes proposed above 
on Ubuntu Jammy.

Thomas

