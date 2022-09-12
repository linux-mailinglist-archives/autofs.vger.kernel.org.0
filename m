Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B950E5B57C9
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 12:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiILKE7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Sep 2022 06:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiILKE6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Sep 2022 06:04:58 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653BF6360
        for <autofs@vger.kernel.org>; Mon, 12 Sep 2022 03:04:57 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l14so18907555eja.7
        for <autofs@vger.kernel.org>; Mon, 12 Sep 2022 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TLMd2And+VqLQIpJU+D9axaPt3Khgs0bWUJLDPCYvsQ=;
        b=Sf96W6cMuUCcLYqpG5pUdpWRy5YMdalYDgG9XkDFvvaj//+GjXxwh1L8ZRj3Sj8uWD
         Q+lzXQlP74ss4A2Epm+LByVDhxZ8Ch/iUPiL5SxiGagi8a7YybkQ+yPWYvtkNPsPQj0J
         25eLER6rFLtDMZDk6hFrJnmO5lABxkSWNnBrLMcl/1+mt0+7lAcrhD5posy2vw4hAANZ
         vLJwDdLqCb/p4/O+13K+oTCRF6JuwO/a62VcRfhcIRw/OIlxIGT4dooqGlM4bc6IPY4o
         ktENjIOF5PYoXdxDwE2+S0NXu079zALrl89IVKOi1zhMB5C8tlEKGOQfC/s8mEpg57yB
         hHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TLMd2And+VqLQIpJU+D9axaPt3Khgs0bWUJLDPCYvsQ=;
        b=2u1f1O7+DcGgHRmsd55ilvqdfsC6OSD7aqrB+O8F5XNu3ooITaATwV9F5Z1jv1X3l2
         v9+BjJJkBM2OAO4X3RodHHngHiCfTnY15pi9fCOqeFOymVT0X0GJy5T7Vcm8d4i2boxZ
         z2PlpqMuNWs235zOqqtKpOZSrzJrzPmDvu38yoWj34sem+WRBkmgtz5Tvl/+gp8QORjM
         THFegooLyLCe/0CL47KQBQUtDlDS2nGbZ/i5isMc30c4vq7lBtLGuS69spRgdKmhI3cP
         gn3+OIiVKeljUhymIYXSY1wVhBtkkK+j6+dIgmAkgxZSPbpPATljvUIeJwT9n/MmHQQm
         iBxw==
X-Gm-Message-State: ACgBeo2WCi9Egnfj9YTtsbWM3fksX654OODyY2VvzeM2RM4Y8F85Ud2w
        8fq7yQ00FMYxJzMXG/Qvxt2Gs2AgGg==
X-Google-Smtp-Source: AA6agR7ndqzVIZwTh4YFE16om6GyPvzsqzT/etImFQr3qU6/QVkfB+mSkmVZ7rpJ/wwkI+xxqFnXxw==
X-Received: by 2002:a17:907:6ea0:b0:77e:c2e5:a35b with SMTP id sh32-20020a1709076ea000b0077ec2e5a35bmr1344361ejc.566.1662977095952;
        Mon, 12 Sep 2022 03:04:55 -0700 (PDT)
Received: from [192.168.254.199] (dynamic-077-181-140-149.77.181.pool.telefonica.de. [77.181.140.149])
        by smtp.gmail.com with ESMTPSA id fw18-20020a170907501200b0073dbaeb50f6sm4177371ejc.169.2022.09.12.03.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:04:55 -0700 (PDT)
Message-ID: <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
Date:   Mon, 12 Sep 2022 12:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
Content-Language: en-GB
To:     autofs@vger.kernel.org
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, reimth@gmail.com
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
 <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
 <147a772c-c180-09d6-729e-46b731821241@gmail.com>
 <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
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

Perfect.

Shall I provide an updated v3 series or should I wait for further comments?

Kind regards

Thomas

On 12.09.22 11:49, Paul Menzel wrote:
> Dear Thomas,
>
>
> Am 12.09.22 um 10:40 schrieb Thomas Reim:
>
>> thank you for reviewing the patch. My understanding of your comment 
>> is to align the notation and use authentication "type" or "method". 
>> Is this correct?
>
> Yes, I thought it’s the same, and suggested it for consistency.
>
>> In general, IANA and IETF define SASL authentication mechanisms. For 
>> LDAP people talk about different types LDAP authentication calls: 
>> simple bind, SASL bind, mixed bind type.
>> In autofs LDAP configuration users can specify the SASL mechanism 
>> using attribute authtype and the authentication bind call type using 
>> parameter authrequired.
>>
>> I'm not sure how to proceed. Maybe we should use:
>> - "Simple authentication requires ..."
>> - "%s authentication requires ..." (e. g. SCRAM-SHA-256 
>> authentication requires ...)
>> - "SASL authentication mechanism auto-selection requires ..."
>>
>> What do you think?
>
> Good idea to avoid it altogether.
>
>
> Kind regards,
>
> Paul


