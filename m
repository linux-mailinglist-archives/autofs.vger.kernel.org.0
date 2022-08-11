Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D26058F581
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 03:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiHKBKu (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 10 Aug 2022 21:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiHKBKu (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 10 Aug 2022 21:10:50 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36C930558
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 18:10:48 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 31BF15C0107;
        Wed, 10 Aug 2022 21:10:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 10 Aug 2022 21:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660180248; x=
        1660266648; bh=zb32YIn4lKbISJNiArD1B8EP5gbZSsudGeN0CQ+MsgI=; b=R
        3RSlUmfAjhKCnW7ZPeLzGbqa90uQ7L7tBAn2Yag2blzikBA9ujkNXJAeKCC4t8+X
        ZcpUS37bvZ8flc9ApXuWi5Pt/cpvn740ejo3mgIaKoj7epSMTkztfxTZTEZ5bLdw
        Sds+gZ7YxwyI9MZ2vOz1A4bcBxkW6HgFwZBqUJaUAj+ix3S1OYZ+PbgS5mZQVBpS
        RXVhqZAwF1RAulf+OEdg61v58Ym4RDOLubdDLY6dbVN5VqTdA+fIIXhonuYxfE+t
        BKMYKoGK4RYdTiRR1fa48yUGbaorxR7pAmhUQmEynBYW/mhYsOmFngUknjkyoTd6
        eHEEVanRl3OTEhiJJXMVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660180248; x=1660266648; bh=z
        b32YIn4lKbISJNiArD1B8EP5gbZSsudGeN0CQ+MsgI=; b=EUsyPgbvJMz7Sr0Wy
        KpifrqBOhcjeLfbHS4mSJDfCpdiKPBr7aLs6XQCJb8P4Vl4uSVX3ZwLb+3URnXE1
        //wmbmTC2nVbRKC8Yp9wI1s4kIey7qF011Vd4Np9KnRg4Vt+Fi/1tDAxNPZ3ftYj
        yohHlXsk2R/E23twtAPWnl2lfUrBpSf2aYXgnKNRnCoRraTpiaHPJ66i76T+JFXf
        L+LbmItrwlGGwG/+L+mJ9TG+jWeiToylePEfsXCV+5p5ShS8QSNA4+5UaL+j4L1F
        /VCZMq90FWIslNrekzTc9o/vUlnksDOT85ke4DztZ3F1lNLE1ITdGgl+iQUCGdyx
        AR/cA==
X-ME-Sender: <xms:GFf0YmMBmOfz8y17ugAxmi9_MCLS4Ud_IrFSZKGmlbIdavuwnkMlzQ>
    <xme:GFf0Yk-lMZYuD-awzSRRCpNpcIW1Am0gA5PmCxEnDBaPo_iZGtSgZheg60jtBgE_5
    rTb5_lZJrVW>
X-ME-Received: <xmr:GFf0YtS03GsUfglta6nTt4EedB6kRgkHqsOhSaujMP9-cU1PMs2L99R1Z9mrF3-2gkJdCHIbmTNyx7dE_IWuOhvJI2TwDpcsh38ZiniTuzopfqUE0ioQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:GFf0Ymviwgd7x7geWjWmb-u_6_qJXl0ujfoU5RvxcdgIjvH6n_CwvA>
    <xmx:GFf0YudNTiZthVmoKRAYBrbX5FmA1wFz2sg9VQpZVCs9timHUukAxw>
    <xmx:GFf0Yq1RL018u0LlKKyC4wsvDxvn39PpyXf6YFlvEehDpIR80LyQ7w>
    <xmx:GFf0YgqTQZcth3dXAeLMXGgbAfecFMVCqmq-o1SmFjqXIndGIPWMVA>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 21:10:46 -0400 (EDT)
Message-ID: <9ee85359-a741-3fc3-9bcd-0d5b2f4c3aab@themaw.net>
Date:   Thu, 11 Aug 2022 09:10:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] autofs-5.1.8 - prepare for OpenLDAP SASL binding
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <20220809115608.107767-3-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115608.107767-3-reimth@gmail.com>
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
> autofs prefers OpenLDAP as LDAP client library and Cyrus as SASL library.
> OpenLDAP also uses Cyrus SASL and is fully capable of providing SASL
> authentication and binding to clients. OpenLDAP SASL interface is actively
> maintained and provides latest security features, e. g. SASL data security
> layer.
>
> It does not make much sense to implement and use an own SASL interface in
> autofs if OpenLDAP is used, which already has a powerful SASL implementation.
>
> Prepare conditional compilation for use of OpenLDAP for SASL authentication
> and binding.
>
> Signed-off-by: Thomas Reim <reimth@gmail.com>

AFAICS it looks good, time will tell, ;)

