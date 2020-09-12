Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47362677A5
	for <lists+autofs@lfdr.de>; Sat, 12 Sep 2020 06:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgILETz (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 12 Sep 2020 00:19:55 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:33951 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725795AbgILETy (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 12 Sep 2020 00:19:54 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 8F87395B;
        Sat, 12 Sep 2020 00:19:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 12 Sep 2020 00:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        sg/ngszbWWYg/YhD+eEjy9+rpdnHbysJQcC/bHa1L0U=; b=Xfluol6nEVbqQ4DD
        Q/P9tNRdr6cNzVOBerrUdxBlgVevl3YzusZIUHSDUC3PNRJASEspYhGDkNmy2sZw
        U7fz0LyV9FDO1QHJpScWWahnFqNzwhPlpWNX/OvlaKv6SJCyhFRpOTccIYRi1NA2
        Wmp4GF1OlcPticA5zW0741LkW23xGO9MLG9ReZQkbq7P9ze+y9Lk8SBA6npybRrn
        Rlb58VYVcsVeMLKx3MbPwKlTynSb/xyGGirphp4HKr1AYx7zlSpPvpAnLZvHAQqv
        iYcYGjDBgzEuOj4206U+OsmNVNTOJiOkmsPnYaZq3p91vgd7D8vC9QVZIBmIh70U
        9Mm4Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=sg/ngszbWWYg/YhD+eEjy9+rpdnHbysJQcC/bHa1L
        0U=; b=putI0is3oS/MtsrsTyTHNADeSr8xvYDnT67qZbF9wJ79GMPzIh/ja3RPD
        8raDZq0PFPoA3FHxNpFXAz0VQuLUPOw3M3qzGCJFutk3HdtfUnm37bijelXiGfpC
        6DW4tenZrw/pL8j1qRQlDB2lyWWgfn8lDYQu6NLnkEX6UGSkcoVdEG9mHwoF+3jF
        ImnOjWtW8u9vEZvZ784hDRVORlS069Ad6+AxTVLn2rw20biLnxm7dRB1AVjiVKCs
        rj7YPhFBFH20zDtRssw5U5hLfCX7ZyzOItmQ6g9imT4s8xO+7zqwZbkKjywnqNez
        CcQpoMl6joXeBWtqH5bW6hCKENuMA==
X-ME-Sender: <xms:aExcXzsHCe2GHVlch70FiquAEZ8BV7fC_Kj-qTOGyGYkvvVCuELtgg>
    <xme:aExcX0cysSXuVRRFqX0EtWGTDOP4--XaPsPitxJ0lfBhYCS2xIY7RbswmmbbQ9ktI
    2mz6hXGdqjz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeitddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepfeefteetvdeguddvveefveeftedtffduudehue
    eihfeuvefgveehffeludeggfejnecukfhppedutdeirdeiledrvdefledrudegjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:aUxcX2yKciIbOBhenutUjffhmGuRjazPA1wo_U-wQLsa-FKCzaowfg>
    <xmx:aUxcXyNklRu5aPe7p3OycyTBIQY1JPwHz3nGE1muNyfOj_quYcCRtg>
    <xmx:aUxcXz_ZGt3SgHtAMPBeNBvT4dy1xJleu1YShdcE1QDN4peDqbw7mg>
    <xmx:aUxcX2L-fmbNyU2SHeuqw1twvY0lqF6s7U0hz-6lTa28yxaCZ5wkaw>
Received: from mickey.themaw.net (106-69-239-147.dyn.iinet.net.au [106.69.239.147])
        by mail.messagingengine.com (Postfix) with ESMTPA id BC276306467E;
        Sat, 12 Sep 2020 00:19:51 -0400 (EDT)
Message-ID: <b2277090b9c641077cb19fe01f46e44a9481bed4.camel@themaw.net>
Subject: Re: sshfs mount option, 'nonempty', causing mount/connection fails:
 "No such file or directory". still a valid option?
From:   Ian Kent <raven@themaw.net>
To:     pgnet.dev@gmail.com, autofs@vger.kernel.org
Date:   Sat, 12 Sep 2020 12:19:48 +0800
In-Reply-To: <c7af3932-6de6-a0a5-285a-e20ee92ffd95@gmail.com>
References: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
         <97d2b7ab490288a8d45c7463ef8a5609842a136d.camel@themaw.net>
         <c7af3932-6de6-a0a5-285a-e20ee92ffd95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2020-09-11 at 18:21 -0700, PGNet Dev wrote:
> hi
> 

snip ...

> cd /mnt/sshfs/example/
> 	bash: cd: /mnt/sshfs/example/: No such file or directory
> 
> journalctl -f -u autofs
> 
> 	Sep 11 18:15:20 desk0013 automount[16234]: handle_packet: type
> = 3
> 	Sep 11 18:15:20 desk0013 automount[16234]:
> handle_packet_missing_indirect: token 102, name example, request pid
> 6657
> 	Sep 11 18:15:20 desk0013 automount[16234]: attempting to mount
> entry /mnt/sshfs/example
> 	Sep 11 18:15:20 desk0013 automount[16234]: lookup_mount:
> lookup(file): looking up example
> 	Sep 11 18:15:20 desk0013 automount[16234]: lookup_mount:
> lookup(file): example ->
> -fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_
> read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,work
> around=rename,ssh_command="/usr/bin/ssh -F
> /usr/local/etc/ssh/ssh_config"  :sshfs\#root@target.example.com\:/
> 	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount:
> parse(sun): expanded entry:
> -fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_
> read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,work
> around=rename,ssh_command="/usr/bin/ssh -F
> /usr/local/etc/ssh/ssh_config"  :sshfs\#root@target.example.com\:/
> 	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount:
> parse(sun): gathered options:
> fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_r
> ead=65536,compression=yes,auto_cache,no_check_root,kernel_cache,worka
> round=rename,ssh_command=/usr/bin/ssh -F
> /usr/local/etc/ssh/ssh_config
> 	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount:
> parse(sun): dequote(":sshfs\#root@target.example.com\:/") -> :
> sshfs#root@target.example.com:/
> 	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount:
> parse(sun): core of entry:
> options=fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid
> =0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cac
> he,workaround=rename,ssh_command=/usr/bin/ssh -F
> /usr/local/etc/ssh/ssh_config, loc=:sshfs#root@target.example.com:/
> 	Sep 11 18:15:20 desk0013 automount[16234]: sun_mount:
> parse(sun): mounting root /mnt/sshfs, mountpoint example, what 
> sshfs#root@target.example.com:/, fstype fuse, options
> rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,co
> mpression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename
> ,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config
> 	Sep 11 18:15:20 desk0013 automount[16234]: do_mount: 
> sshfs#root@target.example.com:/ /mnt/sshfs/example type fuse options
> rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,co
> mpression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename
> ,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config using
> module generic
> 	Sep 11 18:15:20 desk0013 automount[16234]: mount_mount:
> mount(generic): calling mkdir_path /mnt/sshfs/example
> 	Sep 11 18:15:20 desk0013 automount[16234]: mount(generic):
> calling mount -t fuse -o
> rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,co
> mpression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename
> ,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config 
> sshfs#root@target.example.com:/ /mnt/sshfs/example
> !!	Sep 11 18:15:20 desk0013 automount[16234]: >> fuse: unknown
> option(s): `-o nonempty'

That ">>" log entry comes from the command used for the mount.
autofs doesn't know what's valid or not so it logs what comes
back from the mount attempt.

Ian

