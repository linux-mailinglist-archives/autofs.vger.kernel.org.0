Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2352E4923BA
	for <lists+autofs@lfdr.de>; Tue, 18 Jan 2022 11:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbiARKYS (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 05:24:18 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58837 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbiARKYS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 05:24:18 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 9AA7A5C015A;
        Tue, 18 Jan 2022 05:24:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 18 Jan 2022 05:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        nyKplxmHODzrc5RLelfzwbSp/QM3moIYr1RuVxS25Io=; b=ABdSpukZ683bVKP1
        +p8tHCPCQIrbigQGoH/VOMois5mpdC58dr+XJuqFXq/tlITRVqDlK55RBkfa0XJG
        GHvDngctngj1I/nHUjb74zC0QFOCepgZNeQYB8B/CjzRlca7WYMuuqg5dXp2Z261
        r/MinVtrEoKzAcse8dsfPjkXGRqTyzPM/1OABCCuQewGq8wmUW42+wN1Bh5i/Udh
        aOOQMPGvSFux14hkHX2VHi27re89F9d6+9zQX8kE0r3tY0NTGomZ1i4U10X5RfAd
        Ef+7EEGQWMTZnpI1U104Co9J/x995lDsQODi/yTg0VaIM9lNll8ZUfEnGYN+y/yc
        dSNwKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=nyKplxmHODzrc5RLelfzwbSp/QM3moIYr1RuVxS25
        Io=; b=bI7YPnoi70ORS/3VEQwaI5FJ74Q0wtMKtTJyznczLHh6NCwFQrndPSu6/
        R4Q0NV9f5x+pGz+rxUYchMh5kNni2u8ZuDOBkCQrpLsGdKlphm/+LzUV8rZyD57e
        1qyXwQmG4BwGL1LeNBbtqePOIXwqgpwpLN3LoBsStBnxmAQf/ILBVmXe8Xl8Qim7
        jDsqMbG5ZUBUSyKH6hxyL17LC0LFDYtLg6DNNC2rNDmpqXxIU+Rt1/mB3iA7cU2r
        u2lbiD2YtyCDiF1Ze3v+LaldDMDJVU2820vbOw0TRCseCky3q2JbFnbwGSRE6NcN
        mL1+MAdlW/3+Mrr/lYPgL4fD+oydw==
X-ME-Sender: <xms:UZXmYR5MZciDs5N4S_FpEM8beVFHrs7RngqidEXqWHqoxTEL0_BkMQ>
    <xme:UZXmYe54Is3cxMAHBp9hRXrNOeN_rw9Gz6Vn60ZMupzHPi6MNhaxhCoQMcuksIdG2
    i8lzIaqMFi_>
X-ME-Received: <xmr:UZXmYYepGyfGd_VE6XjvLj09fNo11AjcW2S_veGa7cXJrgQWEkt7Rsx77MVub7fL4im4DBklPNwbePCdjZ_AkgM05zGhl9FJS104_4u6pM2RDHId5lDRrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
    dttderudenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpeffledvtdelheevudevhfekjeefvdekteffueejtd
    duveeftdevheeuveeihfelffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:UZXmYaLkbSAmeLtlWKXylgrx92uWt89OUaliyF3lmqDdIgJlqqxPNg>
    <xmx:UZXmYVKpzweubjwOTZiD_HMMsIA83AOKJt6_49a6zIZ9YMzbwrI_wQ>
    <xmx:UZXmYTxgCZoIFNVTQGxjOn2HJSgqNG5Nalz3l2yOYqFxdBJO_fpmGA>
    <xmx:UZXmYXzQq7p9RZXH9Aw-w6aTpMtcqSPp6iGgjDKzuDDyU9Qndl7pQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jan 2022 05:24:15 -0500 (EST)
Message-ID: <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>
Cc:     autofs@vger.kernel.org, Fabian Groffen <grobian@gentoo.org>
Date:   Tue, 18 Jan 2022 18:24:11 +0800
In-Reply-To: <YeaBtjNlovM5gez4@ofant>
References: <YeZ51EWg85akR6Ig@ofant>
         <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
         <YeaBtjNlovM5gez4@ofant>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2022-01-18 at 17:00 +0800, Yixun Lan wrote:
> Hi Ian Kent:
> 
> thanks for your quick reply
> 
> On 16:44 Tue 18 Jan     , Ian Kent wrote:
> > On Tue, 2022-01-18 at 16:27 +0800, Yixun Lan wrote:
> > > Hi Ian Kent:
> > > 
> > > Fabian reported a bug about failing to mount /net with autofs-
> > > 5.1.8,
> > > but have no problem with previous 5.1.6
> > > 
> > > I'm not able to reproduce this error (need more info about the
> > > settings)
> > > So write to the mailinglist to see if you can shed some light on
> > > this..
> > > 
> > > 
> > > The most verbose error messages like this:
> > > 
> > > Jan 11 13:53:09 khnum automount[3614]: mount_autofs_offset:
> > > failed to
> > > mount offset trigger  at 
> > > Jan 11 13:56:24 khnum automount[3614]: set_tsd_user_vars: failed
> > > to
> > > get
> > > buffer size for getpwuid_r
> > > Jan 11 14:56:52 khnum kernel:
> > > autofs4:pid:10191:validate_dev_ioctl:
> > > invalid path supplied for cmd(0xc018937e)
> > 
> > I've had several bug reports which have been mostly fixed now but
> > these
> > log entries don't look like anything I have seen so far.
> > 
> > I haven't yet pushed those changes to the repository either.
> > How would you like to proceed?
> > I could post a patch series to you or the list to try if you wish.
> either way work for me, but I need to be able to reproduce this first
> I will leave Fabian for comments..

A debug log is almost always what I ask for.

Setting "logging = debug" in /etc/autofs.conf will do it.
You need to get a log from start of automount to after the problem
occurs.


Ian

