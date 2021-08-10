Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40E53E594E
	for <lists+autofs@lfdr.de>; Tue, 10 Aug 2021 13:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238288AbhHJLnq (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 10 Aug 2021 07:43:46 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:51223 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237365AbhHJLnp (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 10 Aug 2021 07:43:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id C3D622B013BC;
        Tue, 10 Aug 2021 07:43:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 10 Aug 2021 07:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        TctVu4SZi73zxZawd+qaMfruYdb1cqJLFd+Eiv2vERI=; b=fehTRiGRs650fNDG
        jpVfPZrQx0D5Lel8bpBIn+wKEmqSLPhfZ5GkuTGYNgjMEZaTRr1rqEGFm8xt3PXZ
        6TYGqH1jgeEXsgEvlF0bGleCGQCnOO2i20khDoeJDbda9RpVPaVSbn1t58MgNCXt
        sorRD7SxAQL+//h7aUi0R+Y4nmpXW/AcWkV44IowrcBf+L0aTJTlveyHNXg8TfjA
        33YcVuh4sOgj0RX2jJaPwAOllJu9Vt711sh0q3w3SFopBbjWM3985Fd90moHlYNA
        oBVXuK4F1gM6BqcgAkm3mv0TR0X2IJBv15ZhwQWq/+qp8GXQw0xJuaBfK05GOR+t
        s4I77A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=TctVu4SZi73zxZawd+qaMfruYdb1cqJLFd+Eiv2vE
        RI=; b=EGqWfPgoqc4VmbJYb8u197SQ08Y8suMsOwQqkkiCsMe+EB0+2af9GFfQO
        0c/2kX0UOvpIJKynryr15vYA287G3db8IYmM6sVK/JWUAaHs9tRcQaOxNJSKWKBJ
        7x6bXjsPPN9uV4U1h93hnYjt/rsmaERYPoq259oGdnVE7ogCcw9gSJrgp3aiuYPE
        axLnQN/iLhCGCDvZ/s91RNmTfJuJ5hIWHAlA/y25QVOJBKY08z/tFvufaQRzviG2
        ReSsdM24SGOrVu85OF9ZR5xeTckZj3GZpKmWt7AJLtrB8lGy8aHH47b6JzWpQdG/
        YysNf3ha+UyB0PBOCGKULbmvyV11g==
X-ME-Sender: <xms:W2YSYTqKWYAap_kKklx0YTBfI_GvymH1z5eHE7HyKVwuiusPBcFUzA>
    <xme:W2YSYdoSvhl9e1gneHx1UcT7ZtR6TUkL4u7UU49LlckiL_5E-ozUzmdRHLPA9zx4e
    M32f7kSwzNp>
X-ME-Received: <xmr:W2YSYQM7Nh8zPtfKTYHmljJkMwj6Lm4y9zm2f77rg3TQq_2AAssVN5F2q73WJFZSfU-IlrAgO_RXtvHCljX2WdNVknIDWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:W2YSYW4-w0gsCEWeORee35AjjhhqYJWxJFduBeDHmEAs3R1HGOkCUw>
    <xmx:W2YSYS4t5JKpomYV-dcCSt9juH2hYOF_14WL3diA8a4-wN7V23lXJg>
    <xmx:W2YSYegsDZcgssVXyP6S0YkQZJJTSigpgyAnJUllD0WCezpynooCkQ>
    <xmx:W2YSYfUGfO7Paaw7bWdtHLmWCwBJnTGMq5sPog0Bu8Ngs-TyVhMmJY4-3fw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 07:43:21 -0400 (EDT)
Message-ID: <f78fc66f41caf701141737e61aa1e6988115920b.camel@themaw.net>
Subject: Re: autofs & glibc 2.34
From:   Ian Kent <raven@themaw.net>
To:     Sietse van Zanen <sietse@wizdom.nu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Tue, 10 Aug 2021 19:43:12 +0800
In-Reply-To: <c3a9f593933b4db5907637c505279e1e@wizdom.nu>
References: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
        ,<62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
         <c3a9f593933b4db5907637c505279e1e@wizdom.nu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2021-08-09 at 13:42 +0000, Sietse van Zanen wrote:
> 
> If you're already aware and will relwase an update soon there's nothing
> more to do. Glibc 2.34 is not even a week old. I noticed that a few
> packages were running into this so I thought I'd notify their
> maintainers.

I'll commit the change fairly soon and I hope I'll be able to post
a release by the end of the month.

Florian Weimer logged a Fedora (and RHEL) bug for this, so being
made aware of it I fixed it straight away, ;)

There is a got-cha though.

The reason automount played with the stack size was to work around
a bug in glibc when getting really large group info. This was fixed
in glibc in 2015 so I don't want to add checks for glibc version
since I can't know if a glibc in use has been patched even though
it's an old version and because it was fixed quite a while ago.

So if anyone tries to build on a distro. with a really old glibc
and really large groups info. needs to be handled the advice will
be to update glibc, ;)

Ian
> 
> -Sietse
> 
> ________________________________
> From: Ian Kent <raven@themaw.net>
> Sent: Saturday, August 7, 2021 06:44
> To: Sietse van Zanen; autofs@vger.kernel.org
> Subject: Re: autofs & glibc 2.34
> 
> On Fri, 2021-08-06 at 12:46 +0000, Sietse van Zanen wrote:
> > Autofs no longer compiles with newest glibc 2.34. From the changelog:
> > 
> > When _DYNAMIC_STACK_SIZE_SOURCE or _GNU_SOURCE are defined,
> > PTHREAD_STACK_MIN is no longer constant and is redefined to
> > sysconf(_SC_THREAD_STACK_MIN). This supports dynamic sized register
> > sets for modern architectural features like Arm SVE.
> > 
> > 
> > This is causing compilation error in daemon/automount.c line 87:
> > 
> > size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
> > 
> > 
> 
> I'm aware of this.
> 
> What would you like me to to do here?
> 
> I have two patches for this but haven't pushed them to the repo. yet.
> Also there will be a release, probably later this month that will
> include these.
> 
> Ian
> 
> 
> 


