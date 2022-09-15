Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55E55B93C6
	for <lists+autofs@lfdr.de>; Thu, 15 Sep 2022 06:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiIOE65 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 15 Sep 2022 00:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIOE64 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 15 Sep 2022 00:58:56 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3B04B0FF
        for <autofs@vger.kernel.org>; Wed, 14 Sep 2022 21:58:55 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gh9so39440172ejc.8
        for <autofs@vger.kernel.org>; Wed, 14 Sep 2022 21:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date;
        bh=BUXi/00IExob2iQKzZpN5xcq5kYX3JODQtWz2LFQP4E=;
        b=iGDop9Y5YehhIywuakcdYs7/HP8dUoBkljo/jDHzTPDoo0QVLY/7tNm8YLiyN8QHaX
         lOoJ7R/7OoyoVcm1hsZ9W7PrM6mWdQIVORrRcUpHiGZEUzDRHJh49/+647WR4IS3M+8o
         hOEFYQh8Zz+PcLgqqi1Og0xeJTen7R925EPIhIHLqqfR3F2qkP3IqG1CHpxHxyy8qtE0
         ZiERGJId6W+It1069P2bDMRt4fCY0cE9AJAm13qONqOX9mqvk/SLH5Rxl0Ly9GAXphZq
         KIpX86oF553AVcBxZoMgdl6xnCl4yCVAa0NMsk13021RWiYBeRAIiVZPOsek4kVwjXPZ
         HP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BUXi/00IExob2iQKzZpN5xcq5kYX3JODQtWz2LFQP4E=;
        b=qipTKgQqMue6UZyFfatqhl3bSm6+lmkir388222yhoYv+7SyfnxnqZK3Y+RsMZ99zz
         zOAkY6PTIbWENYN9wxkS5cQMoRhRcbBAlJUvabOjAs+FaWSYUwYbe2luUQHSOHW+eRRE
         we5/d9iIf9u1UAGvA8+H0HeVfIdlaumcozeDZJ5msG1OiChNOC2RA37zgAyALqsdCkuf
         RSwEPTLGBCt+krvRZzFfy/SnBiWflchxaFj0vVGMdDV3qS5TFycaATSPqBPqUwpAQ2OT
         tHG7OlUgbtZ0t1k4JQabO0nksxgqLGbOmbO7GzsJlw+5PZfnryOdDUZAS6eqlZqsVNlw
         SDHQ==
X-Gm-Message-State: ACgBeo08G37NigQYrmPMtcphdhtKX0ha9hDvGEbDTwSPVE3hWlj2ObiK
        uluKttau4dhD/vq7FKpi7g==
X-Google-Smtp-Source: AA6agR7c2gV9gwn3dbFXO/EOt4V4qFHb2Zfa0+iiDdnpO5EXNyenmlDil5fvQ2vNvInRGhvwxPyooA==
X-Received: by 2002:a17:907:3da3:b0:780:3d46:cbe3 with SMTP id he35-20020a1709073da300b007803d46cbe3mr3660522ejc.175.1663217933441;
        Wed, 14 Sep 2022 21:58:53 -0700 (PDT)
Received: from smtpclient.apple (dynamic-2a01-0c23-7899-5500-b4ac-5266-9091-77d1.c23.pool.telefonica.de. [2a01:c23:7899:5500:b4ac:5266:9091:77d1])
        by smtp.gmail.com with ESMTPSA id i5-20020a170906698500b007081282cbd8sm8433262ejr.76.2022.09.14.21.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 21:58:52 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Thomas Reim <reimth@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for auto-detection
Date:   Thu, 15 Sep 2022 06:58:52 +0200
Message-Id: <6193431A-F113-4D65-9797-B7D962826913@gmail.com>
References: <94101915-3156-b594-e886-838b09204aa5@themaw.net>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, Ian Kent <raven@themaw.net>
In-Reply-To: <94101915-3156-b594-e886-838b09204aa5@themaw.net>
To:     autofs@vger.kernel.org
X-Mailer: iPhone Mail (19G82)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian,

It would be great if you make the small changes.=20

> Am 15.09.2022 um 05:28 schrieb Ian Kent <raven@themaw.net>:
>=20
> =EF=BB=BFOn 12/9/22 18:04, Thomas Reim wrote:
>> Perfect.
>>=20
>> Shall I provide an updated v3 series or should I wait for further comment=
s?
>=20
>=20
> I can make these small changes to save you the trouble.
>=20
>=20
> My understanding is they are the spelling of "capabilities" and
>=20
> the removal of "type" and "method" from from those error() log

Correct.=20

>=20
> calls at the end of the patch.
>=20
>=20
> Is that all the changes?
>=20
> Is that what's been agreed?

=46rom my side: agreed

There were no further comments (yet).

Thomas

>=20
>=20
> Ian
>=20
>>=20
>> Kind regards
>>=20
>> Thomas
>>=20
>>> On 12.09.22 11:49, Paul Menzel wrote:
>>> Dear Thomas,
>>>=20
>>>=20
>>>> Am 12.09.22 um 10:40 schrieb Thomas Reim:
>>>=20
>>>> thank you for reviewing the patch. My understanding of your comment is t=
o align the notation and use authentication "type" or "method". Is this corr=
ect?
>>>=20
>>> Yes, I thought it=E2=80=99s the same, and suggested it for consistency.
>>>=20
>>>> In general, IANA and IETF define SASL authentication mechanisms. For LD=
AP people talk about different types LDAP authentication calls: simple bind,=
 SASL bind, mixed bind type.
>>>> In autofs LDAP configuration users can specify the SASL mechanism using=
 attribute authtype and the authentication bind call type using parameter au=
threquired.
>>>>=20
>>>> I'm not sure how to proceed. Maybe we should use:
>>>> - "Simple authentication requires ..."
>>>> - "%s authentication requires ..." (e. g. SCRAM-SHA-256 authentication r=
equires ...)
>>>> - "SASL authentication mechanism auto-selection requires ..."
>>>>=20
>>>> What do you think?
>>>=20
>>> Good idea to avoid it altogether.
>>>=20
>>>=20
>>> Kind regards,
>>>=20
>>> Paul
>>=20
>>=20
