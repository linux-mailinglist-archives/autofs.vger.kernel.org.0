Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FA435D68F
	for <lists+autofs@lfdr.de>; Tue, 13 Apr 2021 06:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhDMEl7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 13 Apr 2021 00:41:59 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57653 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229695AbhDMEl6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 13 Apr 2021 00:41:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id A5C7E5C019E;
        Tue, 13 Apr 2021 00:41:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 13 Apr 2021 00:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        mLdhMhbeJaZyb/2EVmp4rueEnCMKTL/i8OK9LxkAAB4=; b=lCFBHVTveHfMx4qo
        w86xWD1gtzA2N6Cqs08bc2hgVGbXB2lbwbr/fcRnpJdbRpMckBwd3OgxnFVwTPje
        RpasDQ1foTP4uDx+RozH82vqvI/LfP7B2hyM8wQuc3DxDJYvjKc3m2CREXv2wIHM
        bbF8fBDs2C86XNlzEFWs1R3nOMcA+92HcppwMW6+aKFBDhFQvHOi7NBvgGX0IsKV
        GPolA2WqC28y9+8xwiTcYt9CCW3MPmDeKHngvjVgtfI69XIzb4TEhgeYI+G/Ozkg
        xYJEzhH2Girh8QQurHHKb877VqDnUg7Fy09O3CsI42W4fsA93MCPdpfpcPgZ68Yt
        ZoRVCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=mLdhMhbeJaZyb/2EVmp4rueEnCMKTL/i8OK9LxkAA
        B4=; b=vG7LLOcMZCxgVRuqYtDeEkRtPuH8xp0NCV3hetp5X/HDPCFufyQdlpEB5
        c8d/wRYFnpJdtMDtTstv5JTD6LNCjAwlUCp2Xgo01GTEJMPmr1eAaP5ajmw25dFL
        hpxIsAQX1uNVHOYIFa1TJNei1CU7vuvfr4+MNW3LcnNrWwL8l40aMlCCrPMr6Ssy
        oA8HjIFIT4HjemAUKxsk/nCNowi1BfSPFkPfty/fyK8S4t5xdGDe5oREZj3JmFTk
        qDQ+I+FX2PXkQB5f6ByUxjjn8yy/eTsoliFgnuy/ddkFt6eOZmdKpbN/i5lgrLZI
        pTuAEdsh+2TCn2dEmWsNEhfpDunAg==
X-ME-Sender: <xms:AyF1YNxn7dctdBXG_9PtPWz74TzDwtenLWMR-Wp7fXsyYGtnWqC_7A>
    <xme:AyF1YNT8Kgq7Xg8V3lAkrNH4efSrd-Zhg7nt7rcL5h3bnqnE68Pxko7TKW-1ObQnX
    RroaJKpGFgq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucfk
    phepuddtiedrieelrddvheefrddvfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:AyF1YHV2RNZOq8Yoi5w-YB-gC78dm-I9rAQP8Ms4sVSOelvRitcO6g>
    <xmx:AyF1YPj5Uqxm5vISpkhtOKtBsSsQO5f43nvEzA_g3PClIc_I24Tntg>
    <xmx:AyF1YPACzai8mJkOMCzQkxy-VzZK-XJcfVASBCIlkgKoXUwPeUyRNQ>
    <xmx:AyF1YC92-qgQjU8b8R0HPV08kxtjTng0KT0EiDVgKRKT1SWuVsyFFQ>
Received: from mickey.themaw.net (106-69-253-239.dyn.iinet.net.au [106.69.253.239])
        by mail.messagingengine.com (Postfix) with ESMTPA id ADA2224005A;
        Tue, 13 Apr 2021 00:41:37 -0400 (EDT)
Message-ID: <30b967173a277c61dfa9087c036fb615424d75f0.camel@themaw.net>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
From:   Ian Kent <raven@themaw.net>
To:     Mike Marion <mmarion@qualcomm.com>
Cc:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Date:   Tue, 13 Apr 2021 12:41:33 +0800
In-Reply-To: <20210412195345.GE10235@qualcomm.com>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
         <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
         <20210409234211.GB9279@qualcomm.com>
         <0602c18ab85c99a98fe6c4f5e189f2f1c06508d0.camel@themaw.net>
         <20210412195345.GE10235@qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2021-04-12 at 12:53 -0700, Mike Marion wrote:
> On Sat, Apr 10, 2021 at 09:46:47AM +0800, Ian Kent wrote:
> 
> > > I'd love to see re-reads parse the map, save the new paths, parse
> > > the
> > > removals, then add the new paths after removing/umounting removed
> > > paths.
> > 
> > It sounds simple to do but I think you would be surprised with the
> > sort of difficulties I would encounter.
> 
> Yeah, that's pretty much why I never sent the email I wrote up
> before, I
> started to realize it was far more complicated as you say.
> 
> > But, if that was done, what would be the policy if /prj/foo was in
> > use, lazy umount /prj/foo mounts, ignore all changes at or below
> > /prj/foo until it's no longer in use, or something else?
> 
> Yep, that's one of the issues I thought of too.  It's already an
> issue
> we have with the current logic as well.  Usually we end up just
> tagging
> the hosts for a reboot once any compute jobs on them are done, it's
> just
> easier than fixing them by hand.
> 
> > I would be tempted to lazy umount things at or below /prj/foo,
> > after
> > all they would be using stale paths and will eventually end up in
> > tears anyway, particularly if processes have open file handles on
> > paths within the mount.
> > 
> > Don't get me wrong, this does sound sensible and is something that
> > needs to be fixed, there's just those cases that cause me pain time
> > and time again that get in the road.
> > 
> > The other problem is I might use features that are as yet
> > unreleased
> > (but in the current source tree) so that would complicate matters,
> > OTOH I might not need the new features and, other than the in use
> > policy, it might straight froward ...
> 
> It'd be great if it could be implemented at some point.

The lazy umount approach is a bit of a trap because in trivial cases
like testing it appears to work much better than you would expect.

What worries me is that you could have a process with open files (or
a process working directory) on the mount that's gone away, the mount
then gets lazy umounted, the file handles remain but all new accesses
got to different file systems that (probably) contain different data.
So the process could be processing inconsistent data coming from
different mounts it thinks are the same.

Once any references have been released the mount will then go away
naturally.

I don't know if the NFS server will return an error to those existing
file handle accesses once the export is removed ... I suspect not ...

Ian


