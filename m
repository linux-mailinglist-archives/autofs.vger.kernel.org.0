Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2811C488719
	for <lists+autofs@lfdr.de>; Sun,  9 Jan 2022 01:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbiAIA2N (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 8 Jan 2022 19:28:13 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48711 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230433AbiAIA2M (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 8 Jan 2022 19:28:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1C7595C0099;
        Sat,  8 Jan 2022 19:28:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 08 Jan 2022 19:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        lgj2Tm3Hu/oKnptdET3C3oKnuJkJ38bqspzolNjgut0=; b=TfnpYL5LTD9TcCH0
        5uM4FIKMGP6jsnCYW6ttxgtExTJa9NNsuMjH9CRwp/YIEqOYhLh3vxQddK7osTZI
        tB+ibiBF6G69Ya/QhXh7Gd1kRaDdX1aRcIwWMc6VLq+IkEnrb4MtiYwFIy8CtTek
        gc9JUNgVLrHPGqoboql7vu8Yuf3M9YpXCB1WObV9Mv0r/Z+eTMp037HHspyAv4m2
        PKPLaBzbYW3AhSvo2bcTX8u07wxnIHySjxhGsR12JnFeTMTDfI5HeoYa7CiyFkyf
        MmmnFUOICSG2VQHVlaD0VFRCnP3d1l86htWBaCFk+jVSOvzixm4EtlKWtTqeJ3nv
        mo9sSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=lgj2Tm3Hu/oKnptdET3C3oKnuJkJ38bqspzolNjgu
        t0=; b=SDwp8mHonZDo5KuagaFepLrP2zZl1iI+Bh9j8D3QrpIPoMDeTMr69I7U2
        RkyuiWHF5rLyrV8n/t/PkLI0lj3AsgDTk06U8jYVFrWbCLU64Olt6f+RaG2767tj
        kyolc2gwUu5UDWocJ1Y1RNTenItwPNU3k4HDuP6FzUMq6zd5YuBvAMOuNZhtJcb3
        lO9Zvihk6CMXRtYlR0kJ7noiDEjsX1A4XAOkYOgLJe9UDNPIvmz+tXQQs4F/xlZ8
        e+ziImXy5SH6s4EM40JMhboWlRFUcqRvck+ri2S/t4fzRIhE26Yfq8pOkSuF++Dl
        38w6Z2WcdwHWZYExAeEwPIgXPokPg==
X-ME-Sender: <xms:GyzaYQSpRliMSn0ndBq0TXjZqid44YIq1dsjuctvSk9RkFEyzwbHEw>
    <xme:GyzaYdyqlaHUaxRzVR4hQ3Eu5S_3gu3B9rQk8YUX6yp9WgTH7n6LezkZgdc6IhcG5
    6zJvPFS6DH5>
X-ME-Received: <xmr:GyzaYd2_a4a0Xz1AnoUVhZWyU1H2PvpdU5ccNC02AC_wf8sddY_aGbDCDOeVdMyUrSSRkUNPWXtgsfvkksT5fI33jCRzVVqvIcto1E9LxumHezfwBF4Aqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegiedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtke
    ertddtredunecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepieduudejfeefkefhteevffeltefhieegffekhf
    eiteefkefgffetheeiieelvdeunecuffhomhgrihhnpehgvghnthhoohdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:GyzaYUCr4NQ-DZ57K-T4t6Kxgq1zwmHDi8rIhqrDRg6gTUiDdGy7Kw>
    <xmx:GyzaYZguyBjDFxFuYp9Uw01jgkIaximraqVyC-v5fxAfp6Jr7SHMFQ>
    <xmx:GyzaYQoDH6z_d_l4IvJPG7G-QMpyTUBeXvRciQbH2wlPVGLZRF_WkA>
    <xmx:HCzaYZIbTGY1a9L2bGiNm-W0hf-7WvcB_cW8vMEk2dAKpleZiO7pRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Jan 2022 19:28:10 -0500 (EST)
Message-ID: <6471245804b3d448ada9bd42527f7639489217c1.camel@themaw.net>
Subject: Re: [PATCH 1/7] autofs-5.1.8 - fix missing include in hash.h
From:   Ian Kent <raven@themaw.net>
To:     Sam James <sam@gentoo.org>, autofs@vger.kernel.org
Cc:     dlan@gentoo.org
Date:   Sun, 09 Jan 2022 08:28:05 +0800
In-Reply-To: <20211224220225.2531481-1-sam@gentoo.org>
References: <20211224220225.2531481-1-sam@gentoo.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2021-12-24 at 22:02 +0000, Sam James wrote:
> Fixes a build failure with the musl libc:
> ```
> ../include/hash.h:74:8: error: unknown type name '__always_inline'
>    74 | static __always_inline uint32_t hash_64(uint64_t val,
> unsigned int bits)
>       |        ^~~~~~~~~~~~~~~
> ```
> 
> We need to include stddef.h from linux-headers to ensure
> _always_inline
> is always defined.
> 
> Bug: https://bugs.gentoo.org/828918
> Tested-by: Yixun Lan <dlan@gentoo.org>
> Signed-off-by: Sam James <sam@gentoo.org>

Hi Sam,

Thanks for this series.

I've added them to my path queue but still need to perform a build
as a check.

I can't say when I'll commit them to the repo. but I have a number
of bug fixes to commit as well when testing is completed and I'll
do it then.

I may end up doing a release fairly soon too because of those bug
fixes, not sure when that will happen.

Ian
> ---
>  CHANGELOG      | 3 +++
>  include/hash.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/CHANGELOG b/CHANGELOG
> index 3be6119..e4e3362 100644
> --- a/CHANGELOG
> +++ b/CHANGELOG
> @@ -1,3 +1,6 @@
> +
> +- musl: fix missing include in hash.h
> +
>  19/10/2021 autofs-5.1.8
>  - add xdr_exports().
>  - remove mount.x and rpcgen dependencies.
> diff --git a/include/hash.h b/include/hash.h
> index 2447f29..010acd7 100644
> --- a/include/hash.h
> +++ b/include/hash.h
> @@ -3,6 +3,7 @@
>  /* Fast hashing routine for ints,  longs and pointers.
>     (C) 2002 Nadia Yvette Chambers, IBM */
>  
> +#include <linux/stddef.h>
>  #include <sys/types.h>
>  #include <stdint.h>
>  


