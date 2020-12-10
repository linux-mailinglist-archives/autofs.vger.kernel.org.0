Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA2E2D505E
	for <lists+autofs@lfdr.de>; Thu, 10 Dec 2020 02:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgLJB2x (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 9 Dec 2020 20:28:53 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47661 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726263AbgLJB2x (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 9 Dec 2020 20:28:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id DEEE84FF;
        Wed,  9 Dec 2020 20:27:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 09 Dec 2020 20:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        sL25T1SkmuayMTTHvevk9/MsMzL9cGkGBS1g3DKDjBc=; b=bZUGskJJuaWkP49d
        kfQ1FKT/XJPI0fVaSudaxFLb2tMj4rrkjUjZnD6XXb9/a1TW8F0KaZ8l7iS4+S+l
        v86x7YaDO5NPYNFcPI2LyAoJ4gjWGWUlJPOl0Xn8xno9Ew0bQjNx6I5pq9LJScLz
        jYQ0DXP9N8BOtqcytouoXIXojeloJNUxzpKruKEmp/oJhM9TQqM8hdR46hunAph+
        ywN2TKsUVPmOadRlvJJF254PaxjL26yZS5jCf29E/m7YQDUshQV2tR71QFjnFpqF
        rn79yxdHjrl+cvHbePD3cPI9lvGE1A7clTLX+eoKuht3yyftbMkBNsJFwT4poJ7s
        zA9faQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=sL25T1SkmuayMTTHvevk9/MsMzL9cGkGBS1g3DKDj
        Bc=; b=lLkcErizeBB2MtfjKOS5hVO20/k2xqkjD8/U4/N+40ZCgGV5J8f0nnxII
        LjJJOl+/j+jR6zCketMtJP+KOWpLbWob08pSamaZoa97TmIT7921KNE/9jAVOO/D
        v3AAZjxIWLIuJtOMNEedJ9wzgkuU7VJEBHErvZ3y1qBlMAd9EwSwYR8lv9iG7ieR
        IBMjZAM424KfUHeFtL3JH7ys6S4EEm82eZe85ToBpMMIuPirtI7bu2wo3JJg5Ps8
        wffJRj/JKZI19yfqHO9ISjz9gOjCm/ene8wArrjw8qUmcYA6DawuwZyhkxA2ImVw
        8KJOZPD4/gvgX51RC2oeLTPt1G5Kg==
X-ME-Sender: <xms:kXnRXwgY3lxa22eVJer1tsMIMwcGCgLylwLmDUkqIBOp93ZdhUt5CQ>
    <xme:kXnRX5CHfXPVIgIPnfV-endD6Mj0P6Np9vhR5jJbDu-tu0X-lpRvM9DyDLB0gY9DV
    oEKtpzx3uA7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejledgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fhueetheefleehkefgueejtdeihedttdeufeffffeghedtfefhfeehiefhgfdujeenucff
    ohhmrghinhepshhpihhnihgtshdrnhgvthdpuhgsuhhnthhurdgtohhmpdhkvghrnhgvlh
    drohhrghenucfkphepuddtiedrieelrddvfeekrddukeefnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvg
    ht
X-ME-Proxy: <xmx:kXnRX4FwXsRViwZ4ORMg2nf64qmY5PXWusUtA7h1WWza3RMLkMMXlQ>
    <xmx:kXnRXxQ5GU9b6mJ2GvSkHcWeM8HBY7Fry2fiw8R_MIKx-q7AMcERwg>
    <xmx:kXnRX9wJuYm5tTbHiNOBWFwwYUFy4E5rohUIQdIEyLUTJJYtENiH1w>
    <xmx:knnRX2sc9VHvPRuPOD-LfoLyCaJ6jnhZ7LGeb6jR_KPHb_fpXmeJHQ>
Received: from mickey.themaw.net (106-69-238-183.dyn.iinet.net.au [106.69.238.183])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0B1AE240057;
        Wed,  9 Dec 2020 20:27:43 -0500 (EST)
Message-ID: <9e9a916a985acf138dae1c0f415bf6786f7358d2.camel@themaw.net>
Subject: Re: autofs 5.1.6 : segfault at startup
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Cc:     Jonathan Van den Broeck <filovitch@simpletech.be>,
        autofs@vger.kernel.org
Date:   Thu, 10 Dec 2020 09:27:39 +0800
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

Hi Andreas,

> 
> On Sat, Dec 5, 2020 at 6:32 AM Ian Kent <raven@themaw.net> wrote:
> 
> > Removing the LDFLAGS option -Wl,-Bsymbolic-functions makes the
> > problem go away.
> 
> Related:
> https://www.spinics.net/lists/autofs/msg01903.html

Sorry about not getting back to investigating this back then.

I don't know what was happening at the time that caused me to
not get back to it.

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

Not sure what #1636781 is?

But in answer to the question about fixing this upstream.

Based on what I have found recently I don't think simply reading
the config. again and again is the right thing to do.

In a threaded application you should be free to assume program
variables and data referred to by them are available in the way
defined by usual programming methods (eg. a static array defined
in a program source module should not simply go away because the
program has forked to become a daemon).

Regardless of whether using the symbolic-functions link option
is a good idea the segmentation faults that result from it means
I need to work around it.

Making the autofs static library a shared library fixes this and
seems fairly straight forward to do. As I said before, hopefully
I haven't made any mistakes.

Would it be useful to provide Ubuntu with patches prior to the
impending autofs 5.1.7 release (after which these patches would
be present on kernel.org)?

If so I can certainly do that and if we do then from that point
any further changes would be done as follow up patches, so they
would be final upstream patches even though they haven't been
pushed to the repository yet.

Ian

