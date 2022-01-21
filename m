Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A47495EF4
	for <lists+autofs@lfdr.de>; Fri, 21 Jan 2022 13:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380297AbiAUMYY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 21 Jan 2022 07:24:24 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39865 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380326AbiAUMYW (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 21 Jan 2022 07:24:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 70D995C0282;
        Fri, 21 Jan 2022 07:24:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 21 Jan 2022 07:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=tL/2sQ/XA6JhGY
        Oz7898uPs8oRVqPZ8vGkj/B9H7Lnc=; b=LS+2d8+3Yqjg0cTZTknphGpbim2dca
        7UTEvMSBuPmnT6aE4dKwTPIkwTmwk2rTjb6Qa2TpOdzRz5xChtqqQy/4UwI2oLV/
        e7AilM5xV4ga7J+QpYYzx05rW37zFfO067rFK58xVDI1LDyNKM1X5Ez5lHwLq7hO
        phjcQjIL3GoDN4oKVeuo3pirUFHwC3vbrbqedgJtJ5MhO40GBKD/p/sKuSnp6jzW
        iXGCRzHyHHYp9JFudp3xsr3jqSFcEE2d6rCYAcdAwrfjWxbuVIP5vCpewdyscb0q
        1ATpL1BQ/Y2i/yrvYHWHyy6qOLiYyiED4CnMZurEbr+7LDbAmh71dNVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=tL/2sQ/XA6JhGYOz7898uPs8oRVqPZ8vGkj/B9H7L
        nc=; b=Q3sl9Sy3JWr67EjQFafl07ot8cPkfijsACq7fVuvZBWYC0vrNniJOnJRb
        CQ1gKgOOgmIT1S4QZrc/+b5OgFmaMvU32kvTdn6KqBw6islbxyAdSPn3X2J6ws7Y
        UgJsfDDm+eZcbg2NfJoRo5wXx6AWE7MiyPfGCtH8E0ccblLHPFCPnWWpZ7bg2ltM
        4cPK9nyPxvHaOZxHOvqxQ1K6RzQxT1Os+UeQMLdVdCs0hIWib+CeaFQL4r68rWv0
        LWCDCvyCW/eTtTeNrSn7/0VjKMKNMTJjg6EqP9Vqa2cNc8yuGz+hYImEqXFIVNHL
        Yk2PY7ItphHh5vw4nX9/3TWzIuBvA==
X-ME-Sender: <xms:9aXqYfGKyzEYNTGKC24xFxOSidf5A82MbRO3OyMHgSKla_LNog1oZQ>
    <xme:9aXqYcXKoG7Rt9PGQ_iQnQ6Gbu7yvWkMv6rPnSUBgqHMgcvGLIgUNnOw1pY5weJP5
    Jo5X5Fcgx7m>
X-ME-Received: <xmr:9aXqYRKsn0vR18jYQCPG_0KukHPtsecb9J0m5lP3RJzqXOrpF_LngaFknAkqxfQv9ugwPU49qMX8S_xsqMvxI7AYjlDkgmNlg8kQiyh0yKAEk0u37PnOWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
    dttderudenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpefhgfehueetteelfeeltedtgeeiheffuefgueejte
    dvtedvieejffejudevffduheenucffohhmrghinheplhhoghdrihhtnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrg
    ifrdhnvght
X-ME-Proxy: <xmx:9aXqYdHbDyn58MyWZHc59y1DYJqYH_MJHfbyO6e7-JVJG6yFRckvLA>
    <xmx:9aXqYVUiLtoIq9TwiER6RzVUcoILgVgap4MpYDTnz9aztUeJvx_sCg>
    <xmx:9aXqYYOYvzUYdvnCklAC2zZTmwvKMedDsqhoW14Lec_iNepIbTg0rg>
    <xmx:9aXqYWd5WyAMf_w1nAIGOpFg9A4ju22qupxSpWd_3dd38aQvooOyRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jan 2022 07:24:19 -0500 (EST)
Message-ID: <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Fabian Groffen <grobian@gentoo.org>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Date:   Fri, 21 Jan 2022 20:24:14 +0800
In-Reply-To: <YepbqFeUBns+KRbj@gentoo.org>
References: <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
         <YeaBtjNlovM5gez4@ofant>
         <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
         <YeaWIKm/9szaWHIA@gentoo.org>
         <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
         <YehQdqiLSz6LMPVi@gentoo.org>
         <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
         <YekOscjFLNMjggd7@gentoo.org>
         <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
         <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
         <YepbqFeUBns+KRbj@gentoo.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2022-01-21 at 08:07 +0100, Fabian Groffen wrote:
> On 20-01-2022 19:41:11 +0800, Ian Kent wrote:
> > > If it's not using the expected location for autofs.conf that's a
> > > build
> > > problem.
> > > 
> > > Can you get me a build log.
> > 
> > And what does "automount -V" say?
> 
> Linux automount version 5.1.8
> 
> Directories:
>         config dir:     /etc/conf.d
>         maps dir:       /etc/autofs
>         modules dir:    /usr/lib64/autofs
> 
> Compile options:
>   DISABLE_MOUNT_LOCKING ENABLE_FORCED_SHUTDOWN
> ENABLE_IGNORE_BUSY_MOUNTS 
>   LIBXML2_WORKAROUND WITH_LIBTIRPC 
> 
> (this is identical to the 5.1.6 output)
> 
> build-log attached

That all looks good, including the build log.

How about we try stopping the autofs service and run automount
manually and see what we get.

Stop the service then run "automount -fd | tee autofs.log".

It might be useful to add a stderr redirect too but I usually
don't need it, eg. "automount -fd 2>&1 | tee autofs.log".

Ian

