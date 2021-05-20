Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D57389AC5
	for <lists+autofs@lfdr.de>; Thu, 20 May 2021 03:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhETBMJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 May 2021 21:12:09 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57493 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhETBMJ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 19 May 2021 21:12:09 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 785FD5C0093;
        Wed, 19 May 2021 21:10:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 19 May 2021 21:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        tj6KZa3u2C36qcGeahm3MAo4LEwVDdwxINECXVrPuqg=; b=C+SuR2F4yKPGIeH5
        CWfct55wEPm5a8j5g9AIp35RKJwG2kbVidFm+VyjCs4FFJhQErlIdEXfV+DZKb0/
        Bo63YynctDs1ZtySqh58c/TvlmyFNMCyla/O0lGuMNh4mlivS6a5RwrwmBvQyHfO
        25EroZwHygxuqsdL5UxvMGTQKxoBGQFhSU+/cgiERIY9zZkMJH/xmDmL5m41R1eP
        v6KOcCrG76FhDqNPVKfbzBRCfvQ1ZMkZVDXK2Z//ra8DqHrNE2SamYn1ptgjvmXA
        CIKzXTB/sa+aYGp1yO/1Vfd8c8e7d+4msNfO82sCAtk0VAX/MX61f0g6t+CfkKLm
        VXkcqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=tj6KZa3u2C36qcGeahm3MAo4LEwVDdwxINECXVrPu
        qg=; b=oIXzjB3ZrHvpGynDS5wkJwELKQ+B8dA3f2XOaLEKayTuCGMMEwXX6fwd5
        1J27VCPwkmv1GmA//pmCM5MEpV1liG7G5BP88upZKIezgPxtMPt6EfAwYBo2XKwS
        SWXsrKWhx5OBSOq8iv0IcSGYVOxQd2DUMCpr6+P8zQ87RpL+ivpuRcHG38lKfkAq
        vgrmEA7SJggzkQ8HslHu2xau68S2vXzNTAYKZ/8idhwCLT1dWOaXZ9x/QOpUt/bR
        ddCcGCijOiUU1b9iGQUMbx2YcD1iDtn/dWXClRd8nGHsps0rj4oaK82YWdUO4vnI
        YS8V4SXZh1yendltf+x8K2VtxeJbw==
X-ME-Sender: <xms:GLelYBOv3YeNPVifMI06FuteAhHCA4tqlEULT1fZeeVuPv8xHAJH5Q>
    <xme:GLelYD-5KCz0UVDlVmVRNmIeXkJm5ohNzoXQxx7mVXxZgwtHxf3NXz8BaOxL5_1zk
    y1aG2FL52T0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fgleelkeetheelgeehueejueduhfeufffgleehgfevtdehhffhhffhtddugfefheenucfk
    phepuddtiedrieelrddvfedurdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:GLelYATSOcMYpO4FZVPitLUpCau0ENKLztSWpJCHXYLDx0xb_70JSQ>
    <xmx:GLelYNtv4Wo1WmYjnI9xKqwD6dS7HgKSAs86XwvvWitcaWVlCoxrIw>
    <xmx:GLelYJcmo1DuIf3mr1H9r-obczl-oFRNYJbPvNCD-0YdZB0ehiUXww>
    <xmx:GLelYDrJX9oZWmAYtzRuuphE52luKT78FXdTVKUCRK3SHL8GyN_dXQ>
Received: from mickey.long.domain.name.themaw.net (106-69-231-44.dyn.iinet.net.au [106.69.231.44])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Wed, 19 May 2021 21:10:46 -0400 (EDT)
Message-ID: <8c1e7d676bf6c4b2d9eba8ccbaacfc485716ef2a.camel@themaw.net>
Subject: Re: error after upgrade from 5.1.2 to 5.1.7 - nfs: Unknown
 parameter 'O'
From:   Ian Kent <raven@themaw.net>
To:     Fabio Pedretti <fabio.pedretti@unibs.it>, autofs@vger.kernel.org
Date:   Thu, 20 May 2021 09:10:42 +0800
In-Reply-To: <CAGpfsQ2rMhtEwdzLXFmRpJz3WDC+bcLe5eag_x0oUiKf8-6uUA@mail.gmail.com>
References: <CAGpfsQ2rMhtEwdzLXFmRpJz3WDC+bcLe5eag_x0oUiKf8-6uUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2021-05-19 at 17:22 +0200, Fabio Pedretti wrote:
> Hi, I was using auto.master with this line in my Debian 10 system:
> /net   -hosts -O noatime,nodiratime --timeout=0

I don't remember -O ever being valid in the master map.
The -O and --global-options are options to automount(8).

I guess that might have worked at some point but it wasn't
the expected syntax.

> 
> Then I upgraded Debian from buster/10 to current bullseye/11, and
> autofs got upgraded from 5.1.2-4 to 5.1.7-1 (official Debian
> packages).
> 
> Now I am getting this error:
> nfs: Unknown parameter 'O'
> 
> (Same issue if I replace -O with --global-options.)
> 
> Indeed, removing "-O noatime,nodiratime" from auto.master, so,
> leaving
> with just:
> /net   -hosts --timeout=0

Try:
/net	-hosts noatime,nodiratime --timeout=0

that should be what's used I think.

Ian

