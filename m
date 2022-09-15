Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC055B930B
	for <lists+autofs@lfdr.de>; Thu, 15 Sep 2022 05:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiIOD03 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 14 Sep 2022 23:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiIOD01 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 14 Sep 2022 23:26:27 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6984C61A
        for <autofs@vger.kernel.org>; Wed, 14 Sep 2022 20:26:25 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 7CDE75C00ED;
        Wed, 14 Sep 2022 23:26:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 14 Sep 2022 23:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1663212384; x=
        1663298784; bh=sQ+eTn+nOJ+c/GFn3wgmwqEBCVDhu42YsNV/Gu8Pap8=; b=E
        dfZT4iJ1u6Qu/FIjGEgrZaHiFp44Od5rn0XelpcxbRnNWljUXpiLCv2ROIXeXf2X
        nYOLq6Q4jcmbYnt+JVEcSyx11h8TmLy4JoRcKVsgRc/5wIcu1rniEq2RfOxc9RsV
        D36am3KzQScmSt7ZMcGMuGyEDpZVT6Sumxz7OeOCsAqGlXCHXnp5FRW+Q8lgF55V
        WSEXvyovYeCVXuZe9LWEbtYxph0GdFQLvM61Xg2NB1A7f7M20VNYX1JVAeLjQDgz
        iI0DHwHpNmooJOO3MpvHNr0d/9bPBSXb+usu8Uu71+Zi87o6EHRjmIYy5wF0SCXA
        aKKI2dZJZzNm19bWAu7+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663212384; x=
        1663298784; bh=sQ+eTn+nOJ+c/GFn3wgmwqEBCVDhu42YsNV/Gu8Pap8=; b=o
        jT3STm4etIFWrLqVvjC+twgQN7xHr/2JQb0zjifx0tkzEOGQj0cPP8t39BB6xhhv
        kxXwX9q3b+qtJlvn3tfGzUSzxyHfoCAR99AZdIHhJpa4dLfXgA3ERhjoWCw0nb7D
        M7J48Nt5DNSEGz9p7glXcjwQ9tmPD+UKHNC+9jrRtugJb6PH+NiBXWUIgMb1Ut1c
        Jg7gHGMPlYcJwKMszOfrKY6iE6v+wS0VUtMlwCa2mL3zDHISc5VFd7LeAA0Q7dg3
        QJz2DKVZ0GZNh6EHYYlfQWZPUwLI2o5ro/+m+cFgbCIr6oFrJr2BA6F+EnpOogT5
        hoy2EXRsYcfeZEzDku1MQ==
X-ME-Sender: <xms:YJsiY79tj5ABorLnEZ9yYa63ePZGxP9ekH5JOPZZPvo10GYyMA0n9Q>
    <xme:YJsiY3twtX_w5CPJeoUrLtN7zmDDBFWEpjyZbI4NlSYYKwikqCVZVHJygxgX_-gVz
    -AX4ukzxU2h>
X-ME-Received: <xmr:YJsiY5C-E7YV4Dp6EmX9G7_RrrjtOmVR4qKXuJuyZNQSRMEjYR9dCVFOlYECJtztZ2CL2_kV0osRUE65n52jhMbeD7gGthQ14em2HzOwLkxreHrocgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedujedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefkrghn
    ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnh
    epgedvteevvdefiedvueeujeegtedvheelhfehtefhkefgjeeuffeguefgkeduhfejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnh
    esthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:YJsiY3fvQBXxwMbVJnODqiY7AHVeAt0mQz24L9P_PhsxVEOK-BnQvQ>
    <xmx:YJsiYwOkwpOXJPEKXAUPY57kzqWTFdPvP75K6e5ZlV23kPJS3CJN0Q>
    <xmx:YJsiY5kj5RblCrTdkW_4iwKcq35mO_vUza4FsEFJt3H5wpMtqF7n6w>
    <xmx:YJsiY6UdBN_sQp5XaLSZRAQOxW4ENg2wOycKZkygnTKM9HutCr5gsg>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 23:26:22 -0400 (EDT)
Message-ID: <94101915-3156-b594-e886-838b09204aa5@themaw.net>
Date:   Thu, 15 Sep 2022 11:26:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
Content-Language: en-US
To:     Thomas Reim <reimth@gmail.com>, autofs@vger.kernel.org
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
 <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
 <147a772c-c180-09d6-729e-46b731821241@gmail.com>
 <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
 <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 12/9/22 18:04, Thomas Reim wrote:
> Perfect.
>
> Shall I provide an updated v3 series or should I wait for further 
> comments?


I can make these small changes to save you the trouble.


My understanding is they are the spelling of "capabilities" and

the removal of "type" and "method" from from those error() log

calls at the end of the patch.


Is that all the changes?

Is that what's been agreed?


Ian

>
> Kind regards
>
> Thomas
>
> On 12.09.22 11:49, Paul Menzel wrote:
>> Dear Thomas,
>>
>>
>> Am 12.09.22 um 10:40 schrieb Thomas Reim:
>>
>>> thank you for reviewing the patch. My understanding of your comment 
>>> is to align the notation and use authentication "type" or "method". 
>>> Is this correct?
>>
>> Yes, I thought it’s the same, and suggested it for consistency.
>>
>>> In general, IANA and IETF define SASL authentication mechanisms. For 
>>> LDAP people talk about different types LDAP authentication calls: 
>>> simple bind, SASL bind, mixed bind type.
>>> In autofs LDAP configuration users can specify the SASL mechanism 
>>> using attribute authtype and the authentication bind call type using 
>>> parameter authrequired.
>>>
>>> I'm not sure how to proceed. Maybe we should use:
>>> - "Simple authentication requires ..."
>>> - "%s authentication requires ..." (e. g. SCRAM-SHA-256 
>>> authentication requires ...)
>>> - "SASL authentication mechanism auto-selection requires ..."
>>>
>>> What do you think?
>>
>> Good idea to avoid it altogether.
>>
>>
>> Kind regards,
>>
>> Paul
>
>
