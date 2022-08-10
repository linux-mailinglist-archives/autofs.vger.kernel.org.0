Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A4758E450
	for <lists+autofs@lfdr.de>; Wed, 10 Aug 2022 03:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiHJBEn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 21:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiHJBEm (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 21:04:42 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32D97FE64
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 18:04:41 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 6618B5C01B4;
        Tue,  9 Aug 2022 21:04:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 09 Aug 2022 21:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660093479; x=
        1660179879; bh=KZIDtlNpSo20POWmcwK4B90vzWseozE0U5xVG0cty+4=; b=T
        edHXWM0gn+wur9tDuk9W+npCM+B4MRGI7uuINjGzSX3SPqPj74s1xAYkRO/hvumV
        9BR5HBdq8VJ6fnWObq3XP76OYgAcPjaCxbi5xUA0p4PCUStMooid5g16nQbrnE7v
        F1qQs+eMDG2DSODb/L+hr7DG1yLAvn4BIjBbmuUJHDOPxyPOZcmRKkaph5ko8woj
        seYOIYUaCm0dcDOWoygdtRw00KphORbBylQXwK7hXQ8B28vb/I/WOvIJWBtELzfW
        5BWmv6E/YMka2XUYbbFCQYgFAv1oyS14Gmo2L8EkELs8bsKFgGKXAKlgsV6Lrr+X
        RAVzmBwstg7w78QKhrHug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660093479; x=1660179879; bh=K
        ZIDtlNpSo20POWmcwK4B90vzWseozE0U5xVG0cty+4=; b=1JK1qIaKRVUZc8L03
        OH2yT7Q+N/s8wt+7vjVKtqNpUftr+1VD2PU5b2qgs4Q3iyo1NWKZI2fJxtggUJQn
        HN5770sWw8mmDrdP9+J/ElYZz1DaDmhbiinNmDZEkuSWsNv1zxpgocB1rgO7SjK9
        r00zu/PF+F5shSA1+a0Pl6Ui1rF/ywiW0ED3bDofaJ0PMIk2xMgj1YWxIitKggeG
        zzIvX/4tk+wjkM6rNfTq1Ig2Exhul8q6fMrehD7smfN4dwZSpqJM2BLcWN7znVHi
        qUcCfkCQnReK6op+QjBdmKoLAkABi4AkE7RuK47LMurr3u7Nt+1ho6bi84sW/IWS
        Y71vQ==
X-ME-Sender: <xms:JwTzYndVuB3U_K7oAqXjv8dAhuR1eRrHX2ZQzH4uQ9vD3_SmpB5LZw>
    <xme:JwTzYtNp74eq7SQiteltprijNNMCrPs35WqtBXEYx6_fapXcnYHRQ1Qk24r0CcIwD
    xZXgAcoXC-1>
X-ME-Received: <xmr:JwTzYgj553l6utIqWfzdsDymZ0ZnmZjtC_yWYtuXfTlLy8n4Yc3GPEfyyTbbo9YVbA-YG2wPahFviN27YvoIEH8EqXRVzMNdqk5g4MCrfy1-Jel2JaDT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:JwTzYo-kxRmyfXY5AujZAhK_k6kPxlyKbI5NXR4B0BqkbeJ6nz5EhQ>
    <xmx:JwTzYjtPF31oFHxVse_95B78HPSnbhW67pHAeD-MWf_BvHU86VZBtQ>
    <xmx:JwTzYnFaZukVccCN4b7_AdCZa86k2HhCMPLxya3jlc3F8bv-fpB-qw>
    <xmx:JwTzYg7k2QBqpuHgXAqBKM3Xn0w_6x03Up5NkcR835l7Vh3QcqWi6w>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Aug 2022 21:04:37 -0400 (EDT)
Message-ID: <75d2e158-631c-5785-d0be-3328056db540@themaw.net>
Date:   Wed, 10 Aug 2022 09:04:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Missing Support of SASL Sign or Seal using Data
 Security Layer
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115608.107767-1-reimth@gmail.com>
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
> Since version 4.4 Samba AD domain controllers default settings only allow
> for simple SASL binds over TLS encrypted connections or SASL binds with
> sign or seal, i. e. data security layer encryption, over unencrypted
> connections. Therefore, current automounter cannot fetch autofs maps from
> Samba AD DCs using SASL anymore without setting Samba configuration
> parameter "ldap server require strong auth" to "no" or "allow_sasl_over_tls".
>
> Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode using
> an SASL data security layer according to IETF RFC 2078. This security layer
> provides for traffic encryption during authentication and authorization
> towards an OpenLDAP based server and for subsequent encryption of data
> traffic for the LDAP session. Current automounter does not implement SASL
> security layer encryption and only relies on TLS to protect LDAP
> communication.
>
> OpenLDAP libldap if compiled with Cyrus SASL supports negotiation of an
> SASL data security layer based encryption of LDAP traffic. libldap also
> provides automatic negotiation of the best suited SASL mechanism taking
> into account application required defaults.
>
> This series of patches updates automounter to let OpenLDAP and Cyrus SASL
> handle SASL binding and traffic security configuration. Proposed changes
> are backward compatible for clients that use LDAP libraries different from
> OpenLDAP. When using SASL mechanism GSSAPI or simple authentication with
> TLS encryption automounter seamlessly interworks with latest Samba AD DCs.
>
> Please review and provide your comments or suggestions.
>
> Thomas Reim (4):
>    autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
>    autofs-5.1.8 - prepare for OpenLDAP SASL binding
>    autofs-5.1.8 - let OpenLDAP handle SASL binding
>    autofs-5.1.8 - configure: LDAP function checks ignore implicit
>      declarations
>
>   aclocal.m4            |  52 +++++++++++++++
>   configure.in          |   5 +-
>   include/config.h.in   |   3 +
>   include/lookup_ldap.h |   6 ++
>   modules/cyrus-sasl.c  | 148 +++++++++++++++++++++++++++++++++++++++++-
>   modules/lookup_ldap.c | 102 ++++++++++++++++++++++++++++-
>   6 files changed, 312 insertions(+), 4 deletions(-)
>

Thanks Thomas, this functionality sounds useful and the code looks good.


Mostly the comments I'll make later (once I've looked at it a few times)

are about my coding style preferences but there was one place where I

had questions about some function call behaviors. I'm tempted to make

the style changes myself but it's your code and I'd probably make a

mistake or two, ;)


Ian

