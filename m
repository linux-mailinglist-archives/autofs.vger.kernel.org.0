Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7F25B525D
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 02:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiILA4j (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 20:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiILA4j (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 20:56:39 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A2E27DD4
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:56:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l8so731699wmi.2
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fySslnGi0ZNH4YEJJSdIuKan1Jb6dU0xRZKXNb8bvwc=;
        b=ECqDHLaOJXGbGxAT/r8DGcBSrH8Ic4FFz6wRWh8KDYG+6R+z8IqfDffskK9R04lu1R
         6yoezo9lXgAdZ7/yhf7R7Oy+4CiBzBXZBpYzmuiUZx96Pha5nyJeJcl9rRBwDUBs1WAr
         OcV+g6EMOdNUR162+7ooqIAg4zcSIPpXtG1+N/qow6+0w38zRHPXP4BZ9ob1MHiGV93U
         FMjRbgLIFgBGmN53o1Xb4y52JVjkaGTfk7WPjs7lDTPx1Zv1bCyxYZSwSji4qucOL1wy
         68JoJa992B/RIjNKMkiGnjKggFlQU7GzfUadqc2P36HePZDxBRWSAg3vz72OYCLhNM38
         c3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fySslnGi0ZNH4YEJJSdIuKan1Jb6dU0xRZKXNb8bvwc=;
        b=YYjHuaObKo4dfc9I+qSenVynUKSLQSk3LaaX7HzQdpB4HwdzJ3Rrdlr6rayps0zFSp
         vkoYCysOVoSDbS+KEavK6DSlAFIUT07vOUBR08MJzh+CL9ysRaGNqqw8kuN85PRPNtFc
         mDWAYPNvvzj0tG+XMP5uGRWe1utroTkBVlMGMHZlDnJPH1928whBPNMhAKeLih4k3CqN
         O/egEqOgSMI8cKfsT2V1DpO2rP7lj1mg4lSrXtMP5TV3UyI+cfR5hWxtZZHCbdyydRLS
         Pqob0y0boBmV2ISJKbhEtpeLTYdNTZNWoXS08HAOIi3dIWVZQQmTbE05seaa2xUEr5x7
         JaKw==
X-Gm-Message-State: ACgBeo2VYqhqem5Ss7aPMyphVq65UDzP+Xkeok8Rzi9hbAY/wY77shhX
        TACDlMKUw3uaw0ta+aRVoHA47hGZ9Q==
X-Google-Smtp-Source: AA6agR4qsbb293OrtW0EkZLrEYrELtPiOd71N/J7/3MKCK9l//cWosSWysYzHXFbEWEE9UpGcyJVWQ==
X-Received: by 2002:a05:600c:3ac3:b0:3a5:e1de:5994 with SMTP id d3-20020a05600c3ac300b003a5e1de5994mr12420015wms.133.1662944196656;
        Sun, 11 Sep 2022 17:56:36 -0700 (PDT)
Received: from [192.168.254.199] (dynamic-077-190-097-057.77.190.pool.telefonica.de. [77.190.97.57])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003b482fbd93bsm2992617wmo.24.2022.09.11.17.56.36
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 17:56:36 -0700 (PDT)
Message-ID: <944187e3-a947-beb8-d0fa-7d60e3f5210f@gmail.com>
Date:   Mon, 12 Sep 2022 02:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] LDAP SASL bind further fix series
Content-Language: en-GB
To:     autofs@vger.kernel.org
References: <20220911144139.3525598-1-reimth@gmail.com>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <20220911144139.3525598-1-reimth@gmail.com>
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

I'm sorry but I have to revise patch 0002 autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for auto-detection. Please ignore this patch series.

I will post a second version (v2) of the patches that fix this issue.

On 11.09.22 16:41, ThomasReim wrote:
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
>   modules/cyrus-sasl.c           |  4 ++--
>   modules/lookup_ldap.c          | 41 +++++++++++++++++++++++++---------
>   3 files changed, 34 insertions(+), 13 deletions(-)
>
