Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AB1494D37
	for <lists+autofs@lfdr.de>; Thu, 20 Jan 2022 12:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiATLlT (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Jan 2022 06:41:19 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41261 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231836AbiATLlS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Jan 2022 06:41:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E75B35C009F;
        Thu, 20 Jan 2022 06:41:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 20 Jan 2022 06:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=sy14WbTRvNF/Qd
        +AiT6ROcy7gT4foEbd4nn0z7///kY=; b=DVfC2ogweFCc4zvKASOfhTNrEOzTtc
        scC6uMVer1vhKQ3lotmqMxskjSPILOuo/nh2xyWSt/lmQKsc94s/WYiAOK4GqhSc
        Jl+7KwWn09Wbw7lMKsUUmnrSLSoFpXYZ4M0IWFIo9z39CRiYvyncCcGiVLDWCoHJ
        Yw9k/lkmgzWMwjrPc7aZVdMG2J70g7JhSgDmHyAEvsF4DfxD554zRPIogqSoaiJN
        PqzQvxU5phizrwqeBmP64Lsl0FVcbHgfrBcdAuffjcIbRs1Iobw6tndyoT9KEqvM
        TUCYIVwQkIFjS6g8RzEY0lL/dystRVUO+actwaEK2ay1FjVC7fPRluVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=sy14WbTRvNF/Qd+AiT6ROcy7gT4foEbd4nn0z7///
        kY=; b=BYFrOW9/dE8xfqWJ/RjlNlA9gVKzbqwucRw/db6bbzuxF1eh+n3whSPmg
        XESytMjVT8uqElQQn2U9BFpv+jpkfag/c0JfKaHALZ58Ui76oXNgQIBg5wgOKKlO
        bhhrTOtW3y3kWkkX+gA/p8Znim0O8rb0iWQlzE2m2e8nPpgSS5fiKSs3u5jM7dMT
        t4ziWsLRmc2hNoM4j8TzKx2+AM/uUyZOMey1My2JPXLlYYHJ/IEzF5bl/+gJD01C
        5VKXdhNOv50q7kXwo7u6thVI2pTsGiA6lnCSTrzqx1tni9MvomCHN8MTUfiOf4VH
        aucXIPab+Sly1WaJAuSwJLtSo9q1w==
X-ME-Sender: <xms:XUrpYXJqB61BHsl4lZ8VGfdlGDYeuJHAooDh6lKAbjObi01PUk3IEg>
    <xme:XUrpYbLa2JquMch5_FetF0HOh-gY0Q2N8aCzuv-93_-oZq0ObSE95Mcssq6BVE96O
    2zHRuFTFAni>
X-ME-Received: <xmr:XUrpYfthSbKnvaXBiI5q1ERnqDYvBzOXZAXzl4d4jCN7eFJO2dIoDuU9Ez5FjZJlbrRGLsh-U-nZ2ikR8X4Xjt3_s5zansKJJEaUKXok5bfH-xOmyH4zSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
    dttderudenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpeffledvtdelheevudevhfekjeefvdekteffueejtd
    duveeftdevheeuveeihfelffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:XUrpYQamjRmkmv678Xk4GZCRgc57bdazRb0mLATZtc9ayXjH1f1Cfg>
    <xmx:XUrpYebYRKIpbWwygAfLxpS_7zoDlcbUBsz_iMyhsW-tilLX584-Xg>
    <xmx:XUrpYUCaHdvFBvJLkKGLvZa4A5N0stZULTrfBw-ZBRxnzJytY2YKEw>
    <xmx:XUrpYXCj5MU5m53QfZY9rcbwDkAXYYNtfWjzFeYSSKVJuefkc6EAhg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 06:41:15 -0500 (EST)
Message-ID: <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Fabian Groffen <grobian@gentoo.org>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Date:   Thu, 20 Jan 2022 19:41:11 +0800
In-Reply-To: <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
References: <YeZ51EWg85akR6Ig@ofant>
         <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
         <YeaBtjNlovM5gez4@ofant>
         <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
         <YeaWIKm/9szaWHIA@gentoo.org>
         <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
         <YehQdqiLSz6LMPVi@gentoo.org>
         <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
         <YekOscjFLNMjggd7@gentoo.org>
         <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2022-01-20 at 17:21 +0800, Ian Kent wrote:
> On Thu, 2022-01-20 at 08:26 +0100, Fabian Groffen wrote:
> > On 20-01-2022 10:37:20 +0800, Ian Kent wrote:
> > > On Wed, 2022-01-19 at 18:55 +0100, Fabian Groffen wrote:
> > > > I've applied all of the patches from your patchqueue, but I
> > > > don't
> > > > see
> > > > much change.  Startup only shows:
> > > > 
> > > > Jan 19 18:53:20 hera automount[21763]: Starting automounter
> > > > version
> > > > 5.1.8, master map auto.master
> > > > Jan 19 18:53:20 hera automount[21763]: using kernel protocol
> > > > version
> > > > 5.05
> > > > Jan 19 18:53:20 hera automount[21763]: lookup_nss_read_master:
> > > > reading master files auto.master
> > > > Jan 19 18:53:20 hera automount[21763]: do_init: parse(sun):
> > > > init
> > > > gathered global options: (null)
> > > > Jan 19 18:53:20 hera automount[21763]: spawn_mount: mtab link
> > > > detected, passing -n to mount
> > > > Jan 19 18:53:20 hera automount[21763]: spawn_umount: mtab link
> > > > detected, passing -n to mount
> > > > Jan 19 18:53:20 hera automount[21763]: no mounts in table
> > > 
> > > 
> > > This looks like output you would get if debug logging isn't
> > > enabled.
> > > 
> > > Are you using systemd or a sysV init system?
> > 
> > sysv/openrc
> > 
> > > Has the build log of autofs been checked for problems?
> > 
> > yes, none present
> > 
> > > Has the earlier version of autofs that you see working been built
> > > against the same system?
> > 
> > yes
> > 
> > > We really need to get a debug log for this, can't really make
> > > progress
> > > otherwise.
> > 
> > I enabled logging=debug (I use the same config) and 5.1.6 spews out
> > a
> > lot of messages that it normally does not, so I'm assuming that's
> > what
> > logging=debug does.  The problem appears to be to me that 5.1.8
> > doesn't
> > do this, so it seems to either not read /etc/autofs/autofs.conf,
> > or auto.master/auto.net from the same directory?
> 
> If it's not using the expected location for autofs.conf that's a
> build
> problem.
> 
> Can you get me a build log.

And what does "automount -V" say?

Ian
> 
> Ian
> > 
> > Thanks,
> > Fabian
> > > 
> > > Ian
> > > > 
> > > > Thanks,
> > > > Fabian
> > > > 
> > > > On 19-01-2022 09:27:26 +0800, Ian Kent wrote:
> > > > > On Tue, 2022-01-18 at 11:27 +0100, Fabian Groffen wrote:
> > > > > > On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> > > > > > > A debug log is almost always what I ask for.
> > > > > > > 
> > > > > > > Setting "logging = debug" in /etc/autofs.conf will do it.
> > > > > > > You need to get a log from start of automount to after
> > > > > > > the
> > > > > > > problem
> > > > > > > occurs.
> > > > > > 
> > > > > > Let me try this and come back to you.
> > > > > 
> > > > > You might need to take some care doing this.
> > > > > 
> > > > > If your using systemd then a simple "journalctl | grep
> > > > > automount"
> > > > > usually gets what we need.
> > > > > 
> > > > > But if your relying on syslog often the log level setting
> > > > > won't
> > > > > record debug logging so it needs to be changed. Otherwise we
> > > > > don't
> > > > > get a full log.
> > > > > 
> > > > > Ian
> > > > > 
> > > > 
> > > 
> > > 
> > 
> 


