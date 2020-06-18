Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FB21FDFEC
	for <lists+autofs@lfdr.de>; Thu, 18 Jun 2020 03:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732179AbgFRB2w (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 17 Jun 2020 21:28:52 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49069 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731132AbgFRB2w (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 17 Jun 2020 21:28:52 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 6BF225C018B;
        Wed, 17 Jun 2020 21:28:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 17 Jun 2020 21:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        T6lHd7oFZyrW1CfIadIU4mxheIH1DVdSKjfr6qJR6Ec=; b=siWIld69dDLZh8Dd
        0HoAJXtYuMALe7OGIAF7UHWyfw2CqXLRhmqGmnA04Il4EJb6v3xGvz8Yzel5O1se
        Fmuoc/O2lfIs/aNRYz0+aAZqN4uLPS0c9XH3fFBuflrSACvTEO3QykdAY1hNl2bm
        krRpD9wl2BMmylOTgnCfESCmTA+8UpOgZ3rkqxACYxA4SCTYkjm0/DbGiPg0Mfeo
        s99BA5gbV/MaFhPQrautmAam2c6ZFxRtLSkpSqOL4hO42WsRLLayVXsnTNq9XfjO
        egoSa0+kITAoOsyCPynHGKtd7pxgIevWNb3Ip76SYSmT2FH11E1kZ798WNeSYil6
        lij45w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=T6lHd7oFZyrW1CfIadIU4mxheIH1DVdSKjfr6qJR6
        Ec=; b=CiRwp+6vne9nLF7b+GyCjPfAmj/+dUBZSxBmyQbLBw1PGH6KzQml6IP1K
        3znxVJuAabRzUX3QIWTqcP6KBrlbY2DAFjNj3Wh9ZXL4t2zJyaHcZnQkClltLB/o
        wSSILH6oqjU9axwS4nzQCOQXmYSlcAFZGn/O03j9OJnefzwNJM/wnuWdJES9yjp5
        4XZVTZvmprqLLJRVrBqTavZIWkPsIWFA1sSmFOMeHffKCcDLN2hs+VZjtJFMhMHz
        WrWf1kHibLB73ndItLGbej3QoG7x/ZKifcjfd+NCt+nSQ/Fmze8/8WdPyPLDTlIn
        LSzq48g/YgVjvMIqhJG/ucdB3/XhA==
X-ME-Sender: <xms:UsPqXp9sBtv89qHZFspVjPV8z49UWadC36X5pg2MI6e8MrPWxkrp4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejfedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    dviefgieeivddtteekvddvleekvedukeevtdekgfdvheegjeevueejhedvudehtdenucff
    ohhmrghinhepuhhtvgigrghsrdgvughunecukfhppeehkedrjedrudelgedrkeejnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhes
    thhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:UsPqXts13VMdUnFllA3YRdujsHlppanEnDBVEppRhps2cM-N5Z1Xog>
    <xmx:UsPqXnAI1_pRHdXl0jswcBrc-L-6hSXnYcpbIpQ5I2DoJIyuCYAEhQ>
    <xmx:UsPqXtejRiuxGPfB2kE9j8DvB18-8jW3Z8QdpnpTl3woRhtUUVtVng>
    <xmx:UsPqXgtVnjsTkMZXj9pSFk1lrTcCgDLwWO6Hv0qo8x7so4J5Gu6kmw>
Received: from mickey.themaw.net (58-7-194-87.dyn.iinet.net.au [58.7.194.87])
        by mail.messagingengine.com (Postfix) with ESMTPA id E6CAE30618BF;
        Wed, 17 Jun 2020 21:28:48 -0400 (EDT)
Message-ID: <7f144a0767309316dd4662bb5c2fe1472befa724.camel@themaw.net>
Subject: Re: The automounter hangs on attempts to mount non-existent
 directories unless the option vers=4.2 is specified?
From:   Ian Kent <raven@themaw.net>
To:     Patrick Goetz <pgoetz@math.utexas.edu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Thu, 18 Jun 2020 09:28:45 +0800
In-Reply-To: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
References: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2020-06-17 at 08:34 -0500, Patrick Goetz wrote:
> Hi -
> 
> We've been having strange performance problems for over a year on
> high 
> powered workstations with fast (10Gb) networking.  Programs that run 
> instantly on user's laptops would take 5-10 minutes to even launch
> on 
> these dual Xeon workstations with 128GB of RAM. The OS is Ubuntu
> 18.04
> 
> Last week I finally tracked this down to a comedy of errors, the
> first 
> involving autofs.  We only use NFS v.4.x, and thanks to a tip from
> Ian 
> Kent, I had added:
> 
>    mount_nfs_default_protocol = 4
> 
> to /etc/autofs.conf.  However, using this setting in /etc/auto.home:
> 
>    * octopus.biosci.utexas.edu:/home/&
> 
> any attempt to access a non-existent directory in /home (e.g. 
> /home/syslog) would result in the automounter hanging while various 
> attempts to mount were executed.  Changing the auto.home line to
> 
>    * -tcp,vers=4.2 octopus.biosci.utexas.edu:/home/&
> 
> resolved this issue.  I can understand the tcp option, but what
> doesn't 
> make sense to me is the necessity to also specify vers=4.2
> If I remove vers=4.2 from the options list, the automounter starts 
> hanging again when asked to mount a non-existent directory.
> 
> Maybe this is just an issue with mount.nfs?

It's hard to say, possibly, that would need a debug log to check it
out.

> 
> This isn't relevant to autofs, but to satisfy the curious, the next 
> obvious question is why on earth were people attempting to mount 
> non-existent directories in /home, and the answer is (in part) some 
> negligent Debian package management.  After sifting through strace 
> output I noticed entries like this in /etc/passwd:
> 
>    syslog:x:102:106::/home/syslog:/usr/sbin/nologin
> 
> I guess they were thinking that since no one can log in as syslog,
> it 
> doesn't matter what the home directory is set to; likely someone who 
> doesn't use or perhaps even know about autofs.  On my Arch systems
> these 
> entries would look like this:
> 
>    syslog:x:102:106::/:/usr/sbin/nologin

Could be something to do with:

# mount_wait - time to wait for a response from mount(8).
#              Setting this timeout can cause problems when
#              mount would otherwise wait for a server that
#              is temporarily unavailable, such as when it's
#              restarting. The default setting (-1) of waiting
#              for mount(8) usually results in a wait of around
#              3 minutes.
#
#mount_wait = -1

But if this is set to some appropriate value it might introduce
other problems because it's hard to track down those waiting
sub-processes and kill them so they get left to die when they
timeout.

There are issues with the kernel RPC (since the kernel mostly
handles the mount these days) stubbornly not returning failures
quickly which has to be done to mitigate potential data corruption
of remote file systems that also affect things like mounting.

> 
> The final piece of the puzzle is why on earth do misconfigured
> entries 
> in /etc/passwd come in to play, and the answer is
> anaconda/miniconda.  A 
> lot of computational biology tools are embedded in conda
> environments, 
> and for some frankly inexplicable reason conda likes to troll
> through 
> /etc/passwd searching for environments. This seems like an
> anachronism 
> from the days when all real users were documented in /etc/passwd
> rather 
> than via some LDAP, AD, NIS, or Kerberos directory server.
> 

But if you use the wildcard map entry there's no way to know the
entry being looked up doesn't exist so autofs is duty bound to
try and mount the thing.

If the problem is bad enough it might be worth adding some entries
above the wildcard entry that bind mount to one or more directories
to keep those applications happy.

Ian

