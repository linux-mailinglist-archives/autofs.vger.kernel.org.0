Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D3E6B70C2
	for <lists+autofs@lfdr.de>; Mon, 13 Mar 2023 09:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjCMIBV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 13 Mar 2023 04:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjCMIA4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 13 Mar 2023 04:00:56 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642CA125B5
        for <autofs@vger.kernel.org>; Mon, 13 Mar 2023 00:58:10 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 480FB5C00E3;
        Mon, 13 Mar 2023 03:57:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 13 Mar 2023 03:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1678694221; x=1678780621; bh=/uRTFOmICLyTA2jltFoE4rqfAUDSMw0AwsU
        tOIxSYn4=; b=ofHnEHwzk4N6xmA1Cv3Nn7wzd0SEYIPILlkuhQ6F4yFxcNW3PUg
        SbwFKxj+IV87u5dPAre44/yAym5o6vLFjOyogsJG+Lmbrukd+njO314Ng5Fzjytc
        kr1Zm03W16JFVbMFheqrbRvxpTB6KQoRB+vHBzNABpLRr02yEYT87K39VcyIvS/2
        fvPKKybn5a42YNjI936iOfd+FP8LNR4wbqNVHhKXZ3LOFH43N+1bjmloOhvqKc+P
        kHovVaRM4p9PtZ2cOjIFMaKb3rvz/pB6T4KY/nFwjzXDrZviDYZ+TN8FgBiAaMIJ
        ccJO6b8yK0p81zODZUqPcoVgLqdVNRIJctg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1678694221; x=1678780621; bh=/uRTFOmICLyTA2jltFoE4rqfAUDSMw0AwsU
        tOIxSYn4=; b=JB9gzRO1xoS1AbAGRkVz23FtXGfrEmDNBIa0+WhQvc8jDzge/gy
        9JfR3ydky7+0OsPde7jltZdxfcC6xyZL+daD6+nLZ2oHsLKLevJlenxqPyPtz2TB
        yqc3CBzRHJKUuuNmQlo8kayHkagCTVmqo/VLj/IJAQ94+5Qou7YMkCduNgK9EiFz
        eV0MrAXaJeMWpXysc+g6CAPMSvj7fSdMQODdpn8k4swSJSSPg70Ogi0VDEJmThOG
        9ToygIo6eIqW7xg2NIwlPupl6cx5gi8Wh55AXnTORPHwTWb9AwcoWqAcW+jJAqpJ
        8rPqyzauTNlD42nzF4/MbrCU1FYXlWowKRw==
X-ME-Sender: <xms:TNcOZDrbdlfcofRm88IGZpDQt5BsE8sImY1H0dGatZGi7wXcGG1Vpw>
    <xme:TNcOZNqP_7MZVlVG04mop7fe6sIOr0EhjDYfWQ6GXf4jq49nB0LJbWARie_FQANe3
    ThaZjXX-9v5>
X-ME-Received: <xmr:TNcOZAN0Zt9Vf-wtcz7-0MeFnIfUn63BtcY8E1CTCENyeUWPh0d51ubl-FzGM9OCnxZjHIqZr2Ec22m4m93s37mgkRghQR-mxx-nI7H-MpAyoJTIfCr5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvfedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgse
    htkeertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgr
    fidrnhgvtheqnecuggftrfgrthhtvghrnhepgedvteevvdefiedvueeujeegtedvheelhf
    ehtefhkefgjeeuffeguefgkeduhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:TNcOZG6Dgfz6TiirazMZqxBuvFBeiYZo_fqusGlkocF7afhQOkBD1A>
    <xmx:TNcOZC6O5agjKr41_LPVdES_dMDOeYQYHaF7j1Ki3rnxIKPWZXdvKg>
    <xmx:TNcOZOh5yZ5CniKDzCPspGHa9pdM2CYxJ-DgXM2XzuAd9cXC9LFKaw>
    <xmx:TdcOZPUjkI5hriXfkQAU9mL4dK60RvkS512dOCJ8ACBMTS_60nC08A>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Mar 2023 03:56:59 -0400 (EDT)
