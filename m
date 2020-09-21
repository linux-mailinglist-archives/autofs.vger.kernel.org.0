Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2512720DD
	for <lists+autofs@lfdr.de>; Mon, 21 Sep 2020 12:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgIUKZ5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 21 Sep 2020 06:25:57 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45389 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726814AbgIUKZ5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 21 Sep 2020 06:25:57 -0400
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 06:25:56 EDT
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id C2A025C01A5;
        Mon, 21 Sep 2020 06:18:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 21 Sep 2020 06:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        ceahJVW4+yuWF+kSG2r5lwdXzTSgR8vbAek/nrq8UjU=; b=l5ptg86bc5V/RHyE
        pOAhxbkucHU4NEHF+mmUASzf2XvjYDStxvrhPsDI6z3e/bYofIAiNfH4bW+lSp4O
        EaCZ82Exh5JttcUSVoMhZUM8RUZXtB4zId62yOOw1HK5lqaXK7Bkh0/dAA+WQnV7
        aQEIpN5ae+YoufDDDMucT5IdWLbx1OLbUU16t3Jv2GU+TqLYK197fORudVcC4vzY
        3j7mpUI1quAqWQ5dSx6OBmu8x3gY6+mno84VSMz/mFYHS/4Q+ooU253qvHxYH4Zj
        RIhOHovFqz04VRWRrvR6UyG9GKKe2jTUYK3YAaPgkZHvPhuPFse74Rwss7QQdFji
        dWz2yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ceahJVW4+yuWF+kSG2r5lwdXzTSgR8vbAek/nrq8U
        jU=; b=T7e1OpS5g8dHYozL+rnZxJBqAjtfteNvD6RsvzYYODsjF/RpUdWJ9TIWZ
        SyvTsOIx7/LHFNc+ze4lim+DqHIa5l6VCIK/KT8wIiJzDA3zQCC8V7tP5hDkayYP
        szEIi7z215Sra+TJCwUwOdbeVqnTyVKoCZgLgY1ah6Ij5ViJfrKBsVDwdPZSs3rK
        QSA40LQg0OvQhJ34aQivzFdjj/fxB6Dii0oJ7FGqN/UDYSfl4DC/5L3sUYmCC2ra
        8qMkAi2ToGsVXQQCaJj2TkukqjbqNWuW9mpycNykgw+OqeeRX+S1eoOiZAMH8QtO
        yShyqyUnuv9Br88qgCr6nYHILcKNw==
X-ME-Sender: <xms:2X1oXyd01bnnoOGBFQbWE9c2a_u0jWxQTCjwoFzmKLo0uepxIBThvQ>
    <xme:2X1oX8OaJxS4-o5daBEQF3xBS_OAAkltqM5H7LwVlPMqHQ_2Hk5nyFYcEBNOTXuXV
    2J-mEeQ07gD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecukfhp
    pedutdeirdeiledrvdefledrudegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:2X1oXzhvDOea3j_0OnxOz7Wz6Gr_bv3T2KJoRrcmCgiakIabXrcwOw>
    <xmx:2X1oX_8Wu-i6DZXnJwPfzYv8l-74KDmf-IKDkal8QU3IEnI6PL-EDA>
    <xmx:2X1oX-uoqb-0f9ze2imiwN9ekwEMep1MpKM9t3iDBtcA0Dvpm8HkCw>
    <xmx:2n1oX007E4WIJAFaDSQjS0TSoI2VIfhz91ToqMOlriLCNUHaRlPVBg>
Received: from mickey.themaw.net (106-69-239-147.dyn.iinet.net.au [106.69.239.147])
        by mail.messagingengine.com (Postfix) with ESMTPA id 18F243064682;
        Mon, 21 Sep 2020 06:17:59 -0400 (EDT)
Message-ID: <3295700fa7b67ea0cd7122b68d92acb940ab8700.camel@themaw.net>
Subject: Re: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
From:   Ian Kent <raven@themaw.net>
To:     Fabrice Fontaine <fontaine.fabrice@gmail.com>,
        autofs@vger.kernel.org
Cc:     Andreas Oberritter <obi@opendreambox.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Mon, 21 Sep 2020 18:17:55 +0800
In-Reply-To: <20200921053305.1895230-1-fontaine.fabrice@gmail.com>
References: <20200921053305.1895230-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-09-21 at 07:33 +0200, Fabrice Fontaine wrote:
> From: Andreas Oberritter <obi@opendreambox.org>

Thanks for the patch.

> 
> Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
> nothing but "#include linux/nfs.h". rpc_subs.h already includes
> other linux/nfs*.h files directly.

Sounds sensible and the patch applies cleanly to the current
upstream repo.

> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Upstream-Status: Pending

I've added this patch to my patch queue.

I'll likely be pushing my patch queue to the repo. fairly soon
because I need to get release 5.1.7 out. But I do still need to
carry out some more extensive testing before doing so.

> ---
>  include/rpc_subs.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/rpc_subs.h b/include/rpc_subs.h
> index b6d59f9..a2d9648 100644
> --- a/include/rpc_subs.h
> +++ b/include/rpc_subs.h
> @@ -18,7 +18,7 @@
>  
>  #include <rpc/rpc.h>
>  #include <rpc/pmap_prot.h>
> -#include <nfs/nfs.h>
> +#include <linux/nfs.h>
>  #include <linux/nfs2.h>
>  #include <linux/nfs3.h>
>  

