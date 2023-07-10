Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6988D74CE74
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 09:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjGJHa7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 10 Jul 2023 03:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjGJHao (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 10 Jul 2023 03:30:44 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4721B3
        for <autofs@vger.kernel.org>; Mon, 10 Jul 2023 00:30:38 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e43473ee0so3483766a12.3
        for <autofs@vger.kernel.org>; Mon, 10 Jul 2023 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688974237; x=1691566237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM7nr5A/nhqwJCAsaEL+kldJsUa5egvjbDmJafwvcGs=;
        b=WK8dTNlKkOwRvpifzFXMb/8cRvAg+A9ciVxrBs7zOGYWb5/kez57YJj2ABdBlYqkqs
         uJWphZg6qFMLXnFNufSL/Kg6gcebaWhsgPURobNUmHw62xIojcKWYQ2Ft+aIwy7Ufmd3
         b/K2ZL7LvKeA0UfSdWnriLoHQA8vURvktnYD6c1IHrON/ahZxUEuziElVIeikHDfonth
         ZK2UCt8ozrQoBkFgY3DFB7VM7mtDFiqTcEydiIk6liM1nqw9wOMD3PiFebPwgh304QAJ
         H53Zmgi7+MeM7s/aCjDo9nuL+PPeMqINGpApoFrD2U5eeGpYdk7MiYNve+AK5Q4gnnUI
         TfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974237; x=1691566237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yM7nr5A/nhqwJCAsaEL+kldJsUa5egvjbDmJafwvcGs=;
        b=TxSlC1DojVbVyK4B9D+t2glzxq1XD47EJv8XoaMUvt7rEZ9aFTgfwauJspQFBBxqnY
         8t0Lvpo/e/ejMdxG5Oi0fYkhWE+fqJiUIfbcFmNBdVFMRxRlr4gpV2I+z6Og7h8/5aO8
         prHZIKYegD1vcAWlTpxjuF94yvlGuFB4+aAvQv+WRjcxyYxRQBk4nkX2ddbIUNffOfqd
         G7q2e6glNkvKHBaAyQkuV+To0+/FZurZiV1qQriAvFeA8PzkQUyVPVHfL4fKI7ZzoQ8i
         QOpod+y+FOVshodRdelrpIMpZ7bBjnZQHgR8wxCop8YezcLUpXuF4WDxZ9er7uq9PEHU
         sCWg==
X-Gm-Message-State: ABy/qLarTQ6PYPG/47wVQfpEREkRl+HftypNz8JZkRYb9u5mFQvIFLbU
        dX/F9ObvszZ9A04YoYPm/RY=
X-Google-Smtp-Source: APBJJlFw+AG5WWbxvBTQF0xqSxO1JkriOs737D38o0Igwa4CWHBsyiNLQkj4bl1/l9SqVtV/Ce0ZPw==
X-Received: by 2002:a17:906:b846:b0:992:7295:61c9 with SMTP id ga6-20020a170906b84600b00992729561c9mr11086537ejb.69.1688974236746;
        Mon, 10 Jul 2023 00:30:36 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906241100b0098ce63e36e9sm5780785eja.16.2023.07.10.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:30:35 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
        id 035E8BE2DE0; Mon, 10 Jul 2023 09:30:35 +0200 (CEST)
Date:   Mon, 10 Jul 2023 09:30:34 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org,
        Mike Gabriel <sunweaver@debian.org>
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
Message-ID: <ZKuzmrDjHp0XbdYS@eldamar.lan>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
 <66eb24d5-988a-9646-b419-245096dfe3f0@themaw.net>
 <ZKugoVJ27gOdQz2w@eldamar.lan>
 <4c054822-11be-78fc-a191-b7d3af45604c@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c054822-11be-78fc-a191-b7d3af45604c@themaw.net>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian,

On Mon, Jul 10, 2023 at 02:17:03PM +0800, Ian Kent wrote:
> 
> On 10/7/23 14:09, Salvatore Bonaccorso wrote:
> > Hi Ian,
> > 
> > On Mon, Jul 10, 2023 at 10:53:31AM +0800, Ian Kent wrote:
> > > On 9/7/23 22:57, Salvatore Bonaccorso wrote:
> > > > Hi
> > > > 
> > > > The following sort of regression was noticed while updating a client
> > > > running Debian buster (with autofs 5.1.2 based) to Debian bullseye
> > > > (5.1.7 based autofs), but verified it's still present with 5.1.8. The
> > > > folloing setup is present:
> > > > 
> > > > There is a NFS server, dualstacked, with both public IPv4 and IPv6
> > > > addresses resolvable in DNS. As I cannot put the public IPs here in
> > > > the report, let's assume It is called nfs-server with addresses
> > > > 192.168.122.188 and fc00:192:168:122::188.
> > > I assume the IPv6 address here is not what's used in practice. It
> > > 
> > > doesn't look valid, it doesn't look like an IPv4 mapped address, what
> > > 
> > > is it, how was it constructed?
> > I'm sorry this was just me trying to use something valid from
> > https://en.wikipedia.org/wiki/Unique_local_address . Yes this is nto
> > the IPv6 address which the server has in practice.
> 
> Yes, it's been hard over time given the available IPv6 support has been
> 
> poor and setting up locally has always been a problem for me.
> 
> 
> But, as I say, my ISP is there now so I should be good to go.

I think I finally have some further glue: While the host has IPv4 only
it is in a network which from the networking team allows in principle
to be run dualstack, and from the router in the network it recieves as
well

# ip -6 r
fe80::/64 dev bond0 proto kernel metric 256 pref medium
default via fe80::2220:ff:fe00:aa dev bond0 proto ra metric 1024 expires 1667sec hoplimit 64 pref medium

If re delete the additional IPv6 default route, then the mount is
again quick, but *still* involves the IPv6 address:

# ip -6 r del default

then

Jul 10 08:56:17 clienthost automount[24683]: handle_packet: type = 3
Jul 10 08:56:17 clienthost automount[24683]: handle_packet_missing_indirect: token 67, name testuser, request pid 25897
Jul 10 08:56:17 clienthost automount[24683]: attempting to mount entry /home/testuser
Jul 10 08:56:17 clienthost automount[24683]: lookup_mount: lookup(program): testuser -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/testuser
Jul 10 08:56:17 clienthost automount[24683]: lookup_mount: lookup(program): looking up testuser
Jul 10 08:56:17 clienthost automount[24683]: lookup_mount: lookup(program): testuser -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/testuser
Jul 10 08:56:17 clienthost automount[24683]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/testuser
Jul 10 08:56:17 clienthost automount[24683]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
Jul 10 08:56:17 clienthost automount[24683]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/testuser") -> nfs-server:/srv/homes/homes01/testuser
Jul 10 08:56:17 clienthost automount[24683]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/testuser
Jul 10 08:56:17 clienthost automount[24683]: sun_mount: parse(sun): mounting root /home, mountpoint testuser, what nfs-server:/srv/homes/homes01/testuser, fstype nfs, options nosuid,rw,hard,proto=tcp
Jul 10 08:56:17 clienthost automount[24683]: mount(nfs): root=/home name=testuser what=nfs-server:/srv/homes/homes01/testuser, fstype=nfs, options=nosuid,rw,hard,proto=tcp
Jul 10 08:56:17 clienthost automount[24683]: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
Jul 10 08:56:17 clienthost automount[24683]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x20
Jul 10 08:56:17 clienthost automount[24683]: get_nfs_info: nfs v3 rpc ping time: 0.000188
Jul 10 08:56:17 clienthost automount[24683]: get_nfs_info: host nfs-server cost 187 weight 0
Jul 10 08:56:17 clienthost automount[24683]: prune_host_list: selected subset of hosts that support NFS3 over TCP
Jul 10 08:56:17 clienthost automount[24683]: get_supported_ver_and_cost: called with host nfs-server(XXXX:XXXX:XXXX:XXXX::188) version 0x20
Jul 10 08:56:17 clienthost automount[24683]: get_supported_ver_and_cost: rpc ping time 0.000150
Jul 10 08:56:17 clienthost automount[24683]: get_supported_ver_and_cost: cost 149 weight 0
Jul 10 08:56:17 clienthost automount[24683]: mount_mount: mount(nfs): calling mkdir_path /home/testuser
Jul 10 08:56:17 clienthost automount[24683]: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/testuser /home/testuser
Jul 10 08:56:17 clienthost automount[24683]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/testuser on /home/testuser
Jul 10 08:56:17 clienthost automount[24683]: dev_ioctl_send_ready: token = 67
Jul 10 08:56:17 clienthost automount[24683]: mounted /home/testuser

So you might argue likely is it an autofs problem then? Is the bevaviour
regression here considered a users problem (even though the network not fully
under users control), or should IPv6 not be involved? And what about when
proto=tcp is specified, why would IPv6 be involved (note this question/point
was sort of raised as well when commiting
https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=c578e5b37c3cf3ff17a4284f9d9269040cb1d975).

So I'm a bit lost if it's solely users's fault or if there is still a bug
involved in autofs.

Thanks again for your time!

Regards,
Salvatore
