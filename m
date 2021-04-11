Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A4D35B13C
	for <lists+autofs@lfdr.de>; Sun, 11 Apr 2021 05:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbhDKDTJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 10 Apr 2021 23:19:09 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52947 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234973AbhDKDTI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 10 Apr 2021 23:19:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 054E25C00D8;
        Sat, 10 Apr 2021 23:18:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 10 Apr 2021 23:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        LMvgx8OmKmE4R2cNnnevtTSu8dVbrEkiNO3PIFp309M=; b=z4CxFiooscmBj1K8
        1pWG+XmZmUBQBCn/nOPVlVEfDg24BeiDwjZMg90DITITlwkn77iE1KZeQh6i9sC8
        +AuxhQ3oZM4kz0FxXtmnMWxNvGRhXtwxaXfFF6/9B3ZRF/klDaAIrobbhRdqS9yT
        tlHXym5ejKyecIk2BcJTNTssWOVhsabiu8ylIWN8nbcsEazXEdwsb2PVi7zmNUij
        MpIjyGkbSJYaAqesnBqQfopkqjhuV4s2Uf9Ued5/3SRYC/6ZU5W49WqL/LyTkk5K
        w13nsHgr5dTCnI6vespr2LOJYRgGXb5DcBim8o8RxZCyXCkZYPY4v23WEIoDrhni
        Sqol3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=LMvgx8OmKmE4R2cNnnevtTSu8dVbrEkiNO3PIFp30
        9M=; b=g0y9XiLMQWgAZeiVrgc57vs+/M5lO6FWlLlZ6nqsFuoK5HSvSqt8Go5SE
        l4ATyywHhmjhLlMHjhtThIRX0x/Ed4K00RBtwOfyWBQm1upmVvvG7E66rPmDubU2
        6Q3QXERO4oupq9Z64h33iSVBhZhFPwBg9uXuSaGpzFRCLPJyGwm1r8mIGEPoYWoH
        u3gVCMcpNDVF4fED8ierTtVtfQP0JL5Nut+k8d6OlrYRSPtkwbbrSGf1olUbrBNe
        4tRCat3gcOBgKNOUtrG0MfHCNB5mwjxVQ2N029NLAnx0JA8U1sYIWngRmuGLr2ym
        tRdj43hvPRoU32+/F5Ri3p7jP+RjQ==
X-ME-Sender: <xms:nGpyYDTqjwlRGhGnOAgS6sqp9cdK5IJcAix8bqO17iqrZyG1A_ZeCw>
    <xme:nGpyYEyMl6ZxP0pRxepoTPkvji3OrJf72Y9GkKUJ04Cr4F1aZHxWqfxYYIQTHL1y7
    J8xw3O_3gCW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekgedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepfeefteetvdeguddvveefveeftedtffduudehue
    eihfeuvefgveehffeludeggfejnecukfhppeduvddurdeggedrudeguddrjeefnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:nGpyYI1cA0xz-fvIsQt_qtY2MFv6VZc8Z-uRs7S7yDmIFPa6hbL_lQ>
    <xmx:nGpyYDCCdD8lxcHyzEL_1okCgfQViBXoJgyJeDsHBYznC1jb6FxHkQ>
    <xmx:nGpyYMhSFpIgP7KbM3hS1MDxxq3-aYCWs7IEV6HVQs7xPtM2eJs7tw>
    <xmx:nWpyYHvn109jtLgbe4R9khYYDzrQ25IojC4jN-1r96K-sOibmU6YmQ>
Received: from mickey.themaw.net (unknown [121.44.141.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 416771080063;
        Sat, 10 Apr 2021 23:18:50 -0400 (EDT)
Message-ID: <d8810631644e50a5e9a9384fc251d6fa885a6282.camel@themaw.net>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Date:   Sun, 11 Apr 2021 11:18:47 +0800
In-Reply-To: <54a4b76d-3a46-00c5-8888-6aec74715a78@lists.drosera.ch>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
         <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
         <54a4b76d-3a46-00c5-8888-6aec74715a78@lists.drosera.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, 2021-04-10 at 23:50 +0200, Frank Thommen wrote:
> where theses accesses happen all the time. See also our long thread 
> "Changes in indirect multi-maps don't become effective w/o autofs 
> restart" in 2019 ;-)

Right, that's more or less what's been said here now.

The best course of action would be for me to to fix that mount
ordering on re-load without change to busy mount handling and
see how often the problem continues to occur with your current
setup.

Ian

 

