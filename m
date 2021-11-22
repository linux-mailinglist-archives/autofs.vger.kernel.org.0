Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F98458C95
	for <lists+autofs@lfdr.de>; Mon, 22 Nov 2021 11:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhKVKsK (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 22 Nov 2021 05:48:10 -0500
Received: from air.basealt.ru ([194.107.17.39]:39498 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238947AbhKVKsI (ORCPT <rfc822;autofs@vger.kernel.org>);
        Mon, 22 Nov 2021 05:48:08 -0500
Received: by air.basealt.ru (Postfix, from userid 490)
        id 97AB35895B6; Mon, 22 Nov 2021 10:45:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.1
Received: from [10.88.129.190] (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id B6F6A589592;
        Mon, 22 Nov 2021 10:44:58 +0000 (UTC)
Subject: Re: autofs 5.1.8 and TCP_REQUESTED
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
 <7550afb574d26b09ce68b39462a778ed244ece02.camel@themaw.net>
 <12697fd2f212d6be9658df6d5f56b34b854cf4c6.camel@themaw.net>
From:   Stanislav Levin <slev@altlinux.org>
Message-ID: <a4a4facf-ad90-9f4c-6a38-b7ac132df34c@altlinux.org>
Date:   Mon, 22 Nov 2021 13:44:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <12697fd2f212d6be9658df6d5f56b34b854cf4c6.camel@themaw.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FOE14KPJpo9Ug7emgwxS3U5p0gN2KT4Y3"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FOE14KPJpo9Ug7emgwxS3U5p0gN2KT4Y3
Content-Type: multipart/mixed; boundary="FBGAuTqy5NKMbx1XtwHrCIr7JRf3nlX56";
 protected-headers="v1"
From: Stanislav Levin <slev@altlinux.org>
To: Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
Message-ID: <a4a4facf-ad90-9f4c-6a38-b7ac132df34c@altlinux.org>
Subject: Re: autofs 5.1.8 and TCP_REQUESTED
References: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
 <7550afb574d26b09ce68b39462a778ed244ece02.camel@themaw.net>
 <12697fd2f212d6be9658df6d5f56b34b854cf4c6.camel@themaw.net>
In-Reply-To: <12697fd2f212d6be9658df6d5f56b34b854cf4c6.camel@themaw.net>

--FBGAuTqy5NKMbx1XtwHrCIr7JRf3nlX56
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

18.11.2021 07:08, Ian Kent =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Sun, 2021-10-31 at 07:35 +0800, Ian Kent wrote:
>=20
> Does this patch fix the problem you are seeing (note the CHANGELOG
> hunk won't apply but should be straight forward to fix)?
>=20

The fix is verified.
Thank you!


--FBGAuTqy5NKMbx1XtwHrCIr7JRf3nlX56--

--FOE14KPJpo9Ug7emgwxS3U5p0gN2KT4Y3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEyZWA1UChsdCFaW6bq6v+jV2aGegFAmGbdKoFAwAAAAAACgkQq6v+jV2aGeji
Fw/+M5CPIkjyGOauPUtY7/UGAGsO1wJkycei/uGK8QIHBIFVfD5UQVjf9YsilkpulZ5MWjqb+jbe
zpM9xajocDxeA+tEC2vgoPzryKvaqSOKFkc2Qv3RCcI+0tDDl4GrkPtOBTxkODEj2f4nh/DkQhis
3LTTIcT0kPmuqEwLVO/Z1Cg92g7xsLJSi8NVA4preKxKua/i/B1iLiD6JG8wWC2sfD77mAy+6uYJ
FFIG9gwCayVEFmFwYJVqZK8Xej08JHry6+CiIkWH2aNb9igBWj533Dso5Pf9+4uOC8JsgPdVBhlM
xgA0iAefggaCuq3dMJy2fscGf5KuJIE3O5v60/QhGSr2Z93ccWcPRbpTB4iULVmQhBZkqU3g104Q
6YGdlf7zuqbTZIzZMvbfaZ1fqHOUrc6jvJDieJ7QsDgyCH23WUiUEwV+XC+J/UdX/KqXtOELR7MO
wDP1E3Tga3DqUB5lMOj/NU2yukKXcbaFVzZKyrdhWCQLsHkiJeIqGXCoNfSfb2wHdnkuUQiCBij0
+taJw3H+kJs+JpjGe3JcnYciOlMFJP90yI+pxC+K2ScgM5+gH1HqRQ3+T05LlvEwBXvk6eB+9ZsH
2tNvwnowCWPWQ9TufKI02YXJb8itH5VP6jTt/RJZTwI++CI9KH08BTMiTGUKlGPkJFid/9alPmiJ
f8k=
=EFt1
-----END PGP SIGNATURE-----

--FOE14KPJpo9Ug7emgwxS3U5p0gN2KT4Y3--
