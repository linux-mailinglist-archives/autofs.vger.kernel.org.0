Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072144923BE
	for <lists+autofs@lfdr.de>; Tue, 18 Jan 2022 11:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiARK1y (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 05:27:54 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:38202 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiARK1y (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 05:27:54 -0500
Date:   Tue, 18 Jan 2022 11:27:44 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YeaWIKm/9szaWHIA@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
 <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
 <YeaBtjNlovM5gez4@ofant>
 <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KTs1whZULwe2Nsms"
Content-Disposition: inline
In-Reply-To: <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
User-Agent: Mutt/2.1.5 (Darwin 17.7.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--KTs1whZULwe2Nsms
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> A debug log is almost always what I ask for.
>=20
> Setting "logging =3D debug" in /etc/autofs.conf will do it.
> You need to get a log from start of automount to after the problem
> occurs.

Let me try this and come back to you.

Thanks,
Fabian

--=20
Fabian Groffen
Gentoo on a different level

--KTs1whZULwe2Nsms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHmliAACgkQzpXahU5E
QpMZWQgAgHDzlSwekjirOTP1OnMm3f7jIGaROZa+klbmccfc1cxUrqU/L5cXJpyl
214CdGLcbVHDuTCbZhg9aKdE6eF7rnKfYwaP85hclpJia1VtX0yPRnMEMHJ2o0dh
O50Q3xKTPJpbWmt6ftm/ouVcMw1WdlwTTLN0zAynMSXMFgzkvjiwchyOM33qWYsM
yhXnhmKiABKA7KvgnVpnpcy4MKMREu+G9mTf+M4SzkKfENJVgbUXnVwoNLmnH7yB
c2A+rvBFkAeRHO1+KKQhqjsI0smX3cMbYjVJkPhqG42x2N1dxRmecBllHNH+YNpO
CU+RoYr4aJkDZtrsyC3xosIr6YRrUg==
=ppV6
-----END PGP SIGNATURE-----

--KTs1whZULwe2Nsms--
