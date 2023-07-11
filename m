Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E562B74E6E5
	for <lists+autofs@lfdr.de>; Tue, 11 Jul 2023 08:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjGKGLk (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 11 Jul 2023 02:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGKGLk (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 11 Jul 2023 02:11:40 -0400
X-Greylist: delayed 310 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 10 Jul 2023 23:11:35 PDT
Received: from fregna.das-netzwerkteam.de (fregna.das-netzwerkteam.de [148.251.53.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41C91A4
        for <autofs@vger.kernel.org>; Mon, 10 Jul 2023 23:11:35 -0700 (PDT)
Received: from grimnir.das-netzwerkteam.de (grimnir.das-netzwerkteam.de [IPv6:2a01:4f8:202:1381::105])
        by fregna.das-netzwerkteam.de (Postfix) with ESMTPS id 1BAAA6022B;
        Tue, 11 Jul 2023 06:06:21 +0000 (UTC)
Received: from das-netzwerkteam.de (localhost [127.0.0.1])
        by grimnir.das-netzwerkteam.de (Postfix) with ESMTP id EBC83C00DC;
        Tue, 11 Jul 2023 08:06:20 +0200 (CEST)
Received: from [159.48.41.96] ([159.48.41.96]) by mail.das-netzwerkteam.de
 (Horde Framework) with HTTPS; Tue, 11 Jul 2023 06:06:20 +0000
Date:   Tue, 11 Jul 2023 06:06:20 +0000
Message-ID: <20230711060620.Horde.Z-zbcGrkdS6pwJtQqc3MxDv@mail.das-netzwerkteam.de>
From:   Mike Gabriel <sunweaver@debian.org>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Ian Kent <raven@themaw.net>, Goldwyn Rodrigues <rgoldwyn@suse.de>,
        autofs@vger.kernel.org
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
 <236bbf5a-189b-6161-72a4-6beb435f10de@themaw.net>
 <ZKukDcZJPTp1wfCK@eldamar.lan>
 <6b0ef0a5-6136-a52f-ee68-c3ccd1ca1c70@themaw.net>
 <ZKvdiheYex3VSiqW@eldamar.lan>
 <c7bd0680-2a27-479c-2db2-1c99736c8a06@themaw.net>
 <ZKv8nVvu2clupWXb@elende.valinor.li>
 <808f187f-adbe-50e5-6ad4-9563b0b11cf5@themaw.net>
 <ec128c08-09fe-45a6-aa1f-9c5f88aee3cf@themaw.net>
 <ZKzoVAvktkcjwU36@eldamar.lan>
In-Reply-To: <ZKzoVAvktkcjwU36@eldamar.lan>
User-Agent: Horde Application Framework 5
Accept-Language: de,en
Organization: DAS-NETZWERKTEAM
X-Originating-IP: 159.48.41.96
X-Remote-Browser: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML,
 like Gecko) Chrome/114.0.0.0 Safari/537.36
Content-Type: multipart/signed; boundary="=_NTZdOKgge9x0sLesm_tmxo2";
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

--=_NTZdOKgge9x0sLesm_tmxo2
Content-Type: text/plain; charset=iso-8859-1; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On  Di 11 Jul 2023 07:27:48 CEST, Salvatore Bonaccorso wrote:

> Hi Ian,
>
> On Tue, Jul 11, 2023 at 01:13:06PM +0800, Ian Kent wrote:
>> On 11/7/23 08:30, Ian Kent wrote:
>> > On 10/7/23 20:42, Salvatore Bonaccorso wrote:
>> > > Hi Ian,
>> > >
>> > > On Mon, Jul 10, 2023 at 07:11:09PM +0800, Ian Kent wrote:
>> > > > On 10/7/23 18:29, Salvatore Bonaccorso wrote:
>> > > > > Hi,
>> > > > >
>> > > > > On Mon, Jul 10, 2023 at 04:33:24PM +0800, Ian Kent wrote:
>> > > > > > On 10/7/23 14:24, Salvatore Bonaccorso wrote:
>> > > > > > > Hi Ian,
>> > > > > > >
>> > > > > > > On Mon, Jul 10, 2023 at 10:05:12AM +0800, Ian Kent wrote:
>> > > > > > > > On 9/7/23 22:57, Salvatore Bonaccorso wrote:
>> > > > > > > > > Hi
>> > > > > > > > >
>> > > > > > > > > The following sort of regression was noticed
>> > > > > > > > > while updating a client
>> > > > > > > > > running Debian buster (with autofs 5.1.2 based) to=20=20
>>=20Debian bullseye
>> > > > > > > > > (5.1.7 based autofs), but verified it's
>> > > > > > > > > still present with 5.1.8. The
>> > > > > > > > > folloing setup is present:
>> > > > > > > > >
>> > > > > > > > > There is a NFS server, dualstacked, with both=20=20
>>=20public IPv4 and IPv6
>> > > > > > > > > addresses resolvable in DNS. As I cannot put
>> > > > > > > > > the public IPs here in
>> > > > > > > > > the report, let's assume It is called nfs-server=20=20
>>=20with addresses
>> > > > > > > > > 192.168.122.188 and fc00:192:168:122::188.
>> > > > > > > > >
>> > > > > > > > > The client initially running Debian buster,
>> > > > > > > > > is not dualstacked, has
>> > > > > > > > > only IPv4 and has correct routing, e.g.
>> > > > > > > > > pinging to nfs-server will as
>> > > > > > > > > well go to the IPv4 address of nfs-server,
>> > > > > > > > > or any tcp connection will
>> > > > > > > > > go to IPv4 (e.g. ssh -vvv nfs-server).
>> > > > > > > > >
>> > > > > > > > > Automount configuration is fairly simple:
>> > > > > > > > >
>> > > > > > > > > auto.master:
>> > > > > > > > > [...]
>> > > > > > > > > /home=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /etc/auto/homes01
>> > > > > > > > > [...]
>> > > > > > > > >
>> > > > > > > > > and /etc/auto/homes01
>> > > > > > > > > [...]
>> > > > > > > > > * nfs-server:/srv/homes/homes01/&
>> > > > > > > > > [...]
>> > > > > > > > >
>> > > > > > > > > (note in fact the real configuration is slightly=20=20
>>=20more complex,
>> > > > > > > > > nosuid,rw,hard,proto=3Dtcp as options, but
>> > > > > > > > > veried as wel stripping down the
>> > > > > > > > > options, even dropping proto=3Dtcp). I hope I
>> > > > > > > > > correctly de-anonymized
>> > > > > > > > > not messing up with paths in the logs below.
>> > > > > > > > >
>> > > > > > > > > After the update to autofs 5.1.7 based
>> > > > > > > > > version there is a 10s delay on
>> > > > > > > > > mounts from the servers.
>> > > > > > > > >
>> > > > > > > > > In the following logs I had to slightly
>> > > > > > > > > deanonymize the names. But I
>> > > > > > > > > think the delay problem is seen enough by the timestamps=
.
>> > > > > > > > >
>> > > > > > > > > Before the update, with autofs 5.1.2:
>> > > > > > > > >
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > handle_packet: type =3D 3
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > handle_packet_missing_indirect: token 26,
>> > > > > > > > > name username, request pid 5285
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > attempting to mount entry /home/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > lookup_mount: lookup(program): username ->
>> > > > > > > > > -nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > nfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > parse_mount: parse(sun): expanded entry:
>> > > > > > > > > -nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > nfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > parse_mount: parse(sun): gathered options:
>> > > > > > > > > nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > parse_mount: parse(sun):
>> > > > > > > > > dequote("nfs-server:/srv/homes/homes01/username")
>> > > > > > > > > -> nfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > parse_mount: parse(sun): core of entry:
>> > > > > > > > > options=3Dnosuid,rw,hard,proto=3Dtcp,
>> > > > > > > > > loc=3Dnfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > sun_mount: parse(sun): mounting root /home,
>> > > > > > > > > mountpoint username, what
>> > > > > > > > > nfs-server:/srv/homes/homes01/username,
>> > > > > > > > > fstype nfs, options nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > mount_mount: mount(nfs): root=3D/home
>> > > > > > > > > name=3Dusername
>> > > > > > > > > what=3Dnfs-server:/srv/homes/homes01/username,
>> > > > > > > > > fstype=3Dnfs, options=3Dnosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > mount_mount: mount(nfs): nfs
>> > > > > > > > > options=3D"nosuid,rw,hard,proto=3Dtcp",
>> > > > > > > > > nobind=3D0, nosymlink=3D0, ro=3D0
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > get_nfs_info: called with host
>> > > > > > > > > nfs-server(192.168.122.188) proto 6 version
>> > > > > > > > > 0x30
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > get_nfs_info: nfs v3 rpc ping time: 0.000000
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > get_nfs_info: host nfs-server cost 0 weight
>> > > > > > > > > 0
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > prune_host_list: selected subset of hosts
>> > > > > > > > > that support NFS3 over TCP
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > mount_mount: mount(nfs): calling mkdir_path
>> > > > > > > > > /home/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > mount_mount: mount(nfs): calling mount -t
>> > > > > > > > > nfs -s -o nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > nfs-server:/srv/homes/homes01/username
>> > > > > > > > > /home/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > mount_mount: mount(nfs): mounted
>> > > > > > > > > nfs-server:/srv/homes/homes01/username on
>> > > > > > > > > /home/username
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]:
>> > > > > > > > > dev_ioctl_send_ready: token =3D 26
>> > > > > > > > > Jul 09 11:54:41 clienthost automount[5143]: mounted=20=
=20
>>=20/home/username
>> > > > > > > > >
>> > > > > > > > > After the update to 5.1.7 (or 5.1.8):
>> > > > > > > > >
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > handle_packet: type =3D 3
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > handle_packet_missing_indirect: token 33,
>> > > > > > > > > name username, request pid 7104
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > attempting to mount entry /home/username
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > lookup_mount: lookup(program): username ->
>> > > > > > > > > -nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > nfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > parse_mount: parse(sun): expanded entry:
>> > > > > > > > > -nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > nfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > parse_mount: parse(sun): gathered options:
>> > > > > > > > > nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > parse_mount: parse(sun):
>> > > > > > > > > dequote("nfs-server:/srv/homes/homes01/username")
>> > > > > > > > > -> nfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > parse_mount: parse(sun): core of entry:
>> > > > > > > > > options=3Dnosuid,rw,hard,proto=3Dtcp,
>> > > > > > > > > loc=3Dnfs-server:/srv/homes/homes01/username
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > sun_mount: parse(sun): mounting root /home,
>> > > > > > > > > mountpoint username, what
>> > > > > > > > > nfs-server:/srv/homes/homes01/username,
>> > > > > > > > > fstype nfs, options nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > mount(nfs): root=3D/home name=3Dusername
>> > > > > > > > > what=3Dnfs-server:/srv/homes/homes01/username,
>> > > > > > > > > fstype=3Dnfs, options=3Dnosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > mount(nfs): nfs
>> > > > > > > > > options=3D"nosuid,rw,hard,proto=3Dtcp",
>> > > > > > > > > nobind=3D0, nosymlink=3D0, ro=3D0
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > get_nfs_info: called with host
>> > > > > > > > > nfs-server(192.168.122.188) proto 6 version
>> > > > > > > > > 0x20
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > get_nfs_info: nfs v3 rpc ping time: 0.000184
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > get_nfs_info: host nfs-server cost 183
>> > > > > > > > > weight 0
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > prune_host_list: selected subset of hosts
>> > > > > > > > > that support NFS3 over TCP
>> > > > > > > > > Jul 09 11:56:23 clienthost automount[6952]:
>> > > > > > > > > get_supported_ver_and_cost: called with host
>> > > > > > > > > nfs-server(fc00:192:168:122::188) version
>> > > > > > > > > 0x20
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]:
>> > > > > > > > > get_supported_ver_and_cost: rpc ping time
>> > > > > > > > > 0.000352
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]:
>> > > > > > > > > get_supported_ver_and_cost: cost 352 weight
>> > > > > > > > > 0
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]:
>> > > > > > > > > mount_mount: mount(nfs): calling mkdir_path
>> > > > > > > > > /home/username
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]:
>> > > > > > > > > mount(nfs): calling mount -t nfs -s -o
>> > > > > > > > > nosuid,rw,hard,proto=3Dtcp
>> > > > > > > > > nfs-server:/srv/homes/homes01/username
>> > > > > > > > > /home/username
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]:
>> > > > > > > > > mount_mount: mount(nfs): mounted
>> > > > > > > > > nfs-server:/srv/homes/homes01/username on
>> > > > > > > > > /home/username
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]:
>> > > > > > > > > dev_ioctl_send_ready: token =3D 33
>> > > > > > > > > Jul 09 11:56:33 clienthost automount[6952]: mounted=20=
=20
>>=20/home/username
>> > > > > > > > >
>> > > > > > > > > while first get_nfs_info is called again with host
>> > > > > > > > > nfs-server(192.168.12.2188), there is a=20=20
>>=20get_supported_ver_and_cost
>> > > > > > > > > with the IPv6 address, hanging for 10s.
>> > > > > > > > The later call timed out, it's timeout is 10 seconds=20=20
>>=20for addresses
>> > > > > > > >
>> > > > > > > > that look like they are on the local network so the=20=20
>>=20IPv6 address is
>> > > > > > > >
>> > > > > > > > not responding.
>> > > > > > > >
>> > > > > > > >
>> > > > > > > > I know that 10 seconds is a bit long for interactive=20=20
>>=20use, perhaps
>> > > > > > > >
>> > > > > > > > it should be a bit less, but it's better than the 2 minute=
s we
>> > > > > > > >
>> > > > > > > > would often see ...
>> > > > > > > Yes fully understand. We got complaints from clients=20=20
>>=20having to wait
>> > > > > > > 10s for their homes to be mounted, this is how we
>> > > > > > > start investigating
>> > > > > > > it.
>> > > > > > >
>> > > > > > > > I guess you are saying it should be responding ...=20=20
>>=20not sure what
>> > > > > > > >
>> > > > > > > > I can do about that, I will need to reproduce the=20=20
>>=20problem and IPv6
>> > > > > > > >
>> > > > > > > > is still not something I have a setup for easily available=
.
>> > > > > > > I'm not sure. I was actually surprised, given the
>> > > > > > > Client is IPv4 only
>> > > > > > > networking, that there was happing with the updated=20=20
>>=20autofs actually
>> > > > > > > a call to the IPv6 address.
>> > > > > > >
>> > > > > > > > > If I just revert c578e5b37c3c ("autofs-5.1.5
>> > > > > > > > > - Fix NFS mount from IPv6
>> > > > > > > > > addresses") then the mount is again quick, but logs=20=
=20
>>=20an additional
>> > > > > > > > >
>> > > > > > > > > Jul 09 16:31:34 clienthost automount[12045]:
>> > > > > > > > > check_address_proto: requested protocol does
>> > > > > > > > > not match address
>> > > > > > > > >
>> > > > > > > > > so likely not the right fix.
>> > > > > > > > That does raise some interesting alternatives though.
>> > > > > > > >
>> > > > > > > > I'm not sure what the function
>> > > > > > > > check_address_proto() is seeing but it
>> > > > > > > >
>> > > > > > > > essentially (in 5.1.8) says "if the rpc request is=20=20
>>=20for IPv6 and the
>> > > > > > > >
>> > > > > > > > host address length is not set to the length of
>> > > > > > > > an IPv6 address bail
>> > > > > > > >
>> > > > > > > > out". So whatever is wrong there is probably still=20=20
>>=20wrong just not
>> > > > > > > >
>> > > > > > > > happening due to the check returning a fail.
>> > > > > > > >
>> > > > > > > >
>> > > > > > > > If I can setup an environment I can check that
>> > > > > > > > out further but sounds
>> > > > > > > >
>> > > > > > > > a bit suspicious. I can of course check the code
>> > > > > > > > to see if there's an
>> > > > > > > >
>> > > > > > > > obvious setup mistake ...
>> > > > > > > If I can provide any help in debugging this or you can=20=20
>>=20give me hints
>> > > > > > > what I can try let me know. I will need to release the=20=20
>>=20client host
>> > > > > > > soonish again to the customers, but will try to make a=20=20
>>=20similar test
>> > > > > > > client available for further testing.
>> > > > > > >
>> > > > > > > > > I suspect mounts from server, which are
>> > > > > > > > > dualstacked, but route to them
>> > > > > > > > > is only IPv4, are not correctly handled after 90532146bc=
0e
>> > > > > > > > > ("autofs-5.1.3 - fix ipv6 proto option handling")=20=20
>>=20and c578e5b37c3c
>> > > > > > > > > ("autofs-5.1.5 - Fix NFS mount from IPv6 addresses").
>> > > > > > > > I'm not sure that these changes affect the routing at=20=
=20
>>=20all, at least
>> > > > > > > >
>> > > > > > > > not due to autofs itself and the above is a proto TCP=20=
=20
>>=20request so it
>> > > > > > > >
>> > > > > > > > shouldn't be the server simply not responding ... not=20=
=20
>>=20sure why it's
>> > > > > > > >
>> > > > > > > > happening.
>> > > > > > > >
>> > > > > > > >
>> > > > > > > > The difference between the first and second log=20=20
>>=20traces looks like
>> > > > > > > >
>> > > > > > > > dns lookup has returned two hosts in the second=20=20
>>=20availability ping,
>> > > > > > > >
>> > > > > > > > an IPv4 and an IPv6 address. Not sure why an IPv6=20=20
>>=20address isn't
>> > > > > > > >
>> > > > > > > > present in the first availability ping.
>> > > > > > > >
>> > > > > > > >
>> > > > > > > > It might also be that NFSv3 is being checked for
>> > > > > > > > availability rather
>> > > > > > > >
>> > > > > > > > than IPv4. I've assumed that NFS v3 works over IPv6 ...
>> > > > > > > About NFsv3: This is actually independent, it is the=20=20
>>=20same if I use
>> > > > > > > NFSv4 (with -vers=3D4 option, which we have in the=20=20
>>=20original setup, I
>> > > > > > > just tried to strip down as many options as possible for the
>> > > > > > > reproducing case, though still not minimal, but we
>> > > > > > > can actually ommint
>> > > > > > > any of the options).
>> > > > > > >
>> > > > > > > > > (note the package in Debian *is* built with=20=20
>>=20--with-libtirpc).
>> > > > > > > > >
>> > > > > > > > > Does any of the above make sense?
>> > > > > > > > Sadly it does make sense but, as I say, I don't know=20=20
>>=20what's causing
>> > > > > > > >
>> > > > > > > > it.
>> > > > > > > Ok. Again I'm eager to help as much as possible to
>> > > > > > > pinpoint the issue,
>> > > > > > > but might need some hints what I should/can try to isolate t=
he
>> > > > > > > problem. Are there potential missconficuration on=20=20
>>=20client side which
>> > > > > > > cause us problem for autofs in this setup?
>> > > > > > This sounds a bit strange because above you mentioned the=20=
=20
>>=20environment
>> > > > > >
>> > > > > > is IPv4 so the curious thing is where is that IPv6
>> > > > > > address even coming
>> > > > > >
>> > > > > > from. Those addresses are coming from glibc so it's DNS
>> > > > > > or a hosts file.
>> > > > > The environment is equipped to be able to do dual stack, and in =
fact
>> > > > > the nfs-server has both IPv4 and IPv6.
>> > > > >
>> > > > > The particular client is though only equipped with IPv4 address.
>> > > > >
>> > > > > For the nfs-server both IPv4 and IPv6 addresses are both in=20=
=20
>>=20DNS and as
>> > > > > well locally on every hosts in /etc/hosts file deployed via
>> > > > > configuration managment.
>> > > > >
>> > > > > So both resolvable even from the client, but the client reaches =
the
>> > > > > server only via IPv4.
>> > > > I was able to use a real IPv6 address and the ping works just fine=
.
>> > > >
>> > > >
>> > > > So it seems that the bug is actually that I try an IPv6 address at
>> > > >
>> > > > all on an IPv4 only node.
>> > > >
>> > > >
>> > > > It would be useful to know if there's an IPv6 address assigned to
>> > > >
>> > > > the network interface on the customer machine (even if it's the
>> > > >
>> > > > link-local address) so I know what to expect. You would think that
>> > > >
>> > > > trying to send an IPv6 packet on an interface not configured to do
>> > > >
>> > > > so would return an error not just timeout on connecting ...
>> > > Yes this is the case, on the given interface there is the link-local
>> > > address assigned:
>> > >
>> > > 7: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc
>> > > noqueue state UP group default qlen 1000
>> > > =A0=A0=A0=A0 link/ether d8:5e:d3:8f:5d:94 brd ff:ff:ff:ff:ff:ff
>> > > =A0=A0=A0=A0 inet 192.168.122.220/24 brd 192.168.122.255 scope globa=
l bond0
>> > > =A0=A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
>> > > =A0=A0=A0=A0 inet6 fe80::da5e:d3ff:fe8f:5d94/64 scope link
>> > > =A0=A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
>> >
>> > Oh cool, I was concerned there was a real IPv6 address on the interfac=
e
>> >
>> > but then IPv6 could be used for communication.
>> >
>> >
>> > I have always thought that the link-local address should be usable for
>> >
>> > local communication but I've always had trouble using them, don't know
>> >
>> > why.
>> >
>> >
>> > It seems to me then that if an interface doesn't have an IPv6 address
>> >
>> > (excluding the link-local address in this case) then an IPv6 address
>> >
>> > seen via DNS should excluded from the proximity calculation (since it
>> >
>> > would not be reachable via that interface) and consequently excluded
>> >
>> > when constructing the list of addresses to be probed.
>> >
>> >
>> > Let me see if I can set things up to test this locally.
>>
>> So I sent a patch out but forgot to add a cover letter to talk about a
>>
>> couple of things and didn't cc the list either ...
>>
>>
>> Hopefully you get the patch.
>>
>>
>> It won't apply cleanly, at the least you'll need to ignore the hunk
>>
>> to CHANGELOG.
>>
>>
>> Let me know if you get the patch and if you have any problems applying
>>
>> it that aren't straight forward to resolve.
>
> Thank you, the patch just arrived to me and will test it accordingly
> and report back.
>
> Thanks for taking the time for investigating this issue!
>
> Should the patch be resent as well to autofs@vger.kernel.org for
> completeness?
>
> Regards,
> Salvatore

@Salvatore: let me know if the tests go well. If so, I can do an=20=20
upload=20possibly before my VAC (starting next Friday).

I can also do another bookworm-pu for including this. Is autofs 5.1.7=20=20
(bullseye)=20also affected? Would that need a bullseye-pu, as well?

Mike
--=20

mike=20gabriel aka sunweaver (Debian Developer)
mobile: +49 (1520) 1976 148
landline: +49 (4351) 486 14 27

GnuPG Fingerprint: 9BFB AEE8 6C0A A5FF BF22  0782 9AF4 6B30 2577 1B31
mail: sunweaver@debian.org, http://sunweavers.net


--=_NTZdOKgge9x0sLesm_tmxo2
Content-Type: application/pgp-signature
Content-Description: Digitale PGP-Signatur
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIzBAABCgAdFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmSs8VsACgkQmvRrMCV3
GzEcQw/+NqODdzTUlNl+CN71TI1IRaGfqRWeJD9iOZLcoNFn9Pi8xWX1jHx/aCZl
vY9xhrJZErWF9Tzps3ulY2dHw66oE+bsrSgIjyzHqGh8hUB5rBsGxNNPWiol31aR
jhUbFI1fMbQseKOnO0zDLT+n3vGMl0S8+x5xTbECXtvja8PKFNFS9cBUpP9nEGFK
H27CCb11oZLGrwk3RKx7Q9r2KBvKWaVxwtS4nIsZVXPmn9THJeBDPWjoeJDSn5B1
ijxZsC/ylTgofAFQkXgFYNBoi5DX7ISTd8Ploh+kLiECrFwE7N53ROxhDi14jzJP
3JXV4Ji2ofamBNIVbuPIEvda3DqEl6P8SQqVxxSsrve9GrYbDqV2hT1bt5a7q+dw
fjA3XguXRGkNbZ1+eeIMEvYGs2tS4icxkrFv7AWbxZ+WQ+lrPh7C7Xiy+RqeK8Xh
eRoCxh5dGOhJiP/5eBWaNGE6sAZZF1pr6/Qbd7/lyBbBacK46EU02Fj58fepP+R/
nPcUmipxW+7paB6VaTOdXeH4SJF4Z4PBlSPhXZvc3U3LD3PBDy4v+k4AxMYOdS2R
nflGeH6hMPTf/oJ3V4bkUqc0iRNzOW7bhOzYOtrwh+Cua7+lWcbStMtm0b8VlVOj
EBQutgK7KtXOvBusbM8oDUTMWwrswES+Gybl9EdWFMxa4lx482Y=
=ur8y
-----END PGP SIGNATURE-----

--=_NTZdOKgge9x0sLesm_tmxo2--

