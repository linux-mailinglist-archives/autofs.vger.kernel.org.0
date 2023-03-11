Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963096B58EF
	for <lists+autofs@lfdr.de>; Sat, 11 Mar 2023 07:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCKG0b (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 11 Mar 2023 01:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjCKG0a (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 11 Mar 2023 01:26:30 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4ED913D1C4
        for <autofs@vger.kernel.org>; Fri, 10 Mar 2023 22:26:23 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6907F320076F;
        Sat, 11 Mar 2023 01:26:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 11 Mar 2023 01:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1678515981; x=1678602381; bh=HBdJtEkUh+hV/Q6dolGm6Yow+cWFmkVP/dG
        XunEucjw=; b=KQPAtpPV4N8KVqob2TROTm5tm5/wN4IXwQHSzs1/msoV/9+kWi8
        XSlSBbO76Nc5IL8y/XieeotBXW+rZ8pqqmqlucyP2DCorwku6nzInKKu2aF6f6Ra
        3Pd5j3xjGXtrPRVIPT+3zIUOWxYpR99XJYWmrbz7/Mt28gIzkjcvcq/thDHoG4qT
        JddbyIuZuLdXfvu5AXzPJvoyqyjKsKwUEYIC54tGDT45VutbSvDSSK4VjpUcqGSi
        gzvObsu8HexOB7qpMdUQ5RJtZ5BV9wmRtEPV7WaP/tKhaqZyTpDPSMXL6ULvjrPr
        6L5likBk2KLYqATgv9hwZYm1o4HE3CZ4XFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1678515981; x=1678602381; bh=HBdJtEkUh+hV/Q6dolGm6Yow+cWFmkVP/dG
        XunEucjw=; b=tNW96UXkowxpyWv94t7nxGmM/wrAK3N/s2zW2Y5em9pfxSDPBfR
        mxtxdxEd9WhWhyLnZXvq9ROfDbXs/nBa1aepBvJG036ZJ71kyPip0PSt55fxagbZ
        na1YZ88UYTieiNhf48G+XWcKT101fRAbXahxiJWV4R+HUAEDg7xBcZLRxp3SJkg/
        4ISpY4ElPhJpBkt2YfCCA8Yi8U2bsxhzs7VLi4tSlrMOI2658z+kyYCOYr5pMr+P
        J6U/gZCI7gbTS2iL5WOVdrCxQkph1Aqqe5mF75fTh66ihQy+D0m6ThTBeFIrRsXT
        gE2BHhborXOWfK4iqf7g9fdtfV2hV5qDZVw==
X-ME-Sender: <xms:DB8MZJZmT-924C4cDMkCyz8s2RZh8B43-9sIyZhLEs3eObgfgSY7LQ>
    <xme:DB8MZAaONyn2I9JZtmv-kb92K3oi8skH85_GCS3XqzZT6gWElPqy-9Avsprdq-nVz
    WEUrZir9Erd>
X-ME-Received: <xmr:DB8MZL80KY-V3J57IQbdYxOg5mg-mrpp31eapgh8VJuInjJ-raLny6slbobt3MCQK-A20tAJEQQEXINyYG_oc5Z3zGfflZCwfEtsR0rXxd3zg-YAg8ye>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduledgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfeuieeijeeuveekgfeitdethefguddtle
    ffhfelfeelhfduuedvfefhgefhheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:DB8MZHp75oAS6iRcF3wVZ5vWEsBNyaNpq59xKM5ft7vr3cP2LyRWJA>
    <xmx:DB8MZErzzdHpAEblA2_1NiIOWY1E9PMHsquryvGERmt3EguLD5GZkw>
    <xmx:DB8MZNSuY1L0BohQKmKkCl_vk5kCr1oYUScVniKk1vdbKkwa3i2qhQ>
    <xmx:DR8MZKE7AYLy7JsM4hQZcBVOKWCMoy_ebd01Zz-igAO5RNAHGK3BQQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Mar 2023 01:26:19 -0500 (EST)
Message-ID: <cb91e968-1014-fdfe-596a-fd758856aa44@themaw.net>
Date:   Sat, 11 Mar 2023 14:26:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167825473018.8008.14797686282321546235@noble.neil.brown.name>
 <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>
 <167835380568.8008.17125175633261559260@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167835380568.8008.17125175633261559260@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 9/3/23 17:23, NeilBrown wrote:
> On Thu, 09 Mar 2023, Ian Kent wrote:
>> On 8/3/23 13:52, NeilBrown wrote:
>>> New flags in the master map:
>>>     autofsshared
>>>     autofsprivate
>>>     autofsslave
>>>
>>> cause the corresponding mount propagation flags to be set on the autofs
>>> mount point.  If none are specified the current behaviour of inheriting
>>> from the parent unchanged.
>>>
>>> For example specify "autofsprivate" allows mount points to be moved
>>> away from autofs using "mount -M .....".  This is not supported by the
>>> kernel for the normal default of "shared".
>>>
>>> Better flag names should be chosen.  I would have liked to use "shared",
>>> "private", and "slave", but they are already in use and only affect bind
>>> mounts.
>> Looks fine, I'll add it to my patch queue, can't say when I'll commit
>>
>> them though. If you need it committed sooner let me know.
> No rush at all - that fact that you don't hate it is enough for now.
> I was hoping you *would* hate the flag names I chose and would suggest
> something better.

I think your suggesting merging this with the existing code, that's were

I was going too.


> After pondering some more the best I can think of is
>
>    private-autofs
> etc.
> Can you think of anything better?
>
> maybe
>    private=autofs
> which could later be extended to a list of filesystem types...
>
> My other thought is that if they autofs mount is "private" then that is
> inherited to all descendants including the "bind" mounts.  So if we
> changed "private" to apply to the autofs mounts rather than just the
> bind mounts, then it would still affect the bind mounts as documented,
> but it would affect more as well....  I guess that would end up
> negatively affecting someone though...

I can't remember now the motivation for what I originally did.


I'll need to look at that but I suspect it's similar, if not

the same, as your reasons for needing it. I should get a bit

of time soon to have a look ...


>
>>
>> This takes things a bit further than I had.
>>
>> May I ask, what was the motivation for adding this?
> As the commit message hints, I have a customer with a work-flow that
> involves moving mount out of the automount tree with "mount -M ....".
> This used to work perfectly in out SLE-11 product which didn't use
> systemd and so followed the kernel default that mounts were "private" by
> default.  "mount -M" only works out of parents that are private.

Haha, but it's worse than that.


What about systemd's PrivateTmp (I think that's spelling) which creates

a new mount namespace for temporary files. Think about what happens if

you restart a service which this setting when there are autofs mounts

present. Maybe someone made some changes because I haven't seen problems

of this nature for a while but at one time the autofs mounts propagated

to the temp files mount namespace and could never expire preventing them

from ever being umounted including those in the init mount namespace.


I think there's also systemd-nspawn that might have similar problems.


Anyway, it's not very fun, so what your doing is useful, !!

>
> But with SLE-12 we use systemd, and systemd sets everything to "shared"
> by default.  There are good reasons for this and the customer doesn't
> want to over-ride it globally.  They just want the autofs mounts to not
> be shared, so that mount -M works.
> Don't ask me why they want to move mounts like this - but it doesn't
> seem an unreasonable thing to want.

I'm not sure how useful this would be, autofs is very much path based

due to it being driven by path based maps (as you know).


Mind you it sounds a bit like how automounts can work in containers.


Essentially you bind mount (eg. docker --volume=<path> option, IIRC)

the autofs mount into the container at start and child mounts get

propagated to the container. The paths just need to be the same inside

the container.


Ian

