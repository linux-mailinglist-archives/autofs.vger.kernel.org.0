Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7439369C3FD
	for <lists+autofs@lfdr.de>; Mon, 20 Feb 2023 02:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjBTBk6 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Feb 2023 20:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjBTBk5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Feb 2023 20:40:57 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1912D519
        for <autofs@vger.kernel.org>; Sun, 19 Feb 2023 17:40:55 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 590093200AED;
        Sun, 19 Feb 2023 20:40:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 19 Feb 2023 20:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1676857254; x=
        1676943654; bh=4CihKIOMRZJ/C2ShnHl62K26MO1l3d29nx/ZL0155M4=; b=1
        gRbOhmkKHlBnEpkgRcwefcDLS9GiOB1RrEj31g7WDri5pCFZpayIsLJ8Jvl0vZK7
        LsAC4xVN5RDR8g3vSRcPZfEJHJ0Bf1FSym1MuFxVqzm32TvhJZCbQQM8+jPgazdf
        C3vHlrS2dMVPy7V5QhoBJz5w83MJ1lbEo38MHrhZ7fcm0T4XiByBaP/Zi2eAspTA
        RRJNlgKqLJt1gTkjG2aPrBNWws6X9/4BjMB1CeRxW/35bc6bxZIVwHCwDfqt5o/d
        i1n4r2KKVfNVYziDjb4f2hxm2QC3/+vVdSExh/56Il97HAZp0Uvkk3A56CXqxN0T
        Jtnc37Ph6r9fZDyZ+nK8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676857254; x=
        1676943654; bh=4CihKIOMRZJ/C2ShnHl62K26MO1l3d29nx/ZL0155M4=; b=c
        PIV/MrAVdPUUwOZP/kt4V7YmEbV36YEpVTjSBgpLBerDTSHhyI1/OAPzd/ENOOVJ
        pRuqvlYcYwi7cE1fiTijJDITzBWLXQGOvcGeLb/r9sbIkvbmGJ/RyhvH5Ki/UTQx
        C1T1NPnqdY8XD4W/GPvLz5q0+5akoDmE0rq/prK73GkboS20V00WB3th+jDdZwMt
        W/ze6Oy0rQ6oDlUzfbIiBeXO/1qfC8SdOcvhw3GclkqO0AVauacB87yJZf6juwAd
        RcVI7oI5ta1sktFK8+VvWm7lsw3QXeeAKSvymHPfO4AAHftqpbe0PXhQ3HlBWlnp
        QwTUCFBaF08sz5MkaVAZQ==
X-ME-Sender: <xms:ps_yY01O9glFdwkGX92jxzqlxlumv5FnHFpfZCXtl0U1Or3CCHSU0g>
    <xme:ps_yY_GgKsU5zZqkduqDY8VllQ1l1y3bxLjL0XMslwndq6gO20x0zr3_4b6cyeHPs
    34FXMyusoiS>
X-ME-Received: <xmr:ps_yY85kS5OP-Wx3YCXgDlplZLHH132DRh4uSg-9cgSAJ1m9s8E5TaxuYKYe6ssMHoDpM3d8Svqv6ndN3cq_FDm4Mw4sFBY2_qaceCTmixAp3NXj4rzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejgedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuhffvvehfjggtgfesth
    ekredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeeiveelkefgtdegudefudeftdelteejtedvhe
    euleevvdeluefhuddtieegveelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:ps_yY91rdkrXUFqEUMRTS57TqK0nD0zzaIUnEkOz429e1GY8ZS87MA>
    <xmx:ps_yY3E_VGt4F1uVjSI0dSi9_S2pTFfo2gqZnXhCQt3mME3ESXvZIg>
    <xmx:ps_yY28l8V4XT-2cIEFRxg0DyXj87xJXVIHdmJDuzNuBY_T20HO9Bg>
    <xmx:ps_yY-ygDUZ2vQqvkqwLTdhKimIUD5btxCdvKtvv-BTY-KV8ToXdVA>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Feb 2023 20:40:53 -0500 (EST)
Message-ID: <86f6afb5-c666-cf29-7f44-52429e8f81a2@themaw.net>
Date:   Mon, 20 Feb 2023 09:40:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Help with autofs hang
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167684642746.11359.12533584244594425604@noble.neil.brown.name>
 <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
In-Reply-To: <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 20/2/23 08:42, Ian Kent wrote:
>>   The mount map uses LDAP and changes quite often.  My guess is that
>>   automountd notices that some directory has been removed from the map,
>>   and so removes the map entry.  This presumably races with the expiry
>>   process.  The mount gets unmounted because it is removed from the map
>>   at the same time that expiry wants to remove it, and confusion 
>> results.
>
> That sounds different to the terminology I'd use but I think I get what
>
> your saying.
>
>
> I would describe it as, a map entry has been removed from the map when
>
> it's in use causing expires for that map entry to be done on an entry
>
> that's been removed from the index we need for the map entry lookup.
>
> This map entry shouldn't be removed in this case.
>
>
>>     My current thought for a solution is to change the way the kernel 
>> waits
>>   for NFY_EXPIRE replies.  Instead of waiting indefinitely it waits with
>>   a timeout.  If the wait times out and the filesystem is still mounted,
>>   it just loops around and waits again.  If after the timeout the
>>   filesystem has been unmounted it waits one more time (just in case
>>   automountd is about to reply) and then aborts the wait with -EAGAIN.
>>   I've provided the customer with a patch to do this using a 5 second
>>   wait.  I don't have test results yet.
>
> I really don't think this is a kernel problem, it's a user space problem.
>
>
> Some time ago there was a weird case where an active map entry was being
>
> removed from the map entry cache. I had a little trouble even working out
>
> what I had done when I cam across it in a clean up a while ago. So if
>
> this is what your seeing we'll need to do some work to work out what
>
> I saw and what I was doing to fix it.
>
>
> Let me check 5.1.3 and get back to you.

I had a look and what I was thinking of is already present in 5.1.3.


I did however find something that looks like it's work considering,

have a look at this, it might help, not sure though:

commit 21ce28df1f4529948df876243fc977908e070296
Author: Ian Kent <raven@themaw.net>
Date:   Tue Aug 7 12:05:21 2018 +0800

     autofs-5.1.4 - mark removed cache entry negative

     When re-reading a map, entries that have been removed are detected
     and deleted from the map entry cache by lookup_prune_cache().

     If a removed map entry is mounted at the time lookup_prune_cache()
     is called the map entry is skipped. This is done becuase the next
     lookup (following the mount expire, which needs the cache entry to
     remain) will detect the stale cache entry and a map update done
     resulting in the stale entry being removed.

     But if a map re-read is performed while the cache entry is mounted
     the cache will appear to up to date so the removed entry will remain
     valid even after it has expired.

     To cover this case it's sufficient to mark the mounted cache entry
     negative during the cache prune which prevents further lookups from
     using the stale entry.

     Signed-off-by: Ian Kent <raven@themaw.net>


There might have been other patches at the time but it doesn't look

like it from the patch description, worth checking though.


Mostly I would be looking at debug logs to find out where the map entry

is mistakenly gets deleted, not at all straight forward but I think the

only way to tackle this problem.


I'd like to do more to help but I have a difficult problem to work out

how to fix myself just now.


Anyway, maybe I can put some time into it a bit later if needed, ;)


Ian