Message-ID: <f748072c-52a0-32a3-aaef-4689c3adaa41@themaw.net>
Date:   Mon, 13 Mar 2023 15:56:55 +0800
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
 <cb91e968-1014-fdfe-596a-fd758856aa44@themaw.net>
 <78d83b4f-b3c6-eb2e-ab3d-76824b9b29f7@themaw.net>
 <167867796579.8008.1010314226146743739@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167867796579.8008.1010314226146743739@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 13/3/23 11:26, NeilBrown wrote:
> On Sat, 11 Mar 2023, Ian Kent wrote:
>> On 11/3/23 14:26, Ian Kent wrote:
>>> On 9/3/23 17:23, NeilBrown wrote:
>>>> On Thu, 09 Mar 2023, Ian Kent wrote:
>>>>> On 8/3/23 13:52, NeilBrown wrote:
>>>>>> New flags in the master map:
>>>>>>      autofsshared
>>>>>>      autofsprivate
>>>>>>      autofsslave
>>>>>>
>>>>>> cause the corresponding mount propagation flags to be set on the
>>>>>> autofs
>>>>>> mount point.  If none are specified the current behaviour of
>>>>>> inheriting
>>>>>> from the parent unchanged.
>>>>>>
>>>>>> For example specify "autofsprivate" allows mount points to be moved
>>>>>> away from autofs using "mount -M .....".  This is not supported by the
>>>>>> kernel for the normal default of "shared".
>>>>>>
>>>>>> Better flag names should be chosen.  I would have liked to use
>>>>>> "shared",
>>>>>> "private", and "slave", but they are already in use and only affect
>>>>>> bind
>>>>>> mounts.
>>>>> Looks fine, I'll add it to my patch queue, can't say when I'll commit
>>>>>
>>>>> them though. If you need it committed sooner let me know.
>>>> No rush at all - that fact that you don't hate it is enough for now.
>>>> I was hoping you *would* hate the flag names I chose and would suggest
>>>> something better.
>>> I think your suggesting merging this with the existing code, that's were
>>>
>>> I was going too.
>>>
>>>
>>>> After pondering some more the best I can think of is
>>>>
>>>>     private-autofs
>>>> etc.
>>>> Can you think of anything better?
>>>>
>>>> maybe
>>>>     private=autofs
>>>> which could later be extended to a list of filesystem types...
>>>>
>>>> My other thought is that if they autofs mount is "private" then that is
>>>> inherited to all descendants including the "bind" mounts.  So if we
>>>> changed "private" to apply to the autofs mounts rather than just the
>>>> bind mounts, then it would still affect the bind mounts as documented,
>>>> but it would affect more as well....  I guess that would end up
>>>> negatively affecting someone though...
>>> I can't remember now the motivation for what I originally did.
>>>
>>>
>>> I'll need to look at that but I suspect it's similar, if not
>>>
>>> the same, as your reasons for needing it. I should get a bit
>>>
>>> of time soon to have a look ...
>> It looks like the only thing to worry about if we decide to merge
>>
>> the existing propagation options and these is whether we check
>>
>> and stop people from shooting themselves in the foot by causing
>>
>> a deadlock and working out if there are other cases of deadlock
>>
>> beside bind mounting.
>>
> I'm not sure that I understand the cause of the deadlock.

It's been a while but IIRC it was because of mounts that were

propagation shared.


They were propagating to another mount but were also being

propagated back which was strange. Again, IIRC and I'm not sure

I do, when a mount was triggered it was causing the propagation

(back) to cover original mount and trying to follow it triggered

another mount that couldn't be competed (since the first couldn't

be completed). It was odd and I'm pretty sure it shouldn't have

been happening.


Fact is it was hard to understand what was going on in the first

place, but one thing is sure, propagation shared is not friendly

for automounting and is probably a bad choice for the root file

system on systemd's part.


>
> I assume it happens when an autofs mount appears somewhere that the
> automount daemon doesn't know about, and when propagation is configured
> so that when automount mounts something on the location it *does* know
> about, the mount isn't propagated to the problem location.

