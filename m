Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEA049483A
	for <lists+autofs@lfdr.de>; Thu, 20 Jan 2022 08:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238556AbiATH1F (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Jan 2022 02:27:05 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:37926 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiATH1E (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Jan 2022 02:27:04 -0500
Date:   Thu, 20 Jan 2022 08:26:41 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YekOscjFLNMjggd7@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
 <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
 <YeaBtjNlovM5gez4@ofant>
 <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
 <YeaWIKm/9szaWHIA@gentoo.org>
 <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
 <YehQdqiLSz6LMPVi@gentoo.org>
 <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8G3StNSzfrq/bWAd"
Content-Disposition: inline
In-Reply-To: <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
User-Agent: Mutt/2.1.5 (Darwin 17.7.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--8G3StNSzfrq/bWAd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20-01-2022 10:37:20 +0800, Ian Kent wrote:
> On Wed, 2022-01-19 at 18:55 +0100, Fabian Groffen wrote:
> > I've applied all of the patches from your patchqueue, but I don't see
> > much change.=C2=A0 Startup only shows:
> >=20
> > Jan 19 18:53:20 hera automount[21763]: Starting automounter version
> > 5.1.8, master map auto.master
> > Jan 19 18:53:20 hera automount[21763]: using kernel protocol version
> > 5.05
> > Jan 19 18:53:20 hera automount[21763]: lookup_nss_read_master:
> > reading master files auto.master
> > Jan 19 18:53:20 hera automount[21763]: do_init: parse(sun): init
> > gathered global options: (null)
> > Jan 19 18:53:20 hera automount[21763]: spawn_mount: mtab link
> > detected, passing -n to mount
> > Jan 19 18:53:20 hera automount[21763]: spawn_umount: mtab link
> > detected, passing -n to mount
> > Jan 19 18:53:20 hera automount[21763]: no mounts in table
>=20
>=20
> This looks like output you would get if debug logging isn't enabled.
>=20
> Are you using systemd or a sysV init system?

sysv/openrc

> Has the build log of autofs been checked for problems?

yes, none present

> Has the earlier version of autofs that you see working been built
> against the same system?

yes

> We really need to get a debug log for this, can't really make progress
> otherwise.

I enabled logging=3Ddebug (I use the same config) and 5.1.6 spews out a
lot of messages that it normally does not, so I'm assuming that's what
logging=3Ddebug does.  The problem appears to be to me that 5.1.8 doesn't
do this, so it seems to either not read /etc/autofs/autofs.conf,
or auto.master/auto.net from the same directory?

Thanks,
Fabian
>=20
> Ian
> >=20
> > Thanks,
> > Fabian
> >=20
> > On 19-01-2022 09:27:26 +0800, Ian Kent wrote:
> > > On Tue, 2022-01-18 at 11:27 +0100, Fabian Groffen wrote:
> > > > On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> > > > > A debug log is almost always what I ask for.
> > > > >=20
> > > > > Setting "logging =3D debug" in /etc/autofs.conf will do it.
> > > > > You need to get a log from start of automount to after the
> > > > > problem
> > > > > occurs.
> > > >=20
> > > > Let me try this and come back to you.
> > >=20
> > > You might need to take some care doing this.
> > >=20
> > > If your using systemd then a simple "journalctl | grep automount"
> > > usually gets what we need.
> > >=20
> > > But if your relying on syslog often the log level setting won't
> > > record debug logging so it needs to be changed. Otherwise we don't
> > > get a full log.
> > >=20
> > > Ian
> > >=20
> >=20
>=20
>=20

--=20
Fabian Groffen
Gentoo on a different level

--8G3StNSzfrq/bWAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHpDrEACgkQzpXahU5E
QpMtBAf/WkNRQIDUuyjvfpBu62/VDGEkoJRmwZIuPndxUfsoliLjwmZJKvn60qwo
vj6eC1VgfEyO2a9FWejR9C4foF9lJoop0ipkZJF1qk9rlc1vBdiCDmboxcn/K8+2
gcgTLb0CoUnQb6+JnNWMHf2uishDadv4uu/K89lSYsBKG6eyXip3whhV07YcW1Yr
7gUSi9JJNsftj6C9wP/TWYJ8eZgb/l5Hetb7Y0eiDLLXPMyHmYke6nQgCGa88872
aiZxRoW0ftdpxIR2hGBC2Q2MwbpumlV0l8l564MzQzuc/lg2MkeDX+AxP5YZbTf4
LxTF981Qvdys+9PR510IeyyjiCIv+A==
=uou5
-----END PGP SIGNATURE-----

--8G3StNSzfrq/bWAd--
