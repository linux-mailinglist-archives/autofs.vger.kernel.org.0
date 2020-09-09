Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56452262660
	for <lists+autofs@lfdr.de>; Wed,  9 Sep 2020 06:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgIIEdJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 9 Sep 2020 00:33:09 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60557 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725772AbgIIEdI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 9 Sep 2020 00:33:08 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id D02855C00B3;
        Wed,  9 Sep 2020 00:33:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 09 Sep 2020 00:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        MUHe3eUcXLW3hqiwsty80dXuEnxhV4flcf8WdMHILGA=; b=aQtNZzPDGRPcPtOq
        JxJ0L8DEiVLosBplLhChU3LdHY6PxtA196ZSW6j1RLJt5JDKdKglEOqIN1v4fJpl
        oEIQzIqvMVGeNU2BCmtpOx5ExTQLYFilOEoSdQ0K2rpGyYQuRr8xkVuvWSUQh0ld
        6v5wmCKbqEDKVBBURtmvcsJ+5v68yyTUqw9KYmT/5bsQsnk2eg8n1gzb8bKsr9iW
        9jvSrEbUDO8rW2sDMkIxhwwL+yID/9bOkc5hHCnzSBZ5bDka2Ib7lhktgyh5p8J8
        hv30Z0gnEJQmSZrUzx/cQIcgS4dB/atidmTJ5hmV36iEoHoFr+DXYGwmAEBQEr71
        drLong==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=MUHe3eUcXLW3hqiwsty80dXuEnxhV4flcf8WdMHIL
        GA=; b=liQaKwTvB+Vy/INuhUzhvXXafp88yycBGEXU6NVIQhMMUT4QGQAXG+eMY
        aUELPmjRSzmfEQbK+6p9z2WjoGeWDABO933c7A9xDwrhnYhMpTqSBEFHWILrq4tr
        mwwgMdCNXs1RvNbk2v51w4dOuGTXpxHBvGDwlUqptUaDahlWzRsKXoY2fprLLlVs
        g9OYy6NGunAYMWVC2LJ193oQmPnUOX9ZMvP/CkJLtUyPY/pyu/KL1HOsz2u8Dhu9
        987ISHtnf1WBC84dp8S4Ikse0cZuJoCzBCnPud3hiBKGxrg9GJZDdIlRTLXYjYyt
        ijNj30UgPAAnI9FaXUXUWnW8+heLg==
X-ME-Sender: <xms:AFtYX3GewZubEkUE4KBYKU0gszz8N6aWNvQt5rBcr1FbpQMWcQh77w>
    <xme:AFtYX0UY7JuBN9LzBRBh2zYDaGqKZcaDHDBOKkXOsM5GfdlPLSD3tKyabAQdyHdwW
    Z72zP4b-0aY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ehtdeutddvjeeuuefggfeggfekfeehveekkefgfeelheekfeejffdvueeuieevfeenucff
    ohhmrghinhepuggvsghirghnrdhorhhgnecukfhppedutdeirdeiledrvdegtddrudeige
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghv
    vghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:AFtYX5KrUK5LIG4ZGFw5H4AMcWLujOqZXgL7NDoas56rpQ4SuFPROg>
    <xmx:AFtYX1Gl-b2TDzVpSWd62Rp7jwwUnKXVeJBl21gODKNbnKeiv3VugA>
    <xmx:AFtYX9XtwQ5wJIqBAvCECivJegU93paaSbn_XJAmrOBgAsn0UD6Dvw>
    <xmx:AFtYX8AuP4n-mScvlSnLOZusqYYOkjj45GmqTe1EeoyZ3rX7JuC1mg>
Received: from mickey.themaw.net (106-69-240-164.dyn.iinet.net.au [106.69.240.164])
        by mail.messagingengine.com (Postfix) with ESMTPA id A030F328005A;
        Wed,  9 Sep 2020 00:33:02 -0400 (EDT)
Message-ID: <cfbdddc03d840d55258bfa5c2d1ca174c208c233.camel@themaw.net>
Subject: Re: [PATCH] autofs: Fix crash in sun_mount()
From:   Ian Kent <raven@themaw.net>
To:     Paul Menzel <pmenzel@molgen.mpg.de>, Helge Deller <deller@gmx.de>
Cc:     autofs@vger.kernel.org
Date:   Wed, 09 Sep 2020 12:32:58 +0800
In-Reply-To: <a3fd2f9c-6371-5d6d-bbf7-ea5222344e98@molgen.mpg.de>
References: <20200908095402.GA25766@ls3530.fritz.box>
         <a3fd2f9c-6371-5d6d-bbf7-ea5222344e98@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2020-09-08 at 12:02 +0200, Paul Menzel wrote:
> Dear Helge,
> 
> 
> Thank you very much for your patch.
> 
> Am 08.09.20 um 11:54 schrieb Helge Deller:
> > In sun_mount() the the variable np gets initialized to an alloca()
> 
> s/the the/the/
> 
> > memory area:
> >    np = noptions = alloca();
> > Later on, at the end of a loop, it may get accessed like this:
> >    *(np - 1) = '\0';
> > 
> > If np hasn't been increased in between those lines, this access
> > triggers
> > an out-of-bounds access which overwrites stack area and on the
> > parisc
> > architecture segfaults the automount executable as desribed in the
> > Debian
> 
> described
> 
> > bugzilla #892953.
> 
> Debian just calls it Debian BTS.
> 
> > The patch below adds the necessary check and thus fixes the crash.
> > 
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=892953
> > 
> > diff -up ./modules/parse_sun.c.org ./modules/parse_sun.c
> > --- ./modules/parse_sun.c.org	2020-09-08 09:13:03.843105425
> > +0000
> > +++ ./modules/parse_sun.c	2020-09-08 09:16:49.321534049 +0000
> > @@ -575,8 +575,9 @@ static int sun_mount(struct autofs_point
> >   		if (np > noptions + len) {
> >   			warn(ap->logopt, MODPREFIX "options string
> > truncated");
> >   			np[len] = '\0';
> > -		} else
> > +		} else if (np > noptions) {
> >   			*(np - 1) = '\0';
> > +		}
> > 
> >   		options = noptions;
> >   	}
> 
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Thank you both for the patch and review.

I have added it to my patch queue and will commit and push it to
the repo. the next time I do a push.

Could be a little while before I do that though ...

Ian

