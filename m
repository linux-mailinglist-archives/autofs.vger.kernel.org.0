Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0742D6D42
	for <lists+autofs@lfdr.de>; Fri, 11 Dec 2020 02:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394766AbgLKBVl (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 10 Dec 2020 20:21:41 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60075 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404870AbgLKBU7 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 10 Dec 2020 20:20:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7FEA15C020D;
        Thu, 10 Dec 2020 20:19:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Dec 2020 20:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        cPpCYhaHzbja5M1B9SNj1Gejp+p2a4o5qGz5QqIaenY=; b=WAc8axXdG0cuwez0
        Q7Rg/sjRCgf5wkTPbtJhA6mp2zeg7x2CtkoTPE9k4z1MoGcKRImxTEXID/WT9Bq+
        huf87Jl4B2aUVpeK7qGWhFhBWKcjm9HlOYcbKDbT88Sxr6HT2y4IA0s2qpnK+p9i
        ry1rZTyBnHFiilFPkdsAP0Wq2Gnf1zMpcdhQAi1Cdp7poY4FTYPCR/Az47xykYuZ
        SvxQnTSjqW1K0M2iPfjg0m5frJV9pis/S4rGJt8vP1/vSQ//c8iplewGyb87pIHm
        8TZ1x5E4lLztHeC3TSr/40nbS9bocmdEv33p1vu6+w0xuWLj67bkbnaOvVYe9ADd
        wM9yfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=cPpCYhaHzbja5M1B9SNj1Gejp+p2a4o5qGz5QqIae
        nY=; b=HVX5U7Dco3MuXGHj+PGOaEYqYulp36znQ29L61b+a9swA9Wsb1X82EHQB
        4jti1K/A6vCsKh6rJELE175mXrCTlMIbIFfjPA5j4NcT86bmhf5uo8HD5R/U+kqN
        /iL2oorCx/Y+6DP+GQ7w0y8iDy0z84ywQQUeemmmcLLjHVOg9oCVn9N+o+2b9kaj
        Jfc0GenR/UNDmV0KQO4Nje/GcfpdeBXbuyd0ZfLMCwrgG0SIiXezJZabHARhfdJz
        RNqo4zliTbTIsWRMqTD1yg44YoDF/GTkj+IT/A7M22pQW5KnUdwr3CsbyV+YhYmQ
        +9UV34s3bQkcI5OgUvdrvSS8gBGLg==
X-ME-Sender: <xms:OMnSX0NkFFK3IsKbyqwVDriPsjWdz0fXB3wmQ_MHNF47e5gdzVlWmw>
    <xme:OMnSX6_-fBTTK9v33LZf9sW6aaP_nEpDEhX-9etp21_dc5OyiC68ojdQTH8xfdkas
    KV9QcvpUUgr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekuddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    eugedtheegtdeivdelgeefieduleeiiedukeetjeffieethefgkeetieelledvhfenucff
    ohhmrghinhepuhgsuhhnthhurdgtohhmpdhlrghunhgthhhprggurdhnvghtpdhkvghrnh
    gvlhdrohhrghenucfkphepuddtiedrieelrddvfeekrddukeefnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrd
    hnvght
X-ME-Proxy: <xmx:OMnSX7QCvoh3nY5G706-xQnxhkkCebGWexbEdaSM2KsEXWSQ2bfO5A>
    <xmx:OMnSX8tKKMoYUHvcbX10SX-XBuw2cq0-ZBihmYK56jeciMpjAqaT3A>
    <xmx:OMnSX8f-wX_A2s8N0_gkL1toEVTt2WeI4gxwEty-noF1T4RNJF7aqA>
    <xmx:OcnSX2r05eXfcMRpCAQiL71yDFtASEJmmpotm50oAcV7VBay63Jbxg>
Received: from mickey.themaw.net (106-69-238-183.dyn.iinet.net.au [106.69.238.183])
        by mail.messagingengine.com (Postfix) with ESMTPA id A8BE8108005F;
        Thu, 10 Dec 2020 20:19:51 -0500 (EST)
Message-ID: <c7c9ea1f0edba8b574583332376f10676a20143c.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Fri, 11 Dec 2020 09:19:46 +0800
In-Reply-To: <CANYNYEH1M3OqgFd5WDi7L4kq-EMP9pgfB4AzU89XROS=aT20Og@mail.gmail.com>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
         <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
         <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
         <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
         <9e9a916a985acf138dae1c0f415bf6786f7358d2.camel@themaw.net>
         <CANYNYEH1M3OqgFd5WDi7L4kq-EMP9pgfB4AzU89XROS=aT20Og@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2020-12-10 at 09:48 -0300, Andreas Hasenack wrote:
> Hi,
> 
> On Wed, Dec 9, 2020 at 10:27 PM Ian Kent <raven@themaw.net> wrote:
> 
> > > In Ubuntu, -Wl,-Bsymbolic-functions is a system-wide default and
> > > we
> > > remove it from the flags when building autofs in d/rules:
> > > 
> > > # Taken from #1636781 as it's the same problem here. Also see
> > > #
> > > https://lists.ubuntu.com/archives/ubuntu-devel/2018-June/040369.html
> > > ifeq ($(shell dpkg-vendor --derives-from Ubuntu && echo yes),yes)
> > >   export DEB_LDFLAGS_MAINT_STRIP = -Wl,-Bsymbolic-functions
> > > endif
> > 
> > Not sure what #1636781 is?
> 
> Sorry, that's a bug number (not in autofs, but similar):
> https://bugs.launchpad.net/bugs/1636781

Oh right, another example but not strictly autofs.

> 
> > Would it be useful to provide Ubuntu with patches prior to the
> > impending autofs 5.1.7 release (after which these patches would
> > be present on kernel.org)?
> > 
> > If so I can certainly do that and if we do then from that point
> > any further changes would be done as follow up patches, so they
> > would be final upstream patches even though they haven't been
> > pushed to the repository yet.
> 
> Sure, and this is the perfect time for that since we are in a new
> development cycle. I won't be the one working on it, though, as I
> have
> been reassigned elsewhere for the next few months. I'll let someone
> in
> the team know, and I can still file a bug with the patch(es) attached
> and let the team work on it.

I am struggling to get 5.1.7 out now.

The patches will of course be posted to kernel.org when I do get
the new release out.

But I expect pulling in a new version so soon would be considered
premature so what should I do to catch up the the Ubuntu person
working on this?

Ian

