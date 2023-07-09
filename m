Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725C074C4D5
	for <lists+autofs@lfdr.de>; Sun,  9 Jul 2023 16:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjGIO6H (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 9 Jul 2023 10:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjGIO6G (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 9 Jul 2023 10:58:06 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EAA1B0
        for <autofs@vger.kernel.org>; Sun,  9 Jul 2023 07:57:38 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99384a80af7so411142166b.2
        for <autofs@vger.kernel.org>; Sun, 09 Jul 2023 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688914641; x=1691506641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nHYeHkkXf3zSs+85S7jOFkfBAVzbfqyno6y0aXFRHts=;
        b=R+sqUq/Cq0pu59Oj0DqjrFG4aUOYC+K2EPy2xnO59UoSQNaY06rbEVVl6IN/oVEbCJ
         2RzKz9umWnU2BSWe5/l2UccKa540zFXPM5S594pVzU0cTzm6O372cA6qKVFguezIquhm
         Gon1skmdqFZSnkMDYWEzeVU66P2cBMqLuecALVvfFnJnLWmoNqsIzvClFfrRnt3WPo0M
         XB1rwkuaOOm6evvq9bJHtt8nLkJUUDY7YEa2eYO1eyIupgLHN/c8RCrYtFTWYs+D38JF
         uo4okdX4z+9/0/p7Ugrwe/5hiyl6Am6o5t4EiH80MCe5QTNe7p+jJg8hyvT8bfLqu0RV
         Jxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688914641; x=1691506641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHYeHkkXf3zSs+85S7jOFkfBAVzbfqyno6y0aXFRHts=;
        b=AqrXj4S8rqSfa6HFPs/yLQ3SuHmmDcLVFv6keAcR8lnSEuASg3BZV7+UVCn5D6q3Uh
         +BJxFFE4C6CmO5skdxh3xiPnV2oVFTpAzjGHd1+mPZbPRQDlMhANTqLyzves+1VAv+Z6
         mWl3FuQJFuIHA6TpWfL4ymO6T/GpXuKAOGNz9zKFEAB4JpR2Rar7+fcoAaKIWgj2vmfK
         o4BVD9bR2UqvFqIAINExyTHI9hRLtpwgmnTwqmvEXO3BYBatcDZqJERmP0E3nhDydEYh
         zB/JL2KMrZlyR2A/rdX+KWhJI5GDkJ2vFeTYHfv8TUD///6bcgXx0jbhViXGI4xt0weA
         sW9w==
X-Gm-Message-State: ABy/qLY+6zdjclL8rHzPCgxb+XiEGtc/DCHB8xJxLZXtXfM98xCj5lEP
        3JknQwPv5SAGAyt6kdep0ZY=
X-Google-Smtp-Source: APBJJlFued4Dd4NsrxUWum9LK9cIkdKEkixSVm6QzJC1X76FrxalWzWBBFx5WU11g9Von229Fd+RqQ==
X-Received: by 2002:a17:906:5a09:b0:982:7505:fafa with SMTP id mx9-20020a1709065a0900b009827505fafamr7783361ejc.47.1688914640796;
        Sun, 09 Jul 2023 07:57:20 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id kk16-20020a170907767000b009893f268b92sm3603447ejc.28.2023.07.09.07.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 07:57:20 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
        id 31C90BE2DE0; Sun,  9 Jul 2023 16:57:19 +0200 (CEST)
Date:   Sun, 9 Jul 2023 16:57:19 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Ian Kent <raven@themaw.net>, Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc:     autofs@vger.kernel.org, Mike Gabriel <sunweaver@debian.org>
Subject: Regression after changes for mounts from IPv6 addresses introducing
 delays
Message-ID: <ZKrKz/QYjPSmMcts@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_FILL_THIS_FORM_FRAUD_PHISH,T_FILL_THIS_FORM_SHORT,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi

The following sort of regression was noticed while updating a client
running Debian buster (with autofs 5.1.2 based) to Debian bullseye
(5.1.7 based autofs), but verified it's still present with 5.1.8. The
folloing setup is present:

There is a NFS server, dualstacked, with both public IPv4 and IPv6
addresses resolvable in DNS. As I cannot put the public IPs here in
the report, let's assume It is called nfs-server with addresses
192.168.122.188 and fc00:192:168:122::188. 

The client initially running Debian buster, is not dualstacked, has
only IPv4 and has correct routing, e.g. pinging to nfs-server will as
well go to the IPv4 address of nfs-server, or any tcp connection will
go to IPv4 (e.g. ssh -vvv nfs-server).

Automount configuration is fairly simple:

auto.master:
[...]
/home            /etc/auto/homes01
[...]

and /etc/auto/homes01
[...]
* nfs-server:/srv/homes/homes01/&
[...]

(note in fact the real configuration is slightly more complex,
nosuid,rw,hard,proto=tcp as options, but veried as wel stripping down the
options, even dropping proto=tcp). I hope I correctly de-anonymized
not messing up with paths in the logs below.

After the update to autofs 5.1.7 based version there is a 10s delay on
mounts from the servers.

In the following logs I had to slightly deanonymize the names. But I
think the delay problem is seen enough by the timestamps.

Before the update, with autofs 5.1.2:

Jul 09 11:54:41 clienthost automount[5143]: handle_packet: type = 3
Jul 09 11:54:41 clienthost automount[5143]: handle_packet_missing_indirect: token 26, name username, request pid 5285
Jul 09 11:54:41 clienthost automount[5143]: attempting to mount entry /home/username
Jul 09 11:54:41 clienthost automount[5143]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
Jul 09 11:54:41 clienthost automount[5143]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x30
Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: nfs v3 rpc ping time: 0.000000
Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: host nfs-server cost 0 weight 0
Jul 09 11:54:41 clienthost automount[5143]: prune_host_list: selected subset of hosts that support NFS3 over TCP
Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mkdir_path /home/username
Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
Jul 09 11:54:41 clienthost automount[5143]: dev_ioctl_send_ready: token = 26
Jul 09 11:54:41 clienthost automount[5143]: mounted /home/username

After the update to 5.1.7 (or 5.1.8):

Jul 09 11:56:23 clienthost automount[6952]: handle_packet: type = 3
Jul 09 11:56:23 clienthost automount[6952]: handle_packet_missing_indirect: token 33, name username, request pid 7104
Jul 09 11:56:23 clienthost automount[6952]: attempting to mount entry /home/username
Jul 09 11:56:23 clienthost automount[6952]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
Jul 09 11:56:23 clienthost automount[6952]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x20
Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: nfs v3 rpc ping time: 0.000184
Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: host nfs-server cost 183 weight 0
Jul 09 11:56:23 clienthost automount[6952]: prune_host_list: selected subset of hosts that support NFS3 over TCP
Jul 09 11:56:23 clienthost automount[6952]: get_supported_ver_and_cost: called with host nfs-server(fc00:192:168:122::188) version 0x20
Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: rpc ping time 0.000352
Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: cost 352 weight 0
Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): calling mkdir_path /home/username
Jul 09 11:56:33 clienthost automount[6952]: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
Jul 09 11:56:33 clienthost automount[6952]: dev_ioctl_send_ready: token = 33
Jul 09 11:56:33 clienthost automount[6952]: mounted /home/username

while first get_nfs_info is called again with host
nfs-server(192.168.12.2188), there is a get_supported_ver_and_cost
with the IPv6 address, hanging for 10s.

If I just revert c578e5b37c3c ("autofs-5.1.5 - Fix NFS mount from IPv6
addresses") then the mount is again quick, but logs an additional

Jul 09 16:31:34 clienthost automount[12045]: check_address_proto: requested protocol does not match address

so likely not the right fix.

I suspect mounts from server, which are dualstacked, but route to them
is only IPv4, are not correctly handled after 90532146bc0e
("autofs-5.1.3 - fix ipv6 proto option handling") and c578e5b37c3c
("autofs-5.1.5 - Fix NFS mount from IPv6 addresses").

(note the package in Debian *is* built with --with-libtirpc).

Does any of the above make sense?

Regards,
Salvatore
