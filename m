Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF68493F6F
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 18:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356554AbiASR4I (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 Jan 2022 12:56:08 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:33166 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356550AbiASR4G (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 19 Jan 2022 12:56:06 -0500
Date:   Wed, 19 Jan 2022 18:55:02 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YehQdqiLSz6LMPVi@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
 <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
 <YeaBtjNlovM5gez4@ofant>
 <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
 <YeaWIKm/9szaWHIA@gentoo.org>
 <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gYyi+HaO1e4CyNH/"
Content-Disposition: inline
In-Reply-To: <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
User-Agent: Mutt/2.1.5 (Darwin 21.2.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--gYyi+HaO1e4CyNH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've applied all of the patches from your patchqueue, but I don't see
much change.  Startup only shows:

Jan 19 18:53:20 hera automount[21763]: Starting automounter version 5.1.8, =
master map auto.master
Jan 19 18:53:20 hera automount[21763]: using kernel protocol version 5.05
Jan 19 18:53:20 hera automount[21763]: lookup_nss_read_master: reading mast=
er files auto.master
Jan 19 18:53:20 hera automount[21763]: do_init: parse(sun): init gathered g=
lobal options: (null)
Jan 19 18:53:20 hera automount[21763]: spawn_mount: mtab link detected, pas=
sing -n to mount
Jan 19 18:53:20 hera automount[21763]: spawn_umount: mtab link detected, pa=
ssing -n to mount
Jan 19 18:53:20 hera automount[21763]: no mounts in table

Thanks,
Fabian

On 19-01-2022 09:27:26 +0800, Ian Kent wrote:
> On Tue, 2022-01-18 at 11:27 +0100, Fabian Groffen wrote:
> > On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> > > A debug log is almost always what I ask for.
> > >=20
> > > Setting "logging =3D debug" in /etc/autofs.conf will do it.
> > > You need to get a log from start of automount to after the problem
> > > occurs.
> >=20
> > Let me try this and come back to you.
>=20
> You might need to take some care doing this.
>=20
> If your using systemd then a simple "journalctl | grep automount"
> usually gets what we need.
>=20
> But if your relying on syslog often the log level setting won't
> record debug logging so it needs to be changed. Otherwise we don't
> get a full log.
>=20
> Ian
>=20

--=20
Fabian Groffen
Gentoo on a different level

--gYyi+HaO1e4CyNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHoUHYACgkQzpXahU5E
QpNHMAf+PQjJrc01dI8fNfphPnfT/M2bVoX76OC5wf1AbRMIf0BImJh+wvk18xXq
o4ca7lcgXBS/rdcJ/UKcelhBDkPFbRGrb2gD2hPaJHtfPhyM+rIzl9wttWvjV/tL
lzMxfmwUGMxrJCOfcLchGVP/ErQvQlk+Yb8vjAXVUMYM+B2wuQsHsNBpjxURanzI
sflPFd9rTzAlbUZhFtGfb8VeHkQQQ9CSHpabcFmV1baQD91a/JT/FHdTOeE6JN0J
K8ROWhG5oUe9uX/sFSKyXQzIYUx7fIxv0+njkKDZg4+psU3MJXvHBiYk+BwHQqyG
ySAqK3x/t8PGl64f74HJDrePCNLfGg==
=hEte
-----END PGP SIGNATURE-----

--gYyi+HaO1e4CyNH/--