It occurs to me I'll be actually be adding a Signed-off-by

when I add these to the queue.

Ian

> ---
>   aclocal.m4          | 43 +++++++++++++++++++++++++++++++++++++++++++
>   configure.in        |  5 ++++-
>   include/config.h.in |  3 +++
>   3 files changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/aclocal.m4 b/aclocal.m4
> index c671b5b..91b22da 100644
> --- a/aclocal.m4
> +++ b/aclocal.m4
> @@ -325,6 +325,49 @@ AC_TRY_LINK(
>   LIBS="$af_check_hesiod_save_libs"
>   ])
>   
> +dnl --------------------------------------------------------------------------
> +dnl AF_CHECK_FUNC_LDAP_SUPPORT_SASL
> +dnl
> +dnl Check for sasl support in ldap
> +dnl --------------------------------------------------------------------------
> +AC_DEFUN(
> +  [AF_CHECK_FUNC_LDAP_SUPPORT_SASL],
> +  [AC_MSG_CHECKING(for cyrus sasl support in openldap)
> +    have_openldap_cyrus_sasl=no
> +    # save current libs
> +    af_check_ldap_support_sasl_save_libs="$LIBS"
> +    LIBS="$LIBLDAP"
> +
> +    AC_RUN_IFELSE(
> +      [ AC_LANG_SOURCE(
> +        [ #include <stdlib.h>
> +          #include <ldap.h>
> +          int main (int argc, char **argv) {
> +            LDAP *ldap = NULL;
> +            int lret = 0;
> +
> +            lret = ldap_initialize(&ldap, NULL);
> +            if (lret != LDAP_OPT_SUCCESS) {
> +              exit(1);
> +            }
> +            lret = ldap_set_option(ldap, LDAP_OPT_X_SASL_NOCANON,
> +                                   LDAP_OPT_ON);
> +            exit(lret == LDAP_OPT_SUCCESS ? 0 : 1);
> +          } ])],
> +      have_openldap_sasl=yes,
> +      have_openldap_sasl=no,
> +      have_openldap_sasl=yes)
> +
> +    AC_MSG_RESULT($have_openldap_sasl)
> +    if test "$have_openldap_sasl" = "yes"; then
> +      AC_DEFINE(WITH_LDAP_CYRUS_SASL,1,
> +         [Define if OpenLDAP was built with Cyrus SASL])
> +    fi
> +
> +    # restore libs
> +    LIBS="$af_check_ldap_parse_page_control_save_libs"
> +  ])
> +
>   dnl --------------------------------------------------------------------------
>   dnl AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL
>   dnl
> diff --git a/configure.in b/configure.in
> index 68cbd44..45f3234 100644
> --- a/configure.in
> +++ b/configure.in
> @@ -279,6 +279,7 @@ AF_CHECK_NIS_HEADER()
>   # OpenLDAP support?  Expect that this may have a special directory...
>   #
>   AF_tmp_ldflags="$LDFLAGS"
> +AF_tmp_libs="$LIBS"
>   LIBLDAP=''
>   HAVE_LDAP=''
>   AC_ARG_WITH(openldap,
> @@ -303,15 +304,17 @@ if test -z "$HAVE_LDAP" -o "$HAVE_LDAP" != "0"; then
>   	if test "$HAVE_LDAP" = "1"; then
>   		AC_DEFINE(WITH_LDAP,1,
>   			[Define if using LDAP as a source of automount maps])
> -	fi
> +	AF_CHECK_FUNC_LDAP_SUPPORT_SASL()
>   	AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL()
>   	AF_CHECK_FUNC_LDAP_PARSE_PAGE_CONTROL()
> +    fi
>   fi
>   
>   AC_SUBST(LDAP_FLAGS)
>   AC_SUBST(HAVE_LDAP)
>   AC_SUBST(LIBLDAP)
>   LDFLAGS="${AF_tmp_ldflags}"
> +LIBS="${AF_tmp_libs}"
>   
>   #
>   # SASL support
> diff --git a/include/config.h.in b/include/config.h.in
> index 4f8daa8..7dab82e 100644
> --- a/include/config.h.in
> +++ b/include/config.h.in
> @@ -162,6 +162,9 @@
>   /* Define if using LDAP as a source of automount maps */
>   #undef WITH_LDAP
>   
> +/* Define if OpenLDAP was built with Cyrus SASL */
> +#undef WITH_LDAP_CYRUS_SASL
> +
>   /* Define to 1 if you have the libtirpc library installed */
>   #undef WITH_LIBTIRPC
>   
