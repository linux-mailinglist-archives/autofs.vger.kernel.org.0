Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABF769C3B1
	for <lists+autofs@lfdr.de>; Mon, 20 Feb 2023 01:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBTAmd (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Feb 2023 19:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjBTAmc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Feb 2023 19:42:32 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B6BCC09
        for <autofs@vger.kernel.org>; Sun, 19 Feb 2023 16:42:31 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9B5E232003CE;
        Sun, 19 Feb 2023 19:42:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 19 Feb 2023 19:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1676853747; x=
        1676940147; bh=MOvauSlcQf2QiZlOPJKQcEVq5joOiKMGB7RHaNmTK5A=; b=T
        2R3AIm1Z3mjNT1Qy9gY6eDfTYWaJYM2Y5gz0frq5zbnM11udbMegAc0sx3jRYgwL
        7XnaKGTyL/lADSyueqM3nblhUXWpc+fhm+4sxilG/V6dpHUQzWAzfoaoeofUrEM5
        6T54oJDK6qESWc2+bhLI0Ps2E8KwQQGQ0OdvnxnpIldhR7wrQYj6duMX5ut1y++f
        F6pFEDmaK9bw7B/ddAj/tN8f/70enVepsvFHMVdgxBmkEQBLe8Nd/4vY0Nn4NTsT
        w7b3BrHXrYMDX7YbOLy4kNJLWSZ1m+BtIpcvJCzB73dLnC9k6FB+PdW3TLktJX+t
        ZcfiblK3vhfh9RIIA4c2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676853747; x=
        1676940147; bh=MOvauSlcQf2QiZlOPJKQcEVq5joOiKMGB7RHaNmTK5A=; b=f
        G2g5BX9yDe+a7xbgtDrnwTDnEmp9IFhpEE9o0ZDCqfaJs0W1AJRlUGd+kMqXZblE
        uWW8iaKcoTw4zWFEfKh6HzuxPIAfHhpcUQzh3ck3VjG7b12DBZEQ7y3regTJwjA/
        GG3r+z2rAwzb1akAMkDfdBvQ9fEnSVQRV/jnl3/6MMegTwl4j/gLnvkN9qakDkwn
        Oofn1rmZYNlUx5KVUan/khhlWYXWt6+am0p/PNQt/m51rQOmp0Gu4Rzldibhoj7M
        ezzUn7MwyVcBw0OPpY0huMvKkn9uFYD6G6r7JJtCfqukVEOmePSV1ItCPYerspPT
        Wz9nMWF1R4Tmn0jzv2AvA==
X-ME-Sender: <xms:8sHyYzDVcEXOiQN4eIBUvV57Svd1gK3sOu7WoQbXKdGxA45Vd2A52A>
    <xme:8sHyY5gBymCk5guMua_3og8xOhYLuadL6rx5MO0mE39LKcI4Bir0EtU_90peiyb9r
    ZLVYcACgJym>
X-ME-Received: <xmr:8sHyY-mV8fLkXML_dvi7lEm_ijV1JpL5ocwxGwXeaacv-bSNaoLOyZmT8jOX1Ivtw_5RSgKFtrquLP9fhVwxeebEyI0ITnprGPKlJSTAjWJnD6_jz9mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejgedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfeuieeijeeuveekgfeitdethefguddtle
    ffhfelfeelhfduuedvfefhgefhheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:8sHyY1yWOwO1neMu-0kmWm1Yij_07p3c8izGCgaNxX1mM_WXkiur9Q>
    <xmx:8sHyY4RxiYpGroNZ7F5Z80zOPa3EKoQ4eA_hobLwGjx5G0PyA64lzw>
    <xmx:8sHyY4aJGBfpz9ejFcDVZwR1F-BWaBoHhXxbL3wTwybKp0DEq6rnIg>
    <xmx:88HyY3PPwwP7NfzjixgdTWXilcZkB-htvgKK1M1DyM1oKoDI_eJgJQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Feb 2023 19:42:25 -0500 (EST)
Message-ID: <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
Date:   Mon, 20 Feb 2023 08:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Help with autofs hang
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167684642746.11359.12533584244594425604@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167684642746.11359.12533584244594425604@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 20/2/23 06:40, NeilBrown wrote:
> Hi,
>   I have a customer who is experiencing problems with automountd.  I
>   think I know what is happening, but I'm not sure if what I imagine is
>   possible, or what the best solution is.
>
>   The kernel is 4.12 and automountd is 5.1.3 - so not the newest, but not
>   ancient.  I cannot see any changes since that look like they might be
>   relevant.
>
>   The problem is that after a while automountd stops expiring direct
>   mounts, and doesn't mount any new direct mounts that are added to the
>   map.
>   
>   When this happens an automountd thread has sent an
>   AUTOFS_IOC_EXPIRE_MULTI ioctl to the kernel, the kernel has sent a
>   NFY_EXPIRE back up to automountd.  automountd reported
>
>     handle_packet_expire_direct: can't find map entry for ....
>
>   and the kernel never gets an ACK for the message and things hang.

Yes, that case is fatal.


Because the kernel communications pipe might not be able to convey

the direct mount path a bogus value is encoded into the packet and

an inode number to path index is used to lookup the path. Without

the path we can't continue.


But this hasn't happened to me for a long time.


>
>   When I look, the mount point that the kernel is asking automountd to
>   expire has already been unmounted.

That's not right ...


>
>   The mount map uses LDAP and changes quite often.  My guess is that
>   automountd notices that some directory has been removed from the map,
>   and so removes the map entry.  This presumably races with the expiry
>   process.  The mount gets unmounted because it is removed from the map
>   at the same time that expiry wants to remove it, and confusion results.

That sounds different to the terminology I'd use but I think I get what

your saying.


I would describe it as, a map entry has been removed from the map when

it's in use causing expires for that map entry to be done on an entry

that's been removed from the index we need for the map entry lookup.

This map entry shouldn't be removed in this case.


>   
>   My current thought for a solution is to change the way the kernel waits
>   for NFY_EXPIRE replies.  Instead of waiting indefinitely it waits with
>   a timeout.  If the wait times out and the filesystem is still mounted,
>   it just loops around and waits again.  If after the timeout the
>   filesystem has been unmounted it waits one more time (just in case
>   automountd is about to reply) and then aborts the wait with -EAGAIN.
>   I've provided the customer with a patch to do this using a 5 second
>   wait.  I don't have test results yet.

I really don't think this is a kernel problem, it's a user space problem.


Some time ago there was a weird case where an active map entry was being

removed from the map entry cache. I had a little trouble even working out

what I had done when I cam across it in a clean up a while ago. So if

this is what your seeing we'll need to do some work to work out what

I saw and what I was doing to fix it.


Let me check 5.1.3 and get back to you.


>
>   So my questions are:
>    - is this race really possible? Can removal-from-map race with expiry?

Well, maybe but it shouldn't because walking into an expiring mount

or one that's being mounted shouldn't be possible and I haven't seen

symptoms of that happening for a very long time, certainly not with

a kernel as recent as 4.12.


I really think it's a mistake I'm making in the user space code.


>    - is my timeout fix reasonable?  Might it cause other problems?  Is
>      there a better way to fix this inside automountd?

Probably and don't know.


I think user space is the problem here and I suspect trying to change

the kernel won't actually fix the problem because it's a user space

mistake that could still happen.


I'm not sure about the wisdom of my not trying to recover from this

either. Originally it was done because if this happened things would

only get worse and the problem would become hidden. So I made the fail

fatal so I could get a core of the state at the time it happened and

that would be more likely to yield information about the cause. And

this should never happen so the only choice is to fix it.


Ian

