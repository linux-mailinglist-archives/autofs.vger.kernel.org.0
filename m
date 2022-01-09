Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECB0488861
	for <lists+autofs@lfdr.de>; Sun,  9 Jan 2022 09:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbiAIIkN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 9 Jan 2022 03:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiAIIkM (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 9 Jan 2022 03:40:12 -0500
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941F8C06173F
        for <autofs@vger.kernel.org>; Sun,  9 Jan 2022 00:40:12 -0800 (PST)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_B4034554-DB93-4C79-909D-BAEEFC299B97";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/7] autofs-5.1.8 - fix missing include in hash.h
From:   Sam James <sam@gentoo.org>
In-Reply-To: <6471245804b3d448ada9bd42527f7639489217c1.camel@themaw.net>
Date:   Sun, 9 Jan 2022 08:40:04 +0000
Cc:     autofs@vger.kernel.org, dlan@gentoo.org
Message-Id: <112C8F6A-4A46-45AD-AECB-4D985C0002AD@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
 <6471245804b3d448ada9bd42527f7639489217c1.camel@themaw.net>
To:     Ian Kent <raven@themaw.net>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--Apple-Mail=_B4034554-DB93-4C79-909D-BAEEFC299B97
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On 9 Jan 2022, at 00:28, Ian Kent <raven@themaw.net> wrote:
> 
> On Fri, 2021-12-24 at 22:02 +0000, Sam James wrote:
>> Fixes a build failure with the musl libc:
>> ```
>> ../include/hash.h:74:8: error: unknown type name '__always_inline'
>>    74 | static __always_inline uint32_t hash_64(uint64_t val,
>> unsigned int bits)
>>       |        ^~~~~~~~~~~~~~~
>> ```
>> 
>> We need to include stddef.h from linux-headers to ensure
>> _always_inline
>> is always defined.
>> 
>> Bug: https://bugs.gentoo.org/828918
>> Tested-by: Yixun Lan <dlan@gentoo.org>
>> Signed-off-by: Sam James <sam@gentoo.org>
> 
> Hi Sam,
> 
> Thanks for this series.

Hi Ian,

No worries, thanks for your reply!

> 
> I've added them to my path queue but still need to perform a build
> as a check.
> 
> I can't say when I'll commit them to the repo. but I have a number
> of bug fixes to commit as well when testing is completed and I'll
> do it then.
> 
> I may end up doing a release fairly soon too because of those bug
> fixes, not sure when that will happen.

No rush on my end. Just let me know if you have any feedback
or if anything needs fixing from this.

Cheers,
sam

--Apple-Mail=_B4034554-DB93-4C79-909D-BAEEFC299B97
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmHan2RfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDteEwf/fFTSIXDlGU9wYJa1Zd1VbUJpF/jliZB4Tc1wNCAegurAg+ZmLZUrS4yH
pOgLQv+bhpi/tMeUJcG9uZYJKfTcIgZ3+reTtGB02/RCbgojFdYfre0jWxEVLxmn
BzJTJ34fpm4GvmloREP7ZSw/4MaQ8q8asvxs2EibdokHeUnRYttsQsBTh2QrpFq4
0l8e02fnqHKvVK2bul5he+WSpRQNQ0+sEXjzVpjChWTmtwnHg6WxhXbDKiQNcanL
41uqsrhoq8Niw3GoyEFWPSznnGJND9w1UqW2vEUYKy7/9qgtSk/Ic5lPnz0vDYUs
z1Rm+XmKtK7gCaWzN1wxRg2l+Ae04A==
=pC9A
-----END PGP SIGNATURE-----

--Apple-Mail=_B4034554-DB93-4C79-909D-BAEEFC299B97--
