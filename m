Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327A45B525B
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 02:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiILAyx (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 20:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiILAyw (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 20:54:52 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C31AD93
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:54:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id c11so12896273wrp.11
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kIR6s8/NxJXfRYzqO1O1I0wga9iXq+vWmqntiER/k2g=;
        b=kCjdHyVKjqgwjTasBYAB1gX2eFsYsM05mxoOAJRb31HM1YMwThvkXv5q/VPKbcdKSl
         Or5J6leaxn/mjGNubDQAo86B5m0+u9NgUDMShOjNKdBmLBG/Gwaf3hcybn3rZ7cDC3vK
         9pLTYBA2YnGUJRJ/0FP/EPUMoVA3khAD+gxE+vuX6bpsp84bSen+r6OOyAVu7AkUGl9F
         GpefZS0ejUVKYEWGpIKW33k4ABaJ8gIAJ8PB0QQlBMpVVjyZ1P/rIWYVLpvils5gFzSR
         oIrTCU31N7z1hU2ISaaJIQcwmaoeW6Di274ssoahIfDtMqtks1qgneKhIn3B+ZpuVYMJ
         sHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kIR6s8/NxJXfRYzqO1O1I0wga9iXq+vWmqntiER/k2g=;
        b=ziZ5bwB4u2svjRZYvldlwiHYJ0hp+aemC+GMpPJpA0jE3zlSZUF88joeeMj3UeOsOk
         1tUKpfcWG6n+3WgXCX4vkp5aQEWWUJbfkJU1uAdbIrwVU/TUspsldG0lZLxsynUnadGQ
         Wn2fsDtj0NqSVM63zufinOUkOTmqvP7x01ErBcCSDxz7f+EflJQJipd1D+es4LvC6s0R
         Ui6Bx08bVaynoEVYeX1T88z0SodCcwFqqgTmEuJq9ph0OMvKjKvOFsE4LqlZEwodXwgF
         AEarHtdgbk2fHCaLJ8OcJy0LjqzSy8aHXcZcJQdyoKQp2Zz/CecAAYIz+Xy7aXoHURdl
         wM8g==
X-Gm-Message-State: ACgBeo38k0zNo4xWRRSfDjYonJsuOhhSA1y+K96o8Fx93kfSD39HRqI3
        76+BmDZ6Rt59mg9mQYPbBi2Kd9AftA==
X-Google-Smtp-Source: AA6agR6BKUIpt5fzqi+/ANg3NeiMCnJk0PtXTLyTk/S505Tdv0X2NeWQPw6WTlU9vWm26hDXwh2O4g==
X-Received: by 2002:a5d:6708:0:b0:226:ea99:5bce with SMTP id o8-20020a5d6708000000b00226ea995bcemr13842486wru.37.1662944088738;
        Sun, 11 Sep 2022 17:54:48 -0700 (PDT)
Received: from [192.168.254.199] (dynamic-077-190-097-057.77.190.pool.telefonica.de. [77.190.97.57])
        by smtp.gmail.com with ESMTPSA id k8-20020adfe3c8000000b0021e13efa17esm5885105wrm.70.2022.09.11.17.54.48
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 17:54:48 -0700 (PDT)
Message-ID: <013b4d34-ca77-5dac-d846-778ce71cfeb5@gmail.com>
Date:   Mon, 12 Sep 2022 02:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
Content-Language: en-GB
To:     autofs@vger.kernel.org
References: <20220911144139.3525598-1-reimth@gmail.com>
 <20220911144139.3525598-3-reimth@gmail.com>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <20220911144139.3525598-3-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I'm sorry but I have to revise this patch. SASL mechanism auto-selection is really tricky. automount requires auto-selection of the SASL mechanism also if the user specifies authrequired="yes" but does not specify an SASL mechanism to use. This case is missing in the if clause below and ldap_sasl_interactive_bind() will fail to auto-select the mechanism due to missing user credentials.

I will post a second version (v2) of the patches that fix this issue.

On 11.09.22 16:41, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> SASL mechanism auto-selection using ldap_sasl_interactive_bind() is tricky.
> The behaviour and the required information depend not only on the capablities
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
>   modules/lookup_ldap.c | 38 +++++++++++++++++++++++++++++---------
>   1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
> index e4cc32b..160c7a9 100644
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
> @@ -1445,20 +1445,40 @@ int parse_ldap_config(unsigned logopt, struct lookup_context *ctxt)
>   		goto out;
>   	}
>   
> +#ifndef WITH_LDAP_CYRUS_SASL
>   	if (auth_required == LDAP_AUTH_USESIMPLE ||
>   	   (authtype && authtype_requires_creds(authtype))) {
> +#else
> +	if (auth_required == LDAP_AUTH_USESIMPLE ||
> +	   (authtype && authtype_requires_creds(authtype)) ||
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
> +				      "and a secret.  Please fix your configuration "
> +				      "in %s.", auth_conf);
> +			else if (authtype)
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
> +				      "in %s.", authtype, auth_conf);
> +			if (authtype)
> +				free(authtype);
>   			if (user)
>   				free(user);
>   			if (s1)