Tbh, I can't remember now.


>
> And access of that problem location would then block waiting for the
> automount daemon to mount something, but it never will.
>
> Is that correct?  Is that the only problem?

I think the only autofs problem is mounts can be set propagation shared.


>
> So if automount bind-mounts something from elsewhere over an autofs
> mount point, it doesn't want any autofs mount points is mounts below
> this to be propagated back to the origin.  This is why it defaults to
> "slave".  That makes sense.  It would be safe for mounts to propagate
> back only of the original mount was shared or slave - be we cannot check
> or enforce that.

I don't think there is any autofs case where a mount should be set

propagation shared. I am talking about autofs mounts themselves

though not the things autofs mounts for us.


>
> Though if the first autofs mount point were already private, then it
> should probably leave the child bind-mount as private rather than change
> it to slave.

Yes, I agree.


>
> It feels like there is a lot of potential for problems if someone
> creates a bind mount from an automount-manager tree and makes it
> private, or if the original tree is private.  So maybe we shouldn't
> support "private" autofs mounts.  They should be shared, slave, or
> unbindable.

I don't think we should allow autofs mounts to be set propagation

shared, if someone wants to do this they probably don't actually

need to do it and will very likely see a mount hang.


Not sure about private usage, in fact I don't think I care either

way. Thing is users might get themselves into odd situations but

I don't think it will lead to problems bleeding into other mount

trees like we see with shared mount trees.


Clearly binding a private tree elsewhere is going to leave a tree

of mounts that will need to be umounted manually unless it is within

a new mount namespace.


The use case for bind mounting autofs mounts (well what I mean is

actually mount namespace creation but it sounds like and looks like

bind mounting when talking about containers) is into containers where

they need to have the same path to work and need to be propagation

slave for the child directories or mount point triggers that cause

automounts to trigger that then propagate to the namespace.


>
> Similarly slave autofs mounts would be a problem as if they are
> bind-mounted to somewhere (or just duplicated into a new namespace).
> Changes made by automount wouldn't propagate elsewhere and so deadlocks
> could happen.

I think we do need to distinguish between bind-mounting and mount namespace

creation. I've previously used these interchangeably which is not right.

Propagated mounts (I think) are cloned not bound (hehe, sounds like a

bind mount).


Straight bind-mounting generally isn't useful. I'm not sure it should be

prevented since it's usually not harmful although also not useful. Mount

namespace creation should prevent propagation shared autofs mounts being

included, and there should be some way to prevent any autofs mounts (trees)

from being included, and only specifically requested mounts should be cloned

to the target namespace.


But that's kindof a "never ever do this, but allow it if someone says 
please"

type thing, and I don't know how to do that, ;)


>
> So maybe the autofs mounts should always be either shared or unbindable.

I agree with that.

Not sure we care about unbindable since pure bind mounts should not cause

harmful side effects but they aren't useful either so ... it's an open

question.


>
> When autofs mounts a new filesystem on an autofs mount it can safely
> inherit from the parent.  However when it bind-mounts an existing
> filesystem it needs to ensure it is at most "slave".
>
> So I can see two sensible options.
>
>   1/ The autofs mount is "shared" if parent is shared, and is
>      unbindable otherwise.
>      bind-mounts are "slave" if the parent is shared, or
>      unbindable otherwise

I think it's only necessary to over-ride setting the mount propagation

shared, I don't think there's a use case for shared at all. I may be

wrong ... time will tell.


>
>   2/ Everything is unbindable.  This could be achieved with the "private"
>      option.

I must admit I found unbindable behavior odd.

I played with it a bit and probably need to do so again.

IIRC I thought it wasn't usable to prevent bind mounting.


>
> I guess that we still need to support "shared" with leaves bind mounts
> as shared, but with a warning that deadlocks can occur if used
> carelessly.

Haha, did I say I really don't like propagation shared mounts ... just

in case, I don't like mount that are propagation shared, ;)


Ian

