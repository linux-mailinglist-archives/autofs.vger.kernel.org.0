Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B62225838
	for <lists+autofs@lfdr.de>; Mon, 20 Jul 2020 09:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgGTHLp (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Jul 2020 03:11:45 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41919 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726017AbgGTHLp (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Jul 2020 03:11:45 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id DCD395C0075;
        Mon, 20 Jul 2020 03:11:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 20 Jul 2020 03:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        7nuacJiqpx21xGL+WRecZbfWGMRcW2B2w9PQ0NiDDmE=; b=z9q/SU6dj9uDNEpo
        To4h/pE4ewpacLvYgJGUat5kzQLncM5Z+GQJ3CPWc8SXs3Mbk+xlMKF4Yro30aeN
        VuONOl+8Ce3DoyOMKL7Wj/ZuAZG3ApysZ4eP2Kbp4Dop4wxN7KAi+ENyu+4xGXo+
        uskQ+0SHN7WnmSuSNGkKgvDYn792xAJwZTmSGdXIxZWU8zqh664QPEpnRTiY2IWc
        E6/Jpy6pHembojI9l0eLytEJIP+GENpWvHifTadsv+UVvGTAnUeD2+4uFjMace2z
        mwCZh7QtB2ObdCd06ZD8gvnXsByEWcoONV0NlkfNI/MNtK8tFl9eLGT1aWT/1RcP
        54UjzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=7nuacJiqpx21xGL+WRecZbfWGMRcW2B2w9PQ0NiDD
        mE=; b=C7qddqJWi3s8kJezXUyPos5ZnRSiS3zVRvrKAYigt6OMuCmBdhylZMX6R
        IafS+g6biEh5GH6RJe71nt06g1ciexoHgSqa0rAeHJ72lqmKBSBA2LuU8ZaK5MMr
        NDbUfhl/wvtDn3MBcqnEb8CQfsWNlK1YMwRx38zrRvV0GbfgMuAYRmHe1CRmYLMI
        Ho1bv2l+rDZqAUues3NroVpFpLAb6TvxF/Qk62ELFY051JxnnNT7O0FcXeAmOTc4
        +KtjQekaEKtI7befYpGg93al2Hqpf4mwFfRCShxaxAOAqoO8RQYZYSU0w3RRjXMQ
        cJffzLGhmHFNzroYiU/PP+EfEV+MQ==
X-ME-Sender: <xms:r0MVXx0ECe8NjIGB0RwSwNMSko6OtmcgbDb5m0w5TfaZs0aWzAEIAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedvgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    egtedtteelieevkefhgfevkeejffdtjeeihfekudettdeitdekleegleeffeejieenucff
    ohhmrghinhepshhpihhnihgtshdrnhgvthdptghonhhfrdhinhenucfkphepuddukedrvd
    dtkedrfeejrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:r0MVX4HqOhlCwsugMMkv1wSle732UVL50TdW8ajjMI4RkkiPgAsz0A>
    <xmx:r0MVXx4XErGq5t6I8VxODihF01rEIEuML6LcS2Ib0sIAweLuYoE1ig>
    <xmx:r0MVX-03BD5pJlqHO-mxAnuvbxIoSrOHPtzRdPprU18EPzxOvcEvMQ>
    <xmx:r0MVX4FU8YG3Zkal_0hpgkn-O8bHKucuTayTfKHRTTzGqbQWOB7lAA>
Received: from mickey.themaw.net (unknown [118.208.37.175])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4A4C5328005A;
        Mon, 20 Jul 2020 03:11:42 -0400 (EDT)
Message-ID: <548d94a2ebfc9fe2f5f1c0d736346965b64d18c4.camel@themaw.net>
Subject: Re: [PATCH 3/3] Use PKG_CHECK_MODULES to detect libxml2
From:   Ian Kent <raven@themaw.net>
To:     Hugh McMaster <hugh.mcmaster@outlook.com>, autofs@vger.kernel.org
Date:   Mon, 20 Jul 2020 15:11:38 +0800
In-Reply-To: <CAN9BcdtuGxQBNWhsCdhTjqw=jr5CoHvVFxD1Nw1k5o-xF0PSog@mail.gmail.com>
References: <CAN9BcdtuGxQBNWhsCdhTjqw=jr5CoHvVFxD1Nw1k5o-xF0PSog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2020-07-02 at 23:43 +1000, Hugh McMaster wrote:
> This patch removes the use of xml2-config and instead uses
> PKG_CHECK_MODULES to detect the libxml2 library.
> 
> As noted in [1], Debian is removing xml2-config and is progressively
> updating its repository to use pkg-config and its helper macros.
> 
> This patch builds on Andreas Hasenack's initial patch in [1] and
> addresses feedback from Ian Kent [2].
> 
> [1] https://www.spinics.net/lists/autofs/msg02204.html
> [2] https://www.spinics.net/lists/autofs/msg02206.html
> 
> 
> --- a/Makefile.conf.in
> +++ b/Makefile.conf.in
> @@ -36,7 +36,7 @@ SSSD = @HAVE_SSS_AUTOFS@
> 
>  # SASL support: yes (1) no (0)
>  XML_LIBS = @XML_LIBS@
> -XML_FLAGS = @XML_FLAGS@
> +XML_CFLAGS = @XML_CFLAGS@
>  SASL = @HAVE_SASL@
>  LIBSASL= @LIBSASL@
>  SASL_FLAGS = @SASL_FLAGS@
> diff --git a/aclocal.m4 b/aclocal.m4
> index ec362bb..33561aa 100644
> --- a/aclocal.m4
> +++ b/aclocal.m4
> @@ -272,38 +272,6 @@ else
>  fi])
>  ])
> 
> -dnl ----------------------------------------------------------------
> ----------
> -dnl AF_CHECK_LIBXML
> -dnl
> -dnl Check for lib xml
> -dnl ----------------------------------------------------------------
> ----------
> -AC_DEFUN([AF_CHECK_LIBXML],
> -[AC_PATH_PROGS(XML_CONFIG, xml2-config, no)
> -AC_MSG_CHECKING(for libxml2)
> -if test "$XML_CONFIG" = "no"
> -then
> -  AC_MSG_RESULT(no)
> -  HAVE_LIBXML=0
> -else
> -  AC_MSG_RESULT(yes)
> -  HAVE_LIBXML=1
> -  XML_LIBS=`$XML_CONFIG --libs`
> -  XML_FLAGS=`$XML_CONFIG --cflags`
> -  XML_VER=`$XML_CONFIG --version`
> -  XML_MAJOR=`echo $XML_VER|cut -d\. -f1`
> -  if test $XML_MAJOR -le 99
> -  then
> -    XML_MINOR=`echo $XML_VER|cut -d\. -f2`
> -    if test $XML_MINOR -le 99
> -    then
> -      XML_REV=`echo $XML_VER|cut -d\. -f3`
> -      if test $XML_REV -le 99; then
> -        AC_DEFINE(LIBXML2_WORKAROUND,1, [Use libxml2 tsd usage
> workaround])
> -      fi
> -    fi
> -  fi
> -fi])
> -
>  dnl ----------------------------------------------------------------
> ----------
>  dnl AF_CHECK_KRB5
>  dnl
> diff --git a/configure.in b/configure.in
> index 525f79b..9e211c9 100644
> --- a/configure.in
> +++ b/configure.in
> @@ -210,7 +210,11 @@ fi
>  AC_SUBST(ENABLE_FEDFS)
> 
>  # LDAP SASL auth needs libxml and Kerberos
> -AF_CHECK_LIBXML()
> +PKG_CHECK_MODULES([XML], [libxml-2.0], [

I think perhaps I will need to change [libxml-2.0] to
[libxml-2.0 libxml2] ... the Fedora package name.

It's not clear from the PKG_CHECK_MODULES man page if that's the
correct way to specify this and if a space separator is meant to be
used between package names.

Ian

> +  HAVE_LIBXML=1
> +  AC_DEFINE(LIBXML2_WORKAROUND, 1, [Use libxml2 tsd usage
> workaround])
> +], [HAVE_LIBXML=0])
> +
>  AF_CHECK_KRB5()
> 
>  AC_SEARCH_LIBS([versionsort],[])
> @@ -344,7 +348,7 @@ then
>      fi
>  fi
> 
> -AC_SUBST(XML_FLAGS)
> +AC_SUBST(XML_CFLAGS)
>  AC_SUBST(XML_LIBS)
>  AC_SUBST(SASL_FLAGS)
>  AC_SUBST(HAVE_SASL)
> diff --git a/daemon/Makefile b/daemon/Makefile
> index a7ce430..d8e2d6a 100644
> --- a/daemon/Makefile
> +++ b/daemon/Makefile
> @@ -28,7 +28,7 @@ ifeq ($(SYSTEMD), 1)
>  endif
> 
>  ifeq ($(LDAP), 1)
> -    CFLAGS += $(XML_FLAGS)
> +    CFLAGS += $(XML_CFLAGS)
>      LIBS += $(XML_LIBS)
>  endif
> 
> diff --git a/lib/Makefile b/lib/Makefile
> index 518b483..b20b95b 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -25,7 +25,7 @@ CFLAGS += -DAUTOFS_MAP_DIR=\"$(autofsmapdir)\"
>  CFLAGS += -DAUTOFS_CONF_DIR=\"$(autofsconfdir)\"
> 
>  ifeq ($(LDAP), 1)
> -  CFLAGS += $(XML_FLAGS) $(XML_LIBS)
> +  CFLAGS += $(XML_CFLAGS) $(XML_LIBS)
>  endif
> 
>  .PHONY: all install clean
> diff --git a/modules/Makefile b/modules/Makefile
> index 0447559..989c6c1 100644
> --- a/modules/Makefile
> +++ b/modules/Makefile
> @@ -47,7 +47,7 @@ endif
>  ifeq ($(LDAP), 1)
>    SRCS += lookup_ldap.c
>    MODS += lookup_ldap.so
> -  LDAP_FLAGS += $(XML_FLAGS) -DLDAP_THREAD_SAFE
> +  LDAP_FLAGS += $(XML_CFLAGS) -DLDAP_THREAD_SAFE
>    LIBLDAP += $(XML_LIBS)
>    ifeq ($(SASL), 1)
>      SASL_OBJ = cyrus-sasl.o cyrus-sasl-extern.o

