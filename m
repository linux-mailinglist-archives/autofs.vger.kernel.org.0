Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F52495B96
	for <lists+autofs@lfdr.de>; Fri, 21 Jan 2022 09:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344179AbiAUIIR (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 21 Jan 2022 03:08:17 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:60953 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343642AbiAUIIP (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 21 Jan 2022 03:08:15 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E08A53202296;
        Fri, 21 Jan 2022 03:08:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 21 Jan 2022 03:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=aPV+QZL1wsUt0K
        wVJAPXjQ2cj6uRcmJcBlmmTBsFkwY=; b=gYEacYfkyKsb+o8l/eff076MkjM2Rd
        nBKW6ySkAomNeZXlcs52xqm94p1RbxH++t+o68LmxdGHvWzOEaIBrPYAs/PMSk7C
        XX132LGjYOJybTf+egQjNK+rqCTwPYpg1H15ZV7zNlv7V5NIN2oqQU+J2Up/ui+8
        voKfmEpJJ2iuEnm1DW6FDi3SMOe4OmG44RO5xHnPKgRXUtKvpk2mMuFez0bL3mu3
        Arj/LLOKwF79WiX/N/7y5D5vIsFMuqRCK+SJw2+o3A6gumnS261XEgIJVaHKaSA/
        TlpLJZN+PNuoogh3ZdnNAyUK5simrPqmDcXwxntCBeFLTmiiuq3gVQBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=aPV+QZL1wsUt0KwVJAPXjQ2cj6uRcmJcBlmmTBsFkwY=; b=Gn6Rc696
        1WEAKEbH3Q3ndEDSL5KbNa1Q3CDo+oyI6zbekiRGkpkbs6+ul38uHLJvibJtlgX2
        2YbIKK/RwjSZ/6E0r4s7AAi3r2Rtj05acAmFQ9a11p/BGsONCTFckj7r3W/tnum8
        Fwgo01A4vgwsivv3g253JYN2KHw+WKfBHp+NXNOpOHiaOlNOhijY9OFlPlQYBHXF
        JZvtoVdEWt8z/33je5U/bRPYeaFjNRAiR9BImxo7nw6C4Tm8NWRIu9iRh4zAzv50
        9XedLIO1eSz5tAqW22EK2oictQdpBEFtr1atGa1ecqKPh7+d9S5Aaz77fCaBhjlo
        CCOdMHK2NKVSPw==
X-ME-Sender: <xms:7WnqYQxVfwhKIS2TlUzX2tfmeWVzrwJqSY6U-Mf0eM-OJ-PwMpDtEw>
    <xme:7WnqYUQaphsiRj1yIrsf2TquCdWl6NINYhMxvdKr4Z9qwDv7NBc5zszOmS5d4cBgF
    VMJfDyTAuAT>
X-ME-Received: <xmr:7WnqYSWfYidjR5mn6WnLUUZocZ0ARIScCbNo0pclPTgCqi0G_zcj_O3HUHDarQ0i7ZQmPGF77ZgDUZYqNxqKLJzyHTCfPQ9HHwCmk3XAZeJyaihx_0anrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelgdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderudenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ffledvtdelheevudevhfekjeefvdekteffueejtdduveeftdevheeuveeihfelffenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:7WnqYehs-HCBMlowtxxcVjFC_8ZWrUPlYCgEVKm88iodJm55ptWcyg>
    <xmx:7WnqYSCTwh365IBPuLOhdQlg6FU4DMn7K6AZbdEmBqgjLxjLyTZyIg>
    <xmx:7WnqYfIAbl5_WK2fNiGHoIID3_W0aSk8xESBN_rO5Po6dUck_YzHbQ>
    <xmx:7WnqYZ_RUTKX0o_SLAbaw0GvVAOjU7CyYdo1wXQ5K-s91WexNfO6gA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jan 2022 03:08:11 -0500 (EST)
Message-ID: <7967061ccfa8de983f7a0c0320547011228cd1f8.camel@themaw.net>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Fri, 21 Jan 2022 16:08:07 +0800
In-Reply-To: <25f3fdb0fff76a6d347c5e6e1f12d6c6dac40916.camel@themaw.net>
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
         <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
         <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
         <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
         <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
         <25f3fdb0fff76a6d347c5e6e1f12d6c6dac40916.camel@themaw.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2022-01-21 at 14:58 +0800, Ian Kent wrote:
> On Thu, 2022-01-20 at 14:55 -0300, Andreas Hasenack wrote:
> > Hi again,
> > 
> > On Thu, Jan 20, 2022 at 10:16 AM Andreas Hasenack
> > <andreas@canonical.com> wrote:
> > > Something still feels wrong, though, and behaves differently from
> > > 5.1.7.
> > > 
> > > I applied all your patches for 5.1.8, even unrelated ones, and
> > > tried this:
> > > # this would trigger the segfault in plain 5.1.8:
> > > root@j-s390x:~# time ls -la /cifs/localhost/private
> > > total 4
> > > drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> > > drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
> > > -rwxr-xr-x 1 root root 64 Jan 19 13:02 hello-private.txt
> > > 
> > > real    0m0.130s
> > > user    0m0.000s
> > > sys     0m0.001s
> > > root@j-s390x:~# time ls -la /cifs/localhost/pub
> > > total 4
> > > drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> > > drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
> > > -rwxr-xr-x 1 root root 63 Jan 19 13:02 hello-public.txt
> > > 
> > > real    0m0.014s
> > > user    0m0.001s
> > > sys     0m0.001s
> > > 
> > > # This is expected to fail, because I only have
> > > /etc/creds/localhost,
> > > not /etc/creds/127.0.0.1
> > > root@j-s390x:~# time ls -la /cifs/127.0.0.1/private
> > > ls: cannot access '/cifs/127.0.0.1/private': No such file or
> > > directory
> > > 
> > > real    0m0.075s
> > > user    0m0.000s
> > > sys     0m0.001s
> > > 
> > > # but this hangs, and ls process goes into D state. With 5.1.7 it
> > > works.
> > > root@j-s390x:~# time ls -la /cifs/127.0.0.1/pub
> > > <hangs>
> > 
> > The above hang happens for me when patch 5 is applied: [PATCH 05/19]
> > autofs-5.1.8 - fix root offset error handling
> > 
> > In summary, for my s390x case:
> > - [PATCH 05/19] autofs-5.1.8 - fix root offset error handling:
> > introduces the hang in the above scenario
> > - [PATCH 08/19] autofs-5.1.8 - fix loop under run in
> > cache_get_offset_parent(): fixes the s390x segfault, and failure to
> > mount the private cifs share
> 
> Thanks for you efforts on this problem.
> The patch 5 introducing a hang is interesting, I'll have to have a
> look at that.

I think this patch might help with that hang.
I may merge that into the original patch but it's separate for now
to facilitate testing.

autofs-5.1.8 - fix fix root offset error handling

From: Ian Kent <raven@themaw.net>

The change to fix root offset error handlling is missing a cache read
lock prior to the key lookup, the following unmatched unlock then
causes a hang.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG       |    1 +
 daemon/direct.c |    1 +
 2 files changed, 2 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 6f18a0bb..f81b0259 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -3,6 +3,7 @@
 - fix set open file limit.
 - improve descriptor open error reporting.
 - fix root offset error handling.
+- fix fix root offset error handling.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/daemon/direct.c b/daemon/direct.c
index 8810900c..cf3f24d7 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -1275,6 +1275,7 @@ static void *do_mount_direct(void *arg)
 		/* If this is a multi-mount subtree mount failure
 		 * ensure the tree continues to expire.
 		 */
+		cache_readlock(mt.mc);
 		me = cache_lookup_distinct(mt.mc, mt.name);
 		if (me && IS_MM(me) && !IS_MM_ROOT(me))
 			conditional_alarm_add(ap, ap->exp_runfreq);


