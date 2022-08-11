Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0884C58F74F
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 07:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiHKFgV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 11 Aug 2022 01:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234021AbiHKFgT (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 11 Aug 2022 01:36:19 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970D218B1B
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 22:36:16 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id BE8A75C01B7;
        Thu, 11 Aug 2022 01:36:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 11 Aug 2022 01:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660196175; x=
        1660282575; bh=yNF7SryojVMHHdW6i3nOfChR3w+f6f+x6Q6Fai09liA=; b=C
        aZ77LcijwVy9FKyFvgp0Twrin8PNO9dm+25mi5a+QG5lhETnFKnLZeq9kiGM1k3g
        kEelPCW4V6kTGqJkHho0BIPL6m85k8zVMdeEZDB6zxQIDDX1fI/6S3OQrVW1bOsu
        Dy9+s+FijzTuWReKBLnMYljQJO+X9skN/b9lrMjcc1Z/WO1JDgWsAYDjvonK5Y4u
        UOpmNIzGp+d5TyVKO1DbhfT7+B+nP8Bs16ms2A/fD+sioh6UOu/bfxGyjtZfzPO7
        mk//NqK3iZUpxmdvRu7Zhl2h3zlAlRnlIx50eNqcv6Tl9alLxF7ILYP4BuTgeG87
        u9J7GXZKlaK61/RaGvCzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660196175; x=1660282575; bh=y
        NF7SryojVMHHdW6i3nOfChR3w+f6f+x6Q6Fai09liA=; b=xpAt5IdkglvpkcmsQ
        b0WOjBD7STI378iLSiYaDJqixCkubSEJWJpGU+nFBpdJwZN3jxivr2/RBuRX1tzW
        nRmmiW82sKjl5vYmHeRGKNk06kGye70ZX/tbudsitfi5RSA509h0YW/ROzGRonVc
        no1WGYnGQ6A4+4gCCF5vIddmVcDIGgsMoThXcx2tgG+xLm/cMF9SUyKIU+6saG3w
        xjTiQUgbezKSqWRNsJSOr7zdbxpDiw60KFdMyFNuUwP0U1EVH/JYdc5PsarTKpBD
        0XPPA7SSHIGqw1Z9+fcWPu93/7Lj4mPz1UuGNqVfHr+VyeYi/n4VP6WHR51kIk8r
        dEEUA==
X-ME-Sender: <xms:T5X0YhUTosULFCBGwCgTkRBn7W2YGUS6YvZa7jju0GYpJIyQLqbjfw>
    <xme:T5X0Yhkaedgoi4cUx0Ux8nkjbbuyhYwDg1It1knSThmFfUIJiBiULIIOM-qy-5t8N
    8XATpYOczpk>
X-ME-Received: <xmr:T5X0Ytbqbq2OOVVw3JdJCOZXWuDtPYQklvbMuK6lRS1bRrB_FaozcjeOQeM5sheWp05DG37B59LtZAi3zJ_-PzPevIZCnPTp4J4gAdFmtnfJUiim-sZj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:T5X0YkWtYdUOvsQzCnjp39nW8Lj5jC0x7BpajqHl-XK5QsIKK0zUNQ>
    <xmx:T5X0YrmIImqL_z8QzlqeGTdrXZbNRBB0dNsdoydUuyxCulmE7fsOTw>
    <xmx:T5X0YhcJ_TB05BCGKYKksb5JDUnn01E2IXVSTihx5Rk1jtHA4-McCg>
    <xmx:T5X0YhQXM9tbeI8EPiXDVV89caept8aK_qMvevLRiW3V8C3rs8_DBQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Aug 2022 01:36:14 -0400 (EDT)
Message-ID: <bf794c89-d959-f475-3577-b1897cdd0aa8@themaw.net>
Date:   Thu, 11 Aug 2022 13:36:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] autofs-5.1.8 - improve debug logging of SASL binds
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115710.108512-1-reimth@gmail.com>
 <20220809115710.108512-3-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115710.108512-3-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 9/8/22 19:57, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> automounter only provides very limited debug information when binding
> using Cyrus SASL. LDAP based directory services currently all increase
> communication security, which makes it difficult for system administrators
> to find the root cause of failed authentication binds.
>
> Log Cyrus SASL binding parameters and result.
>
> Signed-off-by: Thomas Reim <reimth@gmail.com>
> ---
>   modules/cyrus-sasl.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
> index 3736d12..8984f0f 100644
> --- a/modules/cyrus-sasl.c
> +++ b/modules/cyrus-sasl.c
> @@ -136,7 +136,7 @@ sasl_log_func(void *context, int level, const char *message)
>   	case SASL_LOG_DEBUG:
>   	case SASL_LOG_TRACE:
>   	case SASL_LOG_PASS:
> -		debug(LOGOPT_DEBUG, "%s", message);
> +		debug(LOGOPT_NONE, "%s", message);
>   		break;
>   	default:
>   		break;
> @@ -960,6 +960,26 @@ sasl_bind_mech(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt, const c
>   	result = do_sasl_bind(logopt, ldap, conn,
>   			 &clientout, &clientoutlen, chosen_mech, result);
>   	if (result == 0) {
> +		/* Conversation was completed successfully by now */
> +		char *data;
> +		sasl_ssf_t *ssf;
> +		result = sasl_getprop(conn, SASL_USERNAME, (const void **)(char *) &data);
> +		if (result == SASL_OK && data && *data) {
> +			debug(logopt, "SASL username: %s", data);
> +		}
> +		result = ldap_get_option(ldap, LDAP_OPT_X_SASL_AUTHCID, &data);
> +		if (result == LDAP_OPT_SUCCESS && data && *data) {
> +			debug(logopt, "SASL authcid: %s", data);
> +		}
> +		result = ldap_get_option(ldap, LDAP_OPT_X_SASL_AUTHZID, &data);
> +		if (result == LDAP_OPT_SUCCESS && data && *data) {
> +			debug(logopt, "SASL authzid: %s", data);
> +		}
> +		ssf = NULL;
> +		result = sasl_getprop(conn, SASL_SSF, (const void **)(char *) &ssf);
> +		if (result == SASL_OK) {
> +			debug(logopt, "SASL SSF: %lu", (unsigned long) *ssf);
> +		}

Brackets, ;)


Ian

>   		ldap_memfree(host);
>   		debug(logopt, "sasl bind with mechanism %s succeeded",
>   		      chosen_mech);
