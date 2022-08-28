Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660875A3FB1
	for <lists+autofs@lfdr.de>; Sun, 28 Aug 2022 22:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiH1UyD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 28 Aug 2022 16:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH1UyD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 28 Aug 2022 16:54:03 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AA521A
        for <autofs@vger.kernel.org>; Sun, 28 Aug 2022 13:54:02 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lx1so12113921ejb.12
        for <autofs@vger.kernel.org>; Sun, 28 Aug 2022 13:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EouSF2EN/UKIaoi/9qTx28CoKkbyQaPbZoTsae9JRx0=;
        b=l4zZL6YStThia//sAlwlFr1tPXlo+0kKpPk9I/y9ZaDsWF8kR3xl8JzK0fwkUawmw9
         jwp9N/+12zng7JWQf0oaUzFOLdaENAnRtHKALAZUxvPtB2vgGgEQb162qWdJG+8oMlw9
         f91G+L1Ye10uSsJVHmLhc2qAX1zhMdE8EwPWdRm7AJBdp9SrhVdUGxFEDC066ZEMrw8k
         dRz0d0fa6icRIl5xTvx2vlyvsf+8v4F4cDBXbHjN4y2qS62D1wOIYN34SSYd7xuF3VJg
         VhRfjphMyESO9ysZbPkDswr8zxyY0z2LkQxxmTYMfX8BXGiD6PZOCCY5X4+Wt+wLDVlK
         ZncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EouSF2EN/UKIaoi/9qTx28CoKkbyQaPbZoTsae9JRx0=;
        b=nBO7nGguoS1DM5G226vfuRERU98YA4WoCj0Wr5+o8Bp02f/+LbpSjRvW/n6hDIEOKy
         1lG0AiNglDbtRXiHwQYUDYu1gZusiNC1JCFuJBVCWFq+XiAp1cHLP2RxbxAQQcCop0rt
         zQI+pfDqDYqGdzIpHEZVFgA5lEZSa5lEj8wrbFMsvVXLEeGwl3ZEHktYON3tvg5RW1pA
         YQiraw+ccTkMszNgJY7bmlf6GKaBrYQvu9UyAJVHoz/F18kpdl3lL9Jbq/4BqokUjGp7
         f07xXlRrx17nxHsC895UcvEpOO2lyuob/8hldAlpyAahSzTy3WOHuzjmB8mzI4eZjNab
         54EA==
X-Gm-Message-State: ACgBeo0VrLw3HY+lbTHeChSS3WbmlhPW5vNOZ6+pxluc7Ykyc3JaWgay
        Liy9iQAk6RAZU1Hx4LUBG69aYaN2L8dx
X-Google-Smtp-Source: AA6agR7UCCkeI4RXKJzp0vbypP5cyS7TCbtZkV+01phaAhTfDyVRcSTWGLC79mc6V4DYlxO8P9o5ng==
X-Received: by 2002:a17:907:7f20:b0:73d:d54f:6571 with SMTP id qf32-20020a1709077f2000b0073dd54f6571mr10403666ejc.315.1661720040450;
        Sun, 28 Aug 2022 13:54:00 -0700 (PDT)
Received: from [192.168.254.199] (dynamic-077-181-093-224.77.181.pool.telefonica.de. [77.181.93.224])
        by smtp.gmail.com with ESMTPSA id v27-20020a170906489b00b00738795e7d9bsm3579454ejq.2.2022.08.28.13.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 13:53:59 -0700 (PDT)
Message-ID: <08877c51-0819-76d6-37d6-ed3403023b10@gmail.com>
Date:   Sun, 28 Aug 2022 22:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/4] Updated LDAP SASL bind series
Content-Language: en-US
To:     autofs mailing list <autofs@vger.kernel.org>
Cc:     Ian Kent <raven@themaw.net>
References: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
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

the updated patch series works fine. I've created an Ubuntu PPA for 
testing and early adoption: 
https://launchpad.net/~rdratlos/+archive/ubuntu/lp-1984073-autofs-broken-sasl-binds-to-samba-ad 
until an official patch release will be available.

Thank you very much for your support.

Kind regards

Thomas


On 26/08/2022 10:49, Ian Kent wrote:
> I think the series looks good now and I believe your ok with the
> changes I've made.
>
> The series will sit in my patch queue until I commit them and push
> them to the repo. I will most likely test the function of them too
> but that will take a while to do.
>
> Changes since v1:
> - in do_bind() don't free the passed in result in ldap_parse_result(),
>    explicitly handle the free in the function that declares the result
>    variable, do_bind().
> ---
>
> Thomas Reim (4):
>        autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
>        autofs-5.1.8 - prepare for OpenLDAP SASL binding
>        autofs-5.1.8 - let OpenLDAP handle SASL binding
>        autofs-5.1.8 - configure: LDAP function checks ignore implicit declarations
>
>
>   CHANGELOG             |   4 ++
>   aclocal.m4            |  52 +++++++++++++++
>   configure             |  55 +++++++++++++++-
>   configure.in          |   5 +-
>   include/config.h.in   |   3 +
>   include/lookup_ldap.h |   6 ++
>   modules/cyrus-sasl.c  | 150 +++++++++++++++++++++++++++++++++++++++++-
>   modules/lookup_ldap.c | 137 +++++++++++++++++++++++++++++++++++++-
>   8 files changed, 408 insertions(+), 4 deletions(-)
>
> --
> Ian
>
