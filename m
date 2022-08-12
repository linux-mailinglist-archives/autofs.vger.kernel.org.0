Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C4B591431
	for <lists+autofs@lfdr.de>; Fri, 12 Aug 2022 18:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbiHLQrE (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 12 Aug 2022 12:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbiHLQrD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 12 Aug 2022 12:47:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399FD883DC
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 09:47:01 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e13so1994422edj.12
        for <autofs@vger.kernel.org>; Fri, 12 Aug 2022 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wQnfyr4wToNFOlFXRBL3zdmqd34cw81R0flJ2Hz+1Sg=;
        b=MvqV7VL27foLDpGXHIpWMhpGCPO2k9QpwJwGnb6paPOdFVyIYFnFal6iKlgx7NjRs7
         HeTGr/41zyoxTe6yVe0dDtURk3CqocuIrSe1f9HtkmGGO//Asu2ihaLGDJXXOJ8Wv6ls
         KLzSH4RzOoZF7xjRSRHbi1l2ZIv8CzjhLRJ3xTC+jKph+26ObldpM1yvrjJvR5jJ0pcg
         g9FZaSbz2aa88mHdJy6sBw+rlOXGTiACrq1eAVMk/w+X+4TpncVUuiE/MqngebJjhpN7
         FdgENILX5TzIxr+tExkoGONTlDDnoBvWOmqTgfLojmZCyZAG6RBkb0AAxJ386lHo7qZA
         1Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wQnfyr4wToNFOlFXRBL3zdmqd34cw81R0flJ2Hz+1Sg=;
        b=dhjx5M2Qf36z5pwqctO5zzZKQu0L/30ZfvIzZ7DVm4QG3lLSGqZVZMZzjVpVNNxjzQ
         7SLhS7iOP1ifdPM5Ft0knwPL6l9KXb4+bYalxKReixxah5qKnNF9LaO9BFNbN6UJ0ljO
         Vyw9oCMSfpAl4dIipfmIiElKQ9uZGcMQxFrwAWegGmR9JG6HCVcNCKiJCO9oMQfveOZB
         XZOHVHb6qVu38lxxCkZEV8DO6py1v+URY+nz/xGXefmEIUrq8WXkuJz4ClqYIgu57/7Y
         dk6yFwKYDx/PwwnVkm8i4UK8IZhCac9egcRMA7il75JvB5KZ0WinJ4Af450eoKhbD9xJ
         vwyQ==
X-Gm-Message-State: ACgBeo1O8DMFnozyBbIJqWfOlgrn2ZFOid5gYOIikjnpsv+e4Q2ctnmN
        H9+Qhp3q0g29U+eswxjheoVLT7sgMtyo
X-Google-Smtp-Source: AA6agR42XwNM1UEdA889x4MOOMpPoZq3h7c8IYIKsRmq16jXs6IRAsiP5lv5UJ3hl4rIqM4qq1YAKA==
X-Received: by 2002:aa7:d354:0:b0:43d:7c64:3383 with SMTP id m20-20020aa7d354000000b0043d7c643383mr4448857edr.148.1660322819505;
        Fri, 12 Aug 2022 09:46:59 -0700 (PDT)
Received: from [192.168.254.199] ([77.182.183.173])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b00730af3346d6sm952170ejm.212.2022.08.12.09.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 09:46:59 -0700 (PDT)
Message-ID: <19933e9c-1cb0-e087-948a-0bae8fa67cff@gmail.com>
Date:   Fri, 12 Aug 2022 18:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
Content-Language: en-GB
To:     autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <20220809115608.107767-4-reimth@gmail.com>
 <d98ac4bc-6699-19d9-4fe3-4ce2bf300575@themaw.net>
Cc:     Ian Kent <raven@themaw.net>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <d98ac4bc-6699-19d9-4fe3-4ce2bf300575@themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 11.08.22 04:17, Ian Kent wrote:
> On 9/8/22 19:56, ThomasReim wrote:
>> From: Thomas Reim <reimth@gmail.com>
>>
>> Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode 
>> using an
>> SASL data security layer according to IETF RFC 2078. This security layer
>> provides for traffic encryption during authentication and 
>> authorization towards
>> an OpenLDAP based server and for subsequent encryption of data 
>> traffic for the
>> LDAP session. Current automounter does not implement SASL security layer
>> encryption and only relies on TLS to protect LDAP communication.
>>
>> OpenLDAP libldap if compiled with Cyrus SASL supports negotiation of 
>> an SASL
>> data security layer based encryption of LDAP traffic. libldap also 
>> provides
>> automatic negotiation of the best suited SASL mechanism taking into 
>> account
>> application required defaults.
>>
>> Since version 4.4 Samba AD domain controllers default settings only 
>> allow for
>> simple SASL binds over TLS encrypted connections or SASL binds with 
>> sign or
>> seal, i. e. data security layer encryption, over unencrypted 
>> connections.
>> Therefore, current automounter cannot fetch autofs maps from Samba AD 
>> DCs
>> using SASL anymore without setting Samba configuration parameter 
>> "ldap server
>> require strong auth" to "no" or "allow_sasl_over_tls".
>>
>> This patch updates automounter to let OpenLDAP and Cyrus SASL handle 
>> SASL
>> binding and traffic security configuration. Proposed changes are 
>> backward
>> compatible for clients that use LDAP libaries different from LDAP. 
>> When using
>> SASL mechanism GSSAPI or simple authentication with TLS encryption 
>> automounter
>> seamlessly interworks with latest Samba AD DCs.
>
> There's a few things in this one that go against what my preferences
>
> for coding style. They are minor ...
>
>
> I also have a couple of questions about one part of the do_bind()
>
> changes.
>
>
> Except for the questions this looks good.
>
>
>>
>> Signed-off-by: Thomas Reim <reimth@gmail.com>
>> ---
>>   include/lookup_ldap.h |   6 ++
>>   modules/cyrus-sasl.c  | 148 +++++++++++++++++++++++++++++++++++++++++-
>>   modules/lookup_ldap.c | 102 ++++++++++++++++++++++++++++-
>>   3 files changed, 253 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
>> index 3a10778..9c3e862 100644
>> --- a/include/lookup_ldap.h
>> +++ b/include/lookup_ldap.h
>> @@ -129,6 +129,12 @@ int autofs_sasl_bind(unsigned logopt, struct 
>> ldap_conn *conn, struct lookup_cont
>>   void autofs_sasl_unbind(struct ldap_conn *conn, struct 
>> lookup_context *ctxt);
>>   void autofs_sasl_dispose(struct ldap_conn *conn, struct 
>> lookup_context *ctxt);
>>   void autofs_sasl_done(void);
>> +int sasl_do_kinit(unsigned logopt, struct lookup_context *ctxt);
>> +#ifdef WITH_LDAP_CYRUS_SASL
>> +void autofs_ldap_sasl_freedefs(void *defaults);
>> +void *autofs_ldap_sasl_defaults(LDAP *ld, char *mech, char *realm, 
>> char *authcid, char *passwd, char *authzid );
>> +int autofs_ldap_sasl_interact(LDAP *ld, unsigned flags, void 
>> *defaults, void *in );
>> +#endif
>>   /* cyrus-sasl-extern */
>>   int do_sasl_extern(LDAP *ldap, struct lookup_context *ctxt);
>>   #endif
>> diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
>> index ae046e0..0c4ee58 100644
>> --- a/modules/cyrus-sasl.c
>> +++ b/modules/cyrus-sasl.c
>> @@ -233,6 +233,148 @@ get_server_SASL_mechanisms(unsigned logopt, 
>> LDAP *ld)
>>       return mechanisms;
>>   }
>>   +#ifdef WITH_LDAP_CYRUS_SASL
>> +typedef struct autofs_ldap_sasl_defaults_s {
>> +    char *mech;
>> +    char *realm;
>> +    char *authcid;
>> +    char *passwd;
>> +    char *authzid;
>> +} ldapSASLdefaults;
>> +
>> +
>> +void
>> +autofs_ldap_sasl_freedefs(void *defaults)
>
> I try and keep these on one line.
>
>
> I use the function parameters to break the line if there's
>
> more than one, otherwise these days, I'd let the line grow
>
> longer.


Understood. I hope that I've understood your preferences and made all 
changes accordingly.


>
>
>> +{
>> +    ldapSASLdefaults *defs = defaults;
>> +
>> +    assert(defs != NULL);
>> +
>> +    if (defs->mech) ber_memfree(defs->mech);
>> +    if (defs->realm) ber_memfree(defs->realm);
>> +    if (defs->authcid) ber_memfree(defs->authcid);
>> +    if (defs->passwd) ber_memfree(defs->passwd);
>> +    if (defs->authzid) ber_memfree(defs->authzid);
>
> The if target always on a new line please.


Corrected!


>
>
>> +
>> +    ber_memfree(defs);
>> +}
>> +
>> +void *
>> +autofs_ldap_sasl_defaults(LDAP *ld,
>> +                    char *mech,
>> +                    char *realm,
>> +                    char *authcid,
>> +                    char *passwd,
>> +                    char *authzid)
>> +{
>> +    ldapSASLdefaults *defaults;
>> +
>> +    defaults = ber_memalloc(sizeof(ldapSASLdefaults));
>> +
>> +    if (defaults == NULL) return NULL;
>> +
>> +    defaults->mech = mech ? ber_strdup(mech) : NULL;
>> +    defaults->realm = realm ? ber_strdup(realm) : NULL;
>> +    defaults->authcid = authcid ? ber_strdup(authcid) : NULL;
>> +    defaults->passwd = passwd ? ber_strdup(passwd) : NULL;
>> +    defaults->authzid = authzid ? ber_strdup(authzid) : NULL;
>> +
>> +    if (defaults->mech == NULL) {
>> +        ldap_get_option(ld, LDAP_OPT_X_SASL_MECH, &defaults->mech);
>> +    }
>
> Now, this is picky, I don't like brackets when there's just a
>
> single line in the if target code block.


Corrected!


>
>> +    if (defaults->realm == NULL) {
>> +    ldap_get_option(ld, LDAP_OPT_X_SASL_REALM, &defaults->realm);
> Hopefully you'll spot this when making the changes.

Corrected!


>> +    }
>> +    if (defaults->authcid == NULL) {
>> +        ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHCID, 
>> &defaults->authcid);
>> +    }
>> +    if (defaults->authzid == NULL) {
>> +        ldap_get_option(ld, LDAP_OPT_X_SASL_AUTHZID, 
>> &defaults->authzid);
>> +    }
>> +
>> +    return defaults;
>> +}
>> +
>> +static int
>> +interaction(unsigned flags,
>> +            sasl_interact_t *interact,
>> +            ldapSASLdefaults *defaults)
>> +{
>> +    switch (interact->id) {
>> +    case SASL_CB_GETREALM:
>> +        if (defaults->realm) {
>> +            interact->result = defaults->realm;
>> +        } else if (interact->defresult) {
>> +            interact->result = interact->defresult;
>> +        } else {
>> +            interact->result = "";
>> +        }
>> +        interact->len = strlen(interact->result);
>> +        break;
>> +    case SASL_CB_USER:
>> +        if (defaults->authzid) {
>> +            interact->result = defaults->authzid;
>> +        } else if (interact->defresult) {
>> +            interact->result = interact->defresult;
>> +        } else {
>> +            interact->result = "";
>> +        }
>> +        interact->len = strlen(interact->result);
>> +        break;
>> +    case SASL_CB_PASS:
>> +        if (defaults->passwd) {
>> +            interact->result = defaults->passwd;
>> +        } else if (interact->defresult) {
>> +            interact->result = interact->defresult;
>> +        } else {
>> +            interact->result = "";
>> +        }
>> +        interact->len = strlen(interact->result);
>> +        break;
>> +    case SASL_CB_AUTHNAME:
>> +        if (defaults->authcid) {
>> +            interact->result = defaults->authcid;
>> +        } else if (interact->defresult) {
>> +            interact->result = interact->defresult;
>> +        } else {
>> +            interact->result = "";
>> +        }
>> +        interact->len = strlen(interact->result);
>> +        break;
>> +    }
>> +
>> +    return LDAP_SUCCESS;
>> +}
>> +
>> +int autofs_ldap_sasl_interact(LDAP *ld,
>> +                        unsigned flags,
>> +                        void *defaults,
>> +                        void *interact)
>> +{
>> +    int rc = LDAP_SUCCESS;
>> +    sasl_interact_t *in = (sasl_interact_t*) interact;
>> +    ldapSASLdefaults *deflts = (ldapSASLdefaults*) defaults;
>> +
>> +    if (!ld)
>> +        return LDAP_PARAM_ERROR;
>> +
>> +    while (in->id != SASL_CB_LIST_END) {
>> +        switch (in->id) {
>> +        case SASL_CB_NOECHOPROMPT:
>> +        case SASL_CB_ECHOPROMPT:
>> +            return LDAP_UNAVAILABLE;
>> +        default:
>> +        int rc = interaction(flags, in, deflts);
>> +            if (rc)  return rc;
>> +            break;
>> +        }
>
> Mmm ... rc shadows rc above, that's not good IMHO.
>
> Could it have a different name perhaps.


Sorry, my mistake. There's no need for doubled declaration.

Corrected!


>
>
> I always like declarations at the top of code blocks followed
>
> by a blank line. So the second rc would be at the top of the
>
> while or function itself. Perhaps a single declaration and
>
> re-initialize it of each iteration.
>
>
> And, being even more picky, I often try to put declarations in
>
> longest to shortest order but equally often fail so if you don't
>
> change that I'll pretend I don't see it.


Corrected!

I've tried to do my best. :-)


>
>> +        in++;
>> +    }
>> +
>> +    return LDAP_SUCCESS;
>> +}
>> +#endif
>> +
>>   /*
>>    *  Returns 0 upon successful connect, -1 on failure.
>>    */
>> @@ -989,12 +1131,12 @@ void autofs_sasl_dispose(struct ldap_conn 
>> *conn, struct lookup_context *ctxt)
>>               fatal(status);
>>           return;
>>       }
>> -
>> +#ifndef WITH_LDAP_CYRUS_SASL
>>       if (conn && conn->sasl_conn) {
>>           sasl_dispose(&conn->sasl_conn);
>>           conn->sasl_conn = NULL;
>>       }
>> -
>> +#endif
>
> This is a bit harder.
>
>
> I like blank lines for readability but don't always put them
>
> in too. In this case I think the blank line above the #ifndef
>
> is better kept.
>

