Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF33714239
	for <lists+autofs@lfdr.de>; Mon, 29 May 2023 05:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjE2DNQ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 28 May 2023 23:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjE2DNN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 28 May 2023 23:13:13 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7C3B1
        for <autofs@vger.kernel.org>; Sun, 28 May 2023 20:13:12 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 73BAB3200902;
        Sun, 28 May 2023 23:13:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 28 May 2023 23:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:content-type:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1685329991; x=1685416391; bh=liMeZTud0EEGILXy03RRLFpV5vVerx6kO1J
        48Fa/4F8=; b=sbEzabOkIN60tQY+WuOmpL/80WORW3sb5yN6TrO4Bcwdtw0YE1r
        Qdb67b6eqRsBJyvlt6tgb7KPRwXQZQdP6yUb0d9juwn803TwA4k0m+ud6Z6llGWE
        chGFYNiIiTrTj16hwKAxqc5VUGepviNUzayol0RniVwrZVtcHUz/TZFHunnKBBKc
        K+QCvXDjI41lugAkFPmhf+GRQUJmpCZ0r6wW8mI9t3RRR9ZIF4czOWgvJ46EGt14
        YYP5NYAVtlL1i9HxCRmjdzXLrdpYczZloaJahiJ2hYC+5+q4JC6DaJQlGfTo91uH
        n+33Yji2Pu6Y8wMnPBam5dDW3L+31s6Bd1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685329991; x=
        1685416391; bh=liMeZTud0EEGILXy03RRLFpV5vVerx6kO1J48Fa/4F8=; b=g
        tHnTARams+EaMeDbg2S5cfF9FQs2c0BKUa85TEjWkeCRzWYVvUi0/4wbdmXJ9KN/
        tfN0IemWIZ51/cZbrOaxLJAb9V6AW552ZFL0wa4lPAxaMempaMzBh/VXKSNgByHV
        ciqLPrGPX9wa7BO3BteBYFmxUBuTOR692DX+iP1YnO9eJhG+qkNiYM1FWaP1dKqx
        56HiwWKhi5DGLkLSBkEhc5EoU98FZ3zlSYDbIddmLCmCtZflrrrEmNn4guLUtj0z
        n0b4pX4Q2gZcJU8hAI/qjkyb6GTI26nuWrg+00x6BJ8pHnkrEhrebq/0y36hlblJ
        f0hRZ0jI/A3VMYJmsHwdw==
X-ME-Sender: <xms:Rhh0ZIJbCdsd4tdg1qQ9svQKVB7ZJ6dBB2ZSKe3cUvYIuA7YRCF3-g>
    <xme:Rhh0ZILeAAuJqyxVU3szo171M2C-PksfAU8eHOP2BVBEx1RM2h9wbnlpw078non0P
    8dnXo5jPwGX>
X-ME-Received: <xmr:Rhh0ZIvhf0qth3rwi80CbpIEGiJ0ExnQPETK1SCctD2YZqwqyr0hXDGEfaStRfPJqUX3G4bGP7MsVkvCDY-oD5T_ASsGoePJcpnSlPbQgEor-Sj5GGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    evgeegfedtvefgfffhhfdugeevgfdvueevhfdvteektefhteevfefhfedvudeuteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:Rhh0ZFZWHVh3VtfxGenCcZMa5Zi_IgmicgWwtPqlEt_y5MwRCX2Ryg>
    <xmx:Rhh0ZPbKmkcnBWPSad7yPB-bu3NOGcpd6bHnNfg0ek97ygug4lpQsg>
    <xmx:Rhh0ZBAL8H7Y_Zo0zaYEBq1T158IoE0Zh5hQJ2VCNsmNuZ8GaVhqtQ>
    <xmx:Rxh0ZJ2f3Ut9J5RzUia-g-lCfOqwMdl1MqsGUuzXpK5r8Kup8a5ebg>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 May 2023 23:13:09 -0400 (EDT)
Message-ID: <d496f4d8-b71f-a959-06e2-740916bb2a4b@themaw.net>
Date:   Mon, 29 May 2023 11:13:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
To:     Andreas Hasenack <andreas@canonical.com>,
        autofs mailing list <autofs@vger.kernel.org>
References: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
 <166150377330.37723.7093874206401696231.stgit@donald.themaw.net>
 <CANYNYEEL3rv73o+ezPRXfeigacn5vN9O9PGXU6Fysgthfd5BYA@mail.gmail.com>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <CANYNYEEL3rv73o+ezPRXfeigacn5vN9O9PGXU6Fysgthfd5BYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 25/5/23 02:38, Andreas Hasenack wrote:
