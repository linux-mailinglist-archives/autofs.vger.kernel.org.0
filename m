Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E7B6B594C
	for <lists+autofs@lfdr.de>; Sat, 11 Mar 2023 08:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjCKH2p (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 11 Mar 2023 02:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjCKH2o (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 11 Mar 2023 02:28:44 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FCBE63E5
        for <autofs@vger.kernel.org>; Fri, 10 Mar 2023 23:28:40 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E5303320092F;
        Sat, 11 Mar 2023 02:28:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 11 Mar 2023 02:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1678519717; x=1678606117; bh=zL08AeYH0KQcvzpm69941w/AouULIZpcSPY
        yxGkxXss=; b=KlzkMZHIlcnI/QHTKlGuDjaTH0pWuIYCorUs3VCj7Et24CI0maM
        sIFq1ivpZIz6NJ7bIgQiY3QZgWSyW26Jf/j4dBNmDdrIkYac4oP0CCCqrmfRK15g
        WlWbfrcWcfQhepmdYmg9lSkuuzftX4iTOoU073t0kpALZUu2ibjtW6PX8X4jO8Ld
        rgR9ZY+jUb6NIZDQB4k91aTihEbRIMaCOzB5JkJ8iw4k141ajLNWAOUAEShhCo5Y
        HUBRcZq+yaAsAnKn7qJMVtvB3m0A3dJgp2bKYcaNPNj4fIXhIqRtDLWUmpQpjz3K
        ZdX2U7lp1IBz3VT++B+0ldG0GHoQZGz04Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1678519717; x=1678606117; bh=zL08AeYH0KQcvzpm69941w/AouULIZpcSPY
        yxGkxXss=; b=hZB2zFtFzngHjcOI5M636pFlXgyi0NH31B27xvqtb9AamwJ/05I
        es5nsyjpU3bJu7xXDuGf5KiTITUhfcx1J8v2EeVdEO64erun+BQNckbhyVeUoupz
        /iyheW6QCZkYdKVd9ix5bGlnEq33Tu/3NhwGUAQa+Dp3Q/5kNYL45b5WUroOk4PX
        6UoCHVPkUcvcW26CLzaOmi6+OXJcxg9yDasPCTK3vTA1MjLE8NAhR4HHbRwMyW4o
        V8XTrddkZb7BM6WPCsH0scwUS3QdTT9qMiOdZRbMNtnI/GDQO60iE9590Kej83kt
        l7Nn8JSGEVHr5Y5U/f6P3PABqCptZmqWu0g==
X-ME-Sender: <xms:pS0MZLsC9iLcMqbqLxezevZcDpv0_Wdn0sDLv_25d0Kxxh3aZNxC7w>
    <xme:pS0MZMdHjd8JuZecHZvhLd5lmvECGmi0JNsCysgkT3LuDImzXAVweswZZcHTSfXCu
    AW_8ZblIKis>
X-ME-Received: <xmr:pS0MZOyxeNJR54SqR8jc3cnqWFQJHOj2dk96KMKd_5coYBWaLbMbfg_RTY1l7tP0E07jXdgzIE3RFGSzSvjq5FMCOpJmEZJXZkzE6u7AaoWSE2nw-1jU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduledguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfuffhvfevfhgjtgfgse
    htkeertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgr
    fidrnhgvtheqnecuggftrfgrthhtvghrnhepieevleekgfdtgedufedufedtleetjeetvd
    ehueelvedvleeuhfdutdeigeevleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:pS0MZKM1sf_GhnyO_0GiaJ6lZU6_xGbvPwGTCtebd7XVkzQdYUSSXQ>
    <xmx:pS0MZL8MLB1djjFMQgNqJ2n1uYPHNVGZxb1Q_kh18n4rNx7i0p8T_w>
    <xmx:pS0MZKWjL-JIHp86aBTktlojKlkuuOyqeY2UiOEZlW4VXbnNZ3C0pA>
    <xmx:pS0MZIIMUvlyHyMm1CK6GFaKo3kk-6ElF-_eyPBncvKgU7f5k3Yv1g>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Mar 2023 02:28:35 -0500 (EST)
Message-ID: <78d83b4f-b3c6-eb2e-ab3d-76824b9b29f7@themaw.net>
Date:   Sat, 11 Mar 2023 15:28:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167825473018.8008.14797686282321546235@noble.neil.brown.name>
 <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>
 <167835380568.8008.17125175633261559260@noble.neil.brown.name>
 <cb91e968-1014-fdfe-596a-fd758856aa44@themaw.net>
In-Reply-To: <cb91e968-1014-fdfe-596a-fd758856aa44@themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 11/3/23 14:26, Ian Kent wrote:
> On 9/3/23 17:23, NeilBrown wrote:
>> On Thu, 09 Mar 2023, Ian Kent wrote:
>>> On 8/3/23 13:52, NeilBrown wrote:
>>>> New flags in the master map:
>>>>     autofsshared
>>>>     autofsprivate
>>>>     autofsslave
>>>>
>>>> cause the corresponding mount propagation flags to be set on the 
>>>> autofs
>>>> mount point.  If none are specified the current behaviour of 
>>>> inheriting
>>>> from the parent unchanged.
>>>>
>>>> For example specify "autofsprivate" allows mount points to be moved
>>>> away from autofs using "mount -M .....".  This is not supported by the
>>>> kernel for the normal default of "shared".
>>>>
>>>> Better flag names should be chosen.  I would have liked to use 
>>>> "shared",
>>>> "private", and "slave", but they are already in use and only affect 
>>>> bind
>>>> mounts.
>>> Looks fine, I'll add it to my patch queue, can't say when I'll commit
>>>
>>> them though. If you need it committed sooner let me know.
>> No rush at all - that fact that you don't hate it is enough for now.
>> I was hoping you *would* hate the flag names I chose and would suggest
>> something better.
>
> I think your suggesting merging this with the existing code, that's were
>
> I was going too.
>
>
>> After pondering some more the best I can think of is
>>
>>    private-autofs
>> etc.
>> Can you think of anything better?
>>
>> maybe
>>    private=autofs
>> which could later be extended to a list of filesystem types...
>>
>> My other thought is that if they autofs mount is "private" then that is
>> inherited to all descendants including the "bind" mounts.  So if we
>> changed "private" to apply to the autofs mounts rather than just the
>> bind mounts, then it would still affect the bind mounts as documented,
>> but it would affect more as well....  I guess that would end up
>> negatively affecting someone though...
>
> I can't remember now the motivation for what I originally did.
>
>
> I'll need to look at that but I suspect it's similar, if not
>
> the same, as your reasons for needing it. I should get a bit
>
> of time soon to have a look ...

It looks like the only thing to worry about if we decide to merge

the existing propagation options and these is whether we check

and stop people from shooting themselves in the foot by causing

a deadlock and working out if there are other cases of deadlock

beside bind mounting.


Ian