Corrected!


>
>>       if (ctxt->kinit_successful) {
>>           if (--krb5cc_in_use || ctxt->client_cc)
>>               ret = krb5_cc_close(ctxt->krb5ctxt, ctxt->krb5_ccache);
>> @@ -1095,7 +1237,9 @@ int autofs_sasl_client_init(unsigned logopt)
>>    */
>>   void autofs_sasl_done(void)
>>   {
>> +#ifndef WITH_LDAP_CYRUS_SASL
>>       sasl_done();
>> +#endif
>>       return;
>>   }
>>   diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
>> index 3e43fc0..68b42d4 100644
>> --- a/modules/lookup_ldap.c
>> +++ b/modules/lookup_ldap.c
>> @@ -223,11 +223,13 @@ int __unbind_ldap_connection(unsigned logopt,
>>       if (ctxt->use_tls == LDAP_TLS_RELEASE)
>>           ctxt->use_tls = LDAP_TLS_INIT;
>>   #ifdef WITH_SASL
>> +#ifndef WITH_LDAP_CYRUS_SASL
>>       if (ctxt->auth_required & LDAP_NEED_AUTH)
>>           autofs_sasl_unbind(conn, ctxt);
>>       /* No, sasl_dispose does not release the ldap connection
>>        * unless it's using sasl EXTERNAL
>>        */
>> +#endif
>>   #endif
>>       if (conn->ldap) {
>>           rv = ldap_unbind_ext(conn->ldap, NULL, NULL);
>> @@ -574,15 +576,111 @@ static int do_bind(unsigned logopt, struct 
>> ldap_conn *conn,
>>              const char *uri, struct lookup_context *ctxt)
>>   {
>>       char *host = NULL, *nhost;
>> -    int rv;
>> +    int rv, result;
>>     #ifdef WITH_SASL
>> +#ifdef WITH_LDAP_CYRUS_SASL
>> +    LDAP_SASL_INTERACT_PROC *proc = NULL;
>> +    LDAPMessage *ldap_res = NULL;
>> +    void *defaults;
>> +    const char *chosen_mech = NULL;
>> +    const char *rmech = NULL;
>> +    unsigned sasl_flags = LDAP_SASL_AUTOMATIC;
>> +    int msgid, err;
>> +    char *info = NULL;
>> +#endif
>>       debug(logopt, MODPREFIX "auth_required: %d, sasl_mech %s",
>>             ctxt->auth_required, ctxt->sasl_mech);
>>         if (ctxt->auth_required & LDAP_NEED_AUTH) {
>> +#ifndef WITH_LDAP_CYRUS_SASL
>>           rv = autofs_sasl_bind(logopt, conn, ctxt);
>>           debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
>
> I like this, I like to always try and put the smaller block at the top
>
> of multiple condition checks including macro defines.
>
>
>> +#else
>> +        if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 
>> 6)) {
>> +            rv = sasl_do_kinit(logopt, ctxt);
>> +            if (rv != 0)
>> +                return 0;
>> +            sasl_flags = LDAP_SASL_QUIET;
>> +        }
>> +
>> +        debug(logopt, "Attempting sasl bind with mechanism %s", 
>> ctxt->sasl_mech);
>> +
>> +        if (ctxt->auth_required & LDAP_AUTH_AUTODETECT) {
>> +            if (ctxt->sasl_mech) {
>> +                free(ctxt->sasl_mech);
>> +                ctxt->sasl_mech = NULL;
>> +            }
>> +        }
>> +
>> +        /*
>> +         *  If LDAP_AUTH_AUTODETECT is set, it means that there was no
>> +         *  mechanism specified in the configuration file or auto
>> +         *  selection has been requested, so try to auto-select an
>> +         *  auth mechanism.
>> +         */
>> +
>
> So this type of construct is often problematic and causes pain down
>
> the track so let me ask some silly questions ...
>
>
>> +        defaults = autofs_ldap_sasl_defaults(conn->ldap, 
>> ctxt->sasl_mech, NULL, ctxt->user, ctxt->secret, NULL);
>
> This is longer than the 100 chars I like to keep lines too but I think
>
> I'd like to keep this how it is.


After playing a little bit around with parameter breaking I tend to put 
the user related parameters into a second line.

Please check.


>
>
>> +        do {
>> +            rv = ldap_sasl_interactive_bind(conn->ldap, NULL, 
>> ctxt->sasl_mech,
>> +                                            NULL, NULL, sasl_flags, 
>> autofs_ldap_sasl_interact, defaults,
>> +                                            ldap_res, &rmech, &msgid);
>> +            if (rmech) {
>> +                chosen_mech = rmech;
>> +            }
>> +            if (rv != LDAP_SASL_BIND_IN_PROGRESS)
>> +                break;
>
> If the above conditional is true are we "sure" ldap_res has not
>
> been allocated.
>
>
> ldap_res is initialized above but not re-initialized after using it
>
> so couldn't it be wrong when it's used on a subsequent iteration?
>
> Perhaps it should be re-initialized at the end of each iteration?
>
>
> It may be that ldap_sasl_interactive_bind() sets it to NULL but
>
> we shouldn't count on that.


This is tricky. OpenLDAP client tools do not set to NULL, FreeRADIUS does.

I would follow your proposal to set ldap_res = NULL after freeing LDAP 
message.

In addition, I've added a code block after LDAP interactive bind has 
been completed that parses the final LDAP result and checks it for 
errors, then frees LDAP message.

Furthermore, the updated code will free LDAP message also in case of 
failures.

We should then be on the safe side.


>
>
>> +
>> +            ldap_msgfree(ldap_res);
>> +
>> +            if (ldap_result(conn->ldap, msgid, LDAP_MSG_ALL, NULL, 
>> &ldap_res) == -1 || !ldap_res) {
>
> Perhaps a bit too long ...
>
> Wouldn't it be better to put the !ldap_res first so the function call
>
> isn't made on NULL, and the function call on a new line might be better.
>
> That would help with my shortest to longest fixation too.


Yeah, the line is way to long. Breaking it into two lines does not look 
better. But we have to keep the proposed sequence here,

to cover cases where ldap_result() returns 0 (timeout) and sets ldap_res 
to NULL.


>
>
>> + ldap_get_option(conn->ldap, LDAP_OPT_RESULT_CODE, (void*)&err);
>> +                ldap_get_option(conn->ldap, 
>> LDAP_OPT_DIAGNOSTIC_MESSAGE, (void*)&info);
>> +                error(logopt, MODPREFIX "ldap_sasl_interactive_bind 
>> failed with error %d",
>> +                      err);
>> +                debug(logopt, "ldap_sasl_interactive_bind: %s", info);
>> +                ldap_memfree(info);
>> +                return 0;
>> +            }
>> +        } while ( rv == LDAP_SASL_BIND_IN_PROGRESS );
>> +
>> +        autofs_ldap_sasl_freedefs(defaults);
>> +
>> +        if (rv != LDAP_SUCCESS) {
>> +            ldap_get_option(conn->ldap, LDAP_OPT_DIAGNOSTIC_MESSAGE, 
>> (void*)&info );
>> +            error(logopt, MODPREFIX "ldap_sasl_interactive_bind 
>> failed with error %d",
>> +                  rv);
>> +            debug(logopt, "ldap_sasl_interactive_bind: %s", info);
>> +            ldap_memfree(info);
>> +            return 0;
>> +        }
>> +
>> +        /* Conversation was completed successfully by now */
>> +        char *data;
>> +        ber_len_t *ssf;
>
> Again, I always look for these at the top of code blocks or the
>
> top of the function and there's those brackets.


Corrected!


>
>
> If it's hard to find the the declarations it's usually because the
>
> function is too long which happens all too often but we should still
>
> try not to let it happen.
>
>
>> +        result = ldap_get_option(conn->ldap, 
>> LDAP_OPT_X_SASL_USERNAME, &data);
>> +        if (result == LDAP_OPT_SUCCESS && data && *data) {
>> +            debug(logopt, "SASL username: %s", data );
>> +        }
>> +        data = NULL;
>> +        result = ldap_get_option(conn->ldap, 
>> LDAP_OPT_X_SASL_AUTHCID, &data);
>> +        if (result == LDAP_OPT_SUCCESS && data && *data) {
>> +            debug(logopt, "SASL authcid: %s", data);
>> +        }
>> +        data = NULL;
>> +        result = ldap_get_option(conn->ldap, 
>> LDAP_OPT_X_SASL_AUTHZID, &data);
>> +        if (result == LDAP_OPT_SUCCESS && data && *data) {
>> +            debug(logopt, "SASL authzid: %s", data);
>> +        }
>> +        ssf = NULL;
>> +        result = ldap_get_option(conn->ldap, LDAP_OPT_X_SASL_SSF, 
>> &ssf);
>> +        if (result == LDAP_OPT_SUCCESS && ssf) {
>> +            debug(logopt, "SASL SSF: %lu", (unsigned long) ssf);
>> +        }
>> +
>> +        debug(logopt, "sasl bind with mechanism %s succeeded",
>> +              chosen_mech);
>> +#endif
>>       } else {
>>           rv = bind_ldap_simple(logopt, conn->ldap, uri, ctxt);
>>           debug(logopt, MODPREFIX "ldap simple bind returned %d", rv);
>> @@ -1793,6 +1891,7 @@ static int do_init(const char *mapfmt,
>>       }
>>     #ifdef WITH_SASL
>> +#ifndef WITH_LDAP_CYRUS_SASL
>>       /* Init the sasl callbacks */
>>       ldapinit_mutex_lock();
>>       if (!autofs_sasl_client_init(LOGOPT_NONE)) {
>> @@ -1801,6 +1900,7 @@ static int do_init(const char *mapfmt,
>>           return 1;
>>       }
>>       ldapinit_mutex_unlock();
>> +#endif
>>   #endif
>>         if (is_amd_format)


In order to make review easier for you a subsequent mail will outline 
the proposed changed to the provided patch (patch-for-patch format).


Thomas

