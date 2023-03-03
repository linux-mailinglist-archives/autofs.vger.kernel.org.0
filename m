Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D75136A8EBE
	for <lists+autofs@lfdr.de>; Fri,  3 Mar 2023 02:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjCCBaV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 2 Mar 2023 20:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCCBaQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 2 Mar 2023 20:30:16 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414E855533
        for <autofs@vger.kernel.org>; Thu,  2 Mar 2023 17:30:09 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0D9203200AB1;
        Thu,  2 Mar 2023 20:30:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 02 Mar 2023 20:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1677807005; x=1677893405; bh=/LCnBKhKYN7NkSgTJ38f4U0S1VaEONuXaM5
        qZMYDw+M=; b=iHqAvu9IrIfzbg1nPK80A8HOAuFcoBRlzAOCp6RaN99VW4E32sa
        RMJRmfmEE8t5ssZ/F0bpitSMv9ypsfCjiWtJMEId83knWSl2tLoKgqDaj9gtCCFF
        9fILlVqWe14QipnwS/LTd1N2sorN8DTdtWvLkfzoDHVYEAc9b9p16zm/WJyPWDPv
        RbMUWlWNWyeOOu2hlFEWnJwpuGhP8Kl89Raf9xKSBJQqMKjXN9vKfmxWFwyGQkNQ
        hJRrBst7Ea2PG4VTE8DTvyLarPsECnZC9eI0HflatLzjlHf/yHhlvJJQxo7icO5A
        i8XL11oqK6C7stxej2tJudRTbXvxaEH/jog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677807005; x=1677893405; bh=/LCnBKhKYN7NkSgTJ38f4U0S1VaEONuXaM5
        qZMYDw+M=; b=YKj+dwnF3XuuquOyPMYUSInp/EvMeK4fFcgaAVgVw3iwbTfrmrF
        tLMWTON1tWRZGhjEKrFK9ZlN9c0krQX4dAwoebn3lHgJPH8fLCEBZSQ2WCTu4HB+
        rSbBHM+z7YIwUwnWonlp9mz0iYsoIqavsIRdrZUV1rb2NDia6COyKijj7J6ndms0
        I7NS/PknAdxjUopIfn3zxDEFxgoVMdNRr7VRkNWNyGIBpBuMywZlKA+AgJgBcsdG
        JgWw5+77aO/qTD2qp2/QiJ3wRoTIYDlUrebYfGe0TJUBSqVSEGeEoS+mPGFapkw9
        E3+Pp9IQ+RfLiQadzi4TKE3U5A/tb7gq0gA==
X-ME-Sender: <xms:nU0BZDIKmjpjFuIxqwShfbjr3XUjbrBFkRQ3ixfByzchuXzkJwzMbg>
    <xme:nU0BZHJfzWL-e1Uf2aYCDZUuZp13YAQlwrapQTTbc0ZJc2OcO9_YHFEMB6NheyPL3
    Etfu8viTkyn>
X-ME-Received: <xmr:nU0BZLtnqmWnWD5XYgkIXz9fnKNyS1WAVFS-VxZUqtSUPBZGNbf0QPBA9ZpL3mJH1sMvlPAI4HcGf7HvW9_EOeXj-amuAs8wUmfypxUfu0zvDwXu_UwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelkedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpefhgeffkedtvefhjedvffffheeukedvueeige
    etieelheffudeugfegieeivdehjeenucffohhmrghinhepshhpihhnihgtshdrnhgvthen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvg
    hnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:nU0BZMaYB3Kh2LCTcMQnP7kc3Z4eFe4EV-PO8B7Yhmn93CxN8z3o-g>
    <xmx:nU0BZKa0SSdtvArNZadkrGdhciOUjXiXcteD7x_CqcT1nt5tFECNOQ>
    <xmx:nU0BZACrnfCN7d4wxsqxlg_G7sI9R6T8cRF3_a1bRGYC8_TrVnQcZA>
    <xmx:nU0BZI1O_1OR59v0dtarxERUpagYj4yxnalj_g7KEkEfw2WPfwi2oQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Mar 2023 20:30:04 -0500 (EST)
Message-ID: <53240bdb-6cc3-5fd3-0f5a-030976315306@themaw.net>
Date:   Fri, 3 Mar 2023 09:29:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Help with autofs hang
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167684642746.11359.12533584244594425604@noble.neil.brown.name>
 <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
 <167686859468.11359.12004508002400033963@noble.neil.brown.name>
 <2983eb2d-1884-974f-1b55-f1a67c1f04ee@themaw.net>
 <167778928628.8008.17852591006723680934@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167778928628.8008.17852591006723680934@noble.neil.brown.name>
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


