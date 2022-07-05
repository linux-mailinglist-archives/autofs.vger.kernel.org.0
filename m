Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB1A56625E
	for <lists+autofs@lfdr.de>; Tue,  5 Jul 2022 06:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbiGEE0F (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 5 Jul 2022 00:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbiGEE0E (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 5 Jul 2022 00:26:04 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250B713CE7
        for <autofs@vger.kernel.org>; Mon,  4 Jul 2022 21:26:03 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 881465C00C8;
        Tue,  5 Jul 2022 00:26:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 05 Jul 2022 00:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1656995162; x=
        1657081562; bh=/zDqGQIvK8zIEnMVkjsdjJSdlvs0RqAsJwf60P8LXfY=; b=J
        x2jctowIM8mByoi0B0AB4OS0Dc9vn6PNyQjfowyZtCvY49sGBHs5dbonYlZUFhLn
        2XeCJORVMGt9RXhgekMnV7LlmuGw7CzD0iu2Qo5dcxR8eYulvbzxA3ey8wX6oJBp
        Rw8uHR8kVgYp9p2XMx71Up/aed/UJGc3/LquXyFaMbMJOpTLOPW3vu5Tv+aU+XC6
        6oDcFbj/rShyAcK9A7UjcV8K1pI7c9xJtlgdsG1R+EKnL8IHgsvkAHTU0nm9jPS7
        6rmS0m6EAgLI09S+GdZFqiQgOkLEEIDG/1bS3Mg/t/gXb8xEBWjSII2GvR+7nqV1
        LEZxc47CJHwlMje14k23g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; t=1656995162; x=1657081562; bh=/
        zDqGQIvK8zIEnMVkjsdjJSdlvs0RqAsJwf60P8LXfY=; b=AccqSOz9n2GXiJhep
        D3AzABTBv3BaF+WNac0A+L+OkrL7VJRc3FBwE6q5UWCeZ5weeqZ76Q31Zi2y1bv6
        oE6MfJMAy9+xXql8wG9D0PMbCciRGasmmWwJjH94UjuvAz7uYYUCO+n4GD72z9GW
        rqCwMWvyM4YrkznByzTo50jQqOT+ornDfG2drHQvbBhiXAvHLVaV7tyi8p8z0sQr
        5txfA1VtqCuk4/67vlSo1UfHHF2JUxMEo7XYTU4Vcw1Yk9A1bAe8TXKZ1J97hjUJ
        uDo8JH7PHCxT9j2RHPWRGA+MjmcsqnVwBpdL/Ksn7SZglvSIo6a+cb+O0bYrQNcL
        Smf2Q==
X-ME-Sender: <xms:Wr3DYsEsYXBLBLZuaUxQzKgW52_h00w2is319k7JIhHQV15MRx__kA>
    <xme:Wr3DYlWQdw_OKEdlrOFm7g3YHbWq5vDsbOb3apQm9cN4Hl0D3Eo_0MvDkZ4YX92-J
    W0a6RybxZo7>
X-ME-Received: <xmr:Wr3DYmIqUb3QO7DFAl_NR56qiXCtORXdfvOU6qU79cQ3HomVS2X-xeSA5BpfefQe-vt7tL6GdWAR2wazdepGkecabn6UzOJHhhMrH68YUztJTiObu3ql>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fggeektddvtdegieelhfetffffueekgeeghedvudelgedvieeiiefhteduheejleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:Wr3DYuGD3tqWaw7Aw-h4RDRGDnGN1WWGQwwlSfFbu32HqiZW1MranA>
    <xmx:Wr3DYiUR6gi1oyIgFXvodHfuMHfuNgcal-xSkBzGvj7VzL2wrModqw>
    <xmx:Wr3DYhMnE3yjF_eZW1NRMGan0lTEqjIFIi6Wkd-WRq6Wly2fmDHlaA>
    <xmx:Wr3DYtCYG1gSNuErScDpnywNP8Gow4yX11kR9Po9JYBA-3yUmzY2Pg>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 00:26:01 -0400 (EDT)
Message-ID: <94314819-d588-ae45-3b70-cace1ac468ba@themaw.net>
Date:   Tue, 5 Jul 2022 12:25:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: automounts that reference automounts?
Content-Language: en-US
To:     Daire Byrne <daire@dneg.com>, autofs@vger.kernel.org
References: <CAPt2mGM59Kj9cvf83hzA7aGF6XnedXxRmb3TXGDci_zXYxmQGg@mail.gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <CAPt2mGM59Kj9cvf83hzA7aGF6XnedXxRmb3TXGDci_zXYxmQGg@mail.gmail.com>
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

On 4/7/22 20:14, Daire Byrne wrote:
> Hi,
>
> I'm trying to create an executable automount script that will use
> overlayfs to union paths from another automount executable defined
> map. But it seems like this is not automatically triggering the
> required mounts.
>
> For example, I have an executable mount that will correctly setup
> these paths when accessed (auto.hosts):
>
> /hosts/server1/blah
> /hosts/server2/blah
>
> And then I have another executable map (auto.global) that outputs
> something like this:
>
> -fstype=overlay,ro,lowerdir=/hosts/server1/blah\:/hosts/server2/blah global
>
> If run the mount directly using "sudo mount -t overlay overlay -o
> lowerdir=/hosts/server1/blah\:/hosts/server2/blah /global" it
> correctly triggers the mounting of the /hosts paths first.
>
> But if done via the executable automount script above, then it doesn't
> trigger the /hosts mounts first and fails. I also can't seem to stat
> or trigger the mounts of the /hosts paths in the executable autofs
> script prior to outputting the overlayfs mount string.
>
> I can however get it to trigger a mount of a /hosts path if I just try
> to do a bind mount of it from another mount map.
>
> Is this something specific to overlayfs and/or is there a limitation
> on how mounts across executable autofs maps can interact and trigger
> each other?

I'm not quite sure what's going on here but ...


It's been a while so I don't remember if I have limitations on map

entries triggering mounts themselves. There should be a restriction

on entries triggering mounts within the same map, it can lead to

problems, but I'm not sure I actually check for it.


A debug log might help work out what's happening and is a good place

to start.


The problem might be (actually probably) that when overlayfs walks those

paths in the options the context of automount is such that it doesn't

trigger mounts. Other automounts can be triggered by map entries but only

at specific times and only for mount location of the current automount

during the automounting procedure. That procedure basically sets the

current process to have a different process group leader so that it will be

able to perform automounts then performs an open(2) on the mount location

and finally resets the process group leader. I can tell you this process

doesn't look at paths that are present in any options and path walks 
initiated

by operlayfs will probably not be done in an automount capable context. 
Problem

is, if automount was to run in a context that always triggers mounts it 
would

constantly see deadlocks that can't be resolved.


Ian

