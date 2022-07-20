Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF8757B12F
	for <lists+autofs@lfdr.de>; Wed, 20 Jul 2022 08:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiGTGmy (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 20 Jul 2022 02:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiGTGmx (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 20 Jul 2022 02:42:53 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F4442ACE
        for <autofs@vger.kernel.org>; Tue, 19 Jul 2022 23:42:52 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 0CBD15C0051;
        Wed, 20 Jul 2022 02:42:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 20 Jul 2022 02:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1658299370; x=
        1658385770; bh=mA4siJUm3O39ZV3ZWXWOBEGoFZXuBJaz/MKEcpPhPJk=; b=Y
        u8wxhv8k0g/wVy4OiP8jsF5m/6GjlF/snmUsyupsNFiLXhT/5qtt9vgf+GVVBCI4
        yetObXNtZrV0UrlZaZkLt0hZW6L9nu5Askd7iRJ+MAZmBziPGiKVFEuklCDDp8gu
        gSFVDdaJS2xJRj81Ln2a/D7B2L1ILN7RCiNIO91axCCdP7FvANZj8BqtuDSczx41
        HyIkPu8sz4/qgJvLuRNI/Re4VmdpYUCN3pbRD2lLPcjbHAwpVRzaerTPunRNtm+W
        KPw2zZUDFFfN98OIYawfi7vLkUaVrWdsznzs1FJAO1tkMJ1LZzVR18NUPbr53cQt
        M9USRHVAi4ii5WJ9v7jCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; t=1658299370; x=1658385770; bh=m
        A4siJUm3O39ZV3ZWXWOBEGoFZXuBJaz/MKEcpPhPJk=; b=2pQpk5roV+D0W0Lyi
        B8mqJ1sA6DpEtHLoe25FPSUQjgkSmm0NxOdzpXK2UkFK9CjbbSs/glv3ctQNwhK6
        Ed08Tplf2Sxh29WZ2QGsZSSVfQunVYBS27f8eewFo3xLWgu9Fop4gDWW0frZnTjX
        vXTismEpRSMgYeQhSOCDvBK2lU19sEnxG/lRRZv65Ht+Oo5grkpQRsSmVPi6eqS2
        bsqw6mDMo6diHxFbCxIPJSwAo3CKhBjFwQ8kpXM8BIyEMTNTVhDxYgPo3lbOE0t7
        bfnxEgt7xR1jPBMKzfwAyfgEzIPdlNHo0GCEsryZQARtQitsxS1TLMVBM0RsekMC
        VaDXw==
X-ME-Sender: <xms:6aPXYnXlcoLNMJeB2TeGVq5CkkDQabrEeMMd1Sjpp-ORE0fHx0Xw9w>
    <xme:6aPXYvns5AqQBkIFlzkoHYp5X89ukt2r2yZK9V_qpKTuEeCpGvT-yvzzkYMPNPMZt
    uKk8ogRannN>
X-ME-Received: <xmr:6aPXYjb0TKsCIgLlDCjbXFvk0xo5rijM6UsM0T5Sml8VagTqxIs8o964E1M47pE9Wq6hQOLsZyo_6I2hwoeyeSW_jYeWl1VKFvFmOV6SiORDhRHSKno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeluddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeehiefghfefteeiledtueevkeeuiedtledvle
    duhfeiueejuddvjedtjeelleeivdenucffohhmrghinheplhgruhhntghhphgrugdrnhgv
    thenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrg
    hvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:6aPXYiXr102cSdce0FyCSP7HZX_U2JComAdCXa_HnG0tj0f92XRrcA>
    <xmx:6aPXYhkhkjqxhw_bGeZoLzSsyX9OGn-fMeVaXH8trT5mXC9ErdKklQ>
    <xmx:6aPXYvcp5-shCU1Q5RnD_aEVvEaJd4Hd-HaF0imKxOo_9LUaNv6ZcQ>
    <xmx:6qPXYvRlcu2sYLJpS0d072osr0aIUuZy7iHmv-GYHfmhceSfXafeJw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Jul 2022 02:42:48 -0400 (EDT)
Message-ID: <7db97172-9ff4-cb8c-aa35-d36fbed55205@themaw.net>
Date:   Wed, 20 Jul 2022 14:42:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: autofs 5.1.8: ldap+kerberos leads to automount hang [patch]
Content-Language: en-US
To:     James Dingwall <james-autofs@dingwall.me.uk>,
        autofs@vger.kernel.org
References: <20220719195540.GB2871950@dingwall.me.uk>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220719195540.GB2871950@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 20/7/22 03:55, James Dingwall wrote:
> Hi,
>
> Cross reference: https://bugs.launchpad.net/ubuntu/+source/autofs/+bug/1982219
>
> I recently upgraded an Ubuntu system from 20.04 to 22.04 at which point
> autofs stopped working.  `automount -d -m -v -f` would hang without
> printing the maps.  After adding some debug statements I traced this to
> an unbalanced pthread_mutex_lock()/unlock() in sasl_do_kinit_ext_cc() of
> modules/cyrus-sasl.c.  The patch attached this email resolved the problem
> for me.

Thanks for this, it's definitely a problem alright.


I've added the patch to my patch queue although I can't say when

I'll push it to the repository. If you need the patch pushed to

the repo. sooner for some reason let me know.


In any case it will be included in the next release.

Ian

