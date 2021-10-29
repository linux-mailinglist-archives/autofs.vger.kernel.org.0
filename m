Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AC943FA8B
	for <lists+autofs@lfdr.de>; Fri, 29 Oct 2021 12:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhJ2KOj (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 29 Oct 2021 06:14:39 -0400
Received: from air.basealt.ru ([194.107.17.39]:40334 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231564AbhJ2KOj (ORCPT <rfc822;autofs@vger.kernel.org>);
        Fri, 29 Oct 2021 06:14:39 -0400
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Oct 2021 06:14:38 EDT
Received: by air.basealt.ru (Postfix, from userid 490)
        id 5AE2E5895D6; Fri, 29 Oct 2021 10:02:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.1
Received: from [10.88.129.190] (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id D1B9958942B
        for <autofs@vger.kernel.org>; Fri, 29 Oct 2021 10:02:49 +0000 (UTC)
To:     autofs@vger.kernel.org
From:   Stanislav Levin <slev@altlinux.org>
Subject: autofs 5.1.8 and TCP_REQUESTED
Message-ID: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
Date:   Fri, 29 Oct 2021 13:02:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f30sY8CV5v9opdAYxTCEatBdj2V6JMxuh"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f30sY8CV5v9opdAYxTCEatBdj2V6JMxuh
Content-Type: multipart/mixed; boundary="rWerzRrylFv4GYeJNeaCuKBntewHKdbCK";
 protected-headers="v1"
From: Stanislav Levin <slev@altlinux.org>
To: autofs@vger.kernel.org
Message-ID: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
Subject: autofs 5.1.8 and TCP_REQUESTED

--rWerzRrylFv4GYeJNeaCuKBntewHKdbCK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello.

With switching of autofs 5.1.7 -> 5.1.8 we faced the next issue.

My Linux distro (ALTLinux) has the policy for rpcbind which controls the
localhostness (localhost only by default). NFSv4 doesn't require
rpcbind. But with 606795ecfaa1ba45ab58fa20376213f6089e42e9
(https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?i=
d=3D606795ecfaa1ba45ab58fa20376213f6089e42e9)
it is mandatory and broken our users.

autoumount log:

Oct 28 08:23:24 client3.ipa.test automount[1243]: handle_packet: type =3D=
 3
Oct 28 08:23:24 client3.ipa.test automount[1243]:
handle_packet_missing_indirect: token 2, name athena, request pid 1297
Oct 28 08:23:24 client3.ipa.test automount[1243]: attempting to mount
entry /home/athena
Oct 28 08:23:24 client3.ipa.test automount[1243]: lookup_mount:
lookup(sss): looking up athena
Oct 28 08:23:24 client3.ipa.test automount[1243]: lookup_mount:
lookup(sss): athena -> -fstype=3Dnfs4,rw,sec=3Dkrb5p
client1.ipa.test:/krbnfs_home/&
Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
parse(sun): expanded entry: -fstype=3Dnfs4,rw,sec=3Dkrb5p
client1.ipa.test:/krbnfs_home/athena
Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
parse(sun): gathered options: fstype=3Dnfs4,rw,sec=3Dkrb5p
Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
parse(sun): dequote("client1.ipa.test:/krbnfs_home/athena") ->
client1.ipa.test:/krbnfs_home/athena
Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
parse(sun): core of entry: options=3Dfstype=3Dnfs4,rw,sec=3Dkrb5p,
loc=3Dclient1.ipa.test:/krbnfs_home/athena
Oct 28 08:23:24 client3.ipa.test automount[1243]: sun_mount: parse(sun):
mounting root /home, mountpoint athena, what
client1.ipa.test:/krbnfs_home/athena, fstype nfs4, options rw,sec=3Dkrb5p=

Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): root=3D/hom=
e
name=3Dathena what=3Dclient1.ipa.test:/krbnfs_home/athena, fstype=3Dnfs4,=

options=3Drw,sec=3Dkrb5p
Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): nfs
options=3D"rw,sec=3Dkrb5p", nobind=3D0, nosymlink=3D0, ro=3D0
Oct 28 08:23:24 client3.ipa.test automount[1243]: get_nfs_info: called
with host client1.ipa.test(172.18.0.2) proto 6 version 0x40
Oct 28 08:23:24 client3.ipa.test automount[1243]: get_portmap_client:
error 0x3 getting portmap client
Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): no hosts
available

reason:

