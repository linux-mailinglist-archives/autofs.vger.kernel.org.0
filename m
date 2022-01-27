Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A4E49D6F5
	for <lists+autofs@lfdr.de>; Thu, 27 Jan 2022 01:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiA0Ate (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Jan 2022 19:49:34 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34545 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbiA0Ate (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Jan 2022 19:49:34 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A25EA5C0190;
        Wed, 26 Jan 2022 19:49:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 26 Jan 2022 19:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=2oW9KpOLoSY2K9
        vRUbtK2E1T3E9aV/g8BuVczOGZRJE=; b=TLHZSlvneXBBUbfWmkSrQbCs98VpNU
        U/mBGtViqr2ii9u2z9aTkZ0jEUGCA2m6wqAkvXtz12yb1ElklOT9o5dpHy0/36fn
        5j8+OJLad1owgCJQFyOJNYoeJy3phoBJ2DbWzn0V+/1g6gqvJoRJPF1tpLGDMWj6
        m563VMZcZjzFHDK+9Q26GE/nKJbUTZMrXjoqGPaNwL3YBe9SNzZVNM3/XqLpg0V+
        sRoYKx3/WMFCVU1XvQHGSf3mq+EYdqhoBpx837ilUEemVJuVK5IMcFQT7cGdWKny
        C9s+lPZy2/sA3IQmqkKkoVK/ydYnvTBXJd32Jvox/tGvQ/A2qFEFqW9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=2oW9KpOLoSY2K9vRUbtK2E1T3E9aV/g8BuVczOGZR
        JE=; b=dawQGeM8F4LrEjfsMcBTnhFJP4l0SFNl9m1Is8x9zvpYF/NI8khg9ju+J
        bbF9em6wSJOolIP5Q/fSTgq0KEs/6qzkoJ66VEbLvt7g9juyqb1VSOrRrn4qhUcM
        8UbA52LiHv4YHrsFWvJko931VasqUUw4Zm3MkYpcUYViFE4Yz02ylIkh8ywz2hfE
        x1fcQkvo8k0TVtqjTfYIW5hyBFK2xUxg/YaIAq2g1WBSMRjLwjCvDmcO2bBB7atI
        Pesc+7NcQU0q5daOeEF5NyeDU4kuhzZbD6HhKCrwuKK7ZU9Rpw4hNKmblclYYva9
        kEWmtZMcIx7EdpcFCJEqb9zQA+2vw==
X-ME-Sender: <xms:HezxYRCf7JzIGcmKAEjlEXF0ycR7T2KVN9RxDXw5GoBMGJBQ5Ev29Q>
    <xme:HezxYfg1XjJRMbEEzdA1pNIGbrEIBQzx4ghpOti3tOduYRPvbdJiqZN1xrLou93Od
    H9SO2dStbQD>
X-ME-Received: <xmr:HezxYckimt6OOpyoDdnkV0FSGfeKtMvq53haPbiRhkqBCILi08IMBD1zhX1DARTsLaN0VX_H8TZMydCpw2CcVAUs6iA8oK1rEXnHwb4y7Dm_eZOp1Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedvgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
    dttderjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpeehjefhleejveduffehgfdvheeuudeugeeuvdetje
    ehueegfedvfedufffhfffgvdenucffohhmrghinheplhhoghdrihhtnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrg
    ifrdhnvght
X-ME-Proxy: <xmx:HezxYbzREOc--U6FsngymKfjfjyq_vxN7AFjIXqVSlshIBERPFXuIQ>
    <xmx:HezxYWT5KxyEpdrnsLaeJv6vtWNW-R10e0WMCs1dOYlid2anAuKeEw>
    <xmx:HezxYeaj36Ey2mSAiPUTG6OBjprwq7EGmpigQ5H2fuoR0cC6tl822w>
    <xmx:HezxYf5v03Osm3h9f9Az4_6ziskI-xDxinztubk8pbDSjJACKRZvEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jan 2022 19:49:31 -0500 (EST)
Message-ID: <5337db4f811041de0877da388d294fa11b5d71a4.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Fabian Groffen <grobian@gentoo.org>, Yixun Lan <dlan@gentoo.org>
Cc:     autofs@vger.kernel.org
Date:   Thu, 27 Jan 2022 08:49:28 +0800
In-Reply-To: <YfEg0Oqc4bEhgvj8@gentoo.org>
References: <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
         <YehQdqiLSz6LMPVi@gentoo.org>
         <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
         <YekOscjFLNMjggd7@gentoo.org>
         <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
         <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
         <YepbqFeUBns+KRbj@gentoo.org>
         <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
         <YfEV6b6ZGNJHavr2@gentoo.org> <YfEf8RoMPbjSylm8@ofant>
         <YfEg0Oqc4bEhgvj8@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2022-01-26 at 11:22 +0100, Fabian Groffen wrote:
> On 26-01-2022 18:18:25 +0800, Yixun Lan wrote:
> > HI Fabian:
> > 
> > On 10:35 Wed 26 Jan     , Fabian Groffen wrote:
> > > On 21-01-2022 20:24:14 +0800, Ian Kent wrote:
> > > > > (this is identical to the 5.1.6 output)
> > > > > 
> > > > > build-log attached
> > > > 
> > > > That all looks good, including the build log.
> > > > 
> > > > How about we try stopping the autofs service and run automount
> > > > manually and see what we get.
> > > > 
> > > > Stop the service then run "automount -fd | tee autofs.log".
> > > > 
> > > > It might be useful to add a stderr redirect too but I usually
> > > > don't need it, eg. "automount -fd 2>&1 | tee autofs.log".
> > > 
> > > Sorry for the delay.
> > > 
> > > What I see is a difference in the mount sequence.
> > > 
> > > 5.1.6:
> > > 
> > > attempting to mount entry /net/host/export/gentoo
> > > lookup_mount: lookup(program): /net/host/export/gentoo -> -
> > > fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> > > host:/export/gentoo
> > > parse_mount: parse(sun): expanded entry: -
> > > fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> > > host:/export/gentoo
> > > parse_mount: parse(sun): gathered options:
> > > fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> > > sun_mount: parse(sun): mounting root /net/host/export/gentoo,
> > > mountpoint /net/host/export/gentoo, what host:/export/gentoo,
> > > fstype nfs4, options
> > > hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> > > mount(nfs): root=/net/host/export/gentoo
> > > name=/net/host/export/gentoo what=host:/export/gentoo,
> > > fstype=nfs4,
> > > options=hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> > > mount(nfs): nfs
> > > options="hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768",
> > > nobind=0, nosymlink=0, ro=0
> > > get_nfs_info: called with host host(127.0.0.65) proto 6 version
> > > 0x40
> > > get_nfs_info: nfs v4 rpc ping time: 0.010256
> > > get_nfs_info: host host cost 10255 weight 0
> > > prune_host_list: selected subset of hosts that support NFS4 over
> > > TCP
> > > 
> > > while 5.1.8 does:
> > > 
> > > attempting to mount entry /net/host/export/gentoo
> > > lookup_mount: lookup(program): /net/host/export/gentoo -> -
> > > fstype=nfs,hard,nodev,nosuid host:/export/gentoo
> >                                                              
> > ~~~~~~~~~
> >                                         somehow, it pass the
> > "nfs(v3)" at begining?
> 
> yes, this is *identical* config, I just used a different binary.
> 
> If you look careful, you see that it also didn't take the rest of my
> options:
>   fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> 
> So, either I'm not specifying them in a way supported by 5.1.8, or it
> somehow doesn't process them and falls back to some defaults.
> 
> Fabian
> 
> > 
> > > parse_mount: parse(sun): expanded entry: -
> > > fstype=nfs,hard,nodev,nosuid host:/export/gentoo
> > 
> > > parse_mount: parse(sun): gathered options:
> > > fstype=nfs,hard,nodev,nosuid
> > > sun_mount: parse(sun): mounting root /net/host/export/gentoo,
> > > mountpoint /net/host/export/gentoo, what host:/export/gentoo,
> > > fstype nfs, options hard,nodev,nosuid
> > > mount(nfs): root=/net/host/export/gentoo
> > > name=/net/host/export/gentoo what=host:/export/gentoo,
> > > fstype=nfs, options=hard,nodev,nosuid
> > > mount(nfs): nfs options="hard,nodev,nosuid", nobind=0,
> > > nosymlink=0, ro=0
> > > get_nfs_info: called with host host(127.0.0.65) proto 6 version
> > > 0x20
> > > get_nfs_info: nfs v3 rpc ping time: 0.008827
> > > get_nfs_info: host host cost 8827 weight 0
> > > get_nfs_info: called with host host(127.0.0.65) proto 17 version
> > > 0x20
> > > prune_host_list: selected subset of hosts that support NFS3 over
> > > TCP
> > > 
> > > So it's not using NFSv4 here.
> > > 
> > > Is this enough of the logs?  Else I need to do some more
> > > redaction here.

Can you please use "automount -fd 2>&1 | tee autofs.log" from the
command line, after stopping the serice of course, to get a debug
log for me.

It may be that I've missed a mail that has 5.1.8 logs, there's so
much of it these days ... but I don't have debug logs from the start
of automount until after problems occur.

Ian
> > > 
> > > Fabian
> > > 
> > > -- 
> > > Fabian Groffen
> > > Gentoo on a different level
> > 
> > 
> > 
> > -- 
> > Yixun Lan (dlan)
> > Gentoo Linux Developer
> > GPG Key ID AABEFD55
> 

