Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C661592D2C
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 12:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiHOKgq (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 06:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiHOKgq (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 06:36:46 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E479E11C13
        for <autofs@vger.kernel.org>; Mon, 15 Aug 2022 03:36:44 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 276875C00B3;
        Mon, 15 Aug 2022 06:36:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 06:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660559804; x=
        1660646204; bh=4vNSA+4BwWuIA4y3WQUUmH3GGon0zbeskOVOdRb/hZY=; b=r
        V+GMJjx98+A9nJbphAL1nGvXDESm9xIod5yMMWztRWRmkw0kT6GLJMXnItg/+9RX
        wXg1PjUTYAp3chEjWRn8icp1weYBY9+R5jFXOQv/cuOha2o5Sl4MpQduPPn4cZIq
        OOdYt60L6xhO4FJ+LpfvpGFCgYbkMe5e2qzNmi8JU+1FUe+8STIJzUOWUQ/+XHib
        fvmsGX8Gpzxq9fkZtkmVf0VPbJHZDWjCjHemrEphYA5X6r6o5lfSA/mOsFpZTx74
        98tYQF9v9bhTTwkglAvsuWI6QBc3+l5rZ4EuArTEsK70qxj56snchkO0Jg44r5RR
        E30MIxaFVUdFvLnhvDt2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660559804; x=1660646204; bh=4
        vNSA+4BwWuIA4y3WQUUmH3GGon0zbeskOVOdRb/hZY=; b=hTwhai1AeCeLVtptq
        sRSsuZqw+wvZhbqER7MVDma8bbqFjZ0OTjhZaz3cd4dy/xvqobhfHy+pjnUeElKu
        0+N9LrLIETJVAODVvk8+hrkgaUSLXU/YiVM981aTWfe9So04IXx0NO0+gb2AxqjA
        0/0qzhd6sfIcimdYEx5sicsGk5Qe8JAi6u8bu2RtUkPCbGjKGNuuhmd/Y8uSqwZG
        C6/frOyapfxw4gLGeWrHA8nhIdwFzj0eJzJXJ6EvLWnurZOrzfE+puFPbVcg/cps
        KFAWOoCDCUJhOo13Sa4M97SOFIRpOHNv+43AySt1XdQsx4RzdL+yYuezcgoDFneO
        THTHA==
X-ME-Sender: <xms:uyH6YgkKabwkhQEcw2tv97YCzFaoGvpI5mSPJDgOKRRb7Ry3Wdl_8A>
    <xme:uyH6Yv13_-2KJdyoD_tcEW7bw_4xi7AMbcqlDK--tTK3yaPUQmc9A-pw-GOAk_U6Z
    3yUhOFq_Ah1>
X-ME-Received: <xmr:uyH6Yuq8L9b2H_Mi2j9wS9iDVq2C9QjB_8MxSgYZye-Op0pItZjfPajvdTcnOnh-bA4rfdaU04rP9-LTcGJGsyRSh9u1Rk7v_4wBH0wBKFka7J-3g6Dz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fhveehueekfeekieevieffiefgtdeiudevieeihefhieffudffudelieevheetteenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:vCH6YskXqW6B4CezgeAuKbDtvoBBgZ27mRnPlXKDm7WeCnprC8L1bA>
    <xmx:vCH6Yu167YAFJh3lxT_LbizL44Cuh6lQZst7ZpzsprkpKPDnBj4Bsg>
    <xmx:vCH6Yjvh8Jrqe21CMmumvZZDPEyapbXjA3O4A7gW6YsLHmg04_Cemw>
    <xmx:vCH6YnjNyUPjkVkegiogM80twlPzlwOUTtu-nT8Scc2rsSKRBbujEQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 06:36:42 -0400 (EDT)
Message-ID: <bbc449df-0ffd-d3de-34c7-b927cf89db65@themaw.net>
Date:   Mon, 15 Aug 2022 18:36:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
Content-Language: en-US
To:     Thomas Reim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <20220809115608.107767-4-reimth@gmail.com>
 <d98ac4bc-6699-19d9-4fe3-4ce2bf300575@themaw.net>
 <19933e9c-1cb0-e087-948a-0bae8fa67cff@gmail.com>
 <84c5dce3-e3db-2537-7e71-43212c48a2c3@themaw.net>
 <672f83f0-e549-ccf6-e425-0cda50ac39c4@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <672f83f0-e549-ccf6-e425-0cda50ac39c4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 15/8/22 14:25, Thomas Reim wrote:
> In order to make review easier for you a subsequent mail will outline 
> the proposed changed to the provided patch (patch-for-patch format).
>>
>> I fear this process will get confusing.
>>
>>
>> What is mostly done by people for patch updates during review is to
>>
>> post the entire series with a v<n>, for this patch would be [PATCH v2 
>> 3/4],
>>
>> and then in the cover letter (or the patch itself if there's only one) a
>>
>> simple summary added to describe the changes.
>>
>>
>> Like:
>>
>> - changes for v2:
>>
>>   - short description of change.
>>
>>
>> If that doesn't fit well with your workflow I can deal with the
>>
>> patch-for-patch process.
>>
>>
>> Ian
>
>
> Shame on me. I could have checked your procedure beforehand.
>
> v2 has been sent.
>
That sort of process is pretty widely used by community projects.


Especially those that have a lot of contributors, its so easy to

become confused without some way to identify patch revisions of

emails.


Ian
