Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047F42D7580
	for <lists+autofs@lfdr.de>; Fri, 11 Dec 2020 13:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405482AbgLKMZI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 11 Dec 2020 07:25:08 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46232 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405477AbgLKMY4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 11 Dec 2020 07:24:56 -0500
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1knhT2-0002dB-Hn
        for autofs@vger.kernel.org; Fri, 11 Dec 2020 12:24:12 +0000
Received: by mail-pg1-f198.google.com with SMTP id g24so6332821pgh.14
        for <autofs@vger.kernel.org>; Fri, 11 Dec 2020 04:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Yg4Kpl+6ZkbODi4Pppj8nXaKRbbn8buHcs/veB2TbmM=;
        b=KHx4Uf7f/Kr+gwVNkP2UYqNGmLEJu2WguPR4VmQDEtj2ZCRtRw1lcO9uqAsJ14jurq
         70xKH7iE6kJYLxaWDvRPclsEcCKeU+AhPyIw3dEY6uFbzfTyk4k4XohHv5PDPKtNd7XU
         EhbaoM+CiIGr0rQURE59m+y/NiKI5816plYUtR8WwTpAFtWTtu3hLy1TEtu1SGlIuOKT
         oHXmd0P7q0TR18dmvI2RCYJCp1Wi+0y8mqmINAAeLmVgx8jW31qsglmPew0uqE+93O3x
         Wcu8fqtz4F8skMsyszZ9DMtD1oDeB3upUTmmgWnB8tPTqD4oHGi624zy4PIfrWhmJXAN
         tn1A==
X-Gm-Message-State: AOAM533l46BIIv7oV4+BxFDkM/No1UdGf0fz5atcUPdUsf64vLJPIZx7
        X8v5Eqps+Opu5FGmoF5xOJayaVWVuJcdkYHdGr4pwZJt6SB2bvQOh9cVL9ETzQRO8yGylEXJ2bA
        I5vVVSLVEcXAz8ThH04uFmMn8NEqlTLuTNDwvG5N3/6oiBnVtzA==
X-Received: by 2002:a63:ce0c:: with SMTP id y12mr11562321pgf.208.1607689450898;
        Fri, 11 Dec 2020 04:24:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQWqfVw2DSMOjlBbWGdFgCyYfsDt3Kiez+gO+0cSo/bMED12Hu5brtWnd5dffDDkaGfGuXDf7k52iMvYHq2Jk=
X-Received: by 2002:a63:ce0c:: with SMTP id y12mr11562306pgf.208.1607689450626;
 Fri, 11 Dec 2020 04:24:10 -0800 (PST)
MIME-Version: 1.0
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
 <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
 <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
 <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
 <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
 <9e9a916a985acf138dae1c0f415bf6786f7358d2.camel@themaw.net>
 <CANYNYEH1M3OqgFd5WDi7L4kq-EMP9pgfB4AzU89XROS=aT20Og@mail.gmail.com> <c7c9ea1f0edba8b574583332376f10676a20143c.camel@themaw.net>
In-Reply-To: <c7c9ea1f0edba8b574583332376f10676a20143c.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Fri, 11 Dec 2020 09:23:59 -0300
Message-ID: <CANYNYEGCs_SYAsYSG_zan31r95m24teCVX_xq_7hNtj=EhXBwg@mail.gmail.com>
Subject: Re: autofs 5.1.6 : segfault at startup
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 10:19 PM Ian Kent <raven@themaw.net> wrote:

> I am struggling to get 5.1.7 out now.
>
> The patches will of course be posted to kernel.org when I do get
> the new release out.
>
> But I expect pulling in a new version so soon would be considered
> premature so what should I do to catch up the the Ubuntu person
> working on this?

We try to stay in sync with Debian, applying our changes on top of
their packages.
Currently Debian has:

autofs     | 5.1.6-4        | unstable

And Ubuntu has:
autofs | 5.1.6-4ubuntu1   | hirsute

If Debian grabs 5.1.7, then we can immediately rebase our changes,
including any patches, on top of that.
Going ahead of Debian is also possible, but less desirable.

From what I understood, 5.1.7 will not have these patches you
mentioned, right? I think the best way forward is a bug in launchpad
asking to test the patches (that apply on top of 5.1.7) that allow
using the -Bsymbolic flag again. I can file that once the patches are
published, I'd just need a ping to let me know they are up.
