Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C4558EC40
	for <lists+autofs@lfdr.de>; Wed, 10 Aug 2022 14:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbiHJMt6 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 10 Aug 2022 08:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbiHJMt4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 10 Aug 2022 08:49:56 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7139F81B2C
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 05:49:55 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id DF1A25C042D;
        Wed, 10 Aug 2022 08:49:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 10 Aug 2022 08:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660135791; x=
        1660222191; bh=Mz56YK1oL9f0o6xQIzBFeicHVv5fPJyNmW/e2E9bW/4=; b=M
        NSGSUu64TCX5Bz2OvSiaed/n5uSYlpjjyZGGm/ACF3gt66sfNpZZ6J21lowMb07Q
        WPanWwyf/WXV78q0WYCdgpyz3kpLk5bbO2iWRt3qAApoYVNVVh50xN90NureTW1X
        8VnDp/7pyH0+KNw1OzxCmVkxfGmJ6BvgdQ2/g9F/Xwf+0PoEi7pWlp7c2qRE1WQj
        5UpgFCLO/ZBBcJznQA3V8jL63LzAZ/z0yZ+F4406tSNOtz4z35HyxdV6TKsbZBM8
        BnYckOOsxZdqj8cirNjvg7oKB26aXmN50JhbYHeAAxS2IkY3vm6UmegpxDsh5QGL
        wTJdUzClRWu6xjX5jdTEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660135791; x=1660222191; bh=M
        z56YK1oL9f0o6xQIzBFeicHVv5fPJyNmW/e2E9bW/4=; b=y3tVA2a5z9UO9MkJq
        L0aMR8LfwN+Ls7YkAg/7Y8e7OeqGQlG0eU0HCOoDf08Inf+LWi9eLpH2HVxRxbO+
        PFck+eKuN1v3KTDG5yv2Sv3e+A7DEktCJ+4Ws0pvxfQdMU257tmPukvnAf3XIIVJ
        lhuMBIQtS+sAlRc9ECiVpalWm0rqkGm7NAT21QDhLR9AkQhbXXqhbpc0ppKKcGEj
        2dfKQHKb0BuaUrcZ5X02WOmHVrkF0SY/wbBTZX89bYTXJAp+Lj1+6DEbUfPmuw7l
        vPBmWQC/SrmZ/HzeCwkwzJbEI8uoZlHHQ0N8e+LmS3KhyIyaQpMs3yxUmmL9Y+/u
        qr37w==
X-ME-Sender: <xms:b6nzYmng3A58u7Ta-bX0IlESayOS0u1yavIjEFH-uKnMPzVoUvwZBQ>
    <xme:b6nzYt3-a_yNOjZUkS2BqOZia1sQSamDSE8PujoZgDYl3r9b3moSxmJ1VHem6yd9s
    YqddRW64Jsi>
X-ME-Received: <xmr:b6nzYkpqEhKeMKGMzEiXZPQeFktTxvdN8G1GyzPZxCRRGKlUPzY7K3ZHulEy_MZiMjKVxzldy1qpoNBWxuXLPZ67tFYa_ui0yxsVwRRAtXfTufCDwV7J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fggeektddvtdegieelhfetffffueekgeeghedvudelgedvieeiiefhteduheejleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:b6nzYqkpcapZ43D7JDAteYCSAqW6PUAObcFsl85Qjjchn0j8X2YuXA>
    <xmx:b6nzYk1XrG9tLDv08ZgBNlhOKltHrI4LTlfSGmqxtj-hZi9pnRsXSQ>
    <xmx:b6nzYhv2siQbQmVCgP-BVQCNSDHdXqQ7xxqvgSHmnSEh6mjgYAEqCQ>
    <xmx:b6nzYlhQ7CXHdQx-8GpAwArOfJBkTWJ3-YBR7DYUTgE0yx_rbwvwyQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 08:49:50 -0400 (EDT)
Message-ID: <fe56198c-02e8-42eb-5e8d-aad3f7c5bbb7@themaw.net>
Date:   Wed, 10 Aug 2022 20:49:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Missing Support of SASL Sign or Seal using Data
 Security Layer
Content-Language: en-US
To:     Thomas Reim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <75d2e158-631c-5785-d0be-3328056db540@themaw.net>
 <c5551f78-7f5e-5051-0b6a-9ecc4d5ed1a1@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <c5551f78-7f5e-5051-0b6a-9ecc4d5ed1a1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 10/8/22 14:52, Thomas Reim wrote:
> On 10.08.22 03:04, Ian Kent wrote:
>>
>> Thanks Thomas, this functionality sounds useful and the code looks good.
>>
>>
>> Mostly the comments I'll make later (once I've looked at it a few times)
>>
>> are about my coding style preferences but there was one place where I
>>
>> had questions about some function call behaviors. I'm tempted to make
>>
>> the style changes myself but it's your code and I'd probably make a
>>
>> mistake or two, ;)
>>
>>
>> Ian
>>
> Dear Ian,
>
> thank you for your feedback. Looking forward to your comments. I tried 
> to align
>
> the style to yours but of course it's just a guess. Either way is fine 
> for me. Most
>
> important is a working SASL data security layer. So if you like I can 
> also perform
>
> style updates, once I have an idea :-), test all updates and send the 
> reworked patches
>
> to the list.
>

Yeah, I got distracted today but I'll get to it and have a

look at the log changes too.


Ian


