Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDD24935C1
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 08:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351959AbiASHq0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 Jan 2022 02:46:26 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:38850 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245700AbiASHqZ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 19 Jan 2022 02:46:25 -0500
Date:   Wed, 19 Jan 2022 08:46:16 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YefByA5Ep6HqrPpA@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
 <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
 <YeaBtjNlovM5gez4@ofant>
 <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ekmi4XT+QV3UYNl7"
Content-Disposition: inline
In-Reply-To: <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
User-Agent: Mutt/2.1.5 (Darwin 17.7.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--ekmi4XT+QV3UYNl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hmmm, so I did this, and the only thing I see:

Jan 19 08:40:38 hera automount[15228]: Starting automounter version
5.1.8, master map auto.master
Jan 19 08:40:38 hera automount[15228]: using kernel protocol version
5.05
Jan 19 08:40:38 hera automount[15228]: lookup_nss_read_master: reading
master files auto.master
Jan 19 08:40:38 hera automount[15228]: do_init: parse(sun): init
gathered global options: (null)
Jan 19 08:40:38 hera automount[15228]: spawn_mount: mtab link detected,
passing -n to mount
Jan 19 08:40:38 hera automount[15228]: spawn_umount: mtab link detected,
passing -n to mount
Jan 19 08:40:38 hera automount[15228]: no mounts in table

then:

# mount | grep autofs
/etc/autofs/auto.home on /home type autofs
(rw,relatime,fd=3D-1,pgrp=3D29000,timeout=3D300,minproto=3D5,maxproto=3D5,i=
ndirect)

the /net isn't mounted at all

reverting back to 5.1.6, I see this:

Jan 19 08:43:30 hera automount[16125]: Starting automounter version 5.1.6, =
master map auto.master
Jan 19 08:43:30 hera automount[16125]: using kernel protocol version 5.05
Jan 19 08:43:30 hera automount[16125]: lookup_nss_read_master: reading mast=
er files auto.master
Jan 19 08:43:30 hera automount[16125]: do_init: parse(sun): init gathered g=
lobal options: (null)
Jan 19 08:43:30 hera automount[16125]: spawn_mount: mtab link detected, pas=
sing -n to mount
Jan 19 08:43:30 hera automount[16125]: spawn_umount: mtab link detected, pa=
ssing -n to mount
Jan 19 08:43:30 hera automount[16125]: lookup_read_master: lookup(file): re=
ad entry /home
Jan 19 08:43:30 hera automount[16125]: lookup_read_master: lookup(file): re=
ad entry /net
Jan 19 08:43:30 hera automount[16125]: master_do_mount: mounting /home
Jan 19 08:43:30 hera automount[16125]: automount_path_to_fifo: fifo name /r=
un/autofs.fifo-home
Jan 19 08:43:30 hera automount[16125]: lookup_nss_read_map: reading map fil=
e /etc/autofs/auto.home
Jan 19 08:43:30 hera automount[16125]: do_init: parse(sun): init gathered g=
lobal options: (null)
Jan 19 08:43:30 hera automount[16125]: spawn_mount: mtab link detected, pas=
sing -n to mount
Jan 19 08:43:30 hera automount[16125]: spawn_umount: mtab link detected, pa=
ssing -n to mount
Jan 19 08:43:30 hera automount[16125]: remount_active_mount: trying to re-c=
onnect to mount /home
Jan 19 08:43:30 hera automount[16125]: mounted indirect on /home with timeo=
ut 300, freq 75 seconds
Jan 19 08:43:30 hera automount[16125]: lookup_mount: lookup(program): looki=
ng up user
Jan 19 08:43:30 hera automount[16125]: lookup_mount: lookup(program): user =
-> -fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768 /=
 hera:/export/home/user
Jan 19 08:43:30 hera automount[16125]: parse_mount: parse(sun): expanded en=
try: -fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768=
 / hera:/export/home/user
Jan 19 08:43:30 hera automount[16125]: parse_mount: parse(sun): gathered op=
tions: fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768
Jan 19 08:43:30 hera automount[16125]: parse_mount: parse(sun): dequote("/"=
) -> /
Jan 19 08:43:30 hera automount[16125]: parse_mapent: parse(sun): gathered o=
ptions: fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D327=
68
Jan 19 08:43:30 hera automount[16125]: parse_mapent: parse(sun): dequote("h=
era:/export/home/user") -> hera:/export/home/user
Jan 19 08:43:30 hera automount[16125]: update_offset_entry: parse(sun): upd=
ated multi-mount offset / -> -fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsi=
ze=3D32768,rsize=3D32768 hera:/export/home/user
Jan 19 08:43:30 hera automount[16125]: parse_mapent: parse(sun): gathered o=
ptions: fstype=3Dnfs4,hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D327=
68
Jan 19 08:43:30 hera automount[16125]: parse_mapent: parse(sun): dequote("h=
era:/export/home/user") -> hera:/export/home/user
Jan 19 08:43:30 hera automount[16125]: sun_mount: parse(sun): mounting root=
 /home/user/, mountpoint user, what hera:/export/home/user, fstype nfs4, op=
tions hard,sec=3Dsys,nodev,nosuid,wsize=3D32768,rsize=3D32768
Jan 19 08:43:30 hera automount[16125]: re-connected to /home/user
Jan 19 08:43:30 hera automount[16125]: remount_active_mount: re-connected t=
o mount /home
Jan 19 08:43:30 hera automount[16125]: st_ready: st_ready(): state =3D 0 pa=
th /home
Jan 19 08:43:30 hera automount[16125]: master_do_mount: mounting /net
Jan 19 08:43:30 hera automount[16125]: automount_path_to_fifo: fifo name /r=
un/autofs.fifo-net
Jan 19 08:43:30 hera automount[16125]: lookup_nss_read_map: reading map fil=
e /etc/autofs/auto.net
Jan 19 08:43:30 hera automount[16125]: do_init: parse(sun): init gathered g=
lobal options: (null)
Jan 19 08:43:30 hera automount[16125]: mounted indirect on /net with timeou=
t 300, freq 75 seconds
Jan 19 08:43:30 hera automount[16125]: st_ready: st_ready(): state =3D 0 pa=
th /net

So it appears that 5.1.8 for some reason doesn't eat my auto.net at all?

I posted my conf in https://bugs.gentoo.org/831014

Fabian

On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> On Tue, 2022-01-18 at 17:00 +0800, Yixun Lan wrote:
> > Hi Ian Kent:
> >=20
> > thanks for your quick reply
> >=20
> > On 16:44 Tue 18 Jan=C2=A0=C2=A0=C2=A0=C2=A0 , Ian Kent wrote:
> > > On Tue, 2022-01-18 at 16:27 +0800, Yixun Lan wrote:
> > > > Hi Ian Kent:
> > > >=20
> > > > Fabian reported a bug about failing to mount /net with autofs-
> > > > 5.1.8,
> > > > but have no problem with previous 5.1.6
> > > >=20
> > > > I'm not able to reproduce this error (need more info about the
> > > > settings)
> > > > So write to the mailinglist to see if you can shed some light on
> > > > this..
> > > >=20
> > > >=20
> > > > The most verbose error messages like this:
> > > >=20
> > > > Jan 11 13:53:09 khnum automount[3614]: mount_autofs_offset:
> > > > failed to
> > > > mount offset trigger=C2=A0 at=20
> > > > Jan 11 13:56:24 khnum automount[3614]: set_tsd_user_vars: failed
> > > > to
> > > > get
> > > > buffer size for getpwuid_r
> > > > Jan 11 14:56:52 khnum kernel:
> > > > autofs4:pid:10191:validate_dev_ioctl:
> > > > invalid path supplied for cmd(0xc018937e)
> > >=20
> > > I've had several bug reports which have been mostly fixed now but
> > > these
> > > log entries don't look like anything I have seen so far.
> > >=20
> > > I haven't yet pushed those changes to the repository either.
> > > How would you like to proceed?
> > > I could post a patch series to you or the list to try if you wish.
> > either way work for me, but I need to be able to reproduce this first
> > I will leave Fabian for comments..
>=20
> A debug log is almost always what I ask for.
>=20
> Setting "logging =3D debug" in /etc/autofs.conf will do it.
> You need to get a log from start of automount to after the problem
> occurs.
>=20
>=20
> Ian
>=20

--=20
Fabian Groffen
Gentoo on a different level

--ekmi4XT+QV3UYNl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHnwcgACgkQzpXahU5E
QpMV4wf+KbtiguHF4zLf16M8J9My6cdIEcKVQIv22I2HtM6ZdpV5aJiC+mx+lzad
H5uZJkfH5dHitZWIGncvEQR3ylxKPYQv9cmhtHQWfn3hQ8EhXLoMElg09VqF0t7Q
VQzKT/I/BDtGFgygch4d30UiN+CVBWB6C7a2FWer+jCeDtFs6vBucRGvTLLrKRMK
hMpCy4x+RZ5z9UZ+hXmO9tKQUWCI4+XCnc9MeH6q7pTV7ppSH44EGCKM5bl50mz1
eTchVOWMN6aF/SVateLzu37WvNWLIux+xJXxjUwG1irXcybl+hvluwcUwIujenfV
m7TU95Aqx2wR6ZVOoKkgbl0WYmasIw==
=A7kp
-----END PGP SIGNATURE-----

--ekmi4XT+QV3UYNl7--
