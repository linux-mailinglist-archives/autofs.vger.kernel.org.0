Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D9127CA2D
	for <lists+autofs@lfdr.de>; Tue, 29 Sep 2020 14:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732276AbgI2MRA (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 29 Sep 2020 08:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49258 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729106AbgI2MQr (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 29 Sep 2020 08:16:47 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601381807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C1hoLwkXB3t3tvpnB48LHPZiaL0srQuk1qO89dBM94g=;
        b=Lpx5Ohd0cRpOxImPQBECg6oeq122xPk4sbHh3hZimE2YTs1KAXfR39eNCtbCGCFgMoix+4
        YQWhqe3HxY8gVyvVHCNjgYqDUG4H32RLzaynAmkv2Lxb6oT5evsQYiuyn8KkebkIJAS0QA
        EIzRWozdqwj/KhwE6zc0a5eO5bZ5dWU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-FJ_-cM_-MxmLhatO-MwWQw-1; Tue, 29 Sep 2020 08:16:45 -0400
X-MC-Unique: FJ_-cM_-MxmLhatO-MwWQw-1
Received: by mail-lj1-f198.google.com with SMTP id 26so1124798ljp.19
        for <autofs@vger.kernel.org>; Tue, 29 Sep 2020 05:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C1hoLwkXB3t3tvpnB48LHPZiaL0srQuk1qO89dBM94g=;
        b=Ef1yrmyp7i5rsZV1ni+ait9/+dFa1ECAshyIUKdgokKAzKo9XP5SFwCbj+mQJVZ5UB
         oJiA6xFy4lMbCtnVu+j977MgU7vgU+KP5fb2BC6bnrGLuD5gI30PLKdDmf5oWEJ4dtOM
         1xKowESXwjVbf+bDrZiGiH7s4IVgUTCgy+SGGum9w27AKkPszwX5a5zzu0qC3ulFxSm3
         H+bjBmCPS+MRceZZBMIj2pEqhbdNOImSBEef7W2EKIQKZIhDYeZ/jVShTFYQdfj3RSRH
         4C3QhYxX52xjKqjTjOtUrOW36MaxnBhStl/5e2cWD2Xtxs6DT0nJ705+eVcLvms70oAD
         otWQ==
X-Gm-Message-State: AOAM532aw1YskbWuoNe+L7NwuO0pQac9Eg8JePp4pK4Hbj9QJl4D9GyF
        wMNoKfFsX8tP8WuoJ9lr3B7hHWuyTFHNWYr9AjBR1mZzTqdUnINIMxG2jdmCHl7p2De+bCIMZsh
        ZHuzNwfiOyWXq7ZzHCpRoS58G6dMTA2t3
X-Received: by 2002:a05:651c:10d:: with SMTP id a13mr1017970ljb.217.1601381803722;
        Tue, 29 Sep 2020 05:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0wAN1g0mJoPRemnBeRoOHrscZEmxfN7P/VaV8PCgYFEgJUUhx3QFC5sJAzFENjRdqM8X9hzSDmaCflJ7kHnM=
X-Received: by 2002:a05:651c:10d:: with SMTP id a13mr1017968ljb.217.1601381803483;
 Tue, 29 Sep 2020 05:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAFqZXNsoXr1eA4C8==Nvujs5ONpRnuSqaOQQ0n78R=Dbm-EFGA@mail.gmail.com>
 <20200921160922.GA23870@lst.de> <20200921163011.GZ3421308@ZenIV.linux.org.uk>
 <CAFqZXNsBqvCj0NjEd9+C0H1EPjz7Fst296AA5eOFSVx=SKjfOg@mail.gmail.com>
 <0764629d33d151aee743d0429ac87a5b0c300235.camel@themaw.net>
 <CAFqZXNsqD73hptXxBn+g98ngbFd=Sx+CghtwVqM+NC47VFZhVQ@mail.gmail.com>
 <CAEjxPJ4oZvtqUpW0bMzoZwVsi9kDvL5LtouHQZAO7gM7_qyHMg@mail.gmail.com>
 <CAFqZXNs0oZ+_RNvwE-e62H2FSS=N4wbvJ+tgk0_dSn=5mbPhcw@mail.gmail.com>
 <CAHk-=wjYB+q1=3_x97VSNo5cPTL=eHnuMDXoKhGJOJvo+pbp9g@mail.gmail.com> <05c18390d485ae6d84c49f707d20b49e28f210a6.camel@themaw.net>
In-Reply-To: <05c18390d485ae6d84c49f707d20b49e28f210a6.camel@themaw.net>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Tue, 29 Sep 2020 14:16:32 +0200
Message-ID: <CAFqZXNt2pWwRnnzB0KfZfZy-dJuXfKkJeejpuXcHCBLq1htA8w@mail.gmail.com>
Subject: Re: Commit 13c164b1a186 - regression for LSMs/SELinux?
To:     Ian Kent <raven@themaw.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>, autofs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        Zdenek Pytela <zpytela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sun, Sep 27, 2020 at 5:08 AM Ian Kent <raven@themaw.net> wrote:
>
> On Fri, 2020-09-25 at 10:38 -0700, Linus Torvalds wrote:
> > On Fri, Sep 25, 2020 at 6:38 AM Ondrej Mosnacek <omosnace@redhat.com>
> > wrote:
> > > On Thu, Sep 24, 2020 at 4:16 PM Stephen Smalley
> > > <stephen.smalley.work@gmail.com> wrote:
> > > > Up-thread I thought Linus indicated he didn't really want a flag
> > > > to
> > > > disable pemission checking due to potential abuse (and I agree).
> > >
> > > IIUC he was against adding an FMODE flag, while I was rather
> > > suggesting a new function parameter (I realize it probably wasn't
> > > clear from what I wrote).
> >
> > I really would prefer neither.
> >
> > Any kind of dynamic behavior that depends on a flag is generally
> > worse
> > than something that can be statically seen.
> >
> > Now, if the flag is _purely_ a constant argument in every single
> > user,
> > and there's no complex flow through multiple different layers, an
> > argument flag is certainly fairly close to just having two different
> > functions for two different behaviors.
> >
> > But I don't really see much of an advantage to adding a new argument
> > to kernel_write() for this - because absolutely *nobody* should ever
> > use it apart from this very special autofs case.
> >
> > So I'd rather just re-export the old __kernel_write() (or whatever it
> > was that broke autofs) that didn't do that particular check. We
> > already use it for splice and core dumping.
> >
> > autofs isn't that different from those two, and I think the only real
> > difference is that autofs is a module. No?
>
> It can be, yes, many distro builds compile it in.
>
> >
> > So I think the fix is as simple as exporting __kernel_write() again -
> > and let's just make it a GPL-only export since we really don't want
> > anybody to use it - and revert  commit 13c164b1a186 ("autofs: switch
> > to kernel_write").
>
> Yes, sorry I missed this initially.
>
> There are a couple of other sanity checks in kern_write() but since
> __kern_write() is meant to be for internal use that's not really
> an issue IMHO.

OK, so it seems that reverting comes out as the best choice here.

BTW, I'm looking at rw_verify_area() and I see this "If (ppos)" check
and the comment above it... And then I look at autofs_write(), which
passes &file->f_pos, while ksys_write() passes file_ppos(file), which
checks FMODE_STREAM and returns NULL if it is set. And since the
autofs pipe should be a... well... pipe, which AFAIK implies
FMODE_STREAM, file_ppos() should return NULL for it. So shouldn't
autofs_write() use file_ppos(file) instead of &file->f_pos? Not sure
if there are any practical implications, but seems more
correct/consistent that way... And in that case most of the
rw_verify_area() checks would be skipped anyway. And
file_start_write()/file_end_write() do nothing on non-regular files,
so it seems kernel_write() vs. __kernel_write() makes only very little
difference for pipes.

--
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

