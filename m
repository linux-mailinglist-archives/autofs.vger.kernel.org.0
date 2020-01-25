Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6703314942E
	for <lists+autofs@lfdr.de>; Sat, 25 Jan 2020 10:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgAYJgs (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 25 Jan 2020 04:36:48 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43743 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgAYJgs (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 25 Jan 2020 04:36:48 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A39AC21DC1;
        Sat, 25 Jan 2020 04:36:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 25 Jan 2020 04:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        eqhye8TgwCTEEzD9kdaRsFlOc0UCTgHSvvvIP/zCMy8=; b=bkNT3fK8xIvUOujF
        uVs9k2qYTk3HeUS04Ie1jkRWefr2Z0B1MikkgT04VWStdIByvcA3PeDMdQX8R8wl
        t832wuHYinFAryXDfUrNWmyFlfUlQZIhwNizbpA59BS9HCg6MPVKRoWy1rk+2Dab
        yfMW2ISoEksyVC7Zg09UBW3REusx2kmlhxyhwqiUDS1JuDpe2OvO/weoA/5a7gk9
        WkKhLO4Jb47kBsyjMqXEkECP75IoPPoSGrnqZxzo3kAfflPEQ66fHLKi4aXZT/t5
        NTlWvhcpqKWPp/HydAm0tttvaKII23jjWGfi91pLB8mXhokuhGGGNNfp6MMyqQDa
        vUdzqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=eqhye8TgwCTEEzD9kdaRsFlOc0UCTgHSvvvIP/zCM
        y8=; b=JDqh9sMzupu/Xsa1UvwjCyxOtAdMSuK38ZDxoLpX5V2nBLO8K6lcfvCUf
        TS9cr568PrYqhXAlxGNExtjIZi/bTv2p5MwdT3wxN5xEt7C86ohXQJtNhaBXrV2p
        1dN4ssoT1uQyjOLhjxsmgfOvhn9Je6rfhlim9hMN53+ZGGY9rQWfBxRBqwY8dKtz
        xIrvAMUjMgh0INGiaHin3VZ/ikrUy5YjCtIFL3pENnc7P5kEAkDaDSzZurRLx6cW
        byTuyXhsrc7CpV6J/SyDkk/+Ll4tzSF7FLpjpaJk3/GLljRIOEY3WJDHbwDsADdb
        kp8QHvTqvHk/iz6M25bMhCYzSkt/g==
X-ME-Sender: <xms:LwwsXv743v1WtWagl4kjQlYRtTRZdc0_qfYP19QWJ-9T5r3O4pJNIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdejgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuffhomhgrihhnpeguvggsih
    grnhdrohhrghenucfkphepuddukedrvddtkedrudekkedrudegleenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfi
    drnhgvth
X-ME-Proxy: <xmx:LwwsXnPcxdaFru7WkY4A95hVt8h_ygwXFr6djhtgig4r6yoLhmpl5Q>
    <xmx:LwwsXlKMJUcniYz7feyjwqkTqGk8EuDnSRCMExBtTKbVhvy5BO5Y8Q>
    <xmx:LwwsXtGA0_c96Zc1yxY8MnhiL55jV7WxgM-SjQg7OzMsyhUiI0TslQ>
    <xmx:LwwsXrwzxf9AudhgC6WfwsJWFEsnXThh0Noy_QI5JRSWEhgIH2tOVQ>
Received: from mickey.themaw.net (unknown [118.208.188.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 63E2730654D1;
        Sat, 25 Jan 2020 04:36:46 -0500 (EST)
Message-ID: <7fb50992c43d8740fe19cbd36c37bbd67e447603.camel@themaw.net>
Subject: Re: [PATCH] Use pkg-config to detect libxml2
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Sat, 25 Jan 2020 17:36:42 +0800
In-Reply-To: <CANYNYEHsD+X=X=C743CG4DJQ6CCEk5k0zcTKa1KGGu3KfPWCEw@mail.gmail.com>
References: <CANYNYEHsD+X=X=C743CG4DJQ6CCEk5k0zcTKa1KGGu3KfPWCEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-01-20 at 10:19 -0300, Andreas Hasenack wrote:
> Hi there,
> 
> Debian dropped[1] xml2-config from libxml2-dev in experimental,
> favoring the use of pkg-config instead. This caused some packages to
> fail to build, autofs among them[2].
> 
> I'm submitting the attached patch for your consideration and
> review/comments. I realize this is a distro change and shouldn't
> affect autofs building when everything is installed from source,
> unless libxml2 upstream decides to follow suit and drop xml2-config
> as
> well.
> 
> Thanks!
> 
> 
> 1. 
> https://salsa.debian.org/xml-sgml-team/libxml2/commit/53de4f8ae1469e9068a6ab341836e523324c64c3
> 2. https://bugs.debian.org/949055

The bug is right, the check should fail configure if libxml2 isn't
found, that should be an improvement with that change so it would
be good make it work.

Ian



