Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6096389FB2
	for <lists+autofs@lfdr.de>; Thu, 20 May 2021 10:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhETIVz (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 May 2021 04:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhETIVz (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 May 2021 04:21:55 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A92FC061574
        for <autofs@vger.kernel.org>; Thu, 20 May 2021 01:20:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n8so3362034plf.7
        for <autofs@vger.kernel.org>; Thu, 20 May 2021 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unibs.it; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GLgKDTO7m9kxhpXn3NnwhqqZgUsZNWuaPTu5w/D1HeI=;
        b=ZIcYI16RMLUkkSGw4GLWUd7bn+6zppazbGR/CFlNLqlhuhDAj3MQs3ddSl+nHqhXc1
         fMKocZre5m+x8hU4AreNosiHGJ2UuETGdThDmMFgXtoY/NSTbTsYiYogxpvIgtvATRVb
         ytJGaA7g4oV9jd1vavPXk8VxJI1yhNtcrnzzAFwvhkgPbbD1Ao7lObTU1uFlTkwrosnM
         4zxYFKH/v7oqfdf7xa5W1N9FfmOwV2ylhcOf1O414By7+MSXoAd6xKkJAt85DxVGfV3S
         sTaTpkyguGZCU5wGlxvLTtHTqQqG7rMNQc2ZURNscADPGvlA1cnpqM3meI9NH1lW2lM/
         SS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLgKDTO7m9kxhpXn3NnwhqqZgUsZNWuaPTu5w/D1HeI=;
        b=Yz5ZN4XEb6C4tihOp5YawmuvRceW1ZmR05D1ttjqw8+Wm7EqxaP+ex7vqaTlTQSpif
         dxyOYw/wBB00ka5839Ffat0zcZZvUv2uEnfiAY7NFf2v7uwDraNuIeieivlYCbnNFMwt
         QMPGMg/oQLEIl+JOrLz+E8gPdlE8Nig/DlC/+0xDCXBDb9Y6gRyKfCORrEVVUXxGBfBE
         fL61vnSB/Ye7RTkr0RR3qk7//FhoRkGl1p+ra3W8+gHwQ6MnhpyorZfAA4QYnUIQSoqi
         erY4M6UBS1kVIzgLJzmyQNWJxbywQyUbLCxzB7IYF7wDI2Vu3hn5yNQiB0Nia4kyZjZ1
         +N0g==
X-Gm-Message-State: AOAM533a/v27gF+0RkXn2h4LCjkGLU7HwcDZGpJ8W6jzwsV+7KDi77wk
        wnTfNuaRL1xvA91vHrbHWq9UmiwECSotew66IR5iWRMfOhJwpaHERQK58h2q2aruKtlZAJIbC/t
        q9QwGL7ICKPjmH7Dyi2VACsczo9UuIg==
X-Google-Smtp-Source: ABdhPJw7L6KRIIk9mk5ozu+UQzkTJu+VAPC67sCG/8ilX5jw6vCyF/vlHO1Z8znG9N/0aIELxqcWYhNkZK7r4pDN4j4=
X-Received: by 2002:a17:902:8205:b029:f4:a8f3:78c8 with SMTP id
 x5-20020a1709028205b02900f4a8f378c8mr4437649pln.11.1621498833774; Thu, 20 May
 2021 01:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAGpfsQ2rMhtEwdzLXFmRpJz3WDC+bcLe5eag_x0oUiKf8-6uUA@mail.gmail.com>
 <8c1e7d676bf6c4b2d9eba8ccbaacfc485716ef2a.camel@themaw.net>
In-Reply-To: <8c1e7d676bf6c4b2d9eba8ccbaacfc485716ef2a.camel@themaw.net>
From:   Fabio Pedretti <fabio.pedretti@unibs.it>
Date:   Thu, 20 May 2021 10:20:22 +0200
Message-ID: <CAGpfsQ1n1v23MiBid0yW8fV70mqfN93ovun6i9bJFBv71ANJ3g@mail.gmail.com>
Subject: Re: error after upgrade from 5.1.2 to 5.1.7 - nfs: Unknown parameter 'O'
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Il giorno gio 20 mag 2021 alle ore 03:10 Ian Kent <raven@themaw.net> ha scritto:
>
> On Wed, 2021-05-19 at 17:22 +0200, Fabio Pedretti wrote:
> > Hi, I was using auto.master with this line in my Debian 10 system:
> > /net   -hosts -O noatime,nodiratime --timeout=0
>
> I don't remember -O ever being valid in the master map.
> The -O and --global-options are options to automount(8).
>
> I guess that might have worked at some point but it wasn't
> the expected syntax.
>
> >
> > Then I upgraded Debian from buster/10 to current bullseye/11, and
> > autofs got upgraded from 5.1.2-4 to 5.1.7-1 (official Debian
> > packages).
> >
> > Now I am getting this error:
> > nfs: Unknown parameter 'O'
> >
> > (Same issue if I replace -O with --global-options.)
> >
> > Indeed, removing "-O noatime,nodiratime" from auto.master, so,
> > leaving
> > with just:
> > /net   -hosts --timeout=0
>
> Try:
> /net    -hosts noatime,nodiratime --timeout=0
>
> that should be what's used I think.

That works indeed, thanks for the tip!

Fabio

-- 


Informativa sulla Privacy: http://www.unibs.it/node/8155 
<http://www.unibs.it/node/8155>
