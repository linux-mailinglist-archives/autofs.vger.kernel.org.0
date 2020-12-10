Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCF52D5AD7
	for <lists+autofs@lfdr.de>; Thu, 10 Dec 2020 13:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgLJMtV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 10 Dec 2020 07:49:21 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36613 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgLJMtV (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 10 Dec 2020 07:49:21 -0500
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1knLN7-0002FH-22
        for autofs@vger.kernel.org; Thu, 10 Dec 2020 12:48:37 +0000
Received: by mail-pl1-f197.google.com with SMTP id b2so1893235pls.18
        for <autofs@vger.kernel.org>; Thu, 10 Dec 2020 04:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=g4ZOQUr1G+Cy3H4SEZTEuhcjKC8YJWbwipWHfBbwSqo=;
        b=NeQmAYOzvjCibvKI6XBaTURewEsmEDRWOONGIGAcWYkNiPwCY32PAxrxs5MEaKwVLo
         zB8MmWe96ALVkNB29vXGXP71JUaeewPPHBffaR3jYSoP1WXBe2ysVSQTayk373ZTZaUT
         sy8Glj3sIKl2Q+SezW8u5D4sYZCjFpL1HEQ4KbaKJfmBMTwKj0NQaGKqxu7E6Xm2XRSN
         Df4wQerW8FI5uE8WxYcOT/F477nS3nXONn9oWtgGLInMPO9B1Zh/Xx4Vw4AdGS2+JA3F
         FpIqjuKFSwzEW3QCUOgfc5/O2E6O3aEzrokUXTWlxm2nI2pUy7L3o065JBF//TGxt4iS
         OCiA==
X-Gm-Message-State: AOAM530DHj87zPiE2x1DMzUeNtf3pwU/9+yvI+9lV/zyUtBRlKqWroK2
        s/xktNewxk1/57vk7dWjUIkN6cv2udYIl/1ttDZujwhoXN/Q9sB/CbCEkCPse4IWFShgnFMhAv9
        4eD/LMcEgRAmK4mz/V4AtgyXrIbNAubLfFE66o2zqspRoR9D3yQ==
X-Received: by 2002:a17:902:b116:b029:d8:f5d7:5fe5 with SMTP id q22-20020a170902b116b02900d8f5d75fe5mr6176853plr.48.1607604515609;
        Thu, 10 Dec 2020 04:48:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5w7C1QYi1OufEbq85RD/LQoL2lqrw6I5QIhRk2sgO5h2lJmqyd6BMgAS2L/i60cxSumfxuf0+wi0aa+YJIbk=
X-Received: by 2002:a17:902:b116:b029:d8:f5d7:5fe5 with SMTP id
 q22-20020a170902b116b02900d8f5d75fe5mr6176836plr.48.1607604515301; Thu, 10
 Dec 2020 04:48:35 -0800 (PST)
MIME-Version: 1.0
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
 <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
 <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net>
 <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
 <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com> <9e9a916a985acf138dae1c0f415bf6786f7358d2.camel@themaw.net>
In-Reply-To: <9e9a916a985acf138dae1c0f415bf6786f7358d2.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Thu, 10 Dec 2020 09:48:24 -0300
Message-ID: <CANYNYEH1M3OqgFd5WDi7L4kq-EMP9pgfB4AzU89XROS=aT20Og@mail.gmail.com>
Subject: Re: autofs 5.1.6 : segfault at startup
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Wed, Dec 9, 2020 at 10:27 PM Ian Kent <raven@themaw.net> wrote:

> > In Ubuntu, -Wl,-Bsymbolic-functions is a system-wide default and we
> > remove it from the flags when building autofs in d/rules:
> >
> > # Taken from #1636781 as it's the same problem here. Also see
> > #
> > https://lists.ubuntu.com/archives/ubuntu-devel/2018-June/040369.html
> > ifeq ($(shell dpkg-vendor --derives-from Ubuntu && echo yes),yes)
> >   export DEB_LDFLAGS_MAINT_STRIP = -Wl,-Bsymbolic-functions
> > endif
>
> Not sure what #1636781 is?

Sorry, that's a bug number (not in autofs, but similar):
https://bugs.launchpad.net/bugs/1636781

> Would it be useful to provide Ubuntu with patches prior to the
> impending autofs 5.1.7 release (after which these patches would
> be present on kernel.org)?
>
> If so I can certainly do that and if we do then from that point
> any further changes would be done as follow up patches, so they
> would be final upstream patches even though they haven't been
> pushed to the repository yet.

Sure, and this is the perfect time for that since we are in a new
development cycle. I won't be the one working on it, though, as I have
been reassigned elsewhere for the next few months. I'll let someone in
the team know, and I can still file a bug with the patch(es) attached
and let the team work on it.

Thanks!
