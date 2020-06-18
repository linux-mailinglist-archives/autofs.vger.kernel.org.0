Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841391FE24D
	for <lists+autofs@lfdr.de>; Thu, 18 Jun 2020 04:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgFRCA0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 17 Jun 2020 22:00:26 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35515 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387440AbgFRCAX (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 17 Jun 2020 22:00:23 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id D9E385C0129;
        Wed, 17 Jun 2020 22:00:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 17 Jun 2020 22:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        CIoJ3mB6xd3GjEJ83x4ZIumCe5sxIyUsxU0ZXAcI0Jw=; b=nnEaMtWzryfDgmWD
        Ql/5ZCyiT1DYdk8rkeTWa5Cc4Z22469gDdBoqRjTG2tu0VS+eQO10b2U6CCOK4zX
        NsrU2mUWAE739EHWqmwIeWnNWoXFJucy+0t+by2sPFgiCrTQ4ORvRAOYI26An8/3
        y9lQ37TG9Qr0ZvA5qeQIHawZvG5K5M8EZpsoEha/eJL2PjraEM2ovIFe9O31tdUh
        lRxdyTnHcL7m4ctvwt7WYV++ff4RHW6jxpP5Or7vvCN6QEuic+FhNL/2ZfEmb+fD
        tCiT+CIiNnvXmQJ7ZnpZnOw1PbgoRXFsfvV9W8ImiKKsP9NQGh4H+3Gse7HKrLZu
        GuBM5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=CIoJ3mB6xd3GjEJ83x4ZIumCe5sxIyUsxU0ZXAcI0
        Jw=; b=urwwrXpDl5NurnJ1QUQC1BfaOUnV3HaR5CfH3qL185A8G/sH2DMRQGrhn
        bu/ago+8ezkezVbb0ctIhBhTSpiwHMSz2uqn05Mk1gLU0tyGGx3UFSVE/ceycKbL
        jU+WEFAsQDKsLqrXyrmkSUBjKQ7fFq0ynqIk1/ZNzo04HQhlxUex+Vd84iDqfweh
        v/xegNj2nnGD88RbzxLCdm94rC6Cmye+1IlKGV4XAyb3kbgGiBKjy8YIqsSokXnD
        LJ6JB/w/3+qvweE9AIi3vgBFmDY34HeP0JphqUBINqNU19Li9BellZ1D2cSJ2bHH
        dAbFRc81HugqBBEwSvcbfP0BVZ2Cg==
X-ME-Sender: <xms:tsrqXmPoT0vo6LdrRUzGBhtcCvUR1SlNgc_XIUNhhr3aBXnYUi9sAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejfedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    dviefgieeivddtteekvddvleekvedukeevtdekgfdvheegjeevueejhedvudehtdenucff
    ohhmrghinhepuhhtvgigrghsrdgvughunecukfhppeehkedrjedrudelgedrkeejnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhes
    thhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:tsrqXk8ACTnJbRqojaHg0aeYUCICjhCMVK3q-mikx6AETFAhSLfoXw>
    <xmx:tsrqXtRzUCF_C8DQZH5byCrHJ7PqYUPGsJVApuRPO071x2rG_s2ZBw>
    <xmx:tsrqXms1pVvqU76So7RQNTB5e20azZJC1oejThWRwltOmWjY1JeS4w>
    <xmx:tsrqXt_rW1sGaQypdIUXmwIt-n-G-5uvPHOLfn-Cguh2oIxrGzSszg>
Received: from mickey.themaw.net (58-7-194-87.dyn.iinet.net.au [58.7.194.87])
        by mail.messagingengine.com (Postfix) with ESMTPA id C22093061856;
        Wed, 17 Jun 2020 22:00:20 -0400 (EDT)
Message-ID: <ac8bf2a646cc69c29d8233ad7b88234405e35782.camel@themaw.net>
Subject: Re: The automounter hangs on attempts to mount non-existent
 directories unless the option vers=4.2 is specified?
From:   Ian Kent <raven@themaw.net>
To:     Patrick Goetz <pgoetz@math.utexas.edu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Thu, 18 Jun 2020 10:00:17 +0800
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

If you specify vers or nfsvers and the its value starts with 4
(and mount_nfs_default_protocol is set to 4, and UDP protocol is
not the requested mount protocol) then autofs will probe the server
to work out whether it's available before attempting a mount.

The point is, when the NFS version is explicitly given and those
other conditions are met autofs will do targeted probing to work
out if the server is responding in order to try to (partly) avoid
the potential RPC stubbornness we see during the kernel mounting.

If not the usual probing will be done for protocols and NFS versions
to work out, if the server is responding, and what protocols and NFS
versions are available.

In fact it's not that smart, the probing is really only used to work
out whether to attempt a mount rather than construct an options string,
assuming that job is better left to mount.nfs(8).

If there are multiple servers for the the mount entry (either via DNS
or the map entry itself) then it does eliminate servers that aren't
responding and order the list of servers to try by response time.

Umm ... although I think there are also conditions under which it won't
do the probe at all ... those bits are in more than one place, I'd need
to look over that code if that's really going to be useful and needed.

Ian

