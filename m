Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D172255A7
	for <lists+autofs@lfdr.de>; Mon, 20 Jul 2020 03:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgGTB4d (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Jul 2020 21:56:33 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56255 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726225AbgGTB4d (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Jul 2020 21:56:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 42A4A5C00CF;
        Sun, 19 Jul 2020 21:56:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 19 Jul 2020 21:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        HyOm+LBSW9vW2lWa8d31XUr/Gpx9bCg000iZp9/aRKs=; b=jNZWkLQrxrMXiN5L
        iAMbCwUzq91kkRRyxLE+9JYmK//PR9TlnZYShlaeZU45+zln9Tg0B4CB7X0EHvgi
        K7twNed6eRPyXc4cgOseklog8YLQJUPIGh4VcTxuutemt6hJxUQyf//GBPQvFRDS
        Kg75FaYRweFJwoY+42C6H3nVFrfdzQOuFZG3HP6lop3QgUqz9Qkx5lJZHpG6Obf5
        6R4nqrBdOhqkj8SIF2GTRV0NBLq20yUHHaChQWQw3UZBtJNqYGG3aVgT+Ho00GyP
        ihi2rVbnO9fBLx4rb5ea1kTQlw+XGVbmufqUBA0fQHrCD4h8Jt/MGAt7OGEzmzvG
        nywVhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=HyOm+LBSW9vW2lWa8d31XUr/Gpx9bCg000iZp9/aR
        Ks=; b=F4USbDUXR1gmn8Njy/wPD/pgjSJbRet0KQHl3Ga0g6w0cDmAh4kINksNs
        m1dRFc2/1ijsFTNRi83F2hciQzGGchawht+z6ifMbnSxWBxk6SK37TZdaD9oExpk
        zo7w9UPCwngDhjSZ41lamzhOCCKjiuinpurtgwLPseONyJoo8Dbrm8XhTA+bOOWr
        9lLrFobgBqhD9lTPLqRXB8xVuvcgYKtVf8AtVmDnom+gAE48Pzl8NJm74ISDg1yV
        5DSP6vjbRZA3acYm9DgsWnUE8sWGp1LZvEuzuqvsUTY4o1DapnC/HxtmZ4HR5S90
        +WifNkRlOfsasAWfzysYPoc4bNp3A==
X-ME-Sender: <xms:z_kUX8KLfQSKiD9lkppVZIQ5eF18-QYBd-3SMhleIi9HroWRLbussw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedvgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecukfhp
    peduudekrddvtdekrdefjedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:z_kUX8Lp0g-OySRPvKgynOlgGIXOtsSdpZJtDWj6jppOzeJeU8XeFQ>
    <xmx:z_kUX8srCu1gqm-ziPLQ758F1aRqv15Zog7-CY1iDlQZ1cCM6cqmkQ>
    <xmx:z_kUX5ZztL73UDZvzrFZpYcKi2985jO39-pmHRO7LDIlJy8bfFLaeA>
    <xmx:0PkUX7oB1UOPdYiVszmHDSzZ4-GTPb8cuglsiyxpyvpnyhFwntEmSw>
Received: from mickey.themaw.net (unknown [118.208.37.175])
        by mail.messagingengine.com (Postfix) with ESMTPA id BABF53060067;
        Sun, 19 Jul 2020 21:56:30 -0400 (EDT)
Message-ID: <ab3172ead49897b6ca2fcb11160513336d99a09f.camel@themaw.net>
Subject: Re: [PATCH] autofs: mount_nfs.c fix local rdma share not mounting
From:   Ian Kent <raven@themaw.net>
To:     Achilles Gaikwad <agaikwad@redhat.com>, autofs@vger.kernel.org
Date:   Mon, 20 Jul 2020 09:56:27 +0800
In-Reply-To: <20200719094454.GA288362@nevermore.foobar.lan>
References: <20200719094454.GA288362@nevermore.foobar.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sun, 2020-07-19 at 15:14 +0530, Achilles Gaikwad wrote:
> When using the same system as nfs-server and nfs-client, and
> using `nobind` option for autofs we would fall to the code where
> we let `mount.nfs(8)` to handle the mount. However, when the
> nfs-server and the nfs-client is the same system we end up calling
> `rpc_ping` which gives negative return code. Due to this we fall to
> the label next: and never attempt a mount of nfs share.
> This patch fixes this BUG by not probing rpc_ping if we're
> using rdma.

I made some minor changes to the patch.

In the subject I changed "autofs" to "autofs-5.1.6".
I moved the declare of ret up and added a blank line following it.
I changed the format of the comment a bit (but not the content).

Currently I've pushed all the patches I have to the repo. so
there's no need to keep the patch in the patch queue, waiting
until I'm happy with others before it.

I'll push it to the repo once I've built autofs and used it a
few times just to be sure it's ok.

Thanks
Ian

> 
> Signed-off-by: Achilles Gaikwad <agaikwad@redhat.com>
> ---
>  modules/mount_nfs.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
> index 4e3e703..5a8c3bf 100644
> --- a/modules/mount_nfs.c
> +++ b/modules/mount_nfs.c
> @@ -375,9 +375,13 @@ dont_probe:
>  		 */
>  		if (this->proximity == PROXIMITY_LOCAL) {
>  			char *host = this->name ? this->name :
> "localhost";
> -			int ret;
> -
> -			ret = rpc_ping(host, port, vers, 2, 0,
> RPC_CLOSE_DEFAULT);
> +			/* If we're using RDMA, rpc_ping will fail
> +			 * when nfs-server is local.
> +			 * Therefore, don't probe when we're using RDMA
> +			 */
> +			int ret = 1;
> +			if(!rdma)
> +				ret = rpc_ping(host, port, vers, 2, 0,
> RPC_CLOSE_DEFAULT);
>  			if (ret <= 0)
>  				goto next;
>  		}

