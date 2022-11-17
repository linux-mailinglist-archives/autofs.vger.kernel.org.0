Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4264362D59E
	for <lists+autofs@lfdr.de>; Thu, 17 Nov 2022 09:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbiKQI5N (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 17 Nov 2022 03:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239305AbiKQI5M (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 17 Nov 2022 03:57:12 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A651742E9
        for <autofs@vger.kernel.org>; Thu, 17 Nov 2022 00:57:11 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 3B8B65C0365;
        Thu, 17 Nov 2022 03:57:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 17 Nov 2022 03:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1668675427; x=
        1668761827; bh=06H0CdDCtpp2GfAIWXXMzDHsVjCnpxZE/ONt2sW/0Uc=; b=L
        g0j5yqr7cFCYUrB0emHOGwU9+5wcGDzfez8uzhFPWdA2TdR3uWSBRvRHqLJ3v4A5
        nJT0a+JZUuB6UjHuxi0Gk3cHIJMEWIE03SQ0LYC+vyILzXMLBv7wz2nLv36Gwh65
        GxeWNBOxVKCldHwDI5gS4jymqT2FuLWA3DKiR7SvhkNoNU8qbHFB+6eOBdG/HuHY
        DP8hBJvDsFt9MHKIEh7pQHiALWXerkbyPVmAjDCWmaikJN3eJD8hO67IEpug6bOS
        Bmh98cIP/XUqhLf1m+tIbutogzjA0BmR11lNdvwmqQf4exiaSdBR1L5f65p+wNaG
        w1qvwvrxkpzX7yPCm8RIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668675427; x=
        1668761827; bh=06H0CdDCtpp2GfAIWXXMzDHsVjCnpxZE/ONt2sW/0Uc=; b=J
        FQ6ppAZdhRX6//aVFhFjhi9NUsUfFOmsESmy+769s3xhP2a8GumbvDO7jydl89rq
        uSodZQ0GaXEc/FBKm0RyJQXTVRqOK19M1H8cHKMtYeA6Ej5MDk9HyPJgcn9jsRup
        EgJuz4IPfMzrW/pEre5/XAt/zPQUWczPizwz7t3RtgrQ3eFWDeC6DdYLYvUjtvTD
        djPfgsWWjn+C/aCuuq6qsHTuAqN3gH/c6qJ6hCLVEK8nMCvGz4LzI6wGNQ0HvPAJ
        F1WPbGQX8OVMmixSHE7eT9wH3KbA49b0QrtCrzBd5NHm8LEZr/jrR8Iz6ClRHSlr
        fo9vLzONDgq+HVF4/4cZA==
X-ME-Sender: <xms:Yvd1YwvPBks5hlJSZBiILLXrmxdqRQtofmkUuRZLN8rhaUFpLvGI4w>
    <xme:Yvd1Y9clBMDgqR7ejYYFaALURYeqbfR_Cs_pn28omBDu7UI4ZrFh8eCDssTA_n9PG
    jluA0aaxHLM>
X-ME-Received: <xmr:Yvd1Y7yeV8eVY8dpg-sLNd64kiGYEBK0VqvZJgMqItBGI5g7roU-g8AQY2P4EyOlMiC5zSGWWiw_Rzmw-ugFrS2pFXIM0hWtPVjI2KEst0DJ89a2acDt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefkrghn
    ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnh
    epgedvteevvdefiedvueeujeegtedvheelhfehtefhkefgjeeuffeguefgkeduhfejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnh
    esthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:Yvd1YzPqHjtf6uIRk1L-knu6TcFZa-1YgcVPXzLj_aSgEc2u3RMflg>
    <xmx:Yvd1Yw9O20_NdwGkkTFb_uLnzleX4g5XpoYqI0xY0DYd4OLcCjiihQ>
    <xmx:Yvd1Y7VSPIHeWamAg-pcmZd27YKxA3k9tw54b1A_yQv-sTf8uAnQXQ>
    <xmx:Y_d1Y1FXW_u-l0GC0s25lZJi3z1WOGASK7L05lRORgEsV2DZ-T7jkg>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 03:57:05 -0500 (EST)
Message-ID: <3e385f5c-9b0c-07f2-d472-62d1a5175e13@themaw.net>
Date:   Thu, 17 Nov 2022 16:57:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
Content-Language: en-US
To:     "Thomas A. Reim" <reimth@gmail.com>, autofs@vger.kernel.org
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
 <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
 <147a772c-c180-09d6-729e-46b731821241@gmail.com>
 <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
 <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
 <94101915-3156-b594-e886-838b09204aa5@themaw.net>
 <c3d6769f-2b41-3b75-53e3-479877d11954@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <c3d6769f-2b41-3b75-53e3-479877d11954@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 17/11/22 14:57, Thomas A. Reim wrote:
> Dear Ian and all,
>
> could you please confirm status of this patch?

I haven't committed them yet, I've had a number of things

come up.


Rest assured your patches are in my queue for the next

time I commit.


Ian

>
> Kind regards
>
> Thomas
>
> On 15.09.22 05:26, Ian Kent wrote:
>> On 12/9/22 18:04, Thomas Reim wrote:
>>> Perfect.
>>>
>>> Shall I provide an updated v3 series or should I wait for further 
>>> comments?
>>
>>
>> I can make these small changes to save you the trouble.
>>
>>
>> My understanding is they are the spelling of "capabilities" and
>>
>> the removal of "type" and "method" from from those error() log
>>
>> calls at the end of the patch.
>>
>>
>> Is that all the changes?
>>
>> Is that what's been agreed?
>>
>>
>> Ian
>>
>>>
>>> Kind regards
>>>
>>> Thomas
>>>
>>> On 12.09.22 11:49, Paul Menzel wrote:
>>>> Dear Thomas,
>>>>
>>>>
>>>> Am 12.09.22 um 10:40 schrieb Thomas Reim:
>>>>
>>>>> thank you for reviewing the patch. My understanding of your 
>>>>> comment is to align the notation and use authentication "type" or 
>>>>> "method". Is this correct?
>>>>
>>>> Yes, I thought it’s the same, and suggested it for consistency.
>>>>
>>>>> In general, IANA and IETF define SASL authentication mechanisms. 
>>>>> For LDAP people talk about different types LDAP authentication 
>>>>> calls: simple bind, SASL bind, mixed bind type.
>>>>> In autofs LDAP configuration users can specify the SASL mechanism 
>>>>> using attribute authtype and the authentication bind call type 
>>>>> using parameter authrequired.
>>>>>
>>>>> I'm not sure how to proceed. Maybe we should use:
>>>>> - "Simple authentication requires ..."
>>>>> - "%s authentication requires ..." (e. g. SCRAM-SHA-256 
>>>>> authentication requires ...)
>>>>> - "SASL authentication mechanism auto-selection requires ..."
>>>>>
>>>>> What do you think?
>>>>
>>>> Good idea to avoid it altogether.
>>>>
>>>>
>>>> Kind regards,
>>>>
>>>> Paul
>>>
>>>
