Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9560374D450
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 13:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjGJLLT (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 10 Jul 2023 07:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjGJLLS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 10 Jul 2023 07:11:18 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC20E1
        for <autofs@vger.kernel.org>; Mon, 10 Jul 2023 04:11:16 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A5CF0320076F;
        Mon, 10 Jul 2023 07:11:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 10 Jul 2023 07:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1688987475; x=1689073875; bh=RwWzkxO/WSD1ZKc8hzUalNQYB4ijQ/0pND5
        ODbCvQxI=; b=Xr8/UjFOgFGaCB29vVbIa+D4Ryz3CU8gbvTARWPKDF03GtoHlsV
        neD5jJ7EPfMHcA/yajxm72IrUyYzxt5PeQ9huuLNNxADn4AN05onlRaDqbsPyLMq
        /ftXopF6v45nLzGYg733IUDzuZCQSuSeSfdVFOD+0CC8xx5hMx+aa3RkcJg1Iy/b
        0xpZkKgUxvT4CjrfJ0sXnBQkBuyzyQWTzokF2rQD8NIklPGcCAJ2yHqAfOzCkAY2
        JWn4ZSVNfN+d423uNAudpnqccVajQuArzAh63LEJPV5y2E9Qh//YsGvJvf2YOLL1
        gD3JMnRZ2/eM52y/ESpN+yQDm81xmDEhdsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1688987475; x=1689073875; bh=RwWzkxO/WSD1ZKc8hzUalNQYB4ijQ/0pND5
        ODbCvQxI=; b=JcardkcohkGn3u+2DAr/8hYmwCllhkGCKUlgxj91IeaOEk4S4UC
        VWs4E9yDSYxMRwiCZS5/3M/Ob4oNok5iQWjWobJZ17MjVef44MAX043TXkO9b4ZH
        KE9ZzsCB/EWyGeE0Pu7p1WpsAPXbCgDNfQxEZAa1V7Y959OxG/wTuy3sPJ9UDrxm
        GGz5EWccQjC2EPcd6fWlG+9Di3AXr0yhfvayJxeRfrok9aUaMiztZTIfelaNApeh
        3SREDX8+iSaRpzT7WTe1iAZW/W3PNh1C0NWN2EkNc6UFw+PobRwlBQPtmT+AWYnZ
        tvkB4nY6Mfayxg2fVH0Pr76ZmXWlZeHWD/Q==
X-ME-Sender: <xms:UuerZHpmclPy8S9ej4EIJmx2xAQLPJoWHohOXmAahd67UXIknipizw>
    <xme:UuerZBpaNdyQ1nzSps_vb_oUnuMDA-YV0PZu6mrLY4ua1goK-b-Di_4NKAaUMqHKX
    MwkGiXals7g>
X-ME-Received: <xmr:UuerZEMRA0Vn1pTkhFBrTmSdT5m-3MbRge9oLUI-TIGalOmmGGZTjluoAk75aZWRW3jBo6oxXDwDXeO6UAJbcf2x7R3QOZqyDk2Kn-NL20sXWCioPQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdekgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    euhfeuieeijeeuveekgfeitdethefguddtleffhfelfeelhfduuedvfefhgefhheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:UuerZK73d2ysruihLNdQCB0EXBYPOdwwRcdCl7_Wqeh5aps1uegLtw>
    <xmx:UuerZG6NRmwKlHpRJxMUbwzigu001Oe2nELza4R4lDoUkcVL0LTs2w>
    <xmx:UuerZCioacPEWy-nzvivQr1RNJSJZjvw6xPwaG63myu8o5nK0rG4jQ>
    <xmx:U-erZMQKyXeeD6-ZX1YHnZ3PyLwUl9G_uIMmIREvzNj5owPMIAfGfg>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jul 2023 07:11:12 -0400 (EDT)
Message-ID: <c7bd0680-2a27-479c-2db2-1c99736c8a06@themaw.net>
Date:   Mon, 10 Jul 2023 19:11:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
Content-Language: en-US
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org,
        Mike Gabriel <sunweaver@debian.org>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
 <236bbf5a-189b-6161-72a4-6beb435f10de@themaw.net>
 <ZKukDcZJPTp1wfCK@eldamar.lan>
 <6b0ef0a5-6136-a52f-ee68-c3ccd1ca1c70@themaw.net>
 <ZKvdiheYex3VSiqW@eldamar.lan>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <ZKvdiheYex3VSiqW@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 10/7/23 18:29, Salvatore Bonaccorso wrote:
> Hi,
>
> On Mon, Jul 10, 2023 at 04:33:24PM +0800, Ian Kent wrote:
>> On 10/7/23 14:24, Salvatore Bonaccorso wrote:
>>> Hi Ian,
>>>
>>> On Mon, Jul 10, 2023 at 10:05:12AM +0800, Ian Kent wrote:
>>>> On 9/7/23 22:57, Salvatore Bonaccorso wrote:
>>>>> Hi
>>>>>
>>>>> The following sort of regression was noticed while updating a client
>>>>> running Debian buster (with autofs 5.1.2 based) to Debian bullseye
>>>>> (5.1.7 based autofs), but verified it's still present with 5.1.8. The
>>>>> folloing setup is present:
>>>>>
>>>>> There is a NFS server, dualstacked, with both public IPv4 and IPv6
>>>>> addresses resolvable in DNS. As I cannot put the public IPs here in
>>>>> the report, let's assume It is called nfs-server with addresses
>>>>> 192.168.122.188 and fc00:192:168:122::188.
>>>>>
>>>>> The client initially running Debian buster, is not dualstacked, has
>>>>> only IPv4 and has correct routing, e.g. pinging to nfs-server will as
>>>>> well go to the IPv4 address of nfs-server, or any tcp connection will
>>>>> go to IPv4 (e.g. ssh -vvv nfs-server).
>>>>>
>>>>> Automount configuration is fairly simple:
>>>>>
>>>>> auto.master:
>>>>> [...]
>>>>> /home            /etc/auto/homes01
>>>>> [...]
>>>>>
>>>>> and /etc/auto/homes01
>>>>> [...]
>>>>> * nfs-server:/srv/homes/homes01/&
>>>>> [...]
>>>>>
>>>>> (note in fact the real configuration is slightly more complex,
>>>>> nosuid,rw,hard,proto=tcp as options, but veried as wel stripping down the
>>>>> options, even dropping proto=tcp). I hope I correctly de-anonymized
>>>>> not messing up with paths in the logs below.
>>>>>
>>>>> After the update to autofs 5.1.7 based version there is a 10s delay on
>>>>> mounts from the servers.
>>>>>
>>>>> In the following logs I had to slightly deanonymize the names. But I
>>>>> think the delay problem is seen enough by the timestamps.
>>>>>
>>>>> Before the update, with autofs 5.1.2:
>>>>>
>>>>> Jul 09 11:54:41 clienthost automount[5143]: handle_packet: type = 3
>>>>> Jul 09 11:54:41 clienthost automount[5143]: handle_packet_missing_indirect: token 26, name username, request pid 5285
>>>>> Jul 09 11:54:41 clienthost automount[5143]: attempting to mount entry /home/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
>>>>> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
>>>>> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
>>>>> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
>>>>> Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x30
>>>>> Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: nfs v3 rpc ping time: 0.000000
>>>>> Jul 09 11:54:41 clienthost automount[5143]: get_nfs_info: host nfs-server cost 0 weight 0
>>>>> Jul 09 11:54:41 clienthost automount[5143]: prune_host_list: selected subset of hosts that support NFS3 over TCP
>>>>> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mkdir_path /home/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
>>>>> Jul 09 11:54:41 clienthost automount[5143]: dev_ioctl_send_ready: token = 26
>>>>> Jul 09 11:54:41 clienthost automount[5143]: mounted /home/username
>>>>>
>>>>> After the update to 5.1.7 (or 5.1.8):
>>>>>
>>>>> Jul 09 11:56:23 clienthost automount[6952]: handle_packet: type = 3
>>>>> Jul 09 11:56:23 clienthost automount[6952]: handle_packet_missing_indirect: token 33, name username, request pid 7104
>>>>> Jul 09 11:56:23 clienthost automount[6952]: attempting to mount entry /home/username
>>>>> Jul 09 11:56:23 clienthost automount[6952]: lookup_mount: lookup(program): username -> -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): expanded entry: -nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): gathered options: nosuid,rw,hard,proto=tcp
>>>>> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): dequote("nfs-server:/srv/homes/homes01/username") -> nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:56:23 clienthost automount[6952]: parse_mount: parse(sun): core of entry: options=nosuid,rw,hard,proto=tcp, loc=nfs-server:/srv/homes/homes01/username
>>>>> Jul 09 11:56:23 clienthost automount[6952]: sun_mount: parse(sun): mounting root /home, mountpoint username, what nfs-server:/srv/homes/homes01/username, fstype nfs, options nosuid,rw,hard,proto=tcp
>>>>> Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): root=/home name=username what=nfs-server:/srv/homes/homes01/username, fstype=nfs, options=nosuid,rw,hard,proto=tcp
>>>>> Jul 09 11:56:23 clienthost automount[6952]: mount(nfs): nfs options="nosuid,rw,hard,proto=tcp", nobind=0, nosymlink=0, ro=0
>>>>> Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: called with host nfs-server(192.168.122.188) proto 6 version 0x20
>>>>> Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: nfs v3 rpc ping time: 0.000184
>>>>> Jul 09 11:56:23 clienthost automount[6952]: get_nfs_info: host nfs-server cost 183 weight 0
>>>>> Jul 09 11:56:23 clienthost automount[6952]: prune_host_list: selected subset of hosts that support NFS3 over TCP
>>>>> Jul 09 11:56:23 clienthost automount[6952]: get_supported_ver_and_cost: called with host nfs-server(fc00:192:168:122::188) version 0x20
>>>>> Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: rpc ping time 0.000352
>>>>> Jul 09 11:56:33 clienthost automount[6952]: get_supported_ver_and_cost: cost 352 weight 0
>>>>> Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): calling mkdir_path /home/username
>>>>> Jul 09 11:56:33 clienthost automount[6952]: mount(nfs): calling mount -t nfs -s -o nosuid,rw,hard,proto=tcp nfs-server:/srv/homes/homes01/username /home/username
>>>>> Jul 09 11:56:33 clienthost automount[6952]: mount_mount: mount(nfs): mounted nfs-server:/srv/homes/homes01/username on /home/username
>>>>> Jul 09 11:56:33 clienthost automount[6952]: dev_ioctl_send_ready: token = 33
>>>>> Jul 09 11:56:33 clienthost automount[6952]: mounted /home/username
>>>>>
>>>>> while first get_nfs_info is called again with host
>>>>> nfs-server(192.168.12.2188), there is a get_supported_ver_and_cost
>>>>> with the IPv6 address, hanging for 10s.
>>>> The later call timed out, it's timeout is 10 seconds for addresses
>>>>
>>>> that look like they are on the local network so the IPv6 address is
>>>>
>>>> not responding.
>>>>
>>>>
>>>> I know that 10 seconds is a bit long for interactive use, perhaps
>>>>
>>>> it should be a bit less, but it's better than the 2 minutes we
>>>>
>>>> would often see ...
>>> Yes fully understand. We got complaints from clients having to wait
>>> 10s for their homes to be mounted, this is how we start investigating
>>> it.
>>>
>>>> I guess you are saying it should be responding ... not sure what
>>>>
>>>> I can do about that, I will need to reproduce the problem and IPv6
>>>>
>>>> is still not something I have a setup for easily available.
>>> I'm not sure. I was actually surprised, given the Client is IPv4 only
>>> networking, that there was happing with the updated autofs actually
>>> a call to the IPv6 address.
>>>
>>>>> If I just revert c578e5b37c3c ("autofs-5.1.5 - Fix NFS mount from IPv6
>>>>> addresses") then the mount is again quick, but logs an additional
>>>>>
>>>>> Jul 09 16:31:34 clienthost automount[12045]: check_address_proto: requested protocol does not match address
>>>>>
>>>>> so likely not the right fix.
>>>> That does raise some interesting alternatives though.
>>>>
>>>> I'm not sure what the function check_address_proto() is seeing but it
>>>>
>>>> essentially (in 5.1.8) says "if the rpc request is for IPv6 and the
>>>>
>>>> host address length is not set to the length of an IPv6 address bail
>>>>
>>>> out". So whatever is wrong there is probably still wrong just not
>>>>
>>>> happening due to the check returning a fail.
>>>>
>>>>
>>>> If I can setup an environment I can check that out further but sounds
>>>>
>>>> a bit suspicious. I can of course check the code to see if there's an
>>>>
>>>> obvious setup mistake ...
>>> If I can provide any help in debugging this or you can give me hints
>>> what I can try let me know. I will need to release the client host
>>> soonish again to the customers, but will try to make a similar test
>>> client available for further testing.
>>>
>>>>> I suspect mounts from server, which are dualstacked, but route to them
>>>>> is only IPv4, are not correctly handled after 90532146bc0e
>>>>> ("autofs-5.1.3 - fix ipv6 proto option handling") and c578e5b37c3c
>>>>> ("autofs-5.1.5 - Fix NFS mount from IPv6 addresses").
>>>> I'm not sure that these changes affect the routing at all, at least
>>>>
>>>> not due to autofs itself and the above is a proto TCP request so it
>>>>
>>>> shouldn't be the server simply not responding ... not sure why it's
>>>>
>>>> happening.
>>>>
>>>>
>>>> The difference between the first and second log traces looks like
>>>>
>>>> dns lookup has returned two hosts in the second availability ping,
>>>>
>>>> an IPv4 and an IPv6 address. Not sure why an IPv6 address isn't
>>>>
>>>> present in the first availability ping.
>>>>
>>>>
>>>> It might also be that NFSv3 is being checked for availability rather
>>>>
>>>> than IPv4. I've assumed that NFS v3 works over IPv6 ...
>>> About NFsv3: This is actually independent, it is the same if I use
>>> NFSv4 (with -vers=4 option, which we have in the original setup, I
>>> just tried to strip down as many options as possible for the
>>> reproducing case, though still not minimal, but we can actually ommint
>>> any of the options).
>>>
>>>>> (note the package in Debian *is* built with --with-libtirpc).
>>>>>
>>>>> Does any of the above make sense?
>>>> Sadly it does make sense but, as I say, I don't know what's causing
>>>>
>>>> it.
>>> Ok. Again I'm eager to help as much as possible to pinpoint the issue,
>>> but might need some hints what I should/can try to isolate the
>>> problem. Are there potential missconficuration on client side which
>>> cause us problem for autofs in this setup?
>> This sounds a bit strange because above you mentioned the environment
>>
>> is IPv4 so the curious thing is where is that IPv6 address even coming
>>
>> from. Those addresses are coming from glibc so it's DNS or a hosts file.
> The environment is equipped to be able to do dual stack, and in fact
> the nfs-server has both IPv4 and IPv6.
>
> The particular client is though only equipped with IPv4 address.
>
> For the nfs-server both IPv4 and IPv6 addresses are both in DNS and as
> well locally on every hosts in /etc/hosts file deployed via
> configuration managment.
>
> So both resolvable even from the client, but the client reaches the
> server only via IPv4.

I was able to use a real IPv6 address and the ping works just fine.


So it seems that the bug is actually that I try an IPv6 address at

all on an IPv4 only node.


It would be useful to know if there's an IPv6 address assigned to

the network interface on the customer machine (even if it's the

link-local address) so I know what to expect. You would think that

trying to send an IPv6 packet on an interface not configured to do

so would return an error not just timeout on connecting ...


I'll need to think about a sensible way to detect that, maybe there

was something in the earlier version (but I don't think so), so I'll

have a look around.


Ian

