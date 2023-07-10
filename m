Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE2F74CA18
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 04:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjGJCxj (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 9 Jul 2023 22:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjGJCxj (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 9 Jul 2023 22:53:39 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCCDFB
        for <autofs@vger.kernel.org>; Sun,  9 Jul 2023 19:53:38 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B3BF932003F4;
        Sun,  9 Jul 2023 22:53:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 09 Jul 2023 22:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1688957617; x=1689044017; bh=HmnyTAMzj8v2Pxe3mXMyotV57TxZCbhRkiz
        bv7Ghv2Y=; b=nrefw4sQn4qkpgiBkI0fFsfpcd5QdZUaMaue5YsJYVLo0UTEqjb
        8L6JIMfejP0DivNj8tia66lWFGsJ1stEcDqcmZVsYGQgAvk0Ng0svdWaayp1Rrzh
        W2N9YMiQ9JSO9ieZpze59kdusHr28jhKdE8yPrhTAdCJNlaEiVg5E1DVaLrElgWf
        2hOMs/tJyYM8p2MTiY8GdOLlwiUNWUglK4MFxWmrJ9MK/FJTAt9wsMDxTaZhivb+
        Slw7w2njR/M8gFsBwQu6Y4pSnokktky9aZf38dAK/ftOUr20gKT8GICSXpblkfMP
        ysrm4HpKVt9+UqD1HY9oYARVDWTPKonrvHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1688957617; x=1689044017; bh=HmnyTAMzj8v2Pxe3mXMyotV57TxZCbhRkiz
        bv7Ghv2Y=; b=IrfcBNw0jbXdL2XHRbqx9Vh1lbOcBZbzdrt/ahXuQ/ksPjrq1HI
        uwWmpi0we+Wcdy/DkNJdM3nnVYQzGnrq443FFJ4vfsxQ3g7uy96yCReaIZnITzfJ
        /CqnT2/9j3zXlzsy11lN/L5vmnejjdZNlMIHLHGCHW1EXiKvtsoh1IlAWHIVmK+F
        RkVpGbwZ4vJ470nuy3PNggFMDPJmJsqg2n8VjAtSIUxbAldM5f6mEwYH2vBE17eG
        jBiUBMSrmmc5BDWn+4PbDjYmR2uvt48hWVU9ScJrPhCJKIavHRCQmP5GMkpCdjcO
        Aq2D+I0PvFY0d1XtcUMNpUQM8mGNtHV6jEw==
X-ME-Sender: <xms:sHKrZHlwYzhML5koM1RTyWfmvH1wRqRgpIbeiP7kRF6G-_kdCDUUyw>
    <xme:sHKrZK215T5yLvDz00DbfDYgEb31KeNHXQAnlClJX7mtXNLG170B78Abq-42zgzcb
    daIxLVaz_Ui>
X-ME-Received: <xmr:sHKrZNog5KGrkqHq2dLVLz8e5YstUw1FU7swODy_cSHhkZKw_kuG5j_Wq4T-okUS_bxoujf-1LsIlzyHrUyBLXf4513xt8Fj8NzC2z1rD2CylHrM_OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdeigdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    euhfeuieeijeeuveekgfeitdethefguddtleffhfelfeelhfduuedvfefhgefhheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:sHKrZPlEgX3ndDCrVv1T4e0wWfB--SLXcVqd9s10a6d82U6kr9OBPw>
    <xmx:sHKrZF3Y0VPGMAB_WDLAjSwdq1sKW104wcJfxqttwe1073P8b226Tg>
    <xmx:sHKrZOtJX9UzUKpV46mcEJ5ntTKIjkVwTSxKrcpjcFC2v0NeqCwFjg>
    <xmx:sXKrZG-W1DEOHcTZ2g8ziroWitoxAEbPzN6L--V6BAw0ZMixwC_dIA>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jul 2023 22:53:34 -0400 (EDT)
Message-ID: <66eb24d5-988a-9646-b419-245096dfe3f0@themaw.net>
Date:   Mon, 10 Jul 2023 10:53:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
Content-Language: en-US
To:     Salvatore Bonaccorso <carnil@debian.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc:     autofs@vger.kernel.org, Mike Gabriel <sunweaver@debian.org>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <ZKrKz/QYjPSmMcts@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 9/7/23 22:57, Salvatore Bonaccorso wrote:
> Hi
>
> The following sort of regression was noticed while updating a client
> running Debian buster (with autofs 5.1.2 based) to Debian bullseye
> (5.1.7 based autofs), but verified it's still present with 5.1.8. The
> folloing setup is present:
>
> There is a NFS server, dualstacked, with both public IPv4 and IPv6
> addresses resolvable in DNS. As I cannot put the public IPs here in
> the report, let's assume It is called nfs-server with addresses
> 192.168.122.188 and fc00:192:168:122::188.

I assume the IPv6 address here is not what's used in practice. It

doesn't look valid, it doesn't look like an IPv4 mapped address, what

is it, how was it constructed?


Ian

