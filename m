Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874BC62D3AF
	for <lists+autofs@lfdr.de>; Thu, 17 Nov 2022 07:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbiKQG5x (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 17 Nov 2022 01:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiKQG5w (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 17 Nov 2022 01:57:52 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030955B58B
        for <autofs@vger.kernel.org>; Wed, 16 Nov 2022 22:57:52 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id f18so2788092ejz.5
        for <autofs@vger.kernel.org>; Wed, 16 Nov 2022 22:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHtpJWzCig/i2yOTvYngvnjVpkbhPJ6Wsy6vtdBIJLM=;
        b=QZgHVmOg2ex3Qq7v0L6UqUi3yRuyWek7L7vOu05yezJiPdBO3/IAm9cf3ORYQNRpVA
         wVNo5lzQhJav3YRnEAe/UgiW8EOXLSqvAHm43oEu+78GcKLWTzXNSfhGYuiXszIJ1XRq
         5eSXZSXRpw7Wg/7U2nNdF1AHtP91xwPDIhg91U14qPiYeUyiZeXy15yMizvFzFn19ukc
         D9UmEKYazrb4Z9H4+Cdmd1idBrSiOAypSogwVtJmFfFczfn5V90iByG1Ok/ZVmd/EzKV
         ekCE4biVl7C50E70Uap4C3UdI4/j66/I8tMZS2Xvp3Mj06jg92Tu77RRVs300vNmmgkw
         Z1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHtpJWzCig/i2yOTvYngvnjVpkbhPJ6Wsy6vtdBIJLM=;
        b=BxSy8eQLNTnRTHRZEiJHG6kNpENIsnCEK8wfOTBy60fHoIiEbAea44Gi5KsX+8Pxnu
         2mL7ImmsB+YsvgHq5WzxV1+q/Q6IML7pbCAfr8y05kLBVYgkxvnT71cYFl4HRy/OI8ST
         +HeIrQ0N6g4oKFcV/+IFptHpvcTVxkop4YsmM55CMKDxUZEDK4A7K79iQohQNyFWdgA2
         gSoFCBRPPmXanCQgePIIOR9DvaOwwOYsGrSAYjP+V3cJCyFG/e1zKelfI0C3ACgvy6gM
         8KqiULkxgW/qM7WOwaZTYK/ugCOp5Py4c7pZiTX1AgUqpwzfNUVckpxbKbj4rrXG6J8Z
         wHdg==
X-Gm-Message-State: ANoB5pm07klW/PlQm82GDwgeXz9x9rdLHvWCGAeMqOKxNn7iF1DlAwnq
        SmH6Yh3TPD7NTn+SncwdNCKdRcUdnA==
X-Google-Smtp-Source: AA0mqf6RJ+q/SLWZ3NDb+VghWdxu25+KIDfdVNYznj2XO80dMebHiT8ARbqIJtRuErNa90iQkfvNig==
X-Received: by 2002:a17:906:948c:b0:78d:e869:f328 with SMTP id t12-20020a170906948c00b0078de869f328mr941755ejx.696.1668668270505;
        Wed, 16 Nov 2022 22:57:50 -0800 (PST)
Received: from [10.77.254.199] (dynamic-077-015-023-202.77.15.pool.telefonica.de. [77.15.23.202])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b00782539a02absm7705176ejc.194.2022.11.16.22.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 22:57:50 -0800 (PST)
Message-ID: <ba33d58f-36d0-9d0f-9494-9cc146f66bb5@gmail.com>
Date:   Thu, 17 Nov 2022 07:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     autofs@vger.kernel.org
References: <20220912005822.3947426-1-reimth@gmail.com>
Cc:     Ian Kent <raven@themaw.net>
From:   "Thomas A. Reim" <reimth@gmail.com>
Subject: Re: [PATCH v2 0/2] LDAP SASL bind further fix series
In-Reply-To: <20220912005822.3947426-1-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian,

we can't find the patches in list 
https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.9/.

Is there still work going on? Do you need further updates?

Kind regards

Thomas

On 12.09.22 02:58, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> Dear Ian,
>
> please find two more patches for update of LDAP SASL bind in autofs. The
> provided patches fix following issues:
> - Missing support of SCRAM-*
>    autofs 5.1.8 blocks use of SCRAM-* for SASL binding. DIGEST-MD5 is regarded
>    unsafe and has been marked obsolete by IANA. Implementations should use one
>    of the latest Salted Challenge Response Authentication Mechanisms (SCRAM)
>    defined by IETF RFC-5802/RFC-7677 instead.
> - OpenLDAP SASL mechanism auto-selection requires user credentials
>    autofs 5.1.8 does not fetch user credentials from autofs_ldap_auth.conf if
>    users set authrequired="autodetect" without specifying one of the user
>    credential based SASL mechanisms in attribute authtype. SASL binding using
>    function ldap_sasl_interactive_bind() will fail with error SASL(-13): user
>    not found: no secret in database. Seamless auto-selection of an SASL mechanism
>    using OpenLDAP requires specification of user credentials.
>
> Thomas Reim (2):
>    autofs-5.1.8 - support SCRAM for SASL binding
>    autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for
>      auto-detection
>
>   man/autofs_ldap_auth.conf.5.in |  2 +-
>   modules/cyrus-sasl.c           |  4 +--
>   modules/lookup_ldap.c          | 48 +++++++++++++++++++++++++++-------
>   3 files changed, 41 insertions(+), 13 deletions(-)
>
