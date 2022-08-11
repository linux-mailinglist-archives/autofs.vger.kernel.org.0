Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7EA58F57F
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 03:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbiHKBHe (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 10 Aug 2022 21:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiHKBHe (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 10 Aug 2022 21:07:34 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58892647D6
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 18:07:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3ADF75C01DC;
        Wed, 10 Aug 2022 21:07:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 10 Aug 2022 21:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660180050; x=
        1660266450; bh=X5m0LPuTVpq3KapK74Tc3z6n/1yRKFF11sRshoh54cA=; b=d
        eW8JCAeE42bi4s1zvaOj6GpOVls7nRlJO8x7nLDNwEojIOcIY8GAHqwhg2ZJtfwl
        BsBFWWSSbkbOb2w3VUAzWvA/oPCSn0ousg4Cr+yU/WvsVmWlOBUKR2mAgRmJqD+L
        6MEXBqBnCCwYe/DM7Qu925eIAG2feptD0oo9uMFOOkip5gOBFKPlyHDJg6x2k/zS
        0XULG/sWYSzT1QpJTNNj2PG5TNoFb+hKNF7dgnE+gKgzuSOc58SwekZIqkRgtwDA
        lXdXfKVwm6EW0hdicbmVIm5OKQw2KhUaab3G+Hn9Uvn1xUmjVsnODLOJDenin+1K
        RX0Q+0PsUpNcPBpqdXE1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660180050; x=1660266450; bh=X
        5m0LPuTVpq3KapK74Tc3z6n/1yRKFF11sRshoh54cA=; b=XOkiMkJPcUMhWuDFC
        XQK/Q0DkWFX2zuIyhVg1CwpO5WvBI3hQYfnCdbNprEW0aSMUjZQGCM/sm+tvIpye
        DZezpR2lTdaQYddquUOK3JWaF5H7/rIA9AosiAqH6nLUFL40e7mZNWDdOkeCtIb7
        JnxKtfBrI/S8xFOapGcHvpLyzcM2bIaSpnMCc9jYvFF3a7tcaiAtULK3Zarx9R6U
        WyIBNtyANNmS8CByyP7Q65cQ+Feej+aTfPA/jj0+GxbQA3lcVHsynZnHdUDzOoEV
        rt1IrdXDlI3sHSca04GjWB/utf6u4MztOxnJerrQ5I6dpsnGjyKWRIH1oUz2sL+f
        fvqbw==
X-ME-Sender: <xms:UVb0YqscApYHV_qKoFykF0G3VtzqQuESL-9xLzLqYLb2GxmVLuQ5qA>
    <xme:UVb0YvfyQcSJP62HKqNheiXJbqHr5fJ2hLyCpQJdMyrIIk1DE_5EIlNpJWORMl_OO
    az8VJC8MYzD>
X-ME-Received: <xmr:UVb0Yly1cvUlhpZ-z3cy1NAWkZfMEEwdz7yu85X-UV1YaSOWW7mRUN7k3K6jshBBohcfdRfwu1N63HAN9w9TtGeFBkkjMYDWP0mYHAwOg2pvRwi--snP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:Ulb0YlNMe875eZGD4qJMlF-KlE2afHyc_NYxuStII60N3IzF9Vpv6w>
    <xmx:Ulb0Yq_V2UMQ_RvdIFXKfznsqnVUztFL9a0pV4L06-m0iQw-aGRB9Q>
    <xmx:Ulb0YtXR9dm7CW_gxV4DWKZ_iBxqvKtK7bxBto1OL0sjg-nSnW6nYw>
    <xmx:Ulb0YrLt3jgu5eKf4aEP4kKQBYk2-PXtLmsNceYpdQf_8VP35azzgw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 21:07:28 -0400 (EDT)
Message-ID: <b90336b8-82bc-04e8-fb47-b535c8b40124@themaw.net>
Date:   Thu, 11 Aug 2022 09:07:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] autofs-5.1.8 - restore gcc flags after autoconf
 Kerberos 5 check
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <20220809115608.107767-2-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115608.107767-2-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 9/8/22 19:56, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> Heavily modified LIBS and CFLAGS harm succeeding configure checks

Looks good.

I'll add a Reviewed-by when I add it to my patch queue.

Ian

>
> Signed-off-by: Thomas Reim <reimth@gmail.com>
> ---
>   aclocal.m4 | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/aclocal.m4 b/aclocal.m4
> index 33561aa..c671b5b 100644
> --- a/aclocal.m4
> +++ b/aclocal.m4
> @@ -296,6 +296,9 @@ else
>     LIBS="$LIBS $KRB5_LIBS"
>   
>     AC_CHECK_FUNCS([krb5_principal_get_realm])
> +
> +  CFLAGS="$SAVE_CFLAGS"
> +  LIBS="$SAVE_LIBS"
>   fi])
>   
>   dnl --------------------------------------------------------------------------
