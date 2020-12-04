Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72F32CEC1D
	for <lists+autofs@lfdr.de>; Fri,  4 Dec 2020 11:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbgLDKY1 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 4 Dec 2020 05:24:27 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60125 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729332AbgLDKY1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 4 Dec 2020 05:24:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 38F1EAEE;
        Fri,  4 Dec 2020 05:23:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 04 Dec 2020 05:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        efIdqmKoyrd1kMVZh0FWpi4U1elFSRprSxcJEr8KSqE=; b=J0eJglsVL8QqzWz4
        RCoxTLs58lsaV2JG0Xd/8giKjgOOJn43mkut4lWFE2t0XOVQAQkKKBNGC1ImljpE
        o1OVGhqDAOxILKNhYdm6W2ObO/ad22GMMVHSbljlMr2fLgbNYJFKElxQbcaWH4kf
        SbcTCShCMbyfD8wtEZiS4D+9fKjpaOs5rpWvi2gb+YH5+Ix/WBbPtb8seMEL70Jx
        SHesD42q+15IFxfrkz3p5WkJmxtgTbLEIcu4L/ARfTp82mOaNeLa42h2RDlbLbhj
        +9zHoNhCVHfn9rJO8viF2Rgfx4lhmQ6EQkDmjcupKN4DeHMlmlJVs88r+UNyFRZP
        ju5wSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=efIdqmKoyrd1kMVZh0FWpi4U1elFSRprSxcJEr8KS
        qE=; b=SHuSEPRLyLev6jb0WcOU1wjF+rG4XcUKJ/B3rBkCOngE5R4LWtnDE71h7
        PwzAUgMGyf6mzqb2aYAyo9QnkQa0TUN1qMKc1x87V6yOnzhHSt74AYq29L8dvRF7
        /qkBvChYtzzmIYvYxYrf4tl0uqfI5DiCDbfNfOsOkdmvP136fpZvnBruxVLQ9end
        Egyzr8dAF0pJO03PLkkw/evk2azo6WKVDJtDZCaubh5GfjJnO8xqzCAeUco/u6Kz
        h9OBMPTvCUSSRgFKvMfDorbZqChi+6rRtIptcAlfJsBwgJnm3d4S4KKnKNJpJq6W
        2vG4fghP6+JfjVVKTY58JG2f5LA5g==
X-ME-Sender: <xms:LA7KX2tcvlgcmW1yISBPaJkejj4qBbUKS09IRklaLyIWWPA-fcFAJQ>
    <xme:LA7KX7eXrxStwgo_QpRJGrIZCDwS7OD5fgx9jedCbcBrW9NhNO-T1d6dPFIj9_VUd
    D9ty6mkZ2Kb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepueejtefgleejieehieefgeduffejffeijeevfe
    euudetkedttdfhgeeuteekiedvnecuffhomhgrihhnpehgvghtshholhdruhhsnecukfhp
    pedutdeirdeiledrvdegtddrudefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:LA7KXxxbJhey6Vp47_BVwc-dMnbULrgfD9uh-qj0T1XaJ-HbVMa3Qg>
    <xmx:LA7KXxNf49v2vyMo8MHYlb3FuWQicojgu-FGQhhbvRbTYyMgFD_FRQ>
    <xmx:LA7KX29RAkNISCFKuzPEaD30blsXRLGp39LD7bkVZPEj6AeYEXgbVw>
    <xmx:LA7KX5LJtwj2gxkipc7-U0Z-2UPZCl9Xpgt2Ggqs4nVYvP-jANhMkw>
Received: from mickey.themaw.net (106-69-240-132.dyn.iinet.net.au [106.69.240.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 07FC3108005F;
        Fri,  4 Dec 2020 05:23:38 -0500 (EST)
Message-ID: <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Jonathan Van den Broeck <filovitch@simpletech.be>,
        autofs@vger.kernel.org
Date:   Fri, 04 Dec 2020 18:23:34 +0800
In-Reply-To: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2020-12-03 at 17:01 +0100, Jonathan Van den Broeck wrote:
> Hi,
> 
> Sorry in advance if it is not the right place for this type a
> question,
> I am tottally noob in mailing list.
> 
> I try to use autofs on Solus 4.1 (http://getsol.us). It seems there
> is
> some problem with their package since version 5.1.3 and I want to
> help
> to solve the issue but I cannot figure what is the problem. 
> 
> I have try on fedora without any problem so I compare two strace to
> see
> the difference but it did not help me. It seems to crash when it need
> to read the map file.
> 
> Here is a link the issue with the initial description of the problem
> and a link to the source build of the package :
> https://dev.getsol.us/T9026
> https://dev.getsol.us/source/autofs/

In order to try and work out what's wrong it's necessary to know
where the fault is occurring.

That means you need to have debug symbols available one way or
another.

I don't know how that's done with Solus, in Fedora one installs
the corresponding autofs-debuginfo and autofs-debusource packages.

You might be able to get most of what's needed by changing the
"environment:" line of the Solus package.yml and adding DEBUG=1
to the exported environment for the build but I don't really
know the Solus build system works.

Once you have a package with debugging information you can examine
the core dump using coredumpctl(1) which should be installed as
part of systemd.

If you can get a build with debugging info then I can advise you
further on how to get information about the crash, such as exactly
where the fault occurred.

> 
> SOLUS 4.1:
> filovitch@solus ~/Downloads $ sudo automount -f -d -v
> Starting automounter version 5.1.6, master map auto.master
> using kernel protocol version 5.05
> lookup_nss_read_master: reading master files auto.master
> lookup_read_master: lookup(file): read entry /misc
> Segmentation fault
> 
> filovitch@solus ~/Downloads $ sudo strace automount -f -d -v
> ...
> openat(AT_FDCWD, "/etc/auto.master", O_RDONLY|O_CLOEXEC) = 4
> fstat(4, {st_mode=S_IFREG|0644, st_size=1289, ...}) = 0
> read(4, "#\n# Sample auto.master file\n# Th"..., 4096) = 1289
> write(2, "lookup_read_master: lookup(file)"..., 50lookup_read_master:
> lookup(file): read entry /misc) = 50
> write(2, "\n", 1
> )                       = 1
> --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=NULL} ---
> +++ killed by SIGSEGV (core dumped) +++
> Segmentation fault
> 
> FEDORA 33:
> [filovitch@localhost ~]$ sudo strace automount -f -d -v
> ...
> openat(AT_FDCWD, "/etc/auto.master", O_RDONLY|O_CLOEXEC) = 4
> fstat(4, {st_mode=S_IFREG|0644, st_size=1289, ...}) = 0
> read(4, "#\n# Sample auto.master file\n# Th"..., 4096) = 1289
> write(2, "lookup_read_master: lookup(file)"..., 50lookup_read_master:
> lookup(file): read entry /misc) = 50
> write(2, "\n", 1
> )
> ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> brk(NULL)                               = 0x55d0336bc000
> brk(0x55d0336de000)                     = 0x55d0336de000
> ...

None of this is useful.

Ian

