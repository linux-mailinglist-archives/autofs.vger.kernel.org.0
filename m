Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD9E750046
	for <lists+autofs@lfdr.de>; Wed, 12 Jul 2023 09:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjGLHln (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 12 Jul 2023 03:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjGLHlm (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 12 Jul 2023 03:41:42 -0400
X-Greylist: delayed 378 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Jul 2023 00:41:35 PDT
Received: from fregna.das-netzwerkteam.de (fregna.das-netzwerkteam.de [148.251.53.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A3D10D4
        for <autofs@vger.kernel.org>; Wed, 12 Jul 2023 00:41:35 -0700 (PDT)
Received: from grimnir.das-netzwerkteam.de (grimnir.das-netzwerkteam.de [IPv6:2a01:4f8:202:1381::105])
        by fregna.das-netzwerkteam.de (Postfix) with ESMTPS id 28CFB60494;
        Wed, 12 Jul 2023 07:35:16 +0000 (UTC)
Received: from das-netzwerkteam.de (localhost [127.0.0.1])
        by grimnir.das-netzwerkteam.de (Postfix) with ESMTP id 04DBAC0F53;
        Wed, 12 Jul 2023 09:35:16 +0200 (CEST)
Received: from [159.48.41.96] ([159.48.41.96]) by mail.das-netzwerkteam.de
 (Horde Framework) with HTTPS; Wed, 12 Jul 2023 07:35:15 +0000
Date:   Wed, 12 Jul 2023 07:35:15 +0000
Message-ID: <20230712073515.Horde.VGeXqhi-XAcvkpGKDcih9td@mail.das-netzwerkteam.de>
From:   Mike Gabriel <sunweaver@debian.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Salvatore Bonaccorso <carnil@debian.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
References: <236bbf5a-189b-6161-72a4-6beb435f10de@themaw.net>
 <ZKukDcZJPTp1wfCK@eldamar.lan>
 <6b0ef0a5-6136-a52f-ee68-c3ccd1ca1c70@themaw.net>
 <ZKvdiheYex3VSiqW@eldamar.lan>
 <c7bd0680-2a27-479c-2db2-1c99736c8a06@themaw.net>
 <ZKv8nVvu2clupWXb@elende.valinor.li>
 <808f187f-adbe-50e5-6ad4-9563b0b11cf5@themaw.net>
 <ec128c08-09fe-45a6-aa1f-9c5f88aee3cf@themaw.net>
 <ZKzoVAvktkcjwU36@eldamar.lan>
 <20230711060620.Horde.Z-zbcGrkdS6pwJtQqc3MxDv@mail.das-netzwerkteam.de>
 <ZK0FqQH3V1Bpo3Ho@eldamar.lan>
 <49c36a31-1077-fdc7-5d91-5e63e06b6a9e@themaw.net>
In-Reply-To: <49c36a31-1077-fdc7-5d91-5e63e06b6a9e@themaw.net>
User-Agent: Horde Application Framework 5
Accept-Language: de,en
Organization: DAS-NETZWERKTEAM
X-Originating-IP: 159.48.41.96
X-Remote-Browser: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML,
 like Gecko) Chrome/114.0.0.0 Safari/537.36
Content-Type: multipart/signed; boundary="=_MV4zXNc7II7VmabfLnEu-4W";
 protocol="application/pgp-signature"; micalg=pgp-sha512
MIME-Version: 1.0
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This message is in MIME format and has been PGP signed.

--=_MV4zXNc7II7VmabfLnEu-4W
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On  Mi 12 Jul 2023 04:09:18 CEST, Ian Kent wrote:

> On 11/7/23 15:32, Salvatore Bonaccorso wrote:
>> Hi Mike,
>>
>> On Tue, Jul 11, 2023 at 06:06:20AM +0000, Mike Gabriel wrote:
>>> Hi all,
>>>
>>> On  Di 11 Jul 2023 07:27:48 CEST, Salvatore Bonaccorso wrote:
>>>
>>>> Hi Ian,
>>>>
>>>> On Tue, Jul 11, 2023 at 01:13:06PM +0800, Ian Kent wrote:
>>>>> On 11/7/23 08:30, Ian Kent wrote:
>>>>>> On 10/7/23 20:42, Salvatore Bonaccorso wrote:
>>>>>>> Hi Ian,
>>>>>>>
>>>>>>> On Mon, Jul 10, 2023 at 07:11:09PM +0800, Ian Kent wrote:
>>>>>>>> On 10/7/23 18:29, Salvatore Bonaccorso wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On Mon, Jul 10, 2023 at 04:33:24PM +0800, Ian Kent wrote:
>>>>>>>>>> On 10/7/23 14:24, Salvatore Bonaccorso wrote:
>>>>>>>>>>> Hi Ian,
>>>>>>>>>>>
>>>>>>>>>>> On Mon, Jul 10, 2023 at 10:05:12AM +0800, Ian Kent wrote:
>>>>>>>>>>>> On 9/7/23 22:57, Salvatore Bonaccorso wrote:
>>>>>>>>>>>>> Hi
>>>>>>>>>>>>>
>>>>>>>>>>>>> The following sort of regression was noticed
>>>>>>>>>>>>> while updating a client
>>>>>>>>>>>>> running Debian buster (with autofs 5.1.2 based) to
>>>>> Debian bullseye
>>>>>>>>>>>>> (5.1.7 based autofs), but verified it's
>>>>>>>>>>>>> still present with 5.1.8. The
>>>>>>>>>>>>> folloing setup is present:
>>>>>>>>>>>>>
>>>>>>>>>>>>> There is a NFS server, dualstacked, with both public
>>>>> IPv4 and IPv6
>>>>>>>>>>>>> addresses resolvable in DNS. As I cannot put
>>>>>>>>>>>>> the public IPs here in
>>>>>>>>>>>>> the report, let's assume It is called nfs-server
>>>>> with addresses
>>>>>>>>>>>>> 192.168.122.188 and fc00:192:168:122::188.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The client initially running Debian buster,
>>>>>>>>>>>>> is not dualstacked, has
>>>>>>>>>>>>> only IPv4 and has correct routing, e.g.
>>>>>>>>>>>>> pinging to nfs-server will as
>>>>>>>>>>>>> well go to the IPv4 address of nfs-server,
>>>>>>>>>>>>> or any tcp connection will
>>>>>>>>>>>>> go to IPv4 (e.g. ssh -vvv nfs-server).
>>>>>>>>>>>>>
>>>>>>>>>>>>> Automount configuration is fairly simple:
>>>>>>>>>>>>>
>>>>>>>>>>>>> auto.master:
>>>>>>>>>>>>> [...]
>>>>>>>>>>>>> /home=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /etc/auto/homes01
>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>
>>>>>>>>>>>>> and /etc/auto/homes01
>>>>>>>>>>>>> [...]
>>>>>>>>>>>>> * nfs-server:/srv/homes/homes01/&
>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>
>>>>>>>>>>>>> (note in fact the real configuration is slightly
>>>>> more complex,
>>>>>>>>>>>>> nosuid,rw,hard,proto=3Dtcp as options, but
>>>>>>>>>>>>> veried as wel stripping down the
>>>>>>>>>>>>> options, even dropping proto=3Dtcp). I hope I
>>>>>>>>>>>>> correctly de-anonymized
>>>>>>>>>>>>> not messing up with paths in the logs below.
>>>>>>>>>>>>>
>>>>>>>>>>>>> After the update to autofs 5.1.7 based
>>>>>>>>>>>>> version there is a 10s delay on
>>>>>>>>>>>>> mounts from the servers.
>>>>>>>>>>>>>
>>>>>>>>>>>>> In the following logs I had to slightly
>>>>>>>>>>>>> deanonymize the names. But I
>>>>>>>>>>>>> think the delay problem is seen enough by the timestamps.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Before the update, with autofs 5.1.2:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> handle_packet: type =3D 3
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> handle_packet_missing_indirect: token 26,
>>>>>>>>>>>>> name username, request pid 5285
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> attempting to mount entry /home/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> lookup_mount: lookup(program): username ->
>>>>>>>>>>>>> -nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> parse_mount: parse(sun): expanded entry:
>>>>>>>>>>>>> -nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> parse_mount: parse(sun): gathered options:
>>>>>>>>>>>>> nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> parse_mount: parse(sun):
>>>>>>>>>>>>> dequote("nfs-server:/srv/homes/homes01/username")
>>>>>>>>>>>>> -> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> parse_mount: parse(sun): core of entry:
>>>>>>>>>>>>> options=3Dnosuid,rw,hard,proto=3Dtcp,
>>>>>>>>>>>>> loc=3Dnfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> sun_mount: parse(sun): mounting root /home,
>>>>>>>>>>>>> mountpoint username, what
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username,
>>>>>>>>>>>>> fstype nfs, options nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> mount_mount: mount(nfs): root=3D/home
>>>>>>>>>>>>> name=3Dusername
>>>>>>>>>>>>> what=3Dnfs-server:/srv/homes/homes01/username,
>>>>>>>>>>>>> fstype=3Dnfs, options=3Dnosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> mount_mount: mount(nfs): nfs
>>>>>>>>>>>>> options=3D"nosuid,rw,hard,proto=3Dtcp",
>>>>>>>>>>>>> nobind=3D0, nosymlink=3D0, ro=3D0
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> get_nfs_info: called with host
>>>>>>>>>>>>> nfs-server(192.168.122.188) proto 6 version
>>>>>>>>>>>>> 0x30
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> get_nfs_info: nfs v3 rpc ping time: 0.000000
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> get_nfs_info: host nfs-server cost 0 weight
>>>>>>>>>>>>>
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> prune_host_list: selected subset of hosts
>>>>>>>>>>>>> that support NFS3 over TCP
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> mount_mount: mount(nfs): calling mkdir_path
>>>>>>>>>>>>> /home/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> mount_mount: mount(nfs): calling mount -t
>>>>>>>>>>>>> nfs -s -o nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> /home/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> mount_mount: mount(nfs): mounted
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username on
>>>>>>>>>>>>> /home/username
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]:
>>>>>>>>>>>>> dev_ioctl_send_ready: token =3D 26
>>>>>>>>>>>>> Jul 09 11:54:41 clienthost automount[5143]: mounted
>>>>> /home/username
>>>>>>>>>>>>> After the update to 5.1.7 (or 5.1.8):
>>>>>>>>>>>>>
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> handle_packet: type =3D 3
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> handle_packet_missing_indirect: token 33,
>>>>>>>>>>>>> name username, request pid 7104
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> attempting to mount entry /home/username
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> lookup_mount: lookup(program): username ->
>>>>>>>>>>>>> -nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> parse_mount: parse(sun): expanded entry:
>>>>>>>>>>>>> -nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> parse_mount: parse(sun): gathered options:
>>>>>>>>>>>>> nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> parse_mount: parse(sun):
>>>>>>>>>>>>> dequote("nfs-server:/srv/homes/homes01/username")
>>>>>>>>>>>>> -> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> parse_mount: parse(sun): core of entry:
>>>>>>>>>>>>> options=3Dnosuid,rw,hard,proto=3Dtcp,
>>>>>>>>>>>>> loc=3Dnfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> sun_mount: parse(sun): mounting root /home,
>>>>>>>>>>>>> mountpoint username, what
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username,
>>>>>>>>>>>>> fstype nfs, options nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> mount(nfs): root=3D/home name=3Dusername
>>>>>>>>>>>>> what=3Dnfs-server:/srv/homes/homes01/username,
>>>>>>>>>>>>> fstype=3Dnfs, options=3Dnosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> mount(nfs): nfs
>>>>>>>>>>>>> options=3D"nosuid,rw,hard,proto=3Dtcp",
>>>>>>>>>>>>> nobind=3D0, nosymlink=3D0, ro=3D0
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> get_nfs_info: called with host
>>>>>>>>>>>>> nfs-server(192.168.122.188) proto 6 version
>>>>>>>>>>>>> 0x20
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> get_nfs_info: nfs v3 rpc ping time: 0.000184
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> get_nfs_info: host nfs-server cost 183
>>>>>>>>>>>>> weight 0
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> prune_host_list: selected subset of hosts
>>>>>>>>>>>>> that support NFS3 over TCP
>>>>>>>>>>>>> Jul 09 11:56:23 clienthost automount[6952]:
>>>>>>>>>>>>> get_supported_ver_and_cost: called with host
>>>>>>>>>>>>> nfs-server(fc00:192:168:122::188) version
>>>>>>>>>>>>> 0x20
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]:
>>>>>>>>>>>>> get_supported_ver_and_cost: rpc ping time
>>>>>>>>>>>>> 0.000352
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]:
>>>>>>>>>>>>> get_supported_ver_and_cost: cost 352 weight
>>>>>>>>>>>>>
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]:
>>>>>>>>>>>>> mount_mount: mount(nfs): calling mkdir_path
>>>>>>>>>>>>> /home/username
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]:
>>>>>>>>>>>>> mount(nfs): calling mount -t nfs -s -o
>>>>>>>>>>>>> nosuid,rw,hard,proto=3Dtcp
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username
>>>>>>>>>>>>> /home/username
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]:
>>>>>>>>>>>>> mount_mount: mount(nfs): mounted
>>>>>>>>>>>>> nfs-server:/srv/homes/homes01/username on
>>>>>>>>>>>>> /home/username
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]:
>>>>>>>>>>>>> dev_ioctl_send_ready: token =3D 33
>>>>>>>>>>>>> Jul 09 11:56:33 clienthost automount[6952]: mounted
>>>>> /home/username
>>>>>>>>>>>>> while first get_nfs_info is called again with host
>>>>>>>>>>>>> nfs-server(192.168.12.2188), there is a
>>>>> get_supported_ver_and_cost
>>>>>>>>>>>>> with the IPv6 address, hanging for 10s.
>>>>>>>>>>>> The later call timed out, it's timeout is 10 seconds
>>>>> for addresses
>>>>>>>>>>>> that look like they are on the local network so the
>>>>> IPv6 address is
>>>>>>>>>>>> not responding.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I know that 10 seconds is a bit long for interactive
>>>>> use, perhaps
>>>>>>>>>>>> it should be a bit less, but it's better than the 2 minutes we
>>>>>>>>>>>>
>>>>>>>>>>>> would often see ...
>>>>>>>>>>> Yes fully understand. We got complaints from clients
>>>>> having to wait
>>>>>>>>>>> 10s for their homes to be mounted, this is how we
>>>>>>>>>>> start investigating
>>>>>>>>>>> it.
>>>>>>>>>>>
>>>>>>>>>>>> I guess you are saying it should be responding ... not
>>>>> sure what
>>>>>>>>>>>> I can do about that, I will need to reproduce the
>>>>> problem and IPv6
>>>>>>>>>>>> is still not something I have a setup for easily available.
>>>>>>>>>>> I'm not sure. I was actually surprised, given the
>>>>>>>>>>> Client is IPv4 only
>>>>>>>>>>> networking, that there was happing with the updated
>>>>> autofs actually
>>>>>>>>>>> a call to the IPv6 address.
>>>>>>>>>>>
>>>>>>>>>>>>> If I just revert c578e5b37c3c ("autofs-5.1.5
>>>>>>>>>>>>> - Fix NFS mount from IPv6
>>>>>>>>>>>>> addresses") then the mount is again quick, but logs
>>>>> an additional
>>>>>>>>>>>>> Jul 09 16:31:34 clienthost automount[12045]:
>>>>>>>>>>>>> check_address_proto: requested protocol does
>>>>>>>>>>>>> not match address
>>>>>>>>>>>>>
>>>>>>>>>>>>> so likely not the right fix.
>>>>>>>>>>>> That does raise some interesting alternatives though.
>>>>>>>>>>>>
>>>>>>>>>>>> I'm not sure what the function
>>>>>>>>>>>> check_address_proto() is seeing but it
>>>>>>>>>>>>
>>>>>>>>>>>> essentially (in 5.1.8) says "if the rpc request is for
>>>>> IPv6 and the
>>>>>>>>>>>> host address length is not set to the length of
>>>>>>>>>>>> an IPv6 address bail
>>>>>>>>>>>>
>>>>>>>>>>>> out". So whatever is wrong there is probably still
>>>>> wrong just not
>>>>>>>>>>>> happening due to the check returning a fail.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> If I can setup an environment I can check that
>>>>>>>>>>>> out further but sounds
>>>>>>>>>>>>
>>>>>>>>>>>> a bit suspicious. I can of course check the code
>>>>>>>>>>>> to see if there's an
>>>>>>>>>>>>
>>>>>>>>>>>> obvious setup mistake ...
>>>>>>>>>>> If I can provide any help in debugging this or you can
>>>>> give me hints
>>>>>>>>>>> what I can try let me know. I will need to release the
>>>>> client host
>>>>>>>>>>> soonish again to the customers, but will try to make a
>>>>> similar test
>>>>>>>>>>> client available for further testing.
>>>>>>>>>>>
>>>>>>>>>>>>> I suspect mounts from server, which are
>>>>>>>>>>>>> dualstacked, but route to them
>>>>>>>>>>>>> is only IPv4, are not correctly handled after 90532146bc0e
>>>>>>>>>>>>> ("autofs-5.1.3 - fix ipv6 proto option handling")
>>>>> and c578e5b37c3c
>>>>>>>>>>>>> ("autofs-5.1.5 - Fix NFS mount from IPv6 addresses").
>>>>>>>>>>>> I'm not sure that these changes affect the routing at
>>>>> all, at least
>>>>>>>>>>>> not due to autofs itself and the above is a proto TCP
>>>>> request so it
>>>>>>>>>>>> shouldn't be the server simply not responding ... not
>>>>> sure why it's
>>>>>>>>>>>> happening.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> The difference between the first and second log traces
>>>>> looks like
>>>>>>>>>>>> dns lookup has returned two hosts in the second
>>>>> availability ping,
>>>>>>>>>>>> an IPv4 and an IPv6 address. Not sure why an IPv6
>>>>> address isn't
>>>>>>>>>>>> present in the first availability ping.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> It might also be that NFSv3 is being checked for
>>>>>>>>>>>> availability rather
>>>>>>>>>>>>
>>>>>>>>>>>> than IPv4. I've assumed that NFS v3 works over IPv6 ...
>>>>>>>>>>> About NFsv3: This is actually independent, it is the
>>>>> same if I use
>>>>>>>>>>> NFSv4 (with -vers=3D4 option, which we have in the
>>>>> original setup, I
>>>>>>>>>>> just tried to strip down as many options as possible for the
>>>>>>>>>>> reproducing case, though still not minimal, but we
>>>>>>>>>>> can actually ommint
>>>>>>>>>>> any of the options).
>>>>>>>>>>>
>>>>>>>>>>>>> (note the package in Debian *is* built with
>>>>> --with-libtirpc).
>>>>>>>>>>>>> Does any of the above make sense?
>>>>>>>>>>>> Sadly it does make sense but, as I say, I don't know
>>>>> what's causing
>>>>>>>>>>>> it.
>>>>>>>>>>> Ok. Again I'm eager to help as much as possible to
>>>>>>>>>>> pinpoint the issue,
>>>>>>>>>>> but might need some hints what I should/can try to isolate the
>>>>>>>>>>> problem. Are there potential missconficuration on client
>>>>> side which
>>>>>>>>>>> cause us problem for autofs in this setup?
>>>>>>>>>> This sounds a bit strange because above you mentioned the
>>>>> environment
>>>>>>>>>> is IPv4 so the curious thing is where is that IPv6
>>>>>>>>>> address even coming
>>>>>>>>>>
>>>>>>>>>> from. Those addresses are coming from glibc so it's DNS
>>>>>>>>>> or a hosts file.
>>>>>>>>> The environment is equipped to be able to do dual stack, and in f=
act
>>>>>>>>> the nfs-server has both IPv4 and IPv6.
>>>>>>>>>
>>>>>>>>> The particular client is though only equipped with IPv4 address.
>>>>>>>>>
>>>>>>>>> For the nfs-server both IPv4 and IPv6 addresses are both in
>>>>> DNS and as
>>>>>>>>> well locally on every hosts in /etc/hosts file deployed via
>>>>>>>>> configuration managment.
>>>>>>>>>
>>>>>>>>> So both resolvable even from the client, but the client reaches t=
he
>>>>>>>>> server only via IPv4.
>>>>>>>> I was able to use a real IPv6 address and the ping works just fine=
.
>>>>>>>>
>>>>>>>>
>>>>>>>> So it seems that the bug is actually that I try an IPv6 address at
>>>>>>>>
>>>>>>>> all on an IPv4 only node.
>>>>>>>>
>>>>>>>>
>>>>>>>> It would be useful to know if there's an IPv6 address assigned to
>>>>>>>>
>>>>>>>> the network interface on the customer machine (even if it's the
>>>>>>>>
>>>>>>>> link-local address) so I know what to expect. You would think that
>>>>>>>>
>>>>>>>> trying to send an IPv6 packet on an interface not configured to do
>>>>>>>>
>>>>>>>> so would return an error not just timeout on connecting ...
>>>>>>> Yes this is the case, on the given interface there is the link-loca=
l
>>>>>>> address assigned:
>>>>>>>
>>>>>>> 7: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc
>>>>>>> noqueue state UP group default qlen 1000
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 link/ether d8:5e:d3:8f:5d:94 brd ff:ff:ff:=
ff:ff:ff
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 inet 192.168.122.220/24 brd 192.168.122.25=
5 scope global bond0
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valid_lft forever prefer=
red_lft forever
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 inet6 fe80::da5e:d3ff:fe8f:5d94/64 scope l=
ink
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valid_lft forever prefer=
red_lft forever
>>>>>> Oh cool, I was concerned there was a real IPv6 address on the interf=
ace
>>>>>>
>>>>>> but then IPv6 could be used for communication.
>>>>>>
>>>>>>
>>>>>> I have always thought that the link-local address should be usable f=
or
>>>>>>
>>>>>> local communication but I've always had trouble using them, don't kn=
ow
>>>>>>
>>>>>> why.
>>>>>>
>>>>>>
>>>>>> It seems to me then that if an interface doesn't have an IPv6 addres=
s
>>>>>>
>>>>>> (excluding the link-local address in this case) then an IPv6 address
>>>>>>
>>>>>> seen via DNS should excluded from the proximity calculation (since i=
t
>>>>>>
>>>>>> would not be reachable via that interface) and consequently excluded
>>>>>>
>>>>>> when constructing the list of addresses to be probed.
>>>>>>
>>>>>>
>>>>>> Let me see if I can set things up to test this locally.
>>>>> So I sent a patch out but forgot to add a cover letter to talk about =
a
>>>>>
>>>>> couple of things and didn't cc the list either ...
>>>>>
>>>>>
>>>>> Hopefully you get the patch.
>>>>>
>>>>>
>>>>> It won't apply cleanly, at the least you'll need to ignore the hunk
>>>>>
>>>>> to CHANGELOG.
>>>>>
>>>>>
>>>>> Let me know if you get the patch and if you have any problems applyin=
g
>>>>>
>>>>> it that aren't straight forward to resolve.
>>>> Thank you, the patch just arrived to me and will test it accordingly
>>>> and report back.
>>>>
>>>> Thanks for taking the time for investigating this issue!
>>>>
>>>> Should the patch be resent as well to autofs@vger.kernel.org for
>>>> completeness?
>>>>
>>>> Regards,
>>>> Salvatore
>>> @Salvatore: let me know if the tests go well. If so, I can do an upload
>>> possibly before my VAC (starting next Friday).
>>>
>>> I can also do another bookworm-pu for including this. Is autofs 5.1.7
>>> (bullseye) also affected? Would that need a bullseye-pu, as well?
>> Just reported back the testing to Ian.
>>
>> It would be great, once Ian has confirmed and is going to apply
>> upstream, if you can apply the patch in Debian as well down back to
>> bullseye in fact. Let me know if you would appreciate or need help
>> with the whole.
>
> Hold back a little on applying it.
>
>
> There's a small fix in the existing patch I'd like to separate
>
> out so there will be two patches when I commit it. It was simpler
>
> to not do that initially.
>
>
> Give me a little time to recheck the changes and I'll post both
>
> patches to the list and then commit them after giving a little
>
> time for any further comments.
>
>
> Ian

I will be on VAC starting on Friday.

Salvatore, feel free to NMU (co-maintain) autofs and also do the b*-pu=20=
=20
uploads=20once I am gone. Otherwise, it will take 3-4 weeks for me to=20=20
get=20back to this.

Mike
--=20

mike=20gabriel aka sunweaver (Debian Developer)
mobile: +49 (1520) 1976 148
landline: +49 (4351) 486 14 27

GnuPG Fingerprint: 9BFB AEE8 6C0A A5FF BF22  0782 9AF4 6B30 2577 1B31
mail: sunweaver@debian.org, http://sunweavers.net


--=_MV4zXNc7II7VmabfLnEu-4W
Content-Type: application/pgp-signature
Content-Description: Digitale PGP-Signatur
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIzBAABCgAdFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmSuV7IACgkQmvRrMCV3
GzGotw//eZWnzNF7EpD2DwVwSPEy9LAO9dp9OneHQhmcLJm4uFo5KtZrp/K09oYd
alo92bfusMQFYN5veR9XXTjwQ0R2jHTPjCYwuGf+7eISkMVACNoS6Xr/uoIkT/3D
eFjwdAV+Fui/BWmE+eljstnCeHvTi3LFg4Kt/nL14C7aoy2SME0zJKoD91Z9vLUC
jwugZXCo/luPrfuSckxeImH7w9LPjxsGRUHRS7j8O+ShGQ6gN7x9UVSSQumeFvXr
/GKZNHQjhliUwlSWiRJT5wyF6gt7rg9mEO+f+hHDc7nnl6+VC8xZN0DmlODnujBg
ALEy5vcDybNFYDag6E7h6z6FXYaC9MbYdAlq6KVVws7SIlQawcUTnV6dFNC3S7/o
6gZtjLuERDdclNhKHCUbk0AjB31ky8ORPwVFuqZTYSrdGEiUiQgUwVDC+PQuYDOE
yJDD7/OTA0vpmd+SpGEXD5iiyJahwzxjBAYfa9FG4jvJ4gxWnx/wi8m0iAVsDv+t
9xvDzfsfc+Lch8zvBcF8OV6uXZHMsrGeRnPX4cRKB8B6sAGewkq1uRHFKJUhF/NW
14HEhFfYSHTUxcYvPMjXRkxpnXPuZIaEl7tZWpI329U39NhtGCyZhelF9K334sV5
pXj7TDaa8jH1qBb2PiTBc1P5z7ZO0HZdAtUAz9rUXAah8rL03qE=
=s3mD
-----END PGP SIGNATURE-----

--=_MV4zXNc7II7VmabfLnEu-4W--

