Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7489714940D
	for <lists+autofs@lfdr.de>; Sat, 25 Jan 2020 10:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgAYJFd (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 25 Jan 2020 04:05:33 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:32973 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgAYJFd (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 25 Jan 2020 04:05:33 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id DC98321F7D;
        Sat, 25 Jan 2020 04:05:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 25 Jan 2020 04:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        Fwb19I9O/aBWDRf06mWuC4ATeYpGW0zSrV80Y2xTnEA=; b=pPpAOKa9/u+jlCUz
        htpTERcjeUdDYoiRqELVudJf2wZF3/AywFS6/+UlL2EmydT7YevOqppc7Nko9pHB
        WTe057KtchSvr3Wl+tFgirgsq05NKIv3BnV0JPh5hsQtbT9Yy8OnK57cxmezqK6c
        9MtknrWBk/kHCq8+UFLw0cGfaBbV9Hlz3WsskUQELl7vNqDIpxkZZZWlwdJNSOsq
        DTCvZzGp4aZGKeCraNtDnl6/MnzlAM+vq/3Yq1nHK3hneEXv4ynqVwoT12TcvfVh
        NdiXn6B+d9fczf6qPWK+sCfueFWak87RQjiIaAYTbyyGBPpoTbmN/iueNVf09ViY
        uFkvow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Fwb19I9O/aBWDRf06mWuC4ATeYpGW0zSrV80Y2xTn
        EA=; b=IrluakK49JL2fBCREb1Ka1xfEuFUucJWE5e7KL2/QMpwyVMNAJ5n+KCRw
        orGXs6ReNbMgoN8yPCBvurUUiKTW8gFu35ovF2gWfzcJqm5QK8W2lqTZan3g2ry5
        3CHDwIAnwkAIowHe9L4tiUyVIW5YrUskXP58THo3lSzTM7ZV5SqzBvgpANJtn2Fq
        0rH35DjJdAozb4m49LS5d8n9HL2zjhq1yFkixkDM/XZrDq8C+TxJnbI3mNo3P4VF
        pomHyB1/E/1nXLb+/TIiy4p5s0KfYSxOkTtG0Qq8U6lMqSBpEzfYQJEi2GLBlycL
        IHgT62szjvFCJr944t6PI9apys9QA==
X-ME-Sender: <xms:3AQsXrOVJzo7UYEMsnv05SAyIdjsLpToczLDm0JzLkLx_i5tAGGATg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdeigdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucffohhmrghinhepuggvsg
    hirghnrdhorhhgnecukfhppeduudekrddvtdekrddukeekrddugeelnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrg
    ifrdhnvght
X-ME-Proxy: <xmx:3AQsXjVne-q2bbN6XWezeU--UVKpzbiNgQzggNV5fZG2NU17lJgwNA>
    <xmx:3AQsXhkHI6m9q1V1XwpZoNUqL3LK3o_9JWn-qDD31cFS1YP7T0BaxA>
    <xmx:3AQsXqPkFknvFBPLi_9ulSJx6HQEFnc3Xm91buTVp8Bxb3zZ42QDJA>
    <xmx:3AQsXuN9pd8h315cucUn-aQQRGoEwgrmiGGXwOmICN-KGuVdazHJMQ>
Received: from mickey.themaw.net (unknown [118.208.188.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5CF1C3065391;
        Sat, 25 Jan 2020 04:05:31 -0500 (EST)
Message-ID: <de88a2efd3bd06cce762741d0dec408774bfacad.camel@themaw.net>
Subject: Re: [PATCH] Use pkg-config to detect libxml2
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Sat, 25 Jan 2020 17:05:27 +0800
In-Reply-To: <CANYNYEHsD+X=X=C743CG4DJQ6CCEk5k0zcTKa1KGGu3KfPWCEw@mail.gmail.com>
References: <CANYNYEHsD+X=X=C743CG4DJQ6CCEk5k0zcTKa1KGGu3KfPWCEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-01-20 at 10:19 -0300, Andreas Hasenack wrote:
> Hi there,
> 
> Debian dropped[1] xml2-config from libxml2-dev in experimental,
> favoring the use of pkg-config instead. This caused some packages to
> fail to build, autofs among them[2].
> 
> I'm submitting the attached patch for your consideration and
> review/comments. I realize this is a distro change and shouldn't
> affect autofs building when everything is installed from source,
> unless libxml2 upstream decides to follow suit and drop xml2-config
> as
> well.

It's been a while but IIRC the point of that check was to set
LIBXML2_WORKAROUND if libxml2 is being used because a shared
library usage bug in libxml2 was unlikely to ever be resolved
within the upstream package.

And this change ensures that LIBXML2_WORKAROUND isn't set so
you could start seeing crashes at automount exit due to incorrect
shared library usage of Thread Specific Data (TSD) create and
destroy, see commits a60e2583d, a5958245c and related commits.

IIRC, basically libxml2 uses a shared library function as the
TSD destructor which will not be available at program exit if
(/when) the shared library has already been unloaded => crash.

The logic in that autoconf function isn't great so getting rid
of it is fine but LIBXML2_WORKAROUND should be set if libxml2
is being used.

I'm don't know if "libxml-2.0" in that function invocation will
work with all distros so that's really the only question to
getting rid of the original function.

> 
> Thanks!
> 
> 
> 1. 
> https://salsa.debian.org/xml-sgml-team/libxml2/commit/53de4f8ae1469e9068a6ab341836e523324c64c3
> 2. https://bugs.debian.org/949055

