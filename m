Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C6949C65E
	for <lists+autofs@lfdr.de>; Wed, 26 Jan 2022 10:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiAZJfn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Jan 2022 04:35:43 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:53218 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiAZJfn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Jan 2022 04:35:43 -0500
Date:   Wed, 26 Jan 2022 10:35:37 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YfEV6b6ZGNJHavr2@gentoo.org>
References: <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
 <YeaWIKm/9szaWHIA@gentoo.org>
 <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
 <YehQdqiLSz6LMPVi@gentoo.org>
 <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
 <YekOscjFLNMjggd7@gentoo.org>
 <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
 <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
 <YepbqFeUBns+KRbj@gentoo.org>
 <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sc5og8UPkMOeyN8Z"
Content-Disposition: inline
In-Reply-To: <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
User-Agent: Mutt/2.1.5 (Darwin 17.7.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--Sc5og8UPkMOeyN8Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 21-01-2022 20:24:14 +0800, Ian Kent wrote:
> > (this is identical to the 5.1.6 output)
> >=20
> > build-log attached
>=20
> That all looks good, including the build log.
>=20
> How about we try stopping the autofs service and run automount
> manually and see what we get.
>=20
> Stop the service then run "automount -fd | tee autofs.log".
>=20
> It might be useful to add a stderr redirect too but I usually
> don't need it, eg. "automount -fd 2>&1 | tee autofs.log".

Sorry for the delay.

What I see is a difference in the mount sequence.

5.1.6:

attempting to mount entry /net/host/export/gentoo
lookup_mount: lookup(program): /net/host/export/gentoo -> -fstype=3Dnfs4,ha=
rd,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768 host:/export/gentoo
parse_mount: parse(sun): expanded entry: -fstype=3Dnfs4,hard,sec=3Dsys,node=
v,nosuid,wsize=3D32768,rsize=3D32768 host:/export/gentoo
parse_mount: parse(sun): gathered options: fstype=3Dnfs4,hard,sec=3Dsys,nod=
ev,nosuid,wsize=3D32768,rsize=3D32768
sun_mount: parse(sun): mounting root /net/host/export/gentoo, mountpoint /n=
et/host/export/gentoo, what host:/export/gentoo, fstype nfs4, options hard,=
sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768
mount(nfs): root=3D/net/host/export/gentoo name=3D/net/host/export/gentoo w=
hat=3Dhost:/export/gentoo, fstype=3Dnfs4, options=3Dhard,sec=3Dsys,nodev,no=
suid,wsize=3D32768,rsize=3D32768
mount(nfs): nfs options=3D"hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=
=3D32768", nobind=3D0, nosymlink=3D0, ro=3D0
get_nfs_info: called with host host(127.0.0.65) proto 6 version 0x40
get_nfs_info: nfs v4 rpc ping time: 0.010256
get_nfs_info: host host cost 10255 weight 0
prune_host_list: selected subset of hosts that support NFS4 over TCP

while 5.1.8 does:

attempting to mount entry /net/host/export/gentoo
lookup_mount: lookup(program): /net/host/export/gentoo -> -fstype=3Dnfs,har=
d,nodev,nosuid host:/export/gentoo
parse_mount: parse(sun): expanded entry: -fstype=3Dnfs,hard,nodev,nosuid ho=
st:/export/gentoo
parse_mount: parse(sun): gathered options: fstype=3Dnfs,hard,nodev,nosuid
sun_mount: parse(sun): mounting root /net/host/export/gentoo, mountpoint /n=
et/host/export/gentoo, what host:/export/gentoo, fstype nfs, options hard,n=
odev,nosuid
mount(nfs): root=3D/net/host/export/gentoo name=3D/net/host/export/gentoo w=
hat=3Dhost:/export/gentoo, fstype=3Dnfs, options=3Dhard,nodev,nosuid
mount(nfs): nfs options=3D"hard,nodev,nosuid", nobind=3D0, nosymlink=3D0, r=
o=3D0
get_nfs_info: called with host host(127.0.0.65) proto 6 version 0x20
get_nfs_info: nfs v3 rpc ping time: 0.008827
get_nfs_info: host host cost 8827 weight 0
get_nfs_info: called with host host(127.0.0.65) proto 17 version 0x20
prune_host_list: selected subset of hosts that support NFS3 over TCP

So it's not using NFSv4 here.

Is this enough of the logs?  Else I need to do some more redaction here.

Fabian

--=20
Fabian Groffen
Gentoo on a different level

--Sc5og8UPkMOeyN8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHxFekACgkQzpXahU5E
QpOD9wf+Nb8oU8fmHEnnrLguPXuBO9ELQlexz/vjzdP7VotCHHnYIVuTgF5bSPr/
6Oo3huZDHmzhO2HJ84/64krYd8b7IkqkkCyazoOxJ24GoRunwjyRpZmG5bqdEKjX
3KdlxlO4mEH1CJ/pn4xaV29ttNHQjfAlPv0WzfjzOhaCNEWzf+jnCUTENfCbGfzS
MQnESuoXXCnKwWCQBN0UbtGxfHEK1ZU5V9/SFKKs2Spuu0iCw1cIPP3cX6VGaNjM
7wr7DuNbIiRsYzzXDkuGikUOIJy7PYFwfEVmFs2IUR77gzG7eppITbUgOjjeTN5h
7f4v3pYhW/ycYZ8tki0HYhPfcq11Nw==
=D9Gx
-----END PGP SIGNATURE-----

--Sc5og8UPkMOeyN8Z--
