Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8505B535E
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 07:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiILFTI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Sep 2022 01:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiILFTG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Sep 2022 01:19:06 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8601C937
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 22:19:03 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5ae91f.dynamic.kabel-deutschland.de [95.90.233.31])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id C85C761EA1932;
        Mon, 12 Sep 2022 07:19:00 +0200 (CEST)
Message-ID: <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
Date:   Mon, 12 Sep 2022 07:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
To:     Thomas Reim <reimth@gmail.com>
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
Content-Language: en-US
Cc:     autofs@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220912005822.3947426-3-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Thomas,


Thank you for your patch. Two minor things below.

Am 12.09.22 um 02:58 schrieb ThomasReim:
> From: Thomas Reim <reimth@gmail.com>
> 
> SASL mechanism auto-selection using ldap_sasl_interactive_bind() is tricky.
> The behaviour and the required information depend not only on the capablities

capabilities

> of Cyrus SASL on the client machine but also on supportedSASLmechanisms on the
> LDAP server. The latter information will be requested by libldap during SASL
> mechanism negotiation. Current OpenLDAP libldap implementation is to prefer
> user credential based SCRAM-* mechanisms on token based GSSAPI. Only exception
> are SASL bind requests to servers, e. g. Active Directory domain controllers,
> that have disabled all SASL mechanisms, which rely on user credential transfer
> between client and directory server.
> 
> Current autofs implementation fetches user credential information from LDAP
> authentication configuration file for LDAP simple binds or if users explicitly
> specify a user credential based authentication mechanism (authtype).
> 
> This patch makes specification of user credentials mandatory for SASL mechanism
> auto-detection using ldap_sasl_interactive_bind(). Users can then omit SASL
> authtype specification and automount will auto-select the best suited user
> credential based SASL mechanism supported by client and LDAP server.
> If authtype="GSSAPI" is specified together with authrequired="autodetect"
> automount will obtain a Kerberos ticket-granting ticket and bind to all Active
> Directory servers or use the specified user credentials to bind to all other
> LDAP servers that also support user credential based SASL mechanisms.
> 
> The patch is backward compatible to implementations that use autofs function
> sasl_choose_mech(). The strategy of this function is to force users to specify
> the SASL mechanism (authtype) if user credentials shall be used for SASL binding
> and only perform auto-selection for server supported mechanisms, which are not
> based on user credentials.
> 
> Signed-off-by: Thomas Reim <reimth@gmail.com>
> ---
>   modules/lookup_ldap.c | 45 ++++++++++++++++++++++++++++++++++---------
>   1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
> index e4cc32b..f2e553a 100644
> --- a/modules/lookup_ldap.c
> +++ b/modules/lookup_ldap.c
> @@ -644,14 +644,14 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
>   			sasl_flags = LDAP_SASL_QUIET;
>   		}
>   
> -		debug(logopt, "Attempting sasl bind with mechanism %s", ctxt->sasl_mech);
> -
>   		if (ctxt->auth_required & LDAP_AUTH_AUTODETECT) {
>   			if (ctxt->sasl_mech) {
>   				free(ctxt->sasl_mech);
>   				ctxt->sasl_mech = NULL;
>   			}
> -		}
> +			debug(logopt, "Attempting sasl bind with mechanism auto-select");
> +		} else
> +			debug(logopt, "Attempting sasl bind with mechanism %s", ctxt->sasl_mech);
>   
>   		/*
>   		 *  If LDAP_AUTH_AUTODETECT is set, it means that there was no
> @@ -1445,20 +1445,47 @@ int parse_ldap_config(unsigned logopt, struct lookup_context *ctxt)
>   		goto out;
>   	}
>   
> +#ifndef WITH_LDAP_CYRUS_SASL
>   	if (auth_required == LDAP_AUTH_USESIMPLE ||
>   	   (authtype && authtype_requires_creds(authtype))) {
> +#else
> +	/*
> +	 * OpenLDAP with Cyrus SASL needs user credentials for
> +	 * SASL mechanism auto-selection in following cases:
> +	 * (a) LDAP_AUTH_AUTODETECT
> +	 * (b) LDAP_AUTH_REQUIRED but no SASL mechanism specified
> +	 */
> +	if (auth_required == LDAP_AUTH_USESIMPLE ||
> +	   (authtype && authtype_requires_creds(authtype)) ||
> +	   (!authtype && (auth_required & LDAP_AUTH_REQUIRED)) ||
> +	   (auth_required & LDAP_AUTH_AUTODETECT)) {
> +#endif
>   		char *s1 = NULL, *s2 = NULL;
>   		ret = get_property(logopt, root, "user",  &user);
>   		ret |= get_property(logopt, root, "secret", &s1);
>   		ret |= get_property(logopt, root, "encoded_secret", &s2);
>   		if (ret != 0 || (!user || (!s1 && !s2))) {
>   auth_fail:
> -			error(logopt,
> -			      MODPREFIX
> -			      "%s authentication type requires a username "
> -			      "and a secret.  Please fix your configuration "
> -			      "in %s.", authtype, auth_conf);
> -			free(authtype);
> +			if (auth_required == LDAP_AUTH_USESIMPLE)
> +				error(logopt,
> +				      MODPREFIX
> +				      "Simple authentication method requires a username "

Above and below *type* instead of *method* is used.

> +				      "and a secret.  Please fix your configuration "
> +				      "in %s.", auth_conf);
> +			else if (authtype && authtype_requires_creds(authtype))
> +				error(logopt,
> +				      MODPREFIX
> +				      "%s authentication type requires a username "
> +				      "and a secret.  Please fix your configuration "
> +				      "in %s.", authtype, auth_conf);
> +			else
> +				error(logopt,
> +				      MODPREFIX
> +				      "SASL authentication type auto-selection requires a "
> +				      "username and a secret.  Please fix your configuration "
> +				      "in %s.", auth_conf);
> +			if (authtype)
> +				free(authtype);
>   			if (user)
>   				free(user);
>   			if (s1)


Kind regards,

Paul
