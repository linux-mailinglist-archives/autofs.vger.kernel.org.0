Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3A52D7677
	for <lists+autofs@lfdr.de>; Fri, 11 Dec 2020 14:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405671AbgLKNXw (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 11 Dec 2020 08:23:52 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60605 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727476AbgLKNXe (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 11 Dec 2020 08:23:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 22EE3A92;
        Fri, 11 Dec 2020 08:22:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 11 Dec 2020 08:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        Kbn77uelgQU7PaMFAOc9YFwo3TguW6VtZ2Jj2CPVFyk=; b=R/1o8xgp3qDuznoZ
        LVGBciLPQmdJugVpGm7M0oKh2ixaZOlFETuZcSMjhR/RpATjsDF1cGLYVvI7JSFO
        bnQiTdkyyhJuAFhlCW64oGZuIjEhWMnBQ2f50UmZBNAdvFWG6+QxqxBKSc8sJmRi
        Mt/Meie9wpYvVaQfJpC+HaGd89kCN01yrOoB5Mr0KdbskiHceyNcBOapzQ4Ungxa
        LyGhDs/jwHZs0VTqVhlpVYiuUI7+tt8/0G2H3Myb19gfXeyy30Kb1V4SdvLONfMK
        8jaqtgctl9JnuARodMyF/rFqU+8/wzPhnQpg9sIdD4UtFoWfg5bsjINzDj2XsFAC
        sj26tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Kbn77uelgQU7PaMFAOc9YFwo3TguW6VtZ2Jj2CPVF
        yk=; b=TunnhwY0em5EIifsOC79JF7UD0D9o8rhp3OrFux3CE1BfrMZn3X3CR2eT
        ylJWUsN5bT+EQMrNyPQUedgui4Inlz9SEPE36H8p3dAz/UBWrecWAQXVVK5VTqCo
        xzkmlFBAmwmXP/M93qYg18tefg/Ma/OS7B8qb59QW+SjPyJ+tZcGWlW1AmlrUWBh
        7EGOJ3H0QRigWspaaaIS68uduN86MhtXSFbOtOULbQVaabacc1YtjDdT/pCEGsaq
        wC8PAREyWpvvX5PT3YQ0U9YZx0JoSqSLY9VCfl6mTl5hIF//FuKKQIynhmMyUDLV
        9aNXawLlnoOdn1+hu9FoE42sIHB8w==
X-ME-Sender: <xms:onLTX2B3Lbh0jm-0fQ4rX7AzekkTFKck6AgDvMMpUnMx4sDeDaaSeg>
    <xme:onLTXwgwEtkiMTOMsyk8_7ZzjocUSjTBec1t0eJJgXgNDVswb9h_S7N_jmaz_HdaW
    iKmzml7dzWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekvddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    eikeeggeeuvdevgfefiefhudekkeegheeileejveethedutedvveehudffjeevudenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvddurdeggedrudefhedrudefle
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghv
    vghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:onLTX5n7pfJVfxWuc7tEQRVNcuxGSqJvJ8Xdg5JcdzPOsxh0aKheXQ>
    <xmx:onLTX0wCp1T9uqxBw9kc7wKq4vxuniTRe8MjxjhljwJRGxPLBtOsUQ>
    <xmx:onLTX7QGgFkvfmjkMzcPHWWnMHtNnV7nQG4RQq10RyUOhqNWw6ALzQ>
    <xmx:onLTXyduMWiaPBioyMSHWLLV5tBYD2bevn3d9C4pHeG8uOgWvFeboA>
Received: from mickey.themaw.net (unknown [121.44.135.139])
        by mail.messagingengine.com (Postfix) with ESMTPA id 382C8108005B;
        Fri, 11 Dec 2020 08:22:40 -0500 (EST)
Message-ID: <9753cc97c1206f45690195563ba5d40655bb8fe6.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Fri, 11 Dec 2020 21:22:37 +0800
In-Reply-To: <CANYNYEGCs_SYAsYSG_zan31r95m24teCVX_xq_7hNtj=EhXBwg@mail.gmail.com>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
         <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
         <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
         <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
         <9e9a916a985acf138dae1c0f415bf6786f7358d2.camel@themaw.net>
         <CANYNYEH1M3OqgFd5WDi7L4kq-EMP9pgfB4AzU89XROS=aT20Og@mail.gmail.com>
         <c7c9ea1f0edba8b574583332376f10676a20143c.camel@themaw.net>
         <CANYNYEGCs_SYAsYSG_zan31r95m24teCVX_xq_7hNtj=EhXBwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2020-12-11 at 09:23 -0300, Andreas Hasenack wrote:
> Hi,
> 
> On Thu, Dec 10, 2020 at 10:19 PM Ian Kent <raven@themaw.net> wrote:
> 
> > I am struggling to get 5.1.7 out now.
> > 
> > The patches will of course be posted to kernel.org when I do get
> > the new release out.
> > 
> > But I expect pulling in a new version so soon would be considered
> > premature so what should I do to catch up the the Ubuntu person
> > working on this?
> 
> We try to stay in sync with Debian, applying our changes on top of
> their packages.
> Currently Debian has:
> 
> autofs     | 5.1.6-4        | unstable
> 
> And Ubuntu has:
> autofs | 5.1.6-4ubuntu1   | hirsute
> 
> If Debian grabs 5.1.7, then we can immediately rebase our changes,
> including any patches, on top of that.
> Going ahead of Debian is also possible, but less desirable.
> 
> From what I understood, 5.1.7 will not have these patches you
> mentioned, right? I think the best way forward is a bug in launchpad
> asking to test the patches (that apply on top of 5.1.7) that allow
> using the -Bsymbolic flag again. I can file that once the patches are
> published, I'd just need a ping to let me know they are up.

I am going to include them in 5.1.7.

The the final rounds of testing are being done with the two patches
I mentioned.

The change is purely building my static library as a shared library,
nothing more, so it shouldn't impact existing code. In theory it
should be more economical from a RSS size and possibly WSS size too.
And being a change to the underlying autofs library it will be being
used during all the testing. I haven't seen any problems so far.

I'll announce the release and the 5.1.6 patches will be present on
kernel.org at that time, same as usual.

I'm not sure people will want to update straight away, there are
quite a few changes and a number of them aren't trivial, so people
may choose to select patches they need while waiting for the dust
to settle.

Ian

