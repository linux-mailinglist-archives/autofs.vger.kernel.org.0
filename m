Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DED374CCB7
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 08:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjGJGRT (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 10 Jul 2023 02:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjGJGRS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 10 Jul 2023 02:17:18 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF74103
        for <autofs@vger.kernel.org>; Sun,  9 Jul 2023 23:17:11 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id AF7993200900;
        Mon, 10 Jul 2023 02:17:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 10 Jul 2023 02:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1688969828; x=1689056228; bh=g5iz9Vhb7cHR8FbZ3KTU3wJ3TLT/qCGTM2+
        UxVLujEA=; b=D+kK3D2q5A69WmbU25TUVLGe3lbxRlv3Ghfep/cCyr6/McVBhps
        LSUYksQgsjbTCXDPrOEM6bite/wiZDQlErzpPGIQ5B2uvMG8fz+Subr9MpblFz7d
        YvniJlZOa8QhF+VKUlE+r/7js2p/bJB+dRiZvU0K4iPt6ZNKDRH3GpSjr+D9PFr8
        rXNEepUJfHDjHoUklOzWBtP20pYlW6DOIXChgmBD3kVJ2rAeQm1ZqGTVVsZQuCKk
        yBxtlpy4+StiJgmIXDsRqbZtLHtDaiTUYGuHM4NllMqNW6iszpXPYShgrAgPyG4U
        6P3G54ZwxpQ/puMHRe3MoLm8yKbmIWHo2Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1688969828; x=1689056228; bh=g5iz9Vhb7cHR8FbZ3KTU3wJ3TLT/qCGTM2+
        UxVLujEA=; b=EtPHFUzKhY3juXb1OvfxNUx90LHLnewvneMKUUSDPXRmHDS+9Yq
        64t56Ukf4D9INwc6ofOIG9ZYyFBINmScOgvHfz94cXDtijZkXXzi1cVQ3qwcpFe3
        tlMzb/pAWHXU6PKvodUel2RNEK7v3K+wROUOWqCr60x9vchgeADNv1ZXQHwewQ8w
        +3HvrxaSCevXkWb/7CWGKg33i5Z0clVjLl9otQQEaBir+UKdPRh8hSaRz/Sc5i+r
        yknGffkTftaPs7n4mCcv0G9IQs3PfDTvc2JYnTSCdfZjrZXB3qy9+5ytOP5olG3L
        M2uczNrmm1jV9nEpHiV7dol5KBS8EVZoNAw==
X-ME-Sender: <xms:ZKKrZNjKs0ChSbLbPoo4f6aAWIV8TCuxCnl-e2ERIsYcGBXQypbXTw>
    <xme:ZKKrZCCK4asGw62-H56NJH97ZmGksym4FgkIX7W-ZNYDTCmPAmNVhzwLJcG8hDcGR
    5T7cPwdgeul>
X-ME-Received: <xmr:ZKKrZNHnAN4Pxf3unH4eySE8AOZfxnyai43YZBYlHQgbW2EJh0VEERF4rD9O61OIzIETTUIW0tVBTVUSY_5LfwG_dX6_QWwciWqVxP-KyMFbOnK3uHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdeigddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefkrghn
    ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnh
    epgfevveevgeelleeiudeifffhudffteejgfejteeitdekvddutedtvdefhfdvffelnecu
    ffhomhgrihhnpeifihhkihhpvgguihgrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:ZKKrZCTmN47P9IUST25Pi4xlEUd1j00oJAw0hzwUbbN2TMg2U5MwSg>
    <xmx:ZKKrZKwZBWSPq5d8BTCh5Fwt5YgdJeHIpRTw3EyYD_cbuqKLBnoGIA>
    <xmx:ZKKrZI4Ss36z0GBCNcCN-BTctNiCnFWWeiPLoXRodwx-To6tsdoziA>
    <xmx:ZKKrZPoRsMdcLvn33AK4_v_QYznPhrj34P5A_5W3hpC8u6TlwfvLEQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jul 2023 02:17:05 -0400 (EDT)
Message-ID: <4c054822-11be-78fc-a191-b7d3af45604c@themaw.net>
Date:   Mon, 10 Jul 2023 14:17:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
Content-Language: en-US
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org,
        Mike Gabriel <sunweaver@debian.org>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
 <66eb24d5-988a-9646-b419-245096dfe3f0@themaw.net>
 <ZKugoVJ27gOdQz2w@eldamar.lan>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <ZKugoVJ27gOdQz2w@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 10/7/23 14:09, Salvatore Bonaccorso wrote:
> Hi Ian,
>
> On Mon, Jul 10, 2023 at 10:53:31AM +0800, Ian Kent wrote:
>> On 9/7/23 22:57, Salvatore Bonaccorso wrote:
>>> Hi
>>>
>>> The following sort of regression was noticed while updating a client
>>> running Debian buster (with autofs 5.1.2 based) to Debian bullseye
>>> (5.1.7 based autofs), but verified it's still present with 5.1.8. The
>>> folloing setup is present:
>>>
>>> There is a NFS server, dualstacked, with both public IPv4 and IPv6
>>> addresses resolvable in DNS. As I cannot put the public IPs here in
>>> the report, let's assume It is called nfs-server with addresses
>>> 192.168.122.188 and fc00:192:168:122::188.
>> I assume the IPv6 address here is not what's used in practice. It
>>
>> doesn't look valid, it doesn't look like an IPv4 mapped address, what
>>
>> is it, how was it constructed?
> I'm sorry this was just me trying to use something valid from
> https://en.wikipedia.org/wiki/Unique_local_address . Yes this is nto
> the IPv6 address which the server has in practice.

Yes, it's been hard over time given the available IPv6 support has been

poor and setting up locally has always been a problem for me.


But, as I say, my ISP is there now so I should be good to go.


Ian

