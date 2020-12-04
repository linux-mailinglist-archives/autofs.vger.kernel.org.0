Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299812CEF17
	for <lists+autofs@lfdr.de>; Fri,  4 Dec 2020 14:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgLDN4t (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 4 Dec 2020 08:56:49 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:37109 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726309AbgLDN4t (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 4 Dec 2020 08:56:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 1AE019F0;
        Fri,  4 Dec 2020 08:55:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 04 Dec 2020 08:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        v277/9TZK2wSNjS8qPyp8MxLNcxgTL/ikRnErMjiToU=; b=TLsRNXDVJwdeuynQ
        hanqRMdnc50B06xhlNJcgeuvkie0S2f2ynupbcAswS6XfFtNozjrxRpjhMPPq84I
        yVOyOzlS50/4+Kze2bGoRPtGM1inMDrZ++ksdIR0FTc12sSb4IGGVguFm2CvowGX
        ViDhGESEBbqvQVzmMypRdYEgpx7/Tf9El/PeRnQmzaCiiYnaUP7zFbX7fl45BRND
        zVJ2jEEgbNAXtYsY0OiFIEk81ZiIUF+Q03FdP4u2t1eISkMK75uJC8Ri7qJjDJ7C
        58Gv+5rmfwZZKMsmk/AhjpcjXaZcnT8b95rEooJf9q0pMP8WRGNUPEZoUsUzuaMH
        S5+8bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=v277/9TZK2wSNjS8qPyp8MxLNcxgTL/ikRnErMjiT
        oU=; b=Prg/Kk0EUKEgfQNHIqwVimbt7ZMrSIelt3zU6/xdz/paBRZPVDgYf0mVT
        UlPAaHVZtfi/xIE9nEG6cfHCHtpqCmx7clHxuJgSDBbnJ7l8Kkdr+GNG5U8mqm6k
        24EWe12afBIo8FgKStIazDZY0Q56YUIVMDxrb+BDiiPRCrD0NI0WMniH6b2Xguzh
        OUd+7Z+9ciNoMcS+qzwHQo/E4o+Xo1grE0Y6v0AH7GoKKQgjmt3VDkjGFKeee0/r
        lnnv7GzZNjZtP2YWvbgzTAgAoXNFE5wQsDk3OWNr2hrRweD0NC3M4nqZvx4bfFDF
        Jt3oj1iZwC//O+IhUwwhsDrJx0ytg==
X-ME-Sender: <xms:3j_KX7UC0zmr7JD9XuCxtIzFxKUIfECwBH6KTpGZPoL5VDcvexejag>
    <xme:3j_KXznhGPDjBTTUw_ewcOQV9zHnn2FTxqvHd3DTKrRCdlZalYMyOUqRoJoD89Htm
    geUK34vNuOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepueejtefgleejieehieefgeduffejffeijeevfe
    euudetkedttdfhgeeuteekiedvnecuffhomhgrihhnpehgvghtshholhdruhhsnecukfhp
    pedutdeirdeiledrvdegtddrudefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:3j_KX3Zz3ZpdzaCItO0aMPjOPXWyPHdxn5UlTp8UomK_rHt5jWSXbQ>
    <xmx:3j_KX2WZse9egNbCjspdfpqWAz_1t1K9o17JrOfQvZqa9-jLdOr3oA>
    <xmx:3j_KX1nSztnvhpSNk_gv-I6ke9EQTaQ-ajM8CKBRWfinWl_le-wm_g>
    <xmx:3j_KXxwvW95jGa06dLtDsBN9V1qyC59PVY5tMy5mWs97mrTKUx1Heg>
Received: from mickey.themaw.net (106-69-240-132.dyn.iinet.net.au [106.69.240.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BD571080059;
        Fri,  4 Dec 2020 08:55:41 -0500 (EST)
Message-ID: <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Jonathan Van den Broeck <filovitch@simpletech.be>,
        autofs@vger.kernel.org
Date:   Fri, 04 Dec 2020 21:55:37 +0800
In-Reply-To: <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
         <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2020-12-04 at 18:23 +0800, Ian Kent wrote:
> On Thu, 2020-12-03 at 17:01 +0100, Jonathan Van den Broeck wrote:
> > Hi,
> > 
> > Sorry in advance if it is not the right place for this type a
> > question,
> > I am tottally noob in mailing list.
> > 
> > I try to use autofs on Solus 4.1 (http://getsol.us). It seems there
> > is
> > some problem with their package since version 5.1.3 and I want to
> > help
> > to solve the issue but I cannot figure what is the problem. 
> > 
> > I have try on fedora without any problem so I compare two strace to
> > see
> > the difference but it did not help me. It seems to crash when it
> > need
> > to read the map file.
> > 
> > Here is a link the issue with the initial description of the
> > problem
> > and a link to the source build of the package :
> > https://dev.getsol.us/T9026
> > https://dev.getsol.us/source/autofs/
> 
> In order to try and work out what's wrong it's necessary to know
> where the fault is occurring.
> 
> That means you need to have debug symbols available one way or
> another.
> 
> I don't know how that's done with Solus, in Fedora one installs
> the corresponding autofs-debuginfo and autofs-debusource packages.
> 
> You might be able to get most of what's needed by changing the
> "environment:" line of the Solus package.yml and adding DEBUG=1
> to the exported environment for the build but I don't really
> know the Solus build system works.

Your out of luck here, I couldn't build a Solus package that had
an automount binary with debug symbols.

> 
> Once you have a package with debugging information you can examine
> the core dump using coredumpctl(1) which should be installed as
> part of systemd.

Since the Solus autofs-dbginfo contains no debug symbols.

> 
> If you can get a build with debugging info then I can advise you
> further on how to get information about the crash, such as exactly
> where the fault occurred.

And general area where this fails looks fine but I can't debug it
because of the above.

I'm really not interested if struggling with this odd build system.

> 
> > SOLUS 4.1:
> > filovitch@solus ~/Downloads $ sudo automount -f -d -v
> > Starting automounter version 5.1.6, master map auto.master
> > using kernel protocol version 5.05
> > lookup_nss_read_master: reading master files auto.master
> > lookup_read_master: lookup(file): read entry /misc
> > Segmentation fault
> > 
> > filovitch@solus ~/Downloads $ sudo strace automount -f -d -v
> > ...
> > openat(AT_FDCWD, "/etc/auto.master", O_RDONLY|O_CLOEXEC) = 4
> > fstat(4, {st_mode=S_IFREG|0644, st_size=1289, ...}) = 0
> > read(4, "#\n# Sample auto.master file\n# Th"..., 4096) = 1289
> > write(2, "lookup_read_master: lookup(file)"...,
> > 50lookup_read_master:
> > lookup(file): read entry /misc) = 50
> > write(2, "\n", 1
> > )                       = 1
> > --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=NULL}
> > ---
> > +++ killed by SIGSEGV (core dumped) +++
> > Segmentation fault
> > 
> > FEDORA 33:
> > [filovitch@localhost ~]$ sudo strace automount -f -d -v
> > ...
> > openat(AT_FDCWD, "/etc/auto.master", O_RDONLY|O_CLOEXEC) = 4
> > fstat(4, {st_mode=S_IFREG|0644, st_size=1289, ...}) = 0
> > read(4, "#\n# Sample auto.master file\n# Th"..., 4096) = 1289
> > write(2, "lookup_read_master: lookup(file)"...,
> > 50lookup_read_master:
> > lookup(file): read entry /misc) = 50
> > write(2, "\n", 1
> > )
> > ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> > ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> > brk(NULL)                               = 0x55d0336bc000
> > brk(0x55d0336de000)                     = 0x55d0336de000
> > ...
> 
> None of this is useful.
> 
> Ian
> 

