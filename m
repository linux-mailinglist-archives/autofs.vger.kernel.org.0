Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AC262D5B2
	for <lists+autofs@lfdr.de>; Thu, 17 Nov 2022 09:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239314AbiKQI7g (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 17 Nov 2022 03:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239246AbiKQI72 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 17 Nov 2022 03:59:28 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6AA68C6B
        for <autofs@vger.kernel.org>; Thu, 17 Nov 2022 00:59:27 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 68EC65C0342;
        Thu, 17 Nov 2022 03:59:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 17 Nov 2022 03:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1668675566; x=
        1668761966; bh=Q5gTapqs2pV9wghrT0W7cTt7JOd6feGxihyPnv6R1qY=; b=n
        M7UuN8GXL0qy948P97vntnFfwoX+B1DdW6H7gd2quwDviFwqspBZtnkESK/02ve5
        JQm5KSqAxCkQDF3arCJLEEI+N5LZVYT4LeYqa5ozTdhk0ItpNc092r/aDAAXRl64
        gpKQIoQq7nNJt3raUkjZVf6dIg7JjWl/FeeYwSRyinJKL4t9USDmTM2Ko0KAcpWa
        4PxSDZ/dqkk7Cl8Jkq43B2W2WALfPb+5MXg1+EqnnwmZNZIzORt16lt8xOGlkT8F
        VfQluxUFqDbbfkiZONGKxWGwykN+0AkuWTRPbHSwYH3PoVPwYVjbBhyjxxqEATsW
        vHTYGjzPjO+2OTRrY/Chw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1668675566; x=1668761966; bh=Q
        5gTapqs2pV9wghrT0W7cTt7JOd6feGxihyPnv6R1qY=; b=Pf45A24/fcIdLEnsd
        8Rt6DdsWXHgmLDgXizs+JDBp3Lg1u6qircDsua/O6TYTq/0jGI47j1fcshphXHRN
        PcxDIFogA/13PT7VygYmQ84sqLTNtQhLV7lNXTk2Uju+JZHil7IihHYPTsq6lZ3M
        +KC8tozs5xdd0IRF3HBgitdtu7hYKd2w4JOQINQiEEnwJwq4TvceSJmfuc+bOyGa
        ersj/7nsgnHBIlSYXWvAtPnWISrA7zbQADPX0LKEaqNp0skdRZbd32fvRH9Jd8n4
        qAkwheQeiWIVfU8Ogo/Nc4Lb4yec3DY0eOlgqza4R1rNf1sCUjwMnkoCT0VRbkRg
        EPYMg==
X-ME-Sender: <xms:7vd1Y43Q_1MQzD24t80IBm8nAPU1kWUHjbHL-p09JfB6q-ShxzLJPw>
    <xme:7vd1YzGWPGmb2-1k3oGaYhzFRuC9TnzMprT9mPshaKRriTpki96uqU9LHQfXgvvRn
    _qq9QktHrO3>
X-ME-Received: <xmr:7vd1Yw5RSCiZINWLaVwmzXaKgXERyDaa5GjjYr_TvCA4tVBmuUxHPt3Rrm1czrgI-fB1M_zan-R2KDLP1zgZQPHGixPo0rjA8p1iIxaBzPYWKr4vpLfe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    evgeegfedtvefgfffhhfdugeevgfdvueevhfdvteektefhteevfefhfedvudeuteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:7vd1Yx2DaEHBvjjo3vbrUYq45UOtU4HOeCR8OHFZATZ3dM2AJbREfA>
    <xmx:7vd1Y7GlSwDcbDTrM9CGl7DOlYHKiFEo9f19MfgxUVPCqF78V30_uA>
    <xmx:7vd1Y68uJdWyyrDqL73snRp2RmFGvwq8xZzcFBSHbP5tlK6lTMyxoA>
    <xmx:7vd1Yyz-8MUMXn45L5X2hR1J3reC95kPQLIyZsDx4AnUW6qnfjoCiA>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 03:59:25 -0500 (EST)
Message-ID: <ff4514b1-02b6-35d7-27b3-2295b9527f76@themaw.net>
Date:   Thu, 17 Nov 2022 16:59:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/2] LDAP SASL bind further fix series
Content-Language: en-US
To:     "Thomas A. Reim" <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220912005822.3947426-1-reimth@gmail.com>
 <ba33d58f-36d0-9d0f-9494-9cc146f66bb5@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <ba33d58f-36d0-9d0f-9494-9cc146f66bb5@gmail.com>
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
> Dear Ian,
>
> we can't find the patches in list 
> https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.9/.
>
> Is there still work going on? Do you need further updates?

There's no problem, it's just me getting diverted to other

tasks.


Rest assured I will get to committing the changes eventually.


Ian

>
> Kind regards
>
> Thomas
>
> On 12.09.22 02:58, ThomasReim wrote:
>> From: Thomas Reim <reimth@gmail.com>
>>
>> Dear Ian,
>>
>> please find two more patches for update of LDAP SASL bind in autofs. The
>> provided patches fix following issues:
>> - Missing support of SCRAM-*
>>    autofs 5.1.8 blocks use of SCRAM-* for SASL binding. DIGEST-MD5 is 
>> regarded
>>    unsafe and has been marked obsolete by IANA. Implementations 
>> should use one
>>    of the latest Salted Challenge Response Authentication Mechanisms 
>> (SCRAM)
>>    defined by IETF RFC-5802/RFC-7677 instead.
>> - OpenLDAP SASL mechanism auto-selection requires user credentials
>>    autofs 5.1.8 does not fetch user credentials from 
>> autofs_ldap_auth.conf if
>>    users set authrequired="autodetect" without specifying one of the 
>> user
>>    credential based SASL mechanisms in attribute authtype. SASL 
>> binding using
>>    function ldap_sasl_interactive_bind() will fail with error 
>> SASL(-13): user
>>    not found: no secret in database. Seamless auto-selection of an 
>> SASL mechanism
>>    using OpenLDAP requires specification of user credentials.
>>
>> Thomas Reim (2):
>>    autofs-5.1.8 - support SCRAM for SASL binding
>>    autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for
>>      auto-detection
>>
>>   man/autofs_ldap_auth.conf.5.in |  2 +-
>>   modules/cyrus-sasl.c           |  4 +--
>>   modules/lookup_ldap.c          | 48 +++++++++++++++++++++++++++-------
>>   3 files changed, 41 insertions(+), 13 deletions(-)
>>
