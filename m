Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351782CFF91
	for <lists+autofs@lfdr.de>; Sat,  5 Dec 2020 23:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgLEWu6 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 5 Dec 2020 17:50:58 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:48265 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725270AbgLEWu5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 5 Dec 2020 17:50:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id ACAB3B2C;
        Sat,  5 Dec 2020 17:49:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 05 Dec 2020 17:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        W0jGYahtqg/EIOpMlVihwYlXZu4kw+NhczgXohNWYNE=; b=E+jFxXZyAzzTb0AN
        DDDRoX+tqxE4f6rTYwT4HMB29DAZNJF8IY5TbDMHghHJpOJmE6AFAziPX+y6lEJo
        of4lmTfae9Ok55+0vFRPM/P8/gEJvs769PpHzGRjgJ7Iw1cIP/7ClWkt0nDYjrw9
        RnK0/LLYnHwaklntRUTjRet5B1YNthp51M/RQ7pfaCtjtEMJJ/uxPsQNH2X6eyax
        Cv26UxGvU0Yzu9TN1/zB9Z3kVuLDwLwm3BrYsxhCOoNfB5OrP2quSj9D0XCoE53i
        dV469t7eRZAmXmr89M0/aRzvrBbbi2YD+/kU3kEh8H3VujD9tRrlofT2xAFcYQg3
        chzBtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=W0jGYahtqg/EIOpMlVihwYlXZu4kw+NhczgXohNWY
        NE=; b=B7CRq6ROxSeSrYaLC0ye6mBCxnyOUhJC3p+xzwYSVMxBVt0f4Welx2kTw
        Ja9hmj0+JFgTsOUp8ZHFAvZbCeEgjFO/d8D6x5xyGivrT2eKbXESyiYeb4dVXkVF
        r7b7wVefevDC/HNTf9s6I+EG31PSI9NexuJ6pmVWvg6SN+BlibQp2rnkX0IbIJrR
        kVbaD0MqDfQu1xW+1QdEePg79a2he4n/0y0Lxzs16wosMwpBONDGjaBa4LHvzxti
        Vd99OjP5rvOMOvN9lmgbA76FoWZ96sda4czByjj6C7LLetzEeoPqrx9rX572Soun
        YQ1bY+k6T4MBc2fyrsDLoyIrlCcGw==
X-ME-Sender: <xms:jg7MXxf4fgI3wnpoMGCKwRBX3wRgYOl2tv3hixk7j_V16gJok3v-Xg>
    <xme:jg7MX_NnHhLrARCw5uYuFfNfORgq5us-R40dqe6j15qzhYAAoMFrrjIx9y4wzTKkh
    TTJh3CNWyAu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejuddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    evleektdfhveelgedvtdetleelueejueetjeegveffieegtdegteekvdegtedvfeenucff
    ohhmrghinhepshhpihhnihgtshdrnhgvthdpuhgsuhhnthhurdgtohhmpdhsthgrtghkoh
    hvvghrfhhlohifrdgtohhmnecukfhppedutdeirdeiledrvdegtddrudefvdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthh
    gvmhgrfidrnhgvth
X-ME-Proxy: <xmx:jg7MX6jsuo1-Ww_Y7xUKGBSDM_tPC6EQDsgkLRmZaL5dEx1yC64FFw>
    <xmx:jg7MX68f-WgSK90_dUa-MoBAG_2xpi7ewWCayX_zgD7MeEKuEUbMUQ>
    <xmx:jg7MX9t7IbiFTjsjadwHMxkl0skR25puhxZujISG5_9W3Z0oMz6wkQ>
    <xmx:jw7MX76uF9_9d8C_Y_o9KMeDVoPJhJi-riczrzoJiMSNH6l_psRKJQ>
Received: from mickey.themaw.net (106-69-240-132.dyn.iinet.net.au [106.69.240.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id A1FC8240059;
        Sat,  5 Dec 2020 17:49:49 -0500 (EST)
Message-ID: <8d18d1b3e39fc66846cc3937578dc70ca6d6561d.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Sun, 06 Dec 2020 06:49:45 +0800
In-Reply-To: <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
         <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
         <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
         <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, 2020-12-05 at 12:38 -0300, Andreas Hasenack wrote:
> Hi,
> 
> On Sat, Dec 5, 2020 at 6:32 AM Ian Kent <raven@themaw.net> wrote:
> 
> > Removing the LDFLAGS option -Wl,-Bsymbolic-functions makes the
> > problem go away.
> 
> Related:
> https://www.spinics.net/lists/autofs/msg01903.html
> 
> In Ubuntu, -Wl,-Bsymbolic-functions is a system-wide default and we
> remove it from the flags when building autofs in d/rules:
> 
> # Taken from #1636781 as it's the same problem here. Also see
> # 
> https://lists.ubuntu.com/archives/ubuntu-devel/2018-June/040369.html
> ifeq ($(shell dpkg-vendor --derives-from Ubuntu && echo yes),yes)
>   export DEB_LDFLAGS_MAINT_STRIP = -Wl,-Bsymbolic-functions
> endif
> 
> 
> > I'm not sure why this happens, the best I could find is this:
> > https://stackoverflow.com/questions/7216973/is-there-a-downside-to-using-bsymbolic-functions/20729291

The unfortunate fact is that automount is a threaded application, and
it does allocate and initialize that configuration variable earlier
than any accesses from functions in lib/defaults.c, so the
configuration variable should not be NULL in any thread at some
later point.

Admittedly that initialization function return should be checked
but I don't see how that can cause this. The validity of this
variable shouldn't need to be checked elsewhere in the config.
handling functions.

It's fine to call this a bug in autofs but what is the bug, IDGT?
Is it certain the optimisation option isn't broken in some way?

Ian

