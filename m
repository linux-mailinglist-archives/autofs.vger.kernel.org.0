Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 640AE13A046
	for <lists+autofs@lfdr.de>; Tue, 14 Jan 2020 05:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgANEj2 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 13 Jan 2020 23:39:28 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54383 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbgANEj2 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 13 Jan 2020 23:39:28 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1BC652232D;
        Mon, 13 Jan 2020 23:39:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 13 Jan 2020 23:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        OFAug/VyLlyZWdbNCmp+b/BW74ZJX2y2p2uxm2ib+9I=; b=tQRu0dPUvhRU3L+B
        jEO5mb+2yW1f7l8SOKo2vv9mNrIeNcgbJQu32rsPaMP+YwvMKWwvpb4NAroePO0g
        1iq5StNG1tk9KZ4rpNV6xQNdZrcUXodOng+YUKxHxAMF9KS/ok3Cy1Nybj+yOs3o
        J2Inysrsr++HzGK5wePxSRTuIDDuET+bWGCc6DXqFqN6Q3qcIDAB7fjWvkOZeKWp
        f8Yo1FUCelZCwQCfcnfA0PwxypOYdA+jL4lk22V7ULwt52D6BlVn08+n/y+zthUl
        ltHjKwAkMMWHi4524TxrO6OXQL3GFNeilf/HPFtP+PQVQh4Vhr6FzF/GQmvrT8B1
        H7+bPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=OFAug/VyLlyZWdbNCmp+b/BW74ZJX2y2p2uxm2ib+
        9I=; b=TXFIddbqYc2L18jhJXBSs+mKqWcAPa/t6MIwQ4x4/ioZTlOsXEUARwwrw
        7ZXc46nVWPhnfIEKQaYSCa6Ksd3IQJjyRcZ7Lr5SlV+DsvFla1r5Vy+WaJHTkZxW
        2yp/wHNzjwEaU3QM3WlQ1QWMZb8z1ooLvaHDiuaRdGxoukHsIMm0/q7dUkTDhKlY
        yYWcJl1ZfpzXqXEzYCnUeWFPxNbISN/2wvXGUShtFsRLwg9wn7kk08fSooV+MKJQ
        sbmwk8hepnxvycMVySp7D4w+qSa7twXhvJkHsieLhVYhpA31ul88DOM0WEpLX6sj
        qWobRkIpoJo3Uz+Np+lrliWBU6VKw==
X-ME-Sender: <xms:_kUdXnbne0WURQnKLE26e5Offw1c_JIYqbl1n-Mb18g9usJpZpwAEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejuddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuffhomhgrihhnpeguvghfrghulhhtrdhinhenucfkphepuddukedrvddtle
    drudejhedrvdehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgr
    fidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:_kUdXqqGoj20Ubji6jayAQXdx2Ctb8RKbmIvadoIu-7yh7X66iesMA>
    <xmx:_kUdXk__kpU_MrDzdkeOdEEmNZ_tBkW5OartGIVHo1Scw1kMsR0GZQ>
    <xmx:_kUdXh-4yq40LVfrFpF4Ll7Nl3nki8vYnGdT6F8NychaiopZux_pTA>
    <xmx:_0UdXowrZOnXCU6kB_lLm9Ak5oZ_Q8jMjaaRf1OnGk7tkL0RZ69tdw>
Received: from mickey.themaw.net (unknown [118.209.175.25])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7217030600A8;
        Mon, 13 Jan 2020 23:39:25 -0500 (EST)
Message-ID: <e7d2a0da66aeef258066d98627109e3ea420b444.camel@themaw.net>
Subject: Re: [PATCH] Update browse_mode documentation
From:   Ian Kent <raven@themaw.net>
To:     "aliveTerraN ." <nurgrak@gmail.com>
Cc:     autofs@vger.kernel.org
Date:   Tue, 14 Jan 2020 12:39:21 +0800
In-Reply-To: <CABPfrkx8afzQeb_DssZX9c8k2tzU-K7XX_qHvzq4zHqzhfnX+Q@mail.gmail.com>
References: <CABPfrkx8afzQeb_DssZX9c8k2tzU-K7XX_qHvzq4zHqzhfnX+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-01-13 at 22:53 +0100, aliveTerraN . wrote:
> After listening to your feedback Ian, I have added installed
> configuration default information to the browse_mode parameter to
> better distinguish it from program default. How does this look?
> 
> Signed-off-by: Andreas Polnas <nurgrak@gmail.com>

Looks good to me.
I'll add the patch to my queue.

Thanks
Ian

> ---
> diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
> index 39239d4..bbee5be 100644
> --- a/man/autofs.conf.5.in
> +++ b/man/autofs.conf.5.in
> @@ -63,7 +63,8 @@ but it is the best we can do.
>  .TP
>  .B browse_mode
>  .br
> -Maps are browsable by default (program default "yes").
> +Maps are browsable by default (program default "yes", installed
> +configuration default "no").
>  .TP
>  .B mount_nfs_default_protocol
>  .br
> diff --git a/redhat/autofs.conf.default.in
> b/redhat/autofs.conf.default.in
> index 09bb5dd..f456579 100644
> --- a/redhat/autofs.conf.default.in
> +++ b/redhat/autofs.conf.default.in
> @@ -46,7 +46,8 @@ timeout = 300
>  #
>  #umount_wait = 12
>  #
> -# browse_mode - maps are browsable by default.
> +# browse_mode - Maps are browsable by default. Internal program
> +#           default yes, installed configuration default no.
>  #
>  browse_mode = no
>  #
> diff --git a/samples/autofs.conf.default.in
> b/samples/autofs.conf.default.in
> index 4a18f6f..f132413 100644
> --- a/samples/autofs.conf.default.in
> +++ b/samples/autofs.conf.default.in
> @@ -46,7 +46,8 @@ timeout = 300
>  #
>  #umount_wait = 12
>  #
> -# browse_mode - maps are browsable by default.
> +# browse_mode - Maps are browsable by default. Internal program
> +#           default yes, installed configuration default no.
>  #
>  browse_mode = no
>  #

