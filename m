Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA2562D3AE
	for <lists+autofs@lfdr.de>; Thu, 17 Nov 2022 07:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiKQG5r (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 17 Nov 2022 01:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiKQG5q (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 17 Nov 2022 01:57:46 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CB55B58B
        for <autofs@vger.kernel.org>; Wed, 16 Nov 2022 22:57:45 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id m22so2716748eji.10
        for <autofs@vger.kernel.org>; Wed, 16 Nov 2022 22:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z/kCaOa8ZSVxlRTatthvwb20mJ7s4mvQZKz3UYrH7o=;
        b=hipYIRG+X0dR86CqPMEPFm7BmSWrXeWinzB6c8o4EBTQ1jvRHTarTea6+/7KxXUtqX
         xtH0Xd7bDrV84CLYnRd/na0gU4WNzM1pRihpVpa8Xj+AB/huQRPWsmQGQxBsS7QxoYs4
         UM1r+GAxMsPX2QlvoPDwRTHgVz7c5uiA0l8r3Nvgk/GotWurS9ssFdzyHHnH6mDZU7Ei
         U4elyKrxHErmr+iLH+JRbVtE114L19q22IUWyAQ5m1KxFpkmAH64+nXDrpnwL0q4n4wa
         G0CQgy8MF3b5E5FvpFUk+FB9A0KB9c9DPx+NBCngHkZNzcJkd1saPGhGhg+uBgU3hT8W
         skkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/z/kCaOa8ZSVxlRTatthvwb20mJ7s4mvQZKz3UYrH7o=;
        b=AOlA+dsJ1JOhSIilVnbfAVCdZtwhEtzOgMhBhwul2ocYge7R9wTv4L9q1Aoot6PxkG
         8vJAbEZ+cLsv8uh3q/JmsJYArWBK4UXVLGuL0nEBs5XGk25US7gJodeHQmA88P7/+0nw
         ipW/dsHFdnQP1Un6/QdMk8nk83UzrY6yW3v5kHvMgq7vCV2MZlq4RxnTwyUcw9eLUYzK
         cnKJcy2TfR4XLH8A8R1mu7SyKffQT68JTCOjCGkeAXYhfwzAXRIaEPy/YJY1JZ5rxcqo
         oToRzBjeppsrRUA+Jjxq9YhZXYQTr353xyaMaRIi546nBk8yeVicKa7B394AWr9O/wXL
         Tcnw==
X-Gm-Message-State: ANoB5pkDNTTIh8CGokYjRAWNmlpEvHE63KghTT0kxKeGsxdaCTB7Ubs3
        a+3gNbvolOuYLnyv8X2m81tM3XMTLQ==
X-Google-Smtp-Source: AA0mqf5knOFgHPOsXu4TEF8faDOJ5BFsgsLrzyMy9jp5nWrBuexv3wlzpPBeGCqSFrIM37MTnGL2AQ==
X-Received: by 2002:a17:907:75f3:b0:78d:b046:aaae with SMTP id jz19-20020a17090775f300b0078db046aaaemr1001851ejc.218.1668668264146;
        Wed, 16 Nov 2022 22:57:44 -0800 (PST)
Received: from [10.77.254.199] (dynamic-077-015-023-202.77.15.pool.telefonica.de. [77.15.23.202])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906769300b00722e50dab2csm7723943ejm.109.2022.11.16.22.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 22:57:43 -0800 (PST)
Message-ID: <c3d6769f-2b41-3b75-53e3-479877d11954@gmail.com>
Date:   Thu, 17 Nov 2022 07:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To:     autofs@vger.kernel.org
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, Ian Kent <raven@themaw.net>
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
 <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
 <147a772c-c180-09d6-729e-46b731821241@gmail.com>
 <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
 <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
 <94101915-3156-b594-e886-838b09204aa5@themaw.net>
Content-Language: en-US
From:   "Thomas A. Reim" <reimth@gmail.com>
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
In-Reply-To: <94101915-3156-b594-e886-838b09204aa5@themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian and all,

could you please confirm status of this patch?

Kind regards

Thomas

On 15.09.22 05:26, Ian Kent wrote:
> On 12/9/22 18:04, Thomas Reim wrote:
>> Perfect.
>>
>> Shall I provide an updated v3 series or should I wait for further 
>> comments?
>
>
> I can make these small changes to save you the trouble.
>
>
> My understanding is they are the spelling of "capabilities" and
>
> the removal of "type" and "method" from from those error() log
>
> calls at the end of the patch.
>
>
> Is that all the changes?
>
> Is that what's been agreed?
>
>
> Ian
>
>>
>> Kind regards
>>
>> Thomas
>>
>> On 12.09.22 11:49, Paul Menzel wrote:
>>> Dear Thomas,
>>>
>>>
>>> Am 12.09.22 um 10:40 schrieb Thomas Reim:
>>>
>>>> thank you for reviewing the patch. My understanding of your comment 
>>>> is to align the notation and use authentication "type" or "method". 
>>>> Is this correct?
>>>
>>> Yes, I thought it’s the same, and suggested it for consistency.
>>>
>>>> In general, IANA and IETF define SASL authentication mechanisms. 
>>>> For LDAP people talk about different types LDAP authentication 
>>>> calls: simple bind, SASL bind, mixed bind type.
>>>> In autofs LDAP configuration users can specify the SASL mechanism 
>>>> using attribute authtype and the authentication bind call type 
>>>> using parameter authrequired.
>>>>
>>>> I'm not sure how to proceed. Maybe we should use:
>>>> - "Simple authentication requires ..."
>>>> - "%s authentication requires ..." (e. g. SCRAM-SHA-256 
>>>> authentication requires ...)
>>>> - "SASL authentication mechanism auto-selection requires ..."
>>>>
>>>> What do you think?
>>>
>>> Good idea to avoid it altogether.
>>>
>>>
>>> Kind regards,
>>>
>>> Paul
>>
>>
