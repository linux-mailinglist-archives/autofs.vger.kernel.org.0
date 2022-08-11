Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2F958F5C7
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 04:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbiHKCTc (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 10 Aug 2022 22:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbiHKCTc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 10 Aug 2022 22:19:32 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530E68C468
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 19:19:31 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B49C25C0189;
        Wed, 10 Aug 2022 22:19:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 10 Aug 2022 22:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660184370; x=
        1660270770; bh=z2drrCAPShE62VN2WUPxVZLtFpT5idPz2JhKZZqF6fE=; b=S
        4/XVZWGWcODMY/EEEbm5NxeLywuZtWspzOorjrC9OxGTDUtWFubOrUnxbvW1Dfi/
        syBx33T3nHzeTSrNG0gr0+y00ClAjoSeti4oEfbwaF123bEG+cBz3PdSJEBzLcdz
        LbBGASErzE2Wo+9HLcI2hkcJluMbA+zjMhcLhXnB0Fm1FdWVUEY27fVyIxM54smB
        k3OwvqLMxLebj7LS7Tuh7iNtjfSpyVcIa52/GUfcOv5mU+dfx3wutMiY4orNII4c
        Jn4Z5dcddMHEd9A//S6jNSGqIPD+aLDsWA4mH1zes6ZzqPEKsMGXbftEvN+p3paZ
        56z3Nz7nFZ/Nx//Ea/Q9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660184370; x=1660270770; bh=z
        2drrCAPShE62VN2WUPxVZLtFpT5idPz2JhKZZqF6fE=; b=PNKh4zy5trZ+FqfMe
        eJvUl//46TOQ3s1EWFZRp6rkR/iReoMjoN9n0PD1UkqfCIKrpDfE9sWcWcyWa8xh
        KPuSr8/Co1TDtnCv1uE7UIrlaEu/wdLKBTzvjw61vsEMo+/V8pl+x156OWv95hue
        +sTwhf7R6Q3yVsvVH/llUQSr9fYuyqCmUAtymALcGhBeSfHgclNWGCApJoXgqSMD
        H5s1wtvVW48bKbbYzYWpjt0BmZwvjNsktBlw9j/OJvthSZriWyWUGMcAN/J7dbLF
        DW/wCGyKVC4xNahcqyjAzqSW3+Xg20oViLswGMneu/tjhZrc0966j9uz0PavdYY2
        JOUsA==
X-ME-Sender: <xms:Mmf0YrUiWygRPHrHYcAXS83y-Tsam7KS7zXAgOMjDppYp2yz8FYSgw>
    <xme:Mmf0YjmBzkz9LFQ5N9MmNOOaZ9f8bu2kSYmsi4btFR58R5E4mM1rmn78r2iFoCxWE
    W27wJ99nhJ->
X-ME-Received: <xmr:Mmf0YnaT8sESS6OVpk6NpXe4uY2XQqO_rX0xFifmIVZcGQLfIB8AmWmskgdWNH8iCDlWZ8H8sye7KiWos84PDsTt2z17CJFV7q13Oj6I5HD29ZWyD5na>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:Mmf0YmU5cA6A0HP_bTqnc2W1oxX4peAgEVg92xjy1lWitGnmZ-KpAQ>
    <xmx:Mmf0YlnyuLQfzpof2yfz238FHWILe-rJO6Cesb_1uuicVzvmyQiYVg>
    <xmx:Mmf0YjfCbTXgSr7L9hPewvkOoXU96iy4cS1utDPyvh_GxxLReesIaQ>
    <xmx:Mmf0YjRC4qwrVebVEkQqAa_WHJmhyCsEuXeAJ0T4XwykKdimiJ85gA>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 22:19:29 -0400 (EDT)
Message-ID: <712e420d-a6ee-0d60-6e51-24b2b9ddf16a@themaw.net>
Date:   Thu, 11 Aug 2022 10:19:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] autofs-5.1.8 - configure: LDAP function checks ignore
 implicit declarations
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <20220809115608.107767-5-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115608.107767-5-reimth@gmail.com>
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

On 9/8/22 19:56, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> Wrong CFLAGS: gcc handles implicit function declaration as warning with current
> flag settings. Missing functions in libldap will not be identified.

Another good catch.


Ian

>
> Signed-off-by: Thomas Reim <reimth@gmail.com>
> ---
>   aclocal.m4 | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/aclocal.m4 b/aclocal.m4
> index 91b22da..9fc20bf 100644
> --- a/aclocal.m4
> +++ b/aclocal.m4
> @@ -379,6 +379,8 @@ AC_DEFUN([AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL],
>   # save current libs
>   af_check_ldap_create_page_control_save_libs="$LIBS"
>   LIBS="$LIBS -lldap"
> +af_check_ldap_create_page_control_save_cflags="$CFLAGS"
> +CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
>   
>   AC_TRY_LINK(
>     [ #include <ldap.h> ],
> @@ -399,6 +401,7 @@ fi
>   
>   # restore libs
>   LIBS="$af_check_ldap_create_page_control_save_libs"
> +CFLAGS="$af_check_ldap_create_page_control_save_cflags"
>   ])
>   
>   dnl --------------------------------------------------------------------------
> @@ -412,6 +415,8 @@ AC_DEFUN([AF_CHECK_FUNC_LDAP_PARSE_PAGE_CONTROL],
>   # save current libs
>   af_check_ldap_parse_page_control_save_libs="$LIBS"
>   LIBS="$LIBS -lldap"
> +af_check_ldap_parse_page_control_save_cflags="$CFLAGS"
> +CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
>   
>   AC_TRY_LINK(
>     [ #include <ldap.h> ],
> @@ -432,6 +437,7 @@ fi
>   
>   # restore libs
>   LIBS="$af_check_ldap_parse_page_control_save_libs"
> +CFLAGS="$af_check_ldap_parse_page_control_save_cflags"
>   ])
>   
>   dnl --------------------------------------------------------------------------
