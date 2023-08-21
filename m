Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F012782382
	for <lists+autofs@lfdr.de>; Mon, 21 Aug 2023 08:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbjHUGR7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 21 Aug 2023 02:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjHUGR6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 21 Aug 2023 02:17:58 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6230483
        for <autofs@vger.kernel.org>; Sun, 20 Aug 2023 23:17:57 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0DA903200916;
        Mon, 21 Aug 2023 02:17:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 21 Aug 2023 02:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1692598673; x=1692685073; bh=yuo9Gj0fimhO7+BGNsFc4myWq85zY4RWUIy
        PeMnw1Kc=; b=vqGz92A5+mfQsfarh2L0lu3GXxsAeuGH1AuB4LcIvPrKHeZHyHG
        DAVrIdglWTKiWHGRVjruooTNWjbFDnZq53FtsOQv0NEZwhLZLY2KRyg/c/m3HH0U
        8sDkXMnY5te6XqCanzw1tPEy+0voTyjD1WftXINHDC43U3RM07W4Wy1IiP+uqG9D
        1esVvsxhi2OJ50mzN+10BZRfA4Y5F51XJIEUcDmoDnsptvaEbgXVDq5eQDCqLmNJ
        oCRbiJcEA2SB7e1aV35xCaNk7Na+f885Y4D7qP9PeirBbIcBV/bhGDi3By5CrqtK
        FNnQeJW8xwfDHg6Z1+3xnwp8P2D8WoHrneg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1692598673; x=1692685073; bh=yuo9Gj0fimhO7+BGNsFc4myWq85zY4RWUIy
        PeMnw1Kc=; b=VeMkw11zR18S63NZLi0TLB4eCkVmawdqwoQYJz2xEwvFPkb0dN7
        k9J2AWf9zu305g6lvVl20bgBVAxlZZTBpx1Nv1SLmLGx61efHkB+NeDwUGti9o3w
        FNnb+Uq99UwkmAfQGzPKRbiPogAbnets2SmpZagJCGoqd4x9luLFpe/puPgSAggx
        LvWZVDl3Agc3A5F3gUwcobY5VuKONgFzYTAiUr+4npblyE8pYOzek0Xjdkuc/BYP
        +Kf+TxSPCk0edrOs30+jC2zM4uqNrAWKDe0ckdHWVffiAbG9G0mDETtaGFMsDjfc
        uZ1nqDPb8RNic2n7vT010BTz49YTgnhQC0Q==
X-ME-Sender: <xms:kQHjZJ59ZJqWSszy-REXXVkueTopdVcoSqR1w3d9BY_cx579RlXAFg>
    <xme:kQHjZG6MQx_FRK4-Kk-H_UP776hvxz4xxqsnh58FeYZbwwEX0rHDQbwcaA2WvgKYb
    EE6BNyqICt8>
X-ME-Received: <xmr:kQHjZAf3tdD8BMMbv3iWe1atuVPPCSUKPG4Ohp03CWFLqPQXul5gknY9IUkI3eHK1_MEezSD5BYDrCuKxNq5jcxQqWdZWVn5jyZiU8oazR4bZaH2VW3O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddukedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgr
    nhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrh
    hnpeeuhfeuieeijeeuveekgfeitdethefguddtleffhfelfeelhfduuedvfefhgefhheen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvg
    hnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:kQHjZCLkwWoYN9NuV-S2aRfqZFLqnqO7MZvrnnJLlm1iKQEVI76lTA>
    <xmx:kQHjZNJyIK_vScrFwaQbZgBuXOTqOTPQWmplDnYrg90EV2yH-6DaMw>
    <xmx:kQHjZLwreC6sA9O27XwtLhmbDs2SyaVfpyt0yPK_KxsZZYQuqzXh5w>
    <xmx:kQHjZPxNMiFYes-_e1fVMDUNzNfq0dJL_250xvlWQ7e8SD27q92iQQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Aug 2023 02:17:51 -0400 (EDT)
Message-ID: <81ada237-f5ae-58fd-b2bd-2118c7c9b326@themaw.net>
Date:   Mon, 21 Aug 2023 14:17:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Sharing a direct map
To:     Mike Marion <mmarion@qualcomm.com>,
        Robert Vasek <rvasek01@gmail.com>
Cc:     autofs@vger.kernel.org
References: <CADVsYmhgT=E+o3r9fEhQT2Wg04MJqeYr_xt0pDV9TTtFQjFrzA@mail.gmail.com>
 <20230818184831.GB7856@qualcomm.com>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20230818184831.GB7856@qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 19/8/23 02:48, Mike Marion wrote:
> On Fri, Aug 18, 2023 at 03:08:19PM +0200, Robert Vasek wrote:
>
>> Dear autofs community,
>>
>> is it possible to bind-mount a direct map without triggering the
>> underlying mount? Or is this considered simply "beyond stat" and
>> cannot be done?

I don't think so, if that was made to work then automounting

wouldn't work any more.


> We're doing this all the time.  We're using singularity vs docker, which
> likely makes a difference, but instead of binding various paths, we only
> bind the root path in direct map. e.g. bind a root of /nfs where all the
> paths in the direct map start with /nfs and the accesses inside the
> container trigger things from the main OS.
>
> Unfortunately it means you have to mount the entire direct map tree and
> not only specific paths, but that works for our use case.

Do you mean the entire tree?

The autofs trigger mounts for direct mounts get mounted regardless of

this.


>
>> I'm trying to share the autofs mount into a container. While indirect
>> maps work as expected (in the container I can see the autofs mount and
>> then trigger mounts inside), sharing and bindmounting direct maps
>> triggers the volume mount immediately, and the container sees only the
>> volume.
> I have worked with peers that tried mounting several specific paths in
> the map, and they've run into a lot of issues.  Both that it mounts like
> you mention, but also they apparently have issues where it can time out
> and be umounted, and then accesses from inside the container after that
> don't trigger it to mount again.

That's because the expire check cannot check propagated mount expiry.

I have had a lot of trouble with this over a long time.


I do have kernel changes for it but they too are very likely going to

be controversial when I post them, we will have to see ...


Ian


>
