Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9900274C9CB
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 04:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjGJCF0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 9 Jul 2023 22:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGJCFZ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 9 Jul 2023 22:05:25 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2079102
        for <autofs@vger.kernel.org>; Sun,  9 Jul 2023 19:05:23 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 169BD320027A;
        Sun,  9 Jul 2023 22:05:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 09 Jul 2023 22:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1688954720; x=1689041120; bh=v4/2Qa13LTZ0IY39BNldfcNF32utF4qf9GA
        JfAEGFso=; b=AlyMbYxyRINis85+NrFRCE9jyKXj+2C6n8uN/lcfqdNV2WYDsjG
        ORWA5nfG9t+X6quWGMh2IPizEEm+uIPyd0SRye76FYodLG3wA1yUa8TcHNagI2O0
        GJYb02+YSdTNvYs360+xdH4DJ0WACSnuH98BkCFobPSbV38/QPhscogSdo5Wuw6e
        cVZFbVlTmslOchjKoXWvlAhUfd2RGr7hFqeZRkH/pafwGY4BgygXtW4Ms1bF0x4S
        qxJZ9brFGTQ/f3zqKGIM3SFA4w1fmBfcetBelpXZaiOd50g9+l+6E8PCpa2U/eu2
        Zt/TJBka5CPTqdmNuQ2dlToaFkGu/ELXu0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1688954720; x=1689041120; bh=v4/2Qa13LTZ0IY39BNldfcNF32utF4qf9GA
        JfAEGFso=; b=DQfqEwBXhhT+vKyedcVx7QaoBUgLTa7UKTDgUvuqMwUQwcUaMv7
        NWNOFx+Tzatu/aUVL4Ln8PMbgIhhxya0hdkOSCisJSMyaBICeeMYmWO4sbPTs5Tk
        bzIUyKlrrVlwF929uDII00i0oubVQCU5YJfDCN7gljhh5H6z+qKz80fkn70qrUJC
        KBcwzXh8o5+B+UuhjiWzCYJxiGoh/IbaaPUOMd0RRTP/La4sdDn9zNDlryXLdqvB
        jFqP4B2+jjCNHDt6fjh3S8WhIkmdmKiZfFg8fuGIib4MEBcrBJOt+QnXK7JgHdaE
        VzKMSaTPKVdKx5CYMytqsssn2ukkB7e+e4A==
X-ME-Sender: <xms:YGerZE1RS2GzKLiZ8q7C9FRZLKPSNrwMQFEQCZqDGYDJtJo641Bcog>
    <xme:YGerZPHnDhnqcAPqV9JWKAMX2wp2KyzkVRqaaNRRtD4ILqey-LPnmiuFOkY_V2-7x
    0xbjvZdRw5e>
X-ME-Received: <xmr:YGerZM6fR9exSl8dXJ2rFjxVBD6_jU0Le-TH6CBBiqiBCqj29kwnybO9zgbwgSXYgRFtso1Edo8SJvY4RElraMtVpCP0qmsLdLMCtXXwl6175_-omLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdeigdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    euhfeuieeijeeuveekgfeitdethefguddtleffhfelfeelhfduuedvfefhgefhheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:YGerZN2K3T2NL4XlYuoXI8w8gHzUaBJjZzVuIf0rSIoLyeGA8Dct7Q>
    <xmx:YGerZHFyFkhcPI_f8KFUsuR-cV6K-cYbksJmpfp0801IpV5NPQGYYA>
    <xmx:YGerZG_cctvxLxJKnax7Jkd9-DXoWuZFeEvVMnEJSa8sVF8WYR6QuQ>
    <xmx:YGerZNM0FgPrh8hIY-M0x4zNj4qPd5Pe1a9f4C8WhEw4zKfkS_WL-w>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jul 2023 22:05:18 -0400 (EDT)
