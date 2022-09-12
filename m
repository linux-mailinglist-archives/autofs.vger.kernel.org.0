Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775535B5677
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 10:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiILIko (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Sep 2022 04:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiILIkn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Sep 2022 04:40:43 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DE3220EF
        for <autofs@vger.kernel.org>; Mon, 12 Sep 2022 01:40:40 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id e17so11612597edc.5
        for <autofs@vger.kernel.org>; Mon, 12 Sep 2022 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=o5zhLYMs2GascLdRB090/WE340TKY5Ep88MP6WBvtB4=;
        b=JV0DyIRYsrjAdfBcSUa9R2r73B+Wj4kKsyOrofLMJwS9Jro8Hy6T7BeJe4/heQlGAp
         LsfeluwCSKvonMtxTFkqaSsjiCW+dpECXA8UW7SbIzLaM9AuAQpx7vDdNPMy6YYSHwpz
         tyrOXbl4okVM1nc7tq+GwFHjLI0ArRiK4eCUdKl0z6XJr+GCvcmrR5JUgRRoNfUakBs8
         opeXPodU1N3PUbzCTS0TWAyNbvMFFL83zOuKdsI8dpG1P3/DkPNGZedUxCRff3Zt4K9F
         V6wCnm4cApp+UTZrrWOdCqMga8NtvmBfhEhlPTHGoigOkloUFEWWY3luXLst+lxVBNif
         XfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o5zhLYMs2GascLdRB090/WE340TKY5Ep88MP6WBvtB4=;
        b=Ah6uCKafPGb+5bZB7b43/FmNuD7OEXfhqNv86QZy8Pa3WTZ7SJM4hQZaUPkzmKTFwZ
         bgUwLcz+xVrv23jn4fgjOmScg/WpOoHWsXeoXRa02k1srwul5cz+WKWFgHZXGWmHojw+
         b0+Q1erYVukiBLFrgQCYGVg9Rhira6LBr7Rjq+Wu0VIjk6Ru2oQND7DBPBgwvjTMQ7Aw
         Tm6rMB6+bAeVqaecuw/Dqm4k0wVVQ1Lv84Ma9/9gnRgEkNsW1Rcj8JVFgsz3dJhXKnj1
         ENEBOt1luSteWzr8AFCzuRiK3Cfce69Ym8fRmneTqVuQWiiU0WiZDwTi+fsjfDzL6T0b
         QgWQ==
X-Gm-Message-State: ACgBeo0SjzB9Pcjt3B/Ma281NfCvElq+yscJxF14GD/SbMSULvSFOTzw
        +hiH0Yg7tkCPKHw9D1s80LilQRtRFQ==
X-Google-Smtp-Source: AA6agR5Ms8obmuk0vLbiy6r74IPSomLyQwIoZT9Exfo/SLUeS/FZLRwPy7rtPDL7WaUekLgJh4QJGw==
X-Received: by 2002:aa7:d150:0:b0:44e:3c06:d719 with SMTP id r16-20020aa7d150000000b0044e3c06d719mr21610823edo.265.1662972039033;
        Mon, 12 Sep 2022 01:40:39 -0700 (PDT)
Received: from [192.168.254.199] (dynamic-077-182-163-062.77.182.pool.telefonica.de. [77.182.163.62])
        by smtp.gmail.com with ESMTPSA id z13-20020a1709060acd00b0077d371a8f29sm1580990ejf.204.2022.09.12.01.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 01:40:38 -0700 (PDT)
Message-ID: <147a772c-c180-09d6-729e-46b731821241@gmail.com>
Date:   Mon, 12 Sep 2022 10:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
Content-Language: en-GB
To:     autofs@vger.kernel.org
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
 <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Paul,

thank you for reviewing the patch. My understanding of your comment is 
to align the notation and use authentication "type" or "method". Is this 
correct?

In general, IANA and IETF define SASL authentication mechanisms. For 
LDAP people talk about different types LDAP authentication calls: simple 
bind, SASL bind, mixed bind type.
In autofs LDAP configuration users can specify the SASL mechanism using 
attribute authtype and the authentication bind call type using parameter 
authrequired.

I'm not sure how to proceed. Maybe we should use:
- "Simple authentication requires ..."
- "%s authentication requires ..." (e. g. SCRAM-SHA-256 authentication 
requires ...)
- "SASL authentication mechanism auto-selection requires ..."

What do you think?

Kind regards

Thomas

On 12.09.22 07:18, Paul Menzel wrote:
> Dear Thomas,
>
>
> Thank you for your patch. Two minor things below.
>
> Am 12.09.22 um 02:58 schrieb ThomasReim:
>> From: Thomas Reim <reimth@gmail.com>
>>
>> SASL mechanism auto-selection using ldap_sasl_interactive_bind() is 
>> tricky.
>> The behaviour and the required information depend not only on the 
>> capablities
>
> capabilities
>
>> of Cyrus SASL on the client machine but also on 
>> supportedSASLmechanisms on the
>> LDAP server. The latter information will be requested by libldap 
>> during SASL
>> mechanism negotiation. Current OpenLDAP libldap implementation is to 
>> prefer
>> user credential based SCRAM-* mechanisms on token based GSSAPI. Only 
>> exception
>> are SASL bind requests to servers, e. g. Active Directory domain 
>> controllers,
>> that have disabled all SASL mechanisms, which rely on user credential 
>> transfer
>> between client and directory server.
>>
>> Current autofs implementation fetches user credential information 
>> from LDAP
>> authentication configuration file for LDAP simple binds or if users 
>> explicitly
>> specify a user credential based authentication mechanism (authtype).
>>
>> This patch makes specification of user credentials mandatory for SASL 
>> mechanism
>> auto-detection using ldap_sasl_interactive_bind(). Users can then 
>> omit SASL
>> authtype specification and automount will auto-select the best suited 
>> user
>> credential based SASL mechanism supported by client and LDAP server.
>> If authtype="GSSAPI" is specified together with 
>> authrequired="autodetect"
>> automount will obtain a Kerberos ticket-granting ticket and bind to 
>> all Active
>> Directory servers or use the specified user credentials to bind to 
>> all other
>> LDAP servers that also support user credential based SASL mechanisms.
>>
>> The patch is backward compatible to implementations that use autofs 
>> function
>> sasl_choose_mech(). The strategy of this function is to force users 
>> to specify
>> the SASL mechanism (authtype) if user credentials shall be used for 
>> SASL binding
>> and only perform auto-selection for server supported mechanisms, 
>> which are not
>> based on user credentials.
>>
>> Signed-off-by: Thomas Reim <reimth@gmail.com>
>> ---
>>   modules/lookup_ldap.c | 45 ++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 36 insertions(+), 9 deletions(-)
>>
>> diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
>> index e4cc32b..f2e553a 100644
>> --- a/modules/lookup_ldap.c
>> +++ b/modules/lookup_ldap.c
>> @@ -644,14 +644,14 @@ static int do_bind(unsigned logopt, struct 
>> ldap_conn *conn,
>>               sasl_flags = LDAP_SASL_QUIET;
>>           }
>>   -        debug(logopt, "Attempting sasl bind with mechanism %s", 
>> ctxt->sasl_mech);
>> -
>>           if (ctxt->auth_required & LDAP_AUTH_AUTODETECT) {
>>               if (ctxt->sasl_mech) {
>>                   free(ctxt->sasl_mech);
>>                   ctxt->sasl_mech = NULL;
>>               }
>> -        }
>> +            debug(logopt, "Attempting sasl bind with mechanism 
>> auto-select");
>> +        } else
>> +            debug(logopt, "Attempting sasl bind with mechanism %s", 
>> ctxt->sasl_mech);
>>             /*
>>            *  If LDAP_AUTH_AUTODETECT is set, it means that there was no
>> @@ -1445,20 +1445,47 @@ int parse_ldap_config(unsigned logopt, struct 
>> lookup_context *ctxt)
>>           goto out;
>>       }
>>   +#ifndef WITH_LDAP_CYRUS_SASL
>>       if (auth_required == LDAP_AUTH_USESIMPLE ||
>>          (authtype && authtype_requires_creds(authtype))) {
>> +#else
>> +    /*
>> +     * OpenLDAP with Cyrus SASL needs user credentials for
>> +     * SASL mechanism auto-selection in following cases:
>> +     * (a) LDAP_AUTH_AUTODETECT
>> +     * (b) LDAP_AUTH_REQUIRED but no SASL mechanism specified
>> +     */
>> +    if (auth_required == LDAP_AUTH_USESIMPLE ||
>> +       (authtype && authtype_requires_creds(authtype)) ||
>> +       (!authtype && (auth_required & LDAP_AUTH_REQUIRED)) ||
>> +       (auth_required & LDAP_AUTH_AUTODETECT)) {
>> +#endif
>>           char *s1 = NULL, *s2 = NULL;
>>           ret = get_property(logopt, root, "user",  &user);
>>           ret |= get_property(logopt, root, "secret", &s1);
>>           ret |= get_property(logopt, root, "encoded_secret", &s2);
>>           if (ret != 0 || (!user || (!s1 && !s2))) {
>>   auth_fail:
>> -            error(logopt,
>> -                  MODPREFIX
>> -                  "%s authentication type requires a username "
>> -                  "and a secret.  Please fix your configuration "
>> -                  "in %s.", authtype, auth_conf);
>> -            free(authtype);
>> +            if (auth_required == LDAP_AUTH_USESIMPLE)
>> +                error(logopt,
>> +                      MODPREFIX
>> +                      "Simple authentication method requires a 
>> username "
>
> Above and below *type* instead of *method* is used.
>
>> +                      "and a secret. Please fix your configuration "
>> +                      "in %s.", auth_conf);
>> +            else if (authtype && authtype_requires_creds(authtype))
>> +                error(logopt,
>> +                      MODPREFIX
>> +                      "%s authentication type requires a username "
>> +                      "and a secret.  Please fix your configuration "
>> +                      "in %s.", authtype, auth_conf);
>> +            else
>> +                error(logopt,
>> +                      MODPREFIX
>> +                      "SASL authentication type auto-selection 
>> requires a "
>> +                      "username and a secret.  Please fix your 
>> configuration "
>> +                      "in %s.", auth_conf);
>> +            if (authtype)
>> +                free(authtype);
>>               if (user)
>>                   free(user);
>>               if (s1)
>
>
> Kind regards,
>
> Paul


