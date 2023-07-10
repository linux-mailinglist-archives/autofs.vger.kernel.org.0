Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE4474CCC0
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 08:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjGJGYT (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 10 Jul 2023 02:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGJGYT (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 10 Jul 2023 02:24:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24638124
        for <autofs@vger.kernel.org>; Sun,  9 Jul 2023 23:24:17 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992b66e5affso525148166b.3
        for <autofs@vger.kernel.org>; Sun, 09 Jul 2023 23:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688970255; x=1691562255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mn8jKxvhhSdJAC8NaLlAwjC6ynzDkZ6pmnYff4l4jI=;
        b=N+WB0oOnWasLy/jq+w17/EEK7Gvh+Ce9NNqMVtTYROAKDJWgud/Hzu91WRwAxOrVvt
         +F4cnHO1OBLpcz+QepFzSsd/NrImeDojX6PECUD3ph7AKPEen/nAN9Gu+11k748jKB/B
         4oNXqfHJMdfTpPQyNkptl/O4tpoRaBsh29ELHgly6z5TzSmeXga+WyC9jslMYzSoqjnw
         z5673Oa8vs5ogk17sLEkENoBxH6mlS4OEzEJDVxMCPsvs2N9aGTIeSoGdWc+ELgBxsaS
         mIuwfOIwZQdJhiYNNBCnZlCmxNTAOWt2ajxVLhCDWrAot3kE4Rh9bb6LzfQy7gKnhv2I
         ijaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688970255; x=1691562255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mn8jKxvhhSdJAC8NaLlAwjC6ynzDkZ6pmnYff4l4jI=;
        b=DxfRHmYDlRz7sgELHXZ2+s9UdEGZTZezqXOvYgNXTNFn5GwBaLT3gJ9HV1p0qTXdS/
         6sCBTPXeeHSvXCyRSun5bWhCgCqHZhyrcjpWzYE/eDJkQ/Slk4zrmn4wW2jUB4TCq0Ob
         IH5gV1rtF2XR6ePEtWxanCYbSQm1/KZAqOpEAhtaro/janIFzXdk+nK6cGokFBKIeOaA
         1qzQFKN0SAHzVE6TJv6wa/rqguBVw93zOJ0pTiMXFDyZbDWYaATl1kfcqU6rxypD3Hb+
         w3kmwNYuqhNwn/8XzLn1l1qNvfd1rHdQWEq5R/snldtgezfrWzNUJiB5zyOxPnfbi8Ai
         yckQ==
X-Gm-Message-State: ABy/qLa2SvJhIti/nJRmf1i0Oo4IZ1cu3bYSejGYj7TPnZQ2z4ceBOw2
        3uG3xEm2c7MUAu+i+dKj75w=
X-Google-Smtp-Source: APBJJlEMcuAstqVlwsTccVzy4VOJWGAIPvqXBlwUzgJ+Tdh9DZS/7ufwTe/TC80JrNXe3udolnckeQ==
X-Received: by 2002:a17:906:7499:b0:992:630f:98b4 with SMTP id e25-20020a170906749900b00992630f98b4mr12509232ejl.7.1688970255286;
        Sun, 09 Jul 2023 23:24:15 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id h22-20020a170906399600b0099329b3ab67sm5670491eje.71.2023.07.09.23.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:24:14 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
        id CAEB1BE2DE0; Mon, 10 Jul 2023 08:24:13 +0200 (CEST)
Date:   Mon, 10 Jul 2023 08:24:13 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org,
        Mike Gabriel <sunweaver@debian.org>
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
Message-ID: <ZKukDcZJPTp1wfCK@eldamar.lan>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
 <236bbf5a-189b-6161-72a4-6beb435f10de@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <236bbf5a-189b-6161-72a4-6beb435f10de@themaw.net>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian,

On Mon, Jul 10, 2023 at 10:05:12AM +0800, Ian Kent wrote:
> On 9/7/23 22:57, Salvatore Bonaccorso wrote:
> > Hi
> > 
> > The following sort of regression was noticed while updating a client
> > running Debian buster (with autofs 5.1.2 based) to Debian bullseye
> > (5.1.7 based autofs), but verified it's still present with 5.1.8. The
> > folloing setup is present:
> > 
> > There is a NFS server, dualstacked, with both public IPv4 and IPv6
> > addresses resolvable in DNS. As I cannot put the public IPs here in
> > the report, let's assume It is called nfs-server with addresses
> > 192.168.122.188 and fc00:192:168:122::188.
> > 
> > The client initially running Debian buster, is not dualstacked, has
> > only IPv4 and has correct routing, e.g. pinging to nfs-server will as
> > well go to the IPv4 address of nfs-server, or any tcp connection will
> > go to IPv4 (e.g. ssh -vvv nfs-server).
> > 
> > Automount configuration is fairly simple:
> > 
> > auto.master:
> > [...]
> > /home            /etc/auto/homes01
> > [...]
> > 
> > and /etc/auto/homes01
> > [...]
> > * nfs-server:/srv/homes/homes01/&
> > [...]
> > 
> > (note in fact the real configuration is slightly more complex,
> > nosuid,rw,hard,proto=tcp as options, but veried as wel stripping down the
> > options, even dropping proto=tcp). I hope I correctly de-anonymized
> > not messing up with paths in the logs below.
> > 
> > After the update to autofs 5.1.7 based version there is a 10s delay on
> > mounts from the servers.
> > 
> > In the following logs I had to slightly deanonymize the names. But I
> > think the delay problem is seen enough by the timestamps.
> > 
> > Before the update, with autofs 5.1.2:
> > 
> > Jul 09 11:54:41 clienthost automount[5143]: handle_packet: type = 3
> > Jul 09 11:54:41 clienthost automount[5143]: handle_packet_missing_indirect: token 26, name username, request pid 5285
> > Jul 09 11:54:41 clienthost automount[5143]: attempting to mount entry /home/username
> > Jul 09 11:54:41 clienthost automount[5143]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> > Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> > Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
> > Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
> > Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
> > Jul 09 11:54:41 clienthost automount[5143]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
> > Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
> > Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
> > Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x30
> > Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: nfs v3 rpc ping time: 0.000000
> > Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: host nfs-server cost 0 weight 0
> > Jul 09 11:54:41 clienthost automount[5143]: prune_host_list: selected subset of hosts that support NFS3 over TCP
> > Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mkdir_path /home/username
> > Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
> > Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
> > Jul 09 11:54:41 clienthost automount[5143]: dev_ioctl_send_ready: token = 26
> > Jul 09 11:54:41 clienthost automount[5143]: mounted /home/username
> > 
> > After the update to 5.1.7 (or 5.1.8):
> > 
> > Jul 09 11:56:23 clienthost automount[6952]: handle_packet: type = 3
> > Jul 09 11:56:23 clienthost automount[6952]: handle_packet_missing_indirect: token 33, name username, request pid 7104
> > Jul 09 11:56:23 clienthost automount[6952]: attempting to mount entry /home/username
> > Jul 09 11:56:23 clienthost automount[6952]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> > Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> > Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
> > Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
> > Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
> > Jul 09 11:56:23 clienthost automount[6952]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
> > Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
> > Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
> > Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x20
> > Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: nfs v3 rpc ping time: 0.000184
> > Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: host nfs-server cost 183 weight 0
> > Jul 09 11:56:23 clienthost automount[6952]: prune_host_list: selected subset of hosts that support NFS3 over TCP
> > Jul 09 11:56:23 clienthost automount[6952]: get_supported_ver_and_cost: called with host nfs-server(fc00:192:168:122::188) version 0x20
> > Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: rpc ping time 0.000352
> > Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: cost 352 weight 0
> > Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): calling mkdir_path /home/username
> > Jul 09 11:56:33 clienthost automount[6952]: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
> > Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
> > Jul 09 11:56:33 clienthost automount[6952]: dev_ioctl_send_ready: token = 33
> > Jul 09 11:56:33 clienthost automount[6952]: mounted /home/username
> > 
> > while first get_nfs_info is called again with host
> > nfs-server(192.168.12.2188), there is a get_supported_ver_and_cost
> > with the IPv6 address, hanging for 10s.
> 
> The later call timed out, it's timeout is 10 seconds for addresses
> 
> that look like they are on the local network so the IPv6 address is
> 
> not responding.
> 
> 
> I know that 10 seconds is a bit long for interactive use, perhaps
> 
> it should be a bit less, but it's better than the 2 minutes we
> 
> would often see ...

Yes fully understand. We got complaints from clients having to wait
10s for their homes to be mounted, this is how we start investigating
it.

> I guess you are saying it should be responding ... not sure what
> 
> I can do about that, I will need to reproduce the problem and IPv6
> 
> is still not something I have a setup for easily available.

I'm not sure. I was actually surprised, given the Client is IPv4 only
networking, that there was happing with the updated autofs actually
a call to the IPv6 address.

> > 
> > If I just revert c578e5b37c3c ("autofs-5.1.5 - Fix NFS mount from IPv6
> > addresses") then the mount is again quick, but logs an additional
> > 
> > Jul 09 16:31:34 clienthost automount[12045]: check_address_proto: requested protocol does not match address
> > 
> > so likely not the right fix.
> 
> That does raise some interesting alternatives though.
> 
> I'm not sure what the function check_address_proto() is seeing but it
> 
> essentially (in 5.1.8) says "if the rpc request is for IPv6 and the
> 
> host address length is not set to the length of an IPv6 address bail
> 
> out". So whatever is wrong there is probably still wrong just not
> 
> happening due to the check returning a fail.
> 
> 
> If I can setup an environment I can check that out further but sounds
> 
> a bit suspicious. I can of course check the code to see if there's an
> 
> obvious setup mistake ...

If I can provide any help in debugging this or you can give me hints
what I can try let me know. I will need to release the client host
soonish again to the customers, but will try to make a similar test
client available for further testing.

> > I suspect mounts from server, which are dualstacked, but route to them
> > is only IPv4, are not correctly handled after 90532146bc0e
> > ("autofs-5.1.3 - fix ipv6 proto option handling") and c578e5b37c3c
> > ("autofs-5.1.5 - Fix NFS mount from IPv6 addresses").
> 
> I'm not sure that these changes affect the routing at all, at least
> 
> not due to autofs itself and the above is a proto TCP request so it
> 
> shouldn't be the server simply not responding ... not sure why it's
> 
> happening.
> 
> 
> The difference between the first and second log traces looks like
> 
> dns lookup has returned two hosts in the second availability ping,
> 
> an IPv4 and an IPv6 address. Not sure why an IPv6 address isn't
> 
> present in the first availability ping.
> 
> 
> It might also be that NFSv3 is being checked for availability rather
> 
> than IPv4. I've assumed that NFS v3 works over IPv6 ...

About NFsv3: This is actually independent, it is the same if I use
NFSv4 (with -vers=4 option, which we have in the original setup, I
just tried to strip down as many options as possible for the
reproducing case, though still not minimal, but we can actually ommint
any of the options).

> > 
> > (note the package in Debian *is* built with --with-libtirpc).
> > 
> > Does any of the above make sense?
> 
> Sadly it does make sense but, as I say, I don't know what's causing
> 
> it.

Ok. Again I'm eager to help as much as possible to pinpoint the issue,
but might need some hints what I should/can try to isolate the
problem. Are there potential missconficuration on client side which
cause us problem for autofs in this setup?

Regards,
Salvatore
