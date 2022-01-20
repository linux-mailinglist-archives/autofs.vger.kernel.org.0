Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B868D494A90
	for <lists+autofs@lfdr.de>; Thu, 20 Jan 2022 10:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239283AbiATJVl (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Jan 2022 04:21:41 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36993 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235634AbiATJVk (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Jan 2022 04:21:40 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 101BC5C00AF;
        Thu, 20 Jan 2022 04:21:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Jan 2022 04:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=bJRFHYH+eR5uGy
        hWb8x+rtgx0bpTXJ8LAcRFgZpIZO8=; b=Tha74EuvQ1izUX6PhI0gr1Y68hAF0t
        pSctSJMNJh+3P3dZFKApkMccmFC0bAadqNiYeDBxMqz4jFT85QOyLaQfBprmvsc9
        ReEIDqtFh/GlkobIodw8ULeUs2sNZi5pTqo5GGBEnGy+SmaXU3Qz9irPEA3+KFXG
        JDX9RnIxwvbzC+CPWroZJ15+r39cVL9wv1NpYiPxbByBV4UrmXvYgsIIuoAHE7bq
        BGCQd3l5fzyosiMIQijpcjrkqSWoapeeDX6Gpu6U/WwzBYR8QJl/JW4kjwx7t0kM
        TG4q4NatU/5HrXdlkqyEZ28NzsJthl9jNDah61gf6xDM3DonInQDb7xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=bJRFHYH+eR5uGyhWb8x+rtgx0bpTXJ8LAcRFgZpIZ
        O8=; b=Niv3Bb2qd/62pyH5ED7JFp+0mQKVOaMAQREbVr6z8/ndpJRIv2wYP+jDZ
        sHnUIwSVQ5xRl3/vJKa4x9+/WqWP4Tb++Yr00xof1V+B7GUYOQRJYqc4r43mNV2K
        lU1CZTTknTg5kgQV9ZgA3oRu576mZckPsrLUW9510OjqOOlISKdelT3CEAcZatip
        uMaS6SCzKp0GOywWExxPCg0xJXCKdx9Snr45hxwGk66T2mf2kFV4MPCC8qg1Tqvq
        PoZZEoz3cUWeJH34QUrK+cK13Y4pPBJOPvWDvqAjaJ8kpLpFZOn21Cwbemx63gTp
        q8AdQzecwUgWusa4GQeQQADTFLtaQ==
X-ME-Sender: <xms:oynpYcAcBW_-YyJnWucRnuVWGU-imGtEyojssU1W8ikTS4qa_fD9DQ>
    <xme:oynpYejZ9yU6Xebrx2Q5sayzj9uiY-UShyQSmFH9ORC8x4EX6u0XWsUQ3GJV6cC7w
    FzPoeaPIR4a>
X-ME-Received: <xmr:oynpYfmPjuE7tHaXDAJSlcOQdqZ7A9ccSwSrtcJPRjTrUQneOHfBoYthxi8wRE_yi4pTiUkFLSvpVa7o9g7-uog3MkcK3h2ZviJ2vlliAOsLrKZK5XWQlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtkeertddtre
    dunecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheq
    necuggftrfgrthhtvghrnhepffelvddtleehveduvefhkeejfedvkeetffeujedtudevfe
    dtveehueeviefhleffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:oynpYSxvfAsOLrLuFFzMvq5VpOagBF9tlVXoak6zEoZiDUqQ5jVkYQ>
    <xmx:oynpYRSisJAFk838v3yJh6t1l3gzzBIlNdorNolfGgcgPv0HAHD58A>
    <xmx:oynpYdaWKZBm7j6PJcQdjYYdSDnfDlR31EVCvWB8pxHzkiK2PAUqNw>
    <xmx:pCnpYS5TFj25RReqxF2VLtN5p3dB4IrlLG00bSDQd5Nr7YWCxG6UTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 04:21:37 -0500 (EST)
Message-ID: <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Fabian Groffen <grobian@gentoo.org>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Date:   Thu, 20 Jan 2022 17:21:33 +0800
In-Reply-To: <YekOscjFLNMjggd7@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
         <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
         <YeaBtjNlovM5gez4@ofant>
         <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
         <YeaWIKm/9szaWHIA@gentoo.org>
         <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
         <YehQdqiLSz6LMPVi@gentoo.org>
         <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
         <YekOscjFLNMjggd7@gentoo.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2022-01-20 at 08:26 +0100, Fabian Groffen wrote:
> On 20-01-2022 10:37:20 +0800, Ian Kent wrote:
> > On Wed, 2022-01-19 at 18:55 +0100, Fabian Groffen wrote:
> > > I've applied all of the patches from your patchqueue, but I don't
> > > see
> > > much change.  Startup only shows:
> > > 
> > > Jan 19 18:53:20 hera automount[21763]: Starting automounter
> > > version
> > > 5.1.8, master map auto.master
> > > Jan 19 18:53:20 hera automount[21763]: using kernel protocol
> > > version
> > > 5.05
> > > Jan 19 18:53:20 hera automount[21763]: lookup_nss_read_master:
> > > reading master files auto.master
> > > Jan 19 18:53:20 hera automount[21763]: do_init: parse(sun): init
> > > gathered global options: (null)
> > > Jan 19 18:53:20 hera automount[21763]: spawn_mount: mtab link
> > > detected, passing -n to mount
> > > Jan 19 18:53:20 hera automount[21763]: spawn_umount: mtab link
> > > detected, passing -n to mount
> > > Jan 19 18:53:20 hera automount[21763]: no mounts in table
> > 
> > 
> > This looks like output you would get if debug logging isn't
> > enabled.
> > 
> > Are you using systemd or a sysV init system?
> 
> sysv/openrc
> 
> > Has the build log of autofs been checked for problems?
> 
> yes, none present
> 
> > Has the earlier version of autofs that you see working been built
> > against the same system?
> 
> yes
> 
> > We really need to get a debug log for this, can't really make
> > progress
> > otherwise.
> 
> I enabled logging=debug (I use the same config) and 5.1.6 spews out a
> lot of messages that it normally does not, so I'm assuming that's
> what
> logging=debug does.  The problem appears to be to me that 5.1.8
> doesn't
> do this, so it seems to either not read /etc/autofs/autofs.conf,
> or auto.master/auto.net from the same directory?

If it's not using the expected location for autofs.conf that's a build
problem.

Can you get me a build log.

Ian
> 
> Thanks,
> Fabian
> > 
> > Ian
> > > 
> > > Thanks,
> > > Fabian
> > > 
> > > On 19-01-2022 09:27:26 +0800, Ian Kent wrote:
> > > > On Tue, 2022-01-18 at 11:27 +0100, Fabian Groffen wrote:
> > > > > On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> > > > > > A debug log is almost always what I ask for.
> > > > > > 
> > > > > > Setting "logging = debug" in /etc/autofs.conf will do it.
> > > > > > You need to get a log from start of automount to after the
> > > > > > problem
> > > > > > occurs.
> > > > > 
> > > > > Let me try this and come back to you.
> > > > 
> > > > You might need to take some care doing this.
> > > > 
> > > > If your using systemd then a simple "journalctl | grep
> > > > automount"
> > > > usually gets what we need.
> > > > 
> > > > But if your relying on syslog often the log level setting won't
> > > > record debug logging so it needs to be changed. Otherwise we
> > > > don't
> > > > get a full log.
> > > > 
> > > > Ian
> > > > 
> > > 
> > 
> > 
> 


