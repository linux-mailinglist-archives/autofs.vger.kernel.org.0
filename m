Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD82D20FA
	for <lists+autofs@lfdr.de>; Tue,  8 Dec 2020 03:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgLHCk3 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 7 Dec 2020 21:40:29 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34979 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727958AbgLHCk3 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 7 Dec 2020 21:40:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C02EE5C01C9;
        Mon,  7 Dec 2020 21:39:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 07 Dec 2020 21:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        dLY9n98odqMyQwJxwIXyFlfHaBBocGiUGX+NnHkK7+Q=; b=FtpY4AX4wOU18YQ5
        HYWmHGCXkeb5ojdUvkPbl4rax85ni+RkBCcy+MyEC42OsBsjxmacOnYKVnNgueQn
        VBrPyD0yha9fcVs0h8YdwtuhCxo4ZjWFv4SAYuBS2bxBGBMUJ0yLOOdHkZ4nA9KR
        wVbOb4gTMCc1G2Hrh1pnyTALbzd6KiVYn4mjMMLz4B5I+rHBWvQ4AHccnNSmEE7v
        xWdReQ/OfXA9nA13cTBWT3KBnrJNPohEZBBfd3DRwJYY0M9Zs13l4PFFCCPdeJtf
        q8wedvb8qF/2oWvnYKsuNJLHUDD3blQ79Hy4UnNzbwryi+AOwHkJpaU7WcWqFR0t
        dLCB+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=dLY9n98odqMyQwJxwIXyFlfHaBBocGiUGX+NnHkK7
        +Q=; b=A93YTroAOM7esx9E1ZSz0qs8Vs4bRTv8q+AEtwUHFNxz6fP1+LNkCSG9s
        9Hx29rLPCfjhgzldYZN+aNqTcQezD6LnRbp3nXc/E6cEoDx+wtx5x/c3WimY84WJ
        PDucnUyfQ54THWNlZTaTLJIgGDL0JdP9NFuy9/YHXizHF+Ah5E6z9VWRhQEKQrCQ
        qJGbf3RO17/iGEAZUcgrclzp062/gIC+qLcaOrIGre2UuwZAxFPz7fU/RHz4a4np
        C38xAl6dEzeLIEB44GkgAMn5bLGnufBDOOW9YQhSlzd/YqMkUC35XS53je/vuBso
        DH3Hk/kp1ftaT0ESfotTQBxC0DxFw==
X-ME-Sender: <xms:bufOX-KuCNRdN9DHXlgrfHsNiWDkiOfLefxqOM5Ij0QL1ZI6CA9hkA>
    <xme:bufOX2KeH5EpKg5TWgl3oNJLv6Q9TphnOofAXSfsJwZ9dc1aQZA043fQqvPwivFYE
    8LKYY50vtYG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejhedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    evleektdfhveelgedvtdetleelueejueetjeegveffieegtdegteekvdegtedvfeenucff
    ohhmrghinhepshhpihhnihgtshdrnhgvthdpuhgsuhhnthhurdgtohhmpdhsthgrtghkoh
    hvvghrfhhlohifrdgtohhmnecukfhppedutdeirdeiledrvdegtddrudefvdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthh
    gvmhgrfidrnhgvth
X-ME-Proxy: <xmx:bufOX-vTeiizBLN4FaAKtgSYHdaX9KG4CmfCXKzCxUOt6dS-oWwzBQ>
    <xmx:bufOXzbJOAL6WEUqWTaX_PuW_Fhhd0PqZo52gJgVIoGL3vDXQqZRTQ>
    <xmx:bufOX1b0_4TDPAdfCWny6w9PmMwDPlTjD-24x9NFpjrN69WkC-QpAQ>
    <xmx:bufOX-lTt-pRd_KSGqx0MuXY7b24nFlFjwPyeGtB0eTxEuHEAqMLaQ>
Received: from mickey.themaw.net (106-69-240-132.dyn.iinet.net.au [106.69.240.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 24F961080066;
        Mon,  7 Dec 2020 21:39:40 -0500 (EST)
Message-ID: <81b52ef59b96964a91bb3b7e6624e2f96a47af7e.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Tue, 08 Dec 2020 10:39:36 +0800
In-Reply-To: <8d18d1b3e39fc66846cc3937578dc70ca6d6561d.camel@themaw.net>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
         <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
         <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
         <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
         <8d18d1b3e39fc66846cc3937578dc70ca6d6561d.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sun, 2020-12-06 at 06:49 +0800, Ian Kent wrote:
> On Sat, 2020-12-05 at 12:38 -0300, Andreas Hasenack wrote:
> > Hi,
> > 
> > On Sat, Dec 5, 2020 at 6:32 AM Ian Kent <raven@themaw.net> wrote:
> > 
> > > Removing the LDFLAGS option -Wl,-Bsymbolic-functions makes the
> > > problem go away.
> > 
> > Related:
> > https://www.spinics.net/lists/autofs/msg01903.html
> > 
> > In Ubuntu, -Wl,-Bsymbolic-functions is a system-wide default and we
> > remove it from the flags when building autofs in d/rules:
> > 
> > # Taken from #1636781 as it's the same problem here. Also see
> > # 
> > https://lists.ubuntu.com/archives/ubuntu-devel/2018-June/040369.html
> > ifeq ($(shell dpkg-vendor --derives-from Ubuntu && echo yes),yes)
> >   export DEB_LDFLAGS_MAINT_STRIP = -Wl,-Bsymbolic-functions
> > endif
> > 
> > 
> > > I'm not sure why this happens, the best I could find is this:
> > > https://stackoverflow.com/questions/7216973/is-there-a-downside-to-using-bsymbolic-functions/20729291
> 
> The unfortunate fact is that automount is a threaded application, and
> it does allocate and initialize that configuration variable earlier
> than any accesses from functions in lib/defaults.c, so the
> configuration variable should not be NULL in any thread at some
> later point.
> 
> Admittedly that initialization function return should be checked
> but I don't see how that can cause this. The validity of this
> variable shouldn't need to be checked elsewhere in the config.
> handling functions.
> 
> It's fine to call this a bug in autofs but what is the bug, IDGT?
> Is it certain the optimisation option isn't broken in some way?

Thinking about this further it may be due to my use of a static
library that is linked to each object, automount and the shared
lookup, parse and mount shared libraries.

Still, this problem occurring entirely within in the main() function,
before any shared libraries are used where only the fork() to become
a daemon has occurred when this crash occurs, makes me wonder about
this link option.

It may be that to fix this I need to change that static library to a
shared library. I'm not sure how much work that would be but I suspect
it would be quite a bit ... or maybe the use that link option is broken
and so misguided in itself ...

Ian

