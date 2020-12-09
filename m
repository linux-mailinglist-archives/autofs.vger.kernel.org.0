Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6742D38A4
	for <lists+autofs@lfdr.de>; Wed,  9 Dec 2020 03:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgLICRD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 8 Dec 2020 21:17:03 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58813 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725804AbgLICRD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 8 Dec 2020 21:17:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6C7935C0138;
        Tue,  8 Dec 2020 21:16:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 08 Dec 2020 21:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        cLX2po52Tt3Ot2ItYHRoD2LRuwxyHMjAWq531Mnpd3k=; b=hlSja4xsNIaVbIFg
        qcDu5LssPjUCFP4aylqcURge33mfef2i3/JDWO/bUNhhNSZ+GPe9p6ofRYaCYP0f
        P6LkRVItU9sJUIljJdMPrY492lz6flI9fyDaB+9Si7R8PRJKP9w//qtEEOrjkwW2
        RVsdj3euOtcUckYqoAivLZDc/eKUwRCT59b82Jd0cYnnP9q8h7tYvXOPCVCkYPI8
        u10S/bMNoAYk/cYlxeIkY4BKvfH/RgsJMHiSD4BNZUZmfsDP7H2agEIIXrLwSX/H
        Qr8Uz5KY8HnLWssvxCxans38x8Z3J38px9vLNErQhxQeDdekRJNcXAEkeGEuL/z4
        cDzPIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=cLX2po52Tt3Ot2ItYHRoD2LRuwxyHMjAWq531Mnpd
        3k=; b=m2E1TTBcF5Rbh9gqbC9OlQ5vQW4MFzB361aoubotVmAKL6PWEXY+aj3TF
        Kp15XBIqs1c4LBKLQZsMvgVZQPG3bytubArpqxE+el+qW5vjiUnuvKRTc7JhHX36
        XNfOhwHJnrKqlZBiqzHFS3SaNnR/2kJHqPqgKJtZ8+9CltyFianZItVPZQrk162J
        enyR3saGGJJJB4ePxyKXwx6ij6+uBjy8vJaNfyXKHAcEWkhZLhYh3x+IutDI0GPe
        b6P2uQRMT5qYJ0rs8yZT1Rsxn8h5WneUhwdKGcfYRX8LwREla2pCj7d5gs+TxkV8
        OkvPaLHZxH1Uk+jydrxwaeCxy9ZPQ==
X-ME-Sender: <xms:bzPQX-IFXkVRcTIpKpQvYTubWdroUMrQtYSCdyJPSpN4URKAZ23AGg>
    <xme:bzPQX2Kpn7Iwi3xfgGeWCGLtotUUk9UWwDg6JrqlbvMu3xNyf0Ybp4CXp997RxI0Z
    VfSV-swQbZN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    evleektdfhveelgedvtdetleelueejueetjeegveffieegtdegteekvdegtedvfeenucff
    ohhmrghinhepshhpihhnihgtshdrnhgvthdpuhgsuhhnthhurdgtohhmpdhsthgrtghkoh
    hvvghrfhhlohifrdgtohhmnecukfhppedutdeirdeiledrvdegtddrudefvdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthh
    gvmhgrfidrnhgvth
X-ME-Proxy: <xmx:bzPQX-uC4Zm7nnb4d6utsjb7E4geWJFPMxVC0H1rGe11kO33f5Pg1Q>
    <xmx:bzPQXzZMK-DvPmCtGONu6KnlMayeIcF1WVHfji7TlbebwWyCj-Lphg>
    <xmx:bzPQX1a786rS0IfStiHQwnyppJA7_LTGJ7DNzl0XTOzcFnoFnvsWkQ>
    <xmx:bzPQX-mKwBomMohqz-0y8UC34Itf9Abpd4wl1rra-aoS9lqdFmB-pQ>
Received: from mickey.themaw.net (106-69-240-132.dyn.iinet.net.au [106.69.240.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id D5A5B1080066;
        Tue,  8 Dec 2020 21:16:13 -0500 (EST)
Message-ID: <1a550d45785ae819a5e48c4f68f1a7ef6111e858.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Wed, 09 Dec 2020 10:16:09 +0800
In-Reply-To: <81b52ef59b96964a91bb3b7e6624e2f96a47af7e.camel@themaw.net>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
         <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
         <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
         <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
         <8d18d1b3e39fc66846cc3937578dc70ca6d6561d.camel@themaw.net>
         <81b52ef59b96964a91bb3b7e6624e2f96a47af7e.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2020-12-08 at 10:39 +0800, Ian Kent wrote:
> On Sun, 2020-12-06 at 06:49 +0800, Ian Kent wrote:
> > On Sat, 2020-12-05 at 12:38 -0300, Andreas Hasenack wrote:
> > > Hi,
> > > 
> > > On Sat, Dec 5, 2020 at 6:32 AM Ian Kent <raven@themaw.net> wrote:
> > > 
> > > > Removing the LDFLAGS option -Wl,-Bsymbolic-functions makes the
> > > > problem go away.
> > > 
> > > Related:
> > > https://www.spinics.net/lists/autofs/msg01903.html
> > > 
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
> > > 
> > > 
> > > > I'm not sure why this happens, the best I could find is this:
> > > > https://stackoverflow.com/questions/7216973/is-there-a-downside-to-using-bsymbolic-functions/20729291
> > 
> > The unfortunate fact is that automount is a threaded application,
> > and
> > it does allocate and initialize that configuration variable earlier
> > than any accesses from functions in lib/defaults.c, so the
> > configuration variable should not be NULL in any thread at some
> > later point.
> > 
> > Admittedly that initialization function return should be checked
> > but I don't see how that can cause this. The validity of this
> > variable shouldn't need to be checked elsewhere in the config.
> > handling functions.
> > 
> > It's fine to call this a bug in autofs but what is the bug, IDGT?
> > Is it certain the optimisation option isn't broken in some way?
> 
> Thinking about this further it may be due to my use of a static
> library that is linked to each object, automount and the shared
> lookup, parse and mount shared libraries.
> 
> Still, this problem occurring entirely within in the main() function,
> before any shared libraries are used where only the fork() to become
> a daemon has occurred when this crash occurs, makes me wonder about
> this link option.
> 
> It may be that to fix this I need to change that static library to a
> shared library. I'm not sure how much work that would be but I
> suspect
> it would be quite a bit ... or maybe the use that link option is
> broken
> and so misguided in itself ...

So making the static library a shared library fixes this and, if
I haven't made any mistakes that haven't showed up yet, seems
fairly straight forward to do.

Ian