Message-ID: <236bbf5a-189b-6161-72a4-6beb435f10de@themaw.net>
Date:   Mon, 10 Jul 2023 10:05:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
To:     Salvatore Bonaccorso <carnil@debian.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc:     autofs@vger.kernel.org, Mike Gabriel <sunweaver@debian.org>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <ZKrKz/QYjPSmMcts@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 9/7/23 22:57, Salvatore Bonaccorso wrote:
> Hi
>
> The following sort of regression was noticed while updating a client
> running Debian buster (with autofs 5.1.2 based) to Debian bullseye
> (5.1.7 based autofs), but verified it's still present with 5.1.8. The
> folloing setup is present:
>
> There is a NFS server, dualstacked, with both public IPv4 and IPv6
> addresses resolvable in DNS. As I cannot put the public IPs here in
> the report, let's assume It is called nfs-server with addresses
> 192.168.122.188 and fc00:192:168:122::188.
>
> The client initially running Debian buster, is not dualstacked, has
> only IPv4 and has correct routing, e.g. pinging to nfs-server will as
> well go to the IPv4 address of nfs-server, or any tcp connection will
> go to IPv4 (e.g. ssh -vvv nfs-server).
>
> Automount configuration is fairly simple:
>
> auto.master:
> [...]
> /home            /etc/auto/homes01
> [...]
>
> and /etc/auto/homes01
> [...]
> * nfs-server:/srv/homes/homes01/&
> [...]
>
> (note in fact the real configuration is slightly more complex,
> nosuid,rw,hard,proto=tcp as options, but veried as wel stripping down the
> options, even dropping proto=tcp). I hope I correctly de-anonymized
> not messing up with paths in the logs below.
>
> After the update to autofs 5.1.7 based version there is a 10s delay on
> mounts from the servers.
>
> In the following logs I had to slightly deanonymize the names. But I
> think the delay problem is seen enough by the timestamps.
>
> Before the update, with autofs 5.1.2:
>
> Jul 09 11:54:41 clienthost automount[5143]: handle_packet: type = 3
> Jul 09 11:54:41 clienthost automount[5143]: handle_packet_missing_indirect: token 26, name username, request pid 5285
> Jul 09 11:54:41 clienthost automount[5143]: attempting to mount entry /home/username
> Jul 09 11:54:41 clienthost automount[5143]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
> Jul 09 11:54:41 clienthost automount[5143]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
> Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x30
> Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: nfs v3 rpc ping time: 0.000000
> Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: host nfs-server cost 0 weight 0
> Jul 09 11:54:41 clienthost automount[5143]: prune_host_list: selected subset of hosts that support NFS3 over TCP
> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mkdir_path /home/username
> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
> Jul 09 11:54:41 clienthost automount[5143]: dev_ioctl_send_ready: token = 26
> Jul 09 11:54:41 clienthost automount[5143]: mounted /home/username
>
> After the update to 5.1.7 (or 5.1.8):
>
> Jul 09 11:56:23 clienthost automount[6952]: handle_packet: type = 3
> Jul 09 11:56:23 clienthost automount[6952]: handle_packet_missing_indirect: token 33, name username, request pid 7104
> Jul 09 11:56:23 clienthost automount[6952]: attempting to mount entry /home/username
> Jul 09 11:56:23 clienthost automount[6952]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
> Jul 09 11:56:23 clienthost automount[6952]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
> Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
> Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
> Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x20
> Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: nfs v3 rpc ping time: 0.000184
> Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: host nfs-server cost 183 weight 0
> Jul 09 11:56:23 clienthost automount[6952]: prune_host_list: selected subset of hosts that support NFS3 over TCP
> Jul 09 11:56:23 clienthost automount[6952]: get_supported_ver_and_cost: called with host nfs-server(fc00:192:168:122::188) version 0x20
> Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: rpc ping time 0.000352
> Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: cost 352 weight 0
> Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): calling mkdir_path /home/username
> Jul 09 11:56:33 clienthost automount[6952]: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
> Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
> Jul 09 11:56:33 clienthost automount[6952]: dev_ioctl_send_ready: token = 33
> Jul 09 11:56:33 clienthost automount[6952]: mounted /home/username
>
> while first get_nfs_info is called again with host
> nfs-server(192.168.12.2188), there is a get_supported_ver_and_cost
> with the IPv6 address, hanging for 10s.

The later call timed out, it's timeout is 10 seconds for addresses

that look like they are on the local network so the IPv6 address is

not responding.


I know that 10 seconds is a bit long for interactive use, perhaps

it should be a bit less, but it's better than the 2 minutes we

would often see ...


I guess you are saying it should be responding ... not sure what

I can do about that, I will need to reproduce the problem and IPv6

is still not something I have a setup for easily available.


>
> If I just revert c578e5b37c3c ("autofs-5.1.5 - Fix NFS mount from IPv6
> addresses") then the mount is again quick, but logs an additional
>
> Jul 09 16:31:34 clienthost automount[12045]: check_address_proto: requested protocol does not match address
>
> so likely not the right fix.

That does raise some interesting alternatives though.

I'm not sure what the function check_address_proto() is seeing but it

essentially (in 5.1.8) says "if the rpc request is for IPv6 and the

host address length is not set to the length of an IPv6 address bail

out". So whatever is wrong there is probably still wrong just not

happening due to the check returning a fail.


If I can setup an environment I can check that out further but sounds

a bit suspicious. I can of course check the code to see if there's an

obvious setup mistake ...


>
> I suspect mounts from server, which are dualstacked, but route to them
> is only IPv4, are not correctly handled after 90532146bc0e
> ("autofs-5.1.3 - fix ipv6 proto option handling") and c578e5b37c3c
> ("autofs-5.1.5 - Fix NFS mount from IPv6 addresses").

I'm not sure that these changes affect the routing at all, at least

not due to autofs itself and the above is a proto TCP request so it

shouldn't be the server simply not responding ... not sure why it's

happening.


The difference between the first and second log traces looks like

dns lookup has returned two hosts in the second availability ping,

an IPv4 and an IPv6 address. Not sure why an IPv6 address isn't

present in the first availability ping.


It might also be that NFSv3 is being checked for availability rather

than IPv4. I've assumed that NFS v3 works over IPv6 ...


>
> (note the package in Debian *is* built with --with-libtirpc).
>
> Does any of the above make sense?

Sadly it does make sense but, as I say, I don't know what's causing

it.


Ian

