Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD162CFAD9
	for <lists+autofs@lfdr.de>; Sat,  5 Dec 2020 10:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgLEJWk (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 5 Dec 2020 04:22:40 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49311 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726043AbgLEJWG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 5 Dec 2020 04:22:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 77AB5C41;
        Sat,  5 Dec 2020 04:09:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 05 Dec 2020 04:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        gQHdOL83eGFv+dtb3n+48ktVTrB5d9FQBCT9w57w2SM=; b=YXiUVY8PoTEgdZuc
        BWDOo8R5UPBzs3l6hFmHS1EotXpYzAPCh70FgU/uGPVYP81YGbhB2qWzpKsppF9F
        5BtNgzmg+GOCRwnqTqkAmrnd0lRhGIgrlfj6LmFsUz6CAzjPw9byG6kU8yPL5DQj
        Uq5MOZbUEzaPzZJCfQ6+TmSZQC9hKx2ZNR0lS24l2Jxud98ER1mGUcLtNkbz8A+q
        neCfnjsCXes0bD1m3vZjZrHSHeckeXur32idD3mzWx5A//VwUKU5j7AYGlicAJcp
        IdJg2Fth4B94YhY4sL8wJ5EE19OKmSbSEN61zQiGJ9xKoudZDyfsZekg02u/aEIJ
        QVt94Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=gQHdOL83eGFv+dtb3n+48ktVTrB5d9FQBCT9w57w2
        SM=; b=psIkh3BudzIGjFz+3p6nqxGH2xxZYS5K4pJSSLY/hjTHFSqOiEM27JbjY
        l0zu2gxZg8cJgUNC//Lz7lJVd10IZxgdFJ9giurs7r5jtZBhWFuDj0eo+RTwKN5w
        O8Mkt7Rl9PlUC+NB+ueeHMXRs9EsbwhfsWh2w9wD0MYJsxMG0AsEPKhGmPsVl/b0
        FEhqVa2iNBTk3ys4wiDpAcIg1SS+qc6KP9i5S83XTYrCHDHulF7UOqayvBSlp8Mr
        E5JQP8T9xyxb+g5dQ76m31eMoirCgXfJSOY94Zpo3bx2sPn0Js5725YndcSDEr1x
        aS/xunRHHiAiPGIM1kmiJD412goBw==
X-ME-Sender: <xms:YE7LX6ufrHjrX4KdAJ20Tjm-daTJGlVrOgUrkJT7ZSnh2CiavxGfww>
    <xme:YE7LX_e5jTzp9qgyz_IDvh1DOckdoJpl48LmVYgp3WQTGzpVfN8VxgPl0-Fa1AobU
    Y2RMsF2zSO3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejtddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepleehjeevleffgefgieegueeuhedtuedvhfelfe
    ffjedvuddvkedtkeeikeekgfdvnecuffhomhgrihhnpehgvghtshholhdruhhspdgtohhn
    fhdrihhnpdhsthgrtghkohhvvghrfhhlohifrdgtohhmnecukfhppedutdeirdeiledrvd
    egtddrudefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:YE7LX1xwgLYVhkbnMHZIoMa_Q9xvpSDsBgZAULNR1QMlBzXkE2oZqw>
    <xmx:YE7LX1PrVbshfbsD7i_pTZKJsf-X7XqQR6NkBIbziozz0dIaWUekqQ>
    <xmx:YE7LX6-IyRt9PRRawWgN0wwWOUoUa_vXpyiR2LvdG-wlXCiKCZs2Fw>
    <xmx:YU7LX9I0c5pIrgF6HGfJmcX3JHe0y9xSrarQaIL-ML2BCj7XbT-PVg>
Received: from mickey.themaw.net (106-69-240-132.dyn.iinet.net.au [106.69.240.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9593F1080067;
        Sat,  5 Dec 2020 04:09:51 -0500 (EST)
Message-ID: <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Jonathan Van den Broeck <filovitch@simpletech.be>,
        autofs@vger.kernel.org
Date:   Sat, 05 Dec 2020 17:09:47 +0800
In-Reply-To: <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
         <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2020-12-04 at 21:55 +0800, Ian Kent wrote:
> On Fri, 2020-12-04 at 18:23 +0800, Ian Kent wrote:
> > On Thu, 2020-12-03 at 17:01 +0100, Jonathan Van den Broeck wrote:
> > > Hi,
> > > 
> > > Sorry in advance if it is not the right place for this type a
> > > question,
> > > I am tottally noob in mailing list.
> > > 
> > > I try to use autofs on Solus 4.1 (http://getsol.us). It seems
> > > there
> > > is
> > > some problem with their package since version 5.1.3 and I want to
> > > help
> > > to solve the issue but I cannot figure what is the problem. 
> > > 
> > > I have try on fedora without any problem so I compare two strace
> > > to
> > > see
> > > the difference but it did not help me. It seems to crash when it
> > > need
> > > to read the map file.
> > > 
> > > Here is a link the issue with the initial description of the
> > > problem
> > > and a link to the source build of the package :
> > > https://dev.getsol.us/T9026
> > > https://dev.getsol.us/source/autofs/
> > 
> > In order to try and work out what's wrong it's necessary to know
> > where the fault is occurring.
> > 
> > That means you need to have debug symbols available one way or
> > another.
> > 
> > I don't know how that's done with Solus, in Fedora one installs
> > the corresponding autofs-debuginfo and autofs-debusource packages.
> > 
> > You might be able to get most of what's needed by changing the
> > "environment:" line of the Solus package.yml and adding DEBUG=1
> > to the exported environment for the build but I don't really
> > know the Solus build system works.
> 
> Your out of luck here, I couldn't build a Solus package that had
> an automount binary with debug symbols.
> 
> > Once you have a package with debugging information you can examine
> > the core dump using coredumpctl(1) which should be installed as
> > part of systemd.
> 
> Since the Solus autofs-dbginfo contains no debug symbols.
> 
> > If you can get a build with debugging info then I can advise you
> > further on how to get information about the crash, such as exactly
> > where the fault occurred.
> 
> And general area where this fails looks fine but I can't debug it
> because of the above.
> 
> I'm really not interested if struggling with this odd build system.

In spite of, coredumps not being saved by systemd after a fresh install
and the configuration looking like it should, package dbginfo packages
not being produced during local builds, the distribution dbginfo
package not containing any debugging information (might need a patch
to set DONTSTRIP=1 in Makefile.conf.in but even that doesn't get full
debug info in the built package, not sure how all that hangs together),
I continued with this.

It turns out that the initial crash occurs when trying to access a
static global variable in the configuration handling code.

This structure "has" been allocated and initialized and should be
available to the configuration handling functions.

However, since the functions know it is not NULL they don't check
it before access, and at some point after the allocation and
initialization it is seen as NULL and the program crashes.

Removing the LDFLAGS option -Wl,-Bsymbolic-functions makes the
problem go away.

I'm not sure why this happens, the best I could find is this:
https://stackoverflow.com/questions/7216973/is-there-a-downside-to-using-bsymbolic-functions/20729291

Ian

