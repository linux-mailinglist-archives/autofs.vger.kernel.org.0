Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02781278FBE
	for <lists+autofs@lfdr.de>; Fri, 25 Sep 2020 19:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgIYRid (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 25 Sep 2020 13:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgIYRic (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 25 Sep 2020 13:38:32 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A0BC0613CE
        for <autofs@vger.kernel.org>; Fri, 25 Sep 2020 10:38:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y2so3684329lfy.10
        for <autofs@vger.kernel.org>; Fri, 25 Sep 2020 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xV1ixFKYBYzs9xQqtXfpj87vpxE9fe3bTqmPmwrmWRA=;
        b=fx6QQkhaEaLL0IKUt52H3mzpFGb3zgZouYy5OWhuqmRYp9EJXuJxfucb1VNywFmJBp
         z+VoiRTM4dfJhadiLfJOAFLLSWYu9fOPhVDXnKtf+Uut9p4/+eQ39wnmESomu2cg7F9e
         jWPjxuon8GFrLiwrLCrEukW0y5tUfyxnjOFNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xV1ixFKYBYzs9xQqtXfpj87vpxE9fe3bTqmPmwrmWRA=;
        b=MM/Gbj6AG0zHShMmRzo6HNxbnMpwScem9Pltpa7FYB41reVjxSTdnlZ6UgUaohnFIi
         tlFSRlL1vY3N+JsDgRQCgX0GYqnBfkuTVqtdjV+j5ZtZOvzBlPt7hFDJWPGRTHN6fk0R
         +guiVl6Nb5Ql+NbWPMEmaZZAoKEa4wVq1q6g9nlfWWZhqplqsSyx3FgAW4Ybloh0Z9nV
         Y6dgRiL6HfXwe9KT4hOh4B1rH9B2AeNFPfn1dZZbIK+owfeeoPDaT93hVKHSb0F5jcVW
         nsR1U0Q11wrIUmh6I8W5pE7Pa/mDsLF3/cokeCuhIFixtNzimUq08j3yOq/VCVQbUjzq
         f73w==
X-Gm-Message-State: AOAM532mWmKirXcQGABFFLasi3OTaqJ6RY8E1Lj2BktbmBbi2nI7Mtzg
        20gX2lb5FVmDxlOxOM5L3LzCh90Nxyl6DA==
X-Google-Smtp-Source: ABdhPJwLdPxgKnR1cBFPufLT+n3qJenfSh6+nhzw/sh4wB9cmWFYUZEtcLh9HoNNMgg/H9Eq5UoFXQ==
X-Received: by 2002:a05:6512:31d2:: with SMTP id j18mr1895432lfe.316.1601055510422;
        Fri, 25 Sep 2020 10:38:30 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 206sm2801881lfd.72.2020.09.25.10.38.29
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 10:38:29 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id u21so3132417ljl.6
        for <autofs@vger.kernel.org>; Fri, 25 Sep 2020 10:38:29 -0700 (PDT)
X-Received: by 2002:a2e:994a:: with SMTP id r10mr1638882ljj.102.1601055508689;
 Fri, 25 Sep 2020 10:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFqZXNsoXr1eA4C8==Nvujs5ONpRnuSqaOQQ0n78R=Dbm-EFGA@mail.gmail.com>
 <20200921160922.GA23870@lst.de> <20200921163011.GZ3421308@ZenIV.linux.org.uk>
 <CAFqZXNsBqvCj0NjEd9+C0H1EPjz7Fst296AA5eOFSVx=SKjfOg@mail.gmail.com>
 <0764629d33d151aee743d0429ac87a5b0c300235.camel@themaw.net>
 <CAFqZXNsqD73hptXxBn+g98ngbFd=Sx+CghtwVqM+NC47VFZhVQ@mail.gmail.com>
 <CAEjxPJ4oZvtqUpW0bMzoZwVsi9kDvL5LtouHQZAO7gM7_qyHMg@mail.gmail.com> <CAFqZXNs0oZ+_RNvwE-e62H2FSS=N4wbvJ+tgk0_dSn=5mbPhcw@mail.gmail.com>
In-Reply-To: <CAFqZXNs0oZ+_RNvwE-e62H2FSS=N4wbvJ+tgk0_dSn=5mbPhcw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Sep 2020 10:38:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYB+q1=3_x97VSNo5cPTL=eHnuMDXoKhGJOJvo+pbp9g@mail.gmail.com>
Message-ID: <CAHk-=wjYB+q1=3_x97VSNo5cPTL=eHnuMDXoKhGJOJvo+pbp9g@mail.gmail.com>
Subject: Re: Commit 13c164b1a186 - regression for LSMs/SELinux?
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ian Kent <raven@themaw.net>, Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>, autofs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        Zdenek Pytela <zpytela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, Sep 25, 2020 at 6:38 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> On Thu, Sep 24, 2020 at 4:16 PM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> >
> > Up-thread I thought Linus indicated he didn't really want a flag to
> > disable pemission checking due to potential abuse (and I agree).
>
> IIUC he was against adding an FMODE flag, while I was rather
> suggesting a new function parameter (I realize it probably wasn't
> clear from what I wrote).

I really would prefer neither.

Any kind of dynamic behavior that depends on a flag is generally worse
than something that can be statically seen.

Now, if the flag is _purely_ a constant argument in every single user,
and there's no complex flow through multiple different layers, an
argument flag is certainly fairly close to just having two different
functions for two different behaviors.

But I don't really see much of an advantage to adding a new argument
to kernel_write() for this - because absolutely *nobody* should ever
use it apart from this very special autofs case.

So I'd rather just re-export the old __kernel_write() (or whatever it
was that broke autofs) that didn't do that particular check. We
already use it for splice and core dumping.

autofs isn't that different from those two, and I think the only real
difference is that autofs is a module. No?

So I think the fix is as simple as exporting __kernel_write() again -
and let's just make it a GPL-only export since we really don't want
anybody to use it - and revert  commit 13c164b1a186 ("autofs: switch
to kernel_write").

Hmm?

             Linus
