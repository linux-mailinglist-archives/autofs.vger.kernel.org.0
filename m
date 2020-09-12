Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491F22676C4
	for <lists+autofs@lfdr.de>; Sat, 12 Sep 2020 02:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILAVD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 11 Sep 2020 20:21:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34783 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725871AbgILAUn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 11 Sep 2020 20:20:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 167BDCC5;
        Fri, 11 Sep 2020 20:20:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 11 Sep 2020 20:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        29bBPE2d8tBFRj3NDmxZwLG7S71L9uC2gY1xaJ4EqEo=; b=N6XHoMwROOE50coo
        lsI3BldwnqcU4Pkm5luAFUpI6qWTmzPKB5bMg7znouzRl7jCrhoOLKrDCjiTmRja
        22MgY8P8OZUI9qqynZqBT+giD4aiWY7v8z7C0E/ZwUFnH+bZWqSax/1j3ekQaevs
        J8R68x6045TyovhehZ2HvwRyUDASiGb7H+k/fsN3PpSyhgvBgiUqgFz6uB7QIoVd
        xhfgUOvoVXuCWhnrV7FexVkjMwIGv6Jdn0rq++jftHgfosUUjK3BgRKfjBWDZLL7
        FOfrZUlrCN4tT5TXrS7s6b8Et+hP8zTHKaC1AM7NhmlXeppLnzDty+Y2sTvUyICZ
        msBJ4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=29bBPE2d8tBFRj3NDmxZwLG7S71L9uC2gY1xaJ4Eq
        Eo=; b=mPCubUBsaayV5ftznDvwxF+ZqYSGmbnDDn1lEusOAJPGszV3ZHRZbkcal
        uDpieWceGeMTmNy2dQ7auSQoPTeZxPALxEPRuVCnMYO9dWmDxAwiZABkXqFDUWGM
        kUrRUHrUj2/mi+GX26SovMlRSzWfTU7fDZHnldBqJWHdveQTs07L7SapN8H1Oa50
        dhOtRoPv2FsEmlaAdvKMxpwLlgbJAaefvFnrzJBtj/bsHTPB8EtLNmgE+kIy6aJf
        bZyD6LP7sBosv8LbUNxEBw6VJyuk8YVshnENKos8NR3Fmye2nWYMkQFDB00bbKE1
        9kOunVbuhokHHXh3XVpg7ggqhnlrg==
X-ME-Sender: <xms:VhRcX4Pf0fP04SoXPp-fCwE8JStxcsKyH09v5RXErhZUqQfrDsiARw>
    <xme:VhRcX-_45U2-BquocRtuCeAcB4AoOLFT9AtFYFW-2gkPOxoVLDiDqfgD0TVeseqq9
    73UtJoTVDYj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeitddgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepfeefteetvdeguddvveefveeftedtffduudehue
    eihfeuvefgveehffeludeggfejnecukfhppedutdeirdeiledrvdefledrudegjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:VhRcX_QPRn7InGkUC6_mUJqzAC1a_Qva7OzFCFqiebPD015dvXmVXg>
    <xmx:VhRcXwtv_UfLHcjB1iBhxvZHG8OiJ8wwvr8F8bfZCaHVRw803B8mDA>
    <xmx:VhRcXwfuE31zKQ6OyDaeip0WhqQx8w4md77T6_uZeRjIhYi-Q6hmVQ>
    <xmx:VhRcX6qXH__c16QrdJqe7DGH4dV7VNEzdlRvYltfze2OlOR_2g41kA>
Received: from mickey.themaw.net (106-69-239-147.dyn.iinet.net.au [106.69.239.147])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5A3BB306467E;
        Fri, 11 Sep 2020 20:20:37 -0400 (EDT)
Message-ID: <97d2b7ab490288a8d45c7463ef8a5609842a136d.camel@themaw.net>
Subject: Re: sshfs mount option, 'nonempty', causing mount/connection fails:
 "No such file or directory". still a valid option?
From:   Ian Kent <raven@themaw.net>
To:     pgnet.dev@gmail.com, autofs@vger.kernel.org
Date:   Sat, 12 Sep 2020 08:20:33 +0800
In-Reply-To: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
References: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2020-09-11 at 16:47 -0700, PGNet Dev wrote:
> i'm setting up auto.sshfs, provided by
> 
> 	rpm -qa | grep ^autofs
> 		autofs-5.1.6-7.fc32.x86_64
> 
> on a new server
> 
> 	grep PRETTY /etc/os-release
> 		PRETTY_NAME="Fedora 32 (Server Edition)"
> 		
> 
> my (usual) config, in-place on all my prior/other-OS boxes, includes
> 
> 	cat /etc/auto.master
> 		/mnt/nfs4  /etc/auto.nfs4  --timeout=10,--ghost
> 		/mnt/sshfs /etc/auto.sshfs --timeout=30,--ghost
> 
> where mounts are typically,
> 
> 	cat /etc/auto.sshfs
> 		
> 		example  -
> fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_r
> ead=65536,compression=yes,auto_cache,no_check_root,kernel_cache,worka
> round=rename,ssh_command="/usr/bin/ssh -F
> /usr/local/etc/ssh/ssh_config"  :sshfs\#root@test.example.com\:/
> 
> with that^,
> 
> 	cd /mnt/sshfs/example
> 
> works exactly as expected -- on all _except_ these new Fedora
> installs
> 
> here,
> 
> 	cd /mnt/sshfs/example
> 
> returns
> 
> 	ls: cannot access 'sshfs/example/': No such file or directory
> 
> simply removing 'nonemmpty'
> 
> -	example  -fstype=fuse,rw,nodev,nonempty,allow_other,...
> +	example  -fstype=fuse,rw,nodev,allow_other,...
> 
> cures the problem.
> 
> is 'nonempty' still valid usage with  autofs sshfs mounts?
> is additional/difference config req'd on Fedora, or perhaps more
> recent autofs?

The autofs on f33 should be close to what's in the upstream repo.,
that's the latest release plus patches that have been pushed to the
repo., so there isn't a more recent autofs.

This could be a bug I've introduced or perhaps a change to what's
used to mount these.

How about you get a debug log so we can check.

Set "logging = debug" in /etc/autofs.conf and use journalctl to
collect the log output, like "journalctl -f | tee autofs.log".

Obviously you can grep for automount and perhaps edit the log a
little to get rid of anything that might not be appropriate for
a public mailing list or send it to me privately.

Ian