(gdb) bt
#0  get_vers_and_cost (logopt=3Dlogopt@entry=3D1,
host=3Dhost@entry=3D0x7f239c002240, version=3Dversion@entry=3D65,
port=3Dport@entry=3D-1) at /usr/src/debug/autofs-5.1.8/modules/replicated=
=2Ec:552
#1  0x00007f23a52a2b12 in prune_host_list (logopt=3D1,
list=3Dlist@entry=3D0x7f23a4a64590, vers=3Dvers@entry=3D65, port=3Dport@e=
ntry=3D-1)
at /usr/src/debug/autofs-5.1.8/modules/replicated.c:785
#2  0x00007f23a52a384e in mount_mount (ap=3D<optimized out>,
root=3D<optimized out>, name=3D<optimized out>, name_len=3D<optimized out=
>,
what=3D<optimized out>, fstype=3D<optimized out>, options=3D<optimized ou=
t>,
context=3D<optimized out>) at
/usr/src/debug/autofs-5.1.8/modules/mount_nfs.c:270
#3  0x00007f23a52c4e23 in sun_mount (ap=3Dap@entry=3D0x562be0d49120,
root=3Droot@entry=3D0x562be0d49200 "/home", name=3Dname@entry=3D0x7f23a4a=
668d0
"athena", namelen=3Dnamelen@entry=3D6, loc=3Dloc@entry=3D0x7f239c001f80
"client1.ipa.test:/krbnfs_home/athena", loclen=3Dloclen@entry=3D36,
options=3D0x7f23a4a656a0 "rw,sec=3Dkrb5p", ctxt=3D<optimized out>) at
/usr/src/debug/autofs-5.1.8/modules/parse_sun.c:713
#4  0x00007f23a52cd1cd in parse_mount (ap=3D0x562be0d49120,
name=3D0x7f23a4a668d0 "athena", name_len=3D6, mapent=3D<optimized out>,
context=3D0x7f2398000f80) at
/usr/src/debug/autofs-5.1.8/modules/parse_sun.c:1708
#5  0x00007f23a52f7f35 in lookup_mount (ap=3D0x562be0d49120,
name=3D<optimized out>, name_len=3D<optimized out>, context=3D0x7f2398000=
ef0)
at /usr/src/debug/autofs-5.1.8/modules/lookup_sss.c:1121
#6  0x0000562bdf8e7fe7 in do_lookup_mount (ap=3Dap@entry=3D0x562be0d49120=
,
map=3D0x7f2398000d80, name=3Dname@entry=3D0x7f23a4a6bd90 "athena",
name_len=3Dname_len@entry=3D6) at
/usr/src/debug/autofs-5.1.8/daemon/lookup.c:823
#7  0x0000562bdf8ee4ec in lookup_name_source_instance
(ap=3Dap@entry=3D0x562be0d49120, map=3Dmap@entry=3D0x562be0d49220,
type=3Dtype@entry=3D0x7f239c001ab0 "sss", name=3Dname@entry=3D0x7f23a4a6b=
d90
"athena", name_len=3Dname_len@entry=3D6) at
/usr/src/debug/autofs-5.1.8/daemon/lookup.c:993
#8  0x0000562bdf8ee5d8 in lookup_map_name
(this=3Dthis@entry=3D0x7f239c001a70, ap=3Dap@entry=3D0x562be0d49120,
map=3Dmap@entry=3D0x562be0d49220, name=3Dname@entry=3D0x7f23a4a6bd90 "ath=
ena",
name_len=3Dname_len@entry=3D6) at
/usr/src/debug/autofs-5.1.8/daemon/lookup.c:1044
#9  0x0000562bdf8ef5ae in lookup_nss_mount (ap=3D0x562be0d49120,
source=3D0x0, name=3D0x7f23a4a6bd90 "athena", name_len=3D6) at
/usr/src/debug/autofs-5.1.8/daemon/lookup.c:1241
#10 0x0000562bdf8e032b in do_mount_indirect (arg=3D<optimized out>) at
/usr/src/debug/autofs-5.1.8/daemon/indirect.c:756

(gdb) info args
logopt =3D 1
host =3D 0x7f239c002240
version =3D 65
port =3D -1

(gdb) p /t version
$22 =3D 1000001

so, version is (NFS4_REQUESTED | TCP_REQUESTED). It's ok.

vers is defined as (NFS_VERS_MASK | NFS4_VERS_MASK)
(gdb) p /t 0x0010 | 0x0020 | 0x0040
$21 =3D 1110000

with vers &=3D version; TCP_REQUESTED is filtered out and only
NFS4_REQUESTED stay in. Thus, get_nfs_info will never(?) receive
TCP_REQUESTED and this makes NFSv4 port setting unreachable:
 294                 if ((version & NFS4_REQUESTED) && (version &
TCP_REQUESTED))
 295                         rpc_info->port =3D NFS_PORT;




--rWerzRrylFv4GYeJNeaCuKBntewHKdbCK--

--f30sY8CV5v9opdAYxTCEatBdj2V6JMxuh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEyZWA1UChsdCFaW6bq6v+jV2aGegFAmF7xskFAwAAAAAACgkQq6v+jV2aGejM
OA/+NaniLF2AVLXSpHiIxrhnjTveVNfulgZVs29q7A+3NkrUQwEr5hqypobdjF74VeoO1ixiOb2r
7Ltl3OEvVebKA5vxqAi9FlCDNr6CC+tftTqgSVh06rrE3TP9qd5OldPAGYIREBQW/9hnxP3dhUu/
a7mRoukAlbg19WKXtnHgCjJ/qtzU5ULRGFZWmVW9TgyvCwhVdYjtcYZCdk+KWj6btMCc/5r7fL4l
o9AbPGtCo5SRekwrUZrQhaUKC6lH6+rXCRuEIVtmfZA6rhbGv19xbF9MUI47f8YMYEZAAMHUFsJI
/UvfgWdPbqMZXSLsimNOmd63RpiJ9NU8IEIb0BpBgtmGsHABRgN8moUoeTnY0eQUgsCn5HN7dxes
wGpiHYQ/3YTMrT4F/zax8+U/sS4gvKrt+99KR3AYqEl6Lkj3shlLQQuw8HjM90fhdBujsVpLrHoF
VETg3Qj/dlvcYkj01JnO5d2gA/1gdosz+7+i3/6Z7owYHjGDx5fU1erK4pNPhdSGbV7hVk5oF0Cc
CnJyGdSvOiyZvV8wGSfuotdHjegV36p2z+GXwDGqc712S1YL8ziBqqAOJTYCDBJEwUYkGwjpaKWR
llDHduzyt6gI0MOjmjexFv5GBNw4LYv6AsLiDIFqVVPl7AkjaEaF4wZQsWyZQ2AaVOpvn6Amc7MM
U2w=
=gAXe
-----END PGP SIGNATURE-----

--f30sY8CV5v9opdAYxTCEatBdj2V6JMxuh--
