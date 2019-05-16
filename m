Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC431FD48
	for <lists+autofs@lfdr.de>; Thu, 16 May 2019 03:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfEPBqd (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 15 May 2019 21:46:33 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48515 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726503AbfEPAbL (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 15 May 2019 20:31:11 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 7E4FD25AAE;
        Wed, 15 May 2019 20:31:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 15 May 2019 20:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        hYJM309ARCXnqxqbq9SW+M4XjRsfd7k15Zk7MeUN6WQ=; b=gYGBSrlpZiOGdyk8
        HsRIZsRjOYGqoSVuc/+uNQWoyt5DByIoFhsrJoOiC6GjPzH6TirThMFOClyxEKrR
        T376CCiF5lyEGugaz/baGSBkl+YtMejo6/VdHw8IqbelcuxVTEVTsPmE4i4TCY97
        thlmvl3A6eQp7ipUR6P33z+PSbxq4fFgSxlGqPOZRmexKXBfSF5PNxfDfjbvKqgj
        fo6C6tgPNpA1A8T8Wf1fZjy/jv21g7+WjwHt61ayLs4E18xJF4O9gxCKbk/CR1Xs
        dGaKuLhQPJBelCDQ2E8OYX8zkGIlKzhVnK+iiJyQMyfbldc6B2QIUWTwZ3oY/zSX
        YannnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=hYJM309ARCXnqxqbq9SW+M4XjRsfd7k15Zk7MeUN6
        WQ=; b=yAFQvXYj7uDzfACXCIj0+4drMlU3KSPTNU3PaxyY1lBU2Rs5GilHEhKpP
        QkbgyqzmJauH+CnvHHe3OE6PjuQrEIJ/RM3juJHwqOg++1lMVRYuv3+z4wsTi5Iu
        h933xiEffytZ1EcbyMnpwPH2GsiQLq0RhwLp4bGOoWj6qArzFQAyW+YALrjLsc98
        zJFp0PGF/kh+CFI8rlAeVtvr0rSAZM7FwCDMwsEJro2FCwUoNAR3AkRzleuLx98m
        X+2A7zd/Ux7bJbQzLrapUJ/T4X87xiWynziXZiJkak9+siD3UvMDSa03cLs47mTc
        Fnse52SNIt/M7iOBZyoSzdVja6zew==
X-ME-Sender: <xms:Ta_cXKouKlqg7Nd-nUwmvey9JrPqWRxurKxeVj6Q91K3ToaSYbnggA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleelgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtofgggfesthejre
    dtredtjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucfkphepuddukedrvddtkedrheeirdduuddvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Ta_cXOx9JbivA5yDOIuoWJ3e38VjItVuwdw_SY3gpyVG27wLk2jICg>
    <xmx:Ta_cXFtX2p4tVpuADAFE9lGIyX0hfkTftQ1WR3j6TUh6k3nMx_Zg2w>
    <xmx:Ta_cXD6J7w-n437JxWEm_xma68ufP6MzNOxTgoALC_KebhijazYa-Q>
    <xmx:Tq_cXNNLmNz3sbPyqi5xIfZhcPp-gJ0QQQya8m8eryAqzDU2plnwDQ>
Received: from pluto.themaw.net (unknown [118.208.56.112])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6DA4710378;
        Wed, 15 May 2019 20:31:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id 2DBFE1C012F;
        Thu, 16 May 2019 08:31:06 +0800 (AWST)
Message-ID: <a10a4b0d4e81d378ad1ee351e1b3d37a8bd42024.camel@themaw.net>
Subject: Re: Issue with automounter file breaks cluster
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <list.autofs@drosera.ch>, autofs@vger.kernel.org
Date:   Thu, 16 May 2019 08:31:06 +0800
In-Reply-To: <9763d2f1-e460-50de-ad17-e20b345303f7@drosera.ch>
References: <06d4b596-8149-9ff8-f8e6-8215d7ccbbfc@drosera.ch>
         <3032c9b19f4f606e0704ab57d2919fcfa8043bed.camel@themaw.net>
         <9763d2f1-e460-50de-ad17-e20b345303f7@drosera.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2019-05-15 at 17:01 +0200, Frank Thommen wrote:
> Hi Ian, list,
> 
> On 2/2/19 2:16 AM, Ian Kent wrote:
> > On Thu, 2019-01-31 at 22:26 +0100, Frank Thommen wrote:
> > > 
> > > We are running autofs 5.0.7, release 70.el7_4.1 on CentOS 7.4.1708.
> > > Updating the CentOS release ist not possible due to hardware and
> > > software constraints.
> > > 
> > 
> > Before I go burning lots of time on trying to reproduce this
> > you should check if this happens with the latest CentOS autofs
> > package, revision 90 (the CentOS repo doesn't look like it
> > retains older revisions).
> > 
> > There were a couple of regressions fixed in 7.5 amount other
> > things.
> > 
> > I don't think there were updates to dependent packages that
> > would cause problems in the subsequent RHEL releases (in fact
> > there shouldn't be).
> > 
> > Another question.
> > 
> > When you see the problem has occurred did you check that
> > automount is actually still running (IOW, did you check if
> > it had crashed).
> > 
> > Ian
> > 
> 
> Oops, already > three months and I haven't replied yet.  I'm very sorry 
> for that, because I really appreciate your reactiveness and helpfulness. 
>   Unfortunately other IT problems have outpaced this one.

Understood.

The difficulty here is that this sort of problem pops up occasionally
in (possibly) slightly different scenarios and usually defies debug
efforts.

I try as best I can and from time to time some unrelated bug gets
resolved and it occurs to me that it might have been something that
contributed to this.

But in reality whatever the problem (or problems) is it's really hard
to work out what causes it.

> 
> Summary: In the end we "flattened" the automounter file structure, so 
> that instead of using
> 
>    auto.master: /base /etc/auto.base browse
>    auto.base:   sub1 /sub11 -fstype=autofs,vers=3 file:/etc/auto.sub11
>    auto.sub11:  sub11-1 server:/export1
>                 sub11-2 server:/export2
> 
> we now use
> 
>    auto.master: /base/sub1 /etc/auto.sub1 browse
>    auto.sub1:   sub11 -fstype=nfs,vers=3 \
>                    sub11-1 server:/export1 \
>                    sub11-2 server:/export2
> 
> this solution is as manageable as the first one and the problems 
> described in my original post have gone since then. It "works for us", 
> even though we don't understand what didn't work.  Since the issue - as 
> we have learned in the meantime - overlapped with networking problems of 
> the central storage, the problem /could/ have been an unfortunate 
> concidence, triggering the described problem.

Right, at least you have a workable solution.

> 
> For the sake of completeness and documentation I'll answer your last and 
> still unanswered questions:
> 
> > > > Is it always the same directory that becomes unresponsive?
> > > 
> > > It's all the directories managed by this table.
> > 
> > My original reading of the problem description made me think
> > that only certain automount points became unresponsive.
> > 
> > If "all" the automounts become unresponsive that's a very different
> > problem.
> > 
> 
> only /certain/ directories got lost, but not always the same ones and 
> not on all hosts the same ones.

This is an example of the difficulty, that behaviour isn't consistent
with what I think the problem is so I'm immediately stuck wondering
what could be going on.

> 
> 
> > > > Does the problem also occur if you use a HUP signal to re-read the
> > > > maps?
> > > 
> > > Haven't tried this yet. We usually just restart autofs.
> > 
> > I think this is another misunderstanding of the problem I have.
> > 
> > The description sounded like it was the restart with a modified
> > map that resulted in the problem but based on this and your later
> > reply it sounds like the restart fixes the problem.
> > 
> > That implies that modifying the map results in this automount
> > becoming unresponsive at some later time after the map change.
> > 
> > Have I got it right now?
> 
> Not quite :-)  An automounter restart with he /un/modified map always 
> solved the issue...for some time until some of the directories became 
> unavailable again...

Again not consistent with what I think could cause this.
It's hard to work out what's happening here.

> 
> 
> > Is there anything in the debug log about a map re-read (and
> > following log entries from that) between the time the map is
> > deployed and when the problem occurrs?
> > 
> > Are you sure you're getting all the debug logging?
> > If your assuming that setting "loggin = debug" in the autofs
> > configuration and using syslog with a default configuration
> > you might not be. How have setup to collect the debug log?
> 
> I haven't looked in the details of complete autofs debugging.  Basically 
> the daemon is running with "-d --foreground --dont-check-daemon" (set in 
> /etc/sysconfig/autofs as 'OPTIONS="-d"')

I only mentioned it because the log looked like it was missing
some entries. If your using some sort of syslog implementation
it's configuration can ignore certain log levels so log entries
are missing.

> 
> 
> Again thank you very much for your efforts

Ha, although I couldn't actually help!

Ian

