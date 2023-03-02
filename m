Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023F76A7872
	for <lists+autofs@lfdr.de>; Thu,  2 Mar 2023 01:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjCBAhU (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 1 Mar 2023 19:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCBAhT (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 1 Mar 2023 19:37:19 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7934FA9F
        for <autofs@vger.kernel.org>; Wed,  1 Mar 2023 16:37:18 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id EC2C2320096F;
        Wed,  1 Mar 2023 19:37:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 01 Mar 2023 19:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1677717434; x=
        1677803834; bh=HDvF6ZDJTsDy3evqb0c5rYZbuRIdn2Un6kk0Nhi4AxE=; b=l
        /wH3lNbFCWYlyYywKMgbqN6CrVKZW2ZToECnbCjpxzMwkzCHD1/rWw/B1fesPyXs
        WGO7C7jrGSs7WtSYPsk/4A4lXyTjmZ9I6vqJ0Bt+PyHb1InD857LWd9ZYHQLsd7n
        iXFp2oXYuD4qhPMCKC75f+XjSR9mvWEXkTm2Sq4F7nMkEt6RS1dm8NiE8QXxWHAJ
        yaaXPsQKX8Ur7DdaPRLPboSSZLEFojwnmyqEFMDKkXhwnVjxH1XSst/Z2S23qRAK
        +SZP5zMFLSPhA6T7pA1deE9osD6kW9ynxEf/FfXaSCfCoWneXdGx+huuMMmzFGRK
        0mYzb5iWUG0DP0RSFJtjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677717434; x=
        1677803834; bh=HDvF6ZDJTsDy3evqb0c5rYZbuRIdn2Un6kk0Nhi4AxE=; b=e
        J40lG6TaKK2EfYR6zxYUxTsiV4MagYRI1eLK8lEysitKZU3+9DsIqDAEvAWjgEax
        MuUY25nUPkreawiNIBVkEaya9rghYuUsAxdPhIQh5TpYQJAboCoYNwDtO2fjgh6m
        aNrdPZzA310Xr49qAfKB+E93ZztRqyvSMWlqRy1q7HnLb9Qv0wxbz/r1StcbiIAx
        4TFuDCyjxKGHIjGmZKJGoeyFi3lsmlwtnVRrDwN9KRp/CN9wPue2FMll4QVUXIc+
        NfwgAUuZQp/6uAAoJNe7KtS2uujH675ldq6bnaT0sFb0X7+9UaHuVGY+cnJ6Rnvp
        z/Vc/rRxUM407+OTef7Vg==
X-ME-Sender: <xms:uu__YzSgTlTzUt41MUNJQFg_iAYZSF5ES8mXpx-G-DuwuuWzcv9uMQ>
    <xme:uu__Y0wKT5m_IfI3S8Mkh16xJYnAsgjuU2L7MZzEaEwl_Lhndavr5iVWwet4xxojL
    bbWQEm6RsIY>
X-ME-Received: <xmr:uu__Y40CWKf9oNs_AWF5Kq4zePRvbANzMpwK_oySTfn-uiIlOsZOb7xYvBqc-fYso8-6A3aDKZcQGBwPF90vYgDetGTlH78ewQTPaKtXeXwiZIg-mKe6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeliedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpefhgeffkedtvefhjedvffffheeukedvueeige
    etieelheffudeugfegieeivdehjeenucffohhmrghinhepshhpihhnihgtshdrnhgvthen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvg
    hnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:uu__YzAwozdWndPrIJCQci2MNtBK4yP8Tqtk09uREFMuhwgSPsgJBw>
    <xmx:uu__Y8hoSpYyoG4p0157wEx-8CNoo9AyroO9Z94QfCp4f3UcjzGciw>
    <xmx:uu__Y3rpGGG1Tc-YrL1K4rGI8AV5CvU9933iWcfqwQFKtlQkPiKVkw>
    <xmx:uu__Y6e6VftGzryvTSYESfSJ99N5db_LrJWc_NaVB30wvtvf2aWLxw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 19:37:13 -0500 (EST)
Message-ID: <2983eb2d-1884-974f-1b55-f1a67c1f04ee@themaw.net>
Date:   Thu, 2 Mar 2023 08:37:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Help with autofs hang
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167684642746.11359.12533584244594425604@noble.neil.brown.name>
 <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
 <167686859468.11359.12004508002400033963@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167686859468.11359.12004508002400033963@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 20/2/23 12:49, NeilBrown wrote:
> On Mon, 20 Feb 2023, Ian Kent wrote:
>> On 20/2/23 06:40, NeilBrown wrote:
>>> Hi,
>>>    I have a customer who is experiencing problems with automountd.  I
>>>    think I know what is happening, but I'm not sure if what I imagine is
>>>    possible, or what the best solution is.
>>>
>>>    The kernel is 4.12 and automountd is 5.1.3 - so not the newest, but not
>>>    ancient.  I cannot see any changes since that look like they might be
>>>    relevant.
>>>
>>>    The problem is that after a while automountd stops expiring direct
>>>    mounts, and doesn't mount any new direct mounts that are added to the
>>>    map.
>>>    
>>>    When this happens an automountd thread has sent an
>>>    AUTOFS_IOC_EXPIRE_MULTI ioctl to the kernel, the kernel has sent a
>>>    NFY_EXPIRE back up to automountd.  automountd reported
>>>
>>>      handle_packet_expire_direct: can't find map entry for ....
>>>
>>>    and the kernel never gets an ACK for the message and things hang.
>> Yes, that case is fatal.
>>
>>
>> Because the kernel communications pipe might not be able to convey
>>
>> the direct mount path a bogus value is encoded into the packet and
>>
>> an inode number to path index is used to lookup the path. Without
>>
>> the path we can't continue.
>>
>>
>> But this hasn't happened to me for a long time.
>>
>>
>>>    When I look, the mount point that the kernel is asking automountd to
>>>    expire has already been unmounted.
>> That's not right ...
>>
>>
>>>    The mount map uses LDAP and changes quite often.  My guess is that
>>>    automountd notices that some directory has been removed from the map,
>>>    and so removes the map entry.  This presumably races with the expiry
>>>    process.  The mount gets unmounted because it is removed from the map
>>>    at the same time that expiry wants to remove it, and confusion results.
>> That sounds different to the terminology I'd use but I think I get what
>>
>> your saying.
>>
>>
>> I would describe it as, a map entry has been removed from the map when
>>
>> it's in use causing expires for that map entry to be done on an entry
>>
>> that's been removed from the index we need for the map entry lookup.
>>
>> This map entry shouldn't be removed in this case.
>>
>>
>>>    
>>>    My current thought for a solution is to change the way the kernel waits
>>>    for NFY_EXPIRE replies.  Instead of waiting indefinitely it waits with
>>>    a timeout.  If the wait times out and the filesystem is still mounted,
>>>    it just loops around and waits again.  If after the timeout the
>>>    filesystem has been unmounted it waits one more time (just in case
>>>    automountd is about to reply) and then aborts the wait with -EAGAIN.
>>>    I've provided the customer with a patch to do this using a 5 second
>>>    wait.  I don't have test results yet.
>> I really don't think this is a kernel problem, it's a user space problem.
>>
>>
>> Some time ago there was a weird case where an active map entry was being
>>
>> removed from the map entry cache. I had a little trouble even working out
>>
>> what I had done when I cam across it in a clean up a while ago. So if
>>
>> this is what your seeing we'll need to do some work to work out what
>>
>> I saw and what I was doing to fix it.
>>
>>
>> Let me check 5.1.3 and get back to you.
>>
>>
>>>    So my questions are:
>>>     - is this race really possible? Can removal-from-map race with expiry?
>> Well, maybe but it shouldn't because walking into an expiring mount
>>
>> or one that's being mounted shouldn't be possible and I haven't seen
>>
>> symptoms of that happening for a very long time, certainly not with
>>
>> a kernel as recent as 4.12.
>>
>>
>> I really think it's a mistake I'm making in the user space code.
>>
>>
>>>     - is my timeout fix reasonable?  Might it cause other problems?  Is
>>>       there a better way to fix this inside automountd?
>> Probably and don't know.
>>
>>
>> I think user space is the problem here and I suspect trying to change
>>
>> the kernel won't actually fix the problem because it's a user space
>>
>> mistake that could still happen.
>>
>>
>> I'm not sure about the wisdom of my not trying to recover from this
>>
>> either. Originally it was done because if this happened things would
>>
>> only get worse and the problem would become hidden. So I made the fail
>>
>> fatal so I could get a core of the state at the time it happened and
>>
>> that would be more likely to yield information about the cause. And
>>
>> this should never happen so the only choice is to fix it.
>>
> Thanks - you've given me some useful pointers.  I'll look some more.
>
> I have a core of automountd while it is hanging (so after the initial
> problem) and also a core of the kernel.  So if you do find more time to
> look and want me to find something in a core file, just let me know.

Umm ... sounds like you didn't see my second reply to this.

It refers to a commit that resolves a problem that sounds a lot like

what your seeing?

https://www.spinics.net/lists/autofs/msg02557.html


Ian