> Hi all,
>
> resending as my previous email was in html, sorry
>
> On Fri, Aug 26, 2022 at 5:49 AM Ian Kent <raven@themaw.net> wrote:
>> From: Thomas Reim <reimth@gmail.com>
>>
>> From: Thomas Reim <reimth@gmail.com>
>>
>> Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode using an
>> SASL data security layer according to IETF RFC 2078. This security layer
>> provides for traffic encryption during authentication and authorization towards
>> an OpenLDAP based server and for subsequent encryption of data traffic for the
>> LDAP session. Current automounter does not implement SASL security layer
>> encryption and only relies on TLS to protect LDAP communication.
> I was writing a test for this, since we plan to release an autofs
> update with this fix, and noticed that a particular config stopped
> working: `credentialcache` in /etc/autofs_ldap_auth.conf.
>
> For the test I was grabbing a TGT instead of using a keytab, an
> configuring autofs to use that to authenticate against an openldap
> server:
> <autofs_ldap_sasl_conf
>          usetls="no"
>          tlsrequired="no"
>      authrequired="yes"
>      authtype="GSSAPI"
>      clientprinc="ubuntu@LXD"
>      credentialcache="/tmp/krb5cc_0"
> />
>
> Initially openldap was configured to accept connections authenticated
> via sasl and any ssf (including 0, which is the case with autofs).
> Later I would configure the openldap server to reject connections
> authenticated with SASL and an ssf=0, in order to trigger the bug and
> verify the fix (where autofs would be using ssf=256).
>
> Anyway, the above was working with an unpatched autofs:
>
> (...)
> parse_ldap_config: lookup(ldap): user: (null), secret: unspecified,
> client principal: ubuntu@LXD credential cache: /tmp/krb5cc_0
> do_init: parse(sun): init gathered global options: (null)
> do_bind: lookup(ldap): auth_required: 2, sasl_mech GSSAPI
> sasl_do_kinit_ext_cc: using external credential cache for auth: client
> principal ubuntu@LXD
> sasl_do_kinit_ext_cc: external credential cache default principal ubuntu@LXD
> sasl_do_kinit_ext_cc: Kerberos authentication was successful!
> sasl_bind_mech: Attempting sasl bind with mechanism GSSAPI
> sasl_log_func: GSSAPI client step 1
> getuser_func: called with context (nil), id 16385.
> sasl_log_func: GSSAPI client step 1
> getuser_func: called with context (nil), id 16385.
> sasl_log_func: GSSAPI client step 2
> sasl_bind_mech: sasl bind with mechanism GSSAPI succeeded
>
> But not in the patched one:
> (...)
> parse_ldap_config: lookup(ldap): user: (null), secret: unspecified,
> client principal: ubuntu@LXD credential cache: /tmp/krb5cc_0
> do_init: parse(sun): init gathered global options: (null)
> do_bind: lookup(ldap): auth_required: 2, sasl_mech GSSAPI
> sasl_do_kinit: initializing kerberos ticket: client principal ubuntu@LXD
> sasl_do_kinit: calling krb5_parse_name on client principal ubuntu@LXD
> sasl_do_kinit: Using tgs name krbtgt/LXD@LXD
> sasl_do_kinit: krb5_get_init_creds_keytab failed with error -1765328174
> do_bind: lookup(ldap): auth_required: 2, sasl_mech GSSAPI
> sasl_do_kinit: initializing kerberos ticket: client principal ubuntu@LXD
> sasl_do_kinit: calling krb5_parse_name on client principal ubuntu@LXD
> sasl_do_kinit: Using tgs name krbtgt/LXD@LXD
> sasl_do_kinit: krb5_get_init_creds_keytab failed with error -1765328174
>
> The patched version is only trying sasl_do_kinit(), instead of
> sasl_do_kinit_ext_cc():
>
>> --- a/modules/lookup_ldap.c
>> +++ b/modules/lookup_ldap.c
> (...)
>> @@ -574,15 +576,146 @@ static int do_bind(unsigned logopt, struct ldap_conn *conn,
>>                     const char *uri, struct lookup_context *ctxt)
>>   {
>>          char *host = NULL, *nhost;
>> -       int rv;
>> +       int rv, result;
> (...)
>>          if (ctxt->auth_required & LDAP_NEED_AUTH) {
>> +#ifndef WITH_LDAP_CYRUS_SASL
>>                  rv = autofs_sasl_bind(logopt, conn, ctxt);
>>                  debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
>> +#else
>> +               if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 6)) {
>> +                       rv = sasl_do_kinit(logopt, ctxt);
>> +                       if (rv != 0)
>> +                               return 0;
>> +                       sasl_flags = LDAP_SASL_QUIET;
>
> Should the above check for ctct->client_cc and then conditionally call
> sasl_do_kinit_ext_cc() instead of sasl_do_kinit(), like the code in
> autofs_sasl_bind()/sasl_bind_mech() does? I checked later patches from
> https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.9/,
> and while there are further sasl tweaks, I didn't see anything that
> would change this behavior.
>
> I quickly tried this:
> --- a/modules/lookup_ldap.c 2023-05-16 21:02:41.263345786 +0000
> +++ b/modules/lookup_ldap.c 2023-05-16 21:02:47.807520735 +0000
> @@ -601,7 +601,10 @@
>          debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
>   #else
>          if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 6)) {
> -           rv = sasl_do_kinit(logopt, ctxt);
> +            if (ctxt->client_cc)
> +                rv = sasl_do_kinit_ext_cc(logopt, ctxt);
> +            else
> +               rv = sasl_do_kinit(logopt, ctxt);
>              if (rv != 0)
>                  return 0;
>              sasl_flags = LDAP_SASL_QUIET;
>
> And then my test case worked again. But maybe there is another way to
> do it "the openldap way"?


On the face of it this looks like a mistake.


I'll have a look at the code as a whole later but I expect I'll just apply

this as it is, ;)


Thanks

Ian

