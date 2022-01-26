Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727B249C757
	for <lists+autofs@lfdr.de>; Wed, 26 Jan 2022 11:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239837AbiAZKWP (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Jan 2022 05:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiAZKWP (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Jan 2022 05:22:15 -0500
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5FAC06161C
        for <autofs@vger.kernel.org>; Wed, 26 Jan 2022 02:22:14 -0800 (PST)
Date:   Wed, 26 Jan 2022 11:22:08 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Yixun Lan <dlan@gentoo.org>
Cc:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YfEg0Oqc4bEhgvj8@gentoo.org>
References: <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
 <YehQdqiLSz6LMPVi@gentoo.org>
 <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
 <YekOscjFLNMjggd7@gentoo.org>
 <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
 <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
 <YepbqFeUBns+KRbj@gentoo.org>
 <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
 <YfEV6b6ZGNJHavr2@gentoo.org>
 <YfEf8RoMPbjSylm8@ofant>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uxHtbPnTPRULj0/V"
Content-Disposition: inline
In-Reply-To: <YfEf8RoMPbjSylm8@ofant>
User-Agent: Mutt/2.1.5 (Darwin 17.7.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--uxHtbPnTPRULj0/V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26-01-2022 18:18:25 +0800, Yixun Lan wrote:
> HI Fabian:
>=20
> On 10:35 Wed 26 Jan     , Fabian Groffen wrote:
> > On 21-01-2022 20:24:14 +0800, Ian Kent wrote:
> > > > (this is identical to the 5.1.6 output)
> > > >=20
> > > > build-log attached
> > >=20
> > > That all looks good, including the build log.
> > >=20
> > > How about we try stopping the autofs service and run automount
> > > manually and see what we get.
> > >=20
> > > Stop the service then run "automount -fd | tee autofs.log".
> > >=20
> > > It might be useful to add a stderr redirect too but I usually
> > > don't need it, eg. "automount -fd 2>&1 | tee autofs.log".
> >=20
> > Sorry for the delay.
> >=20
> > What I see is a difference in the mount sequence.
> >=20
> > 5.1.6:
> >=20
> > attempting to mount entry /net/host/export/gentoo
> > lookup_mount: lookup(program): /net/host/export/gentoo -> -fstype=3Dnfs=
4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768 host:/export/gent=
oo
> > parse_mount: parse(sun): expanded entry: -fstype=3Dnfs4,hard,sec=3Dsys,=
nodev,nosuid,wsize=3D32768,rsize=3D32768 host:/export/gentoo
> > parse_mount: parse(sun): gathered options: fstype=3Dnfs4,hard,sec=3Dsys=
,nodev,nosuid,wsize=3D32768,rsize=3D32768
> > sun_mount: parse(sun): mounting root /net/host/export/gentoo, mountpoin=
t /net/host/export/gentoo, what host:/export/gentoo, fstype nfs4, options h=
ard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768
> > mount(nfs): root=3D/net/host/export/gentoo name=3D/net/host/export/gent=
oo what=3Dhost:/export/gentoo, fstype=3Dnfs4, options=3Dhard,sec=3Dsys,node=
v,nosuid,wsize=3D32768,rsize=3D32768
> > mount(nfs): nfs options=3D"hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rs=
ize=3D32768", nobind=3D0, nosymlink=3D0, ro=3D0
> > get_nfs_info: called with host host(127.0.0.65) proto 6 version 0x40
> > get_nfs_info: nfs v4 rpc ping time: 0.010256
> > get_nfs_info: host host cost 10255 weight 0
> > prune_host_list: selected subset of hosts that support NFS4 over TCP
> >=20
> > while 5.1.8 does:
> >=20
> > attempting to mount entry /net/host/export/gentoo
> > lookup_mount: lookup(program): /net/host/export/gentoo -> -fstype=3Dnfs=
,hard,nodev,nosuid host:/export/gentoo
>                                                               ~~~~~~~~~
> 				        somehow, it pass the "nfs(v3)" at begining?

yes, this is *identical* config, I just used a different binary.

If you look careful, you see that it also didn't take the rest of my
options:
  fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768

So, either I'm not specifying them in a way supported by 5.1.8, or it
somehow doesn't process them and falls back to some defaults.

Fabian

>=20
> > parse_mount: parse(sun): expanded entry: -fstype=3Dnfs,hard,nodev,nosui=
d host:/export/gentoo
>=20
> > parse_mount: parse(sun): gathered options: fstype=3Dnfs,hard,nodev,nosu=
id
> > sun_mount: parse(sun): mounting root /net/host/export/gentoo, mountpoin=
t /net/host/export/gentoo, what host:/export/gentoo, fstype nfs, options ha=
rd,nodev,nosuid
> > mount(nfs): root=3D/net/host/export/gentoo name=3D/net/host/export/gent=
oo what=3Dhost:/export/gentoo, fstype=3Dnfs, options=3Dhard,nodev,nosuid
> > mount(nfs): nfs options=3D"hard,nodev,nosuid", nobind=3D0, nosymlink=3D=
0, ro=3D0
> > get_nfs_info: called with host host(127.0.0.65) proto 6 version 0x20
> > get_nfs_info: nfs v3 rpc ping time: 0.008827
> > get_nfs_info: host host cost 8827 weight 0
> > get_nfs_info: called with host host(127.0.0.65) proto 17 version 0x20
> > prune_host_list: selected subset of hosts that support NFS3 over TCP
> >=20
> > So it's not using NFSv4 here.
> >=20
> > Is this enough of the logs?  Else I need to do some more redaction here.
> >=20
> > Fabian
> >=20
> > --=20
> > Fabian Groffen
> > Gentoo on a different level
>=20
>=20
>=20
> --=20
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

--=20
Fabian Groffen
Gentoo on a different level

--uxHtbPnTPRULj0/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHxINAACgkQzpXahU5E
QpOIjAgAi3gCA+fy4axjf2wqln9vHc8c5y8edruKrM/MszG9ZZqZ/WlYjw1W7d9N
LmCuQECGy0M0/yvpL42f7iO5G1yOBoRvoIZPUdh0vigzgt3GbqGFG7qoJXH1WqMx
Qz/wVwoNcrDRC+AGpAH4aCCLSVp8VxJpVMifvgT83IYXGrHaCduu1CLH84RiFepy
EypivmTUW6lv3ObuPKFZ7IHg425vahlV6r4DaCek6o2pZtO8vpgSiTMX9E8LRl2u
g1YlK35ijNcjaiW+RePo/5OyoKKxK1NWdLo07lApo+CS3lmz8nUB7NaVJzWRp8tC
2bui4tcI8nV3yhUzi8MhNDQP1nVC8Q==
=yuqG
-----END PGP SIGNATURE-----

--uxHtbPnTPRULj0/V--
