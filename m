Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5997D0FC1
	for <lists+autofs@lfdr.de>; Fri, 20 Oct 2023 14:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377155AbjJTMh7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 20 Oct 2023 08:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377079AbjJTMh7 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 20 Oct 2023 08:37:59 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C423126;
        Fri, 20 Oct 2023 05:37:55 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E4F765C0B43;
        Fri, 20 Oct 2023 08:37:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 20 Oct 2023 08:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1697805471; x=1697891871; bh=9QNPqwRDcZlrvt91c+3etbh0BxgwUgfNZr/
        o/gl+odo=; b=UanxiwEDWTEH0PBAKXMFyf8mk2xjAYLsWSefdeP/3w1hQgito+h
        vRQb6i+U+r8kXQBa6JhuvyAfUUEhx7gOz72gFUwsjqTc2W3C6mioo4JJ3gv4um9o
        yN+8onTen1NeGVUaxsJqR2/hAzNpbnx3nN/Ku2XvxjmLYdi/GGpaI6FnrcLi4op0
        x+e5CgN1A9LGzw+Kvhvao7RSnGFuC3UYCP9PcbVro4IDNGNf6WMW3VMb4w5+nazc
        3nv1wT7O3f5PKhKvspRDiP7QqkrCb8crsDnUbEzNdLaMe6QJYZ0xS/ksbgWbYP2M
        1jQH7y0zwuSOuzctpVszR2+1QipacUJFGCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1697805471; x=1697891871; bh=9QNPqwRDcZlrvt91c+3etbh0BxgwUgfNZr/
        o/gl+odo=; b=Ei/8V1NOxkilnST4rAAke0DTO34hvwfZeLWdiE9vQNXW9lpsVyj
        HMG1x8ra+Ol0q0Hp/5nvKN1nFtxKAjw8AVI4tjla9D0trciB/XeLrWZfqvRoJUy3
        7KEHYN1jzwnbQPFiGrHHi8YCV7vSv3iNB8xygwoRP2iA0uTtghurWIpZp4y0f0vs
        BLH7g4xBVtQa8QK5AnleYNEWbCDd/8MmBqo93xtDsGE1y3jDJvoleMJ/hWNsFks+
        jVGUQuofBhUlOJkPDRnK7PS0Cvow8Ambdjqix+Fao6kYrtsCfRlRqi76bFIGgtHr
        fJro1rbHhNh2rh7t/CxDXsVPyJ06KY2pY+Q==
X-ME-Sender: <xms:n3QyZbAiI46w1rfrxHic7zKHJ6jhwyq_uVqvKLmVXnDFAoE9-hdyjw>
    <xme:n3QyZRgBVvhFWQR7RAWky47gk2d6nnQaE5pjOPPjXG64G5MK_iLpYLeB7Oxe4ju4P
    1GLN_Og6Oi2>
X-ME-Received: <xmr:n3QyZWlfGssOQaumdqCf7WY-HNCA2KO99RuQVsE6Sk-ck_ZMqCQhLis1Gvpp8hP6644gW3nEaVOW7jxXSgSTRtfZ7tYDGiSXQOYTz1NM8KaXVZZ93PvAuaU->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeekgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    euhfeuieeijeeuveekgfeitdethefguddtleffhfelfeelhfduuedvfefhgefhheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:n3QyZdxhonMhRo4BOKKf8UJPhbXMsvAXWVBR5XQ_9yIQuIE6EKGxVQ>
    <xmx:n3QyZQQXI1uYvgP_pzOD9-g6klhCbyaMDaphsjwToX8otPUZ0Ve97w>
    <xmx:n3QyZQYBNYUvEfLvwKbGSTNOg3dHy0TCEEtVuxNGxo50CJ1MX430aA>
    <xmx:n3QyZVQBIisVMfeV18DQhRhCk3G6kKYZgyfl-vxIlICZJpk12fafrw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Oct 2023 08:37:47 -0400 (EDT)
Message-ID: <5e4f0e11-1896-041c-3b32-c05af91d1526@themaw.net>
Date:   Fri, 20 Oct 2023 20:37:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: autofs: add autofs_parse_fd()
To:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        autofs@vger.kernel.org
Cc:     Bill O'Donnell <bodonnel@redhat.com>,
        Christian Brauner <brauner@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYt75r4i39DuB4E3y6jRLaLoSEHGbBcJy=AQZBQ2SmBbiQ@mail.gmail.com>
 <71adfca4-4e80-4a93-b480-3031e26db409@app.fastmail.com>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <71adfca4-4e80-4a93-b480-3031e26db409@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 20/10/23 14:36, Arnd Bergmann wrote:
> On Thu, Oct 19, 2023, at 17:27, Naresh Kamboju wrote:
>> The qemu-x86_64 and x86_64 booting with 64bit kernel and 32bit rootfs we call
>> it as compat mode boot testing. Recently it started to failed to get login
>> prompt.
>>
>> We have not seen any kernel crash logs.
>>
>> Anders, bisection is pointing to first bad commit,
>> 546694b8f658 autofs: add autofs_parse_fd()
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> I tried to find something in that commit that would be different
> in compat mode, but don't see anything at all -- this appears
> to be just a simple refactoring of the code, unlike the commits
> that immediately follow it and that do change the mount
> interface.
>
> Unfortunately this makes it impossible to just revert the commit
> on top of linux-next. Can you double-check your bisection by
> testing 546694b8f658 and the commit before it again?
>
> What are the exact mount options you pass to autofs in your fstab?

I've only just seen this report, sorry about that.


I'll have a go at trying to reproduce it but debugging in an environment

like this will be something of a challenge I think.


Ian

