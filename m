Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CE14945D7
	for <lists+autofs@lfdr.de>; Thu, 20 Jan 2022 03:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbiATCh1 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 Jan 2022 21:37:27 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55573 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230154AbiATCh1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 19 Jan 2022 21:37:27 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6474A3200A5F;
        Wed, 19 Jan 2022 21:37:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 19 Jan 2022 21:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=jbzSc08ZxyTFcy
        YbfqXWhipubbfEJ7hQ1uSpUlJ2YtE=; b=Qm5T9/nXZdsXkfT6J7tr2qef5LwoIM
        GgRihIKF6sCPhEJrFAu4BtzZCRf5pSanQ9El80BLw0DmqeXf2WeT8HcogQvUN08E
        h9zvmy8eqFBLvaAdvObbjA3Ir1Wzu3MbIARKMLEl52Cn9JyzWiGCPVWuYJOPjF+i
        x2/m1IVdSze7VPjYJXIG6ROh+v1J2kCwjY9YD+7jop3XNOYTSKtUKvKSL23qC/DR
        chDHss9o8vwbJ+kQjfTgt/Igxdl9DM4Jpct2E6jZdaJJQ4wwQWvwgZYLhHmNf3kv
        jq8o9t4vS2tXsfQ4s5R0tdLaSx55qE2Fg5yHI3r97JmntKXWAkbDPjDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=jbzSc08ZxyTFcyYbfqXWhipubbfEJ7hQ1uSpUlJ2Y
        tE=; b=Gl5a7VLg1tyO8LBpSNVRd+e4RiWyGAAMy9tHvEeAXu5QZsmF4HrsQqqYZ
        IuS4daVL/lG/sd/XB0dp2M//wT2y5rZWAZUMvahb7+HYIS1wA4XKukmszqRZ09Il
        e7x5FP4zp/BUlPdBvHx4e2YaHN9S3TnrVMmwmF4JCNA0D6xZwzG1xbbTbEDfSbLl
        C0G7LLp6z1iuTe+tT7B1uM00w/QqRh5lAkxM9TOaGWBgHMWWhWSfEEK5W8v/jqB1
        r8O9CMSbwA+4LHYi4ukH0GgJGgsdvtDlq4AL7FVM8kYt31JwxiYo57xDsMbYkHDK
        aQY0K6BOmd+2zErISARZYKpR3k8Qw==
X-ME-Sender: <xms:5croYby3_9ApVlJvMZ2n3NNrRy0u2vl9y-0KxuPn4SrypUC-kV--cA>
    <xme:5croYTQ_Om0uOtx1bSINTgErG1yHX00-nYCfIyo_dxEYrmKAq8Sba4RY2Wi6_d8Pt
    wduxLV7ttHB>
X-ME-Received: <xmr:5croYVX55SnHi5seijrDuISYvRTuXLfaIFqxSwczGlwPj_AbNxY9KTNzObs-xO63S7zFyoyporkccJgvyL0GfJAsVb7yfMsQTtVIUHqet3jdR2muJro3LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
    dttderudenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpeffledvtdelheevudevhfekjeefvdekteffueejtd
    duveeftdevheeuveeihfelffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:5croYVjzLEptjAwghL0yykjy7fvSyPwG9vKmCYD02G5_50yHKYT_Iw>
    <xmx:5croYdBwKNkCWkh1XxrBKQwrS1INzfVGgQjq81MFf_QvPDq0F6eRvg>
    <xmx:5croYeKEOay1oUkpmAhxfV3GJu31IHtQxsAXhs738LgPoke58jnpKw>
    <xmx:5croYQoMFzkGt5BQ0bcmI4nmyYCFwieKudR9vDY0ugv2DUVnmxKWAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jan 2022 21:37:24 -0500 (EST)
Message-ID: <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Fabian Groffen <grobian@gentoo.org>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Date:   Thu, 20 Jan 2022 10:37:20 +0800
In-Reply-To: <YehQdqiLSz6LMPVi@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
         <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
         <YeaBtjNlovM5gez4@ofant>
         <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
         <YeaWIKm/9szaWHIA@gentoo.org>
         <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
         <YehQdqiLSz6LMPVi@gentoo.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2022-01-19 at 18:55 +0100, Fabian Groffen wrote:
> I've applied all of the patches from your patchqueue, but I don't see
> much change.  Startup only shows:
> 
> Jan 19 18:53:20 hera automount[21763]: Starting automounter version
> 5.1.8, master map auto.master
> Jan 19 18:53:20 hera automount[21763]: using kernel protocol version
> 5.05
> Jan 19 18:53:20 hera automount[21763]: lookup_nss_read_master:
> reading master files auto.master
> Jan 19 18:53:20 hera automount[21763]: do_init: parse(sun): init
> gathered global options: (null)
> Jan 19 18:53:20 hera automount[21763]: spawn_mount: mtab link
> detected, passing -n to mount
> Jan 19 18:53:20 hera automount[21763]: spawn_umount: mtab link
> detected, passing -n to mount
> Jan 19 18:53:20 hera automount[21763]: no mounts in table


This looks like output you would get if debug logging isn't enabled.

Are you using systemd or a sysV init system?
Has the build log of autofs been checked for problems?

Has the earlier version of autofs that you see working been built
against the same system?

We really need to get a debug log for this, can't really make progress
otherwise.

Ian
> 
> Thanks,
> Fabian
> 
> On 19-01-2022 09:27:26 +0800, Ian Kent wrote:
> > On Tue, 2022-01-18 at 11:27 +0100, Fabian Groffen wrote:
> > > On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> > > > A debug log is almost always what I ask for.
> > > > 
> > > > Setting "logging = debug" in /etc/autofs.conf will do it.
> > > > You need to get a log from start of automount to after the
> > > > problem
> > > > occurs.
> > > 
> > > Let me try this and come back to you.
> > 
> > You might need to take some care doing this.
> > 
> > If your using systemd then a simple "journalctl | grep automount"
> > usually gets what we need.
> > 
> > But if your relying on syslog often the log level setting won't
> > record debug logging so it needs to be changed. Otherwise we don't
> > get a full log.
> > 
> > Ian
> > 
> 