On 3/3/23 04:34, NeilBrown wrote:
> On Thu, 02 Mar 2023, Ian Kent wrote:
>> On 20/2/23 12:49, NeilBrown wrote:
>>> On Mon, 20 Feb 2023, Ian Kent wrote:
>>>> On 20/2/23 06:40, NeilBrown wrote:
>>>>> Hi,
>>>>>     I have a customer who is experiencing problems with automountd.  I
>>>>>     think I know what is happening, but I'm not sure if what I imagine is
>>>>>     possible, or what the best solution is.
>>>>>
>>>>>     The kernel is 4.12 and automountd is 5.1.3 - so not the newest, but not
>>>>>     ancient.  I cannot see any changes since that look like they might be
>>>>>     relevant.
>>>>>
>>>>>     The problem is that after a while automountd stops expiring direct
>>>>>     mounts, and doesn't mount any new direct mounts that are added to the
>>>>>     map.
>>>>>     
>>>>>     When this happens an automountd thread has sent an
>>>>>     AUTOFS_IOC_EXPIRE_MULTI ioctl to the kernel, the kernel has sent a
>>>>>     NFY_EXPIRE back up to automountd.  automountd reported
>>>>>
>>>>>       handle_packet_expire_direct: can't find map entry for ....
>>>>>
>>>>>     and the kernel never gets an ACK for the message and things hang.
>>>> Yes, that case is fatal.
>>>>
>>>>
>>>> Because the kernel communications pipe might not be able to convey
>>>>
>>>> the direct mount path a bogus value is encoded into the packet and
>>>>
>>>> an inode number to path index is used to lookup the path. Without
>>>>
>>>> the path we can't continue.
>>>>
>>>>
>>>> But this hasn't happened to me for a long time.
>>>>
>>>>
>>>>>     When I look, the mount point that the kernel is asking automountd to
>>>>>     expire has already been unmounted.
>>>> That's not right ...
>>>>
>>>>
>>>>>     The mount map uses LDAP and changes quite often.  My guess is that
>>>>>     automountd notices that some directory has been removed from the map,
>>>>>     and so removes the map entry.  This presumably races with the expiry
>>>>>     process.  The mount gets unmounted because it is removed from the map
>>>>>     at the same time that expiry wants to remove it, and confusion results.
>>>> That sounds different to the terminology I'd use but I think I get what
>>>>
>>>> your saying.
>>>>
>>>>
>>>> I would describe it as, a map entry has been removed from the map when
>>>>
>>>> it's in use causing expires for that map entry to be done on an entry
>>>>
>>>> that's been removed from the index we need for the map entry lookup.
>>>>
>>>> This map entry shouldn't be removed in this case.
>>>>
>>>>
>>>>>     
>>>>>     My current thought for a solution is to change the way the kernel waits
>>>>>     for NFY_EXPIRE replies.  Instead of waiting indefinitely it waits with
>>>>>     a timeout.  If the wait times out and the filesystem is still mounted,
>>>>>     it just loops around and waits again.  If after the timeout the
>>>>>     filesystem has been unmounted it waits one more time (just in case
>>>>>     automountd is about to reply) and then aborts the wait with -EAGAIN.
>>>>>     I've provided the customer with a patch to do this using a 5 second
>>>>>     wait.  I don't have test results yet.
>>>> I really don't think this is a kernel problem, it's a user space problem.
>>>>
>>>>
>>>> Some time ago there was a weird case where an active map entry was being
>>>>
>>>> removed from the map entry cache. I had a little trouble even working out
>>>>
>>>> what I had done when I cam across it in a clean up a while ago. So if
>>>>
>>>> this is what your seeing we'll need to do some work to work out what
>>>>
>>>> I saw and what I was doing to fix it.
>>>>
>>>>
>>>> Let me check 5.1.3 and get back to you.
>>>>
>>>>
>>>>>     So my questions are:
>>>>>      - is this race really possible? Can removal-from-map race with expiry?
>>>> Well, maybe but it shouldn't because walking into an expiring mount
>>>>
>>>> or one that's being mounted shouldn't be possible and I haven't seen
>>>>
>>>> symptoms of that happening for a very long time, certainly not with
>>>>
>>>> a kernel as recent as 4.12.
>>>>
>>>>
>>>> I really think it's a mistake I'm making in the user space code.
>>>>
>>>>
>>>>>      - is my timeout fix reasonable?  Might it cause other problems?  Is
>>>>>        there a better way to fix this inside automountd?
>>>> Probably and don't know.
>>>>
>>>>
>>>> I think user space is the problem here and I suspect trying to change
>>>>
>>>> the kernel won't actually fix the problem because it's a user space
>>>>
>>>> mistake that could still happen.
>>>>
>>>>
>>>> I'm not sure about the wisdom of my not trying to recover from this
>>>>
>>>> either. Originally it was done because if this happened things would
>>>>
>>>> only get worse and the problem would become hidden. So I made the fail
>>>>
>>>> fatal so I could get a core of the state at the time it happened and
>>>>
>>>> that would be more likely to yield information about the cause. And
>>>>
>>>> this should never happen so the only choice is to fix it.
>>>>
>>> Thanks - you've given me some useful pointers.  I'll look some more.
>>>
>>> I have a core of automountd while it is hanging (so after the initial
>>> problem) and also a core of the kernel.  So if you do find more time to
>>> look and want me to find something in a core file, just let me know.
>> Umm ... sounds like you didn't see my second reply to this.
>>
>> It refers to a commit that resolves a problem that sounds a lot like
>>
>> what your seeing?
>>
>> https://www.spinics.net/lists/autofs/msg02557.html
>>
> Hi Ian,
>   I did see that - I should have replied.
>
>   I agree the issue that patch addresses is superficially similar.
>   It involves direct mounts not being expired.
>   However I have other symptoms that don't match.  Specifically:
>   1/ new direct mounts that appear in the map don't take effect
>   2/ an automount thread is blocked on an EXPIRE ioctl and when
>      woken up (e.g. just running strace of the process can do that)
>      the symptoms disappear.
>
>   The fix in the patch is to mark a cache entry as stale so future
>   lookups won't find it.  This is almost exactly the reverse of what I
>   think I need.  When the kernel receives a NFY_EXPIRE from the kernel it
>   fails to find any matching entry in the cache.

Yes, negative cache entries are found by lookups but they are

not used. They are kept for cases that need the cache entry

info. for autofs to function.


This patch might not be what you need but what you describe does

sound like the cache entry has been removed when it shouldn't have.

And autofs does try and trigger map re-read requests if it thinks

the map is stale. I usually like to look at a debug log to work out

what's been going on and work out what else I might need to look at,

crash, core, etc.


Ian

