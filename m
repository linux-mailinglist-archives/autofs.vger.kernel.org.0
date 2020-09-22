Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC87F273C0F
	for <lists+autofs@lfdr.de>; Tue, 22 Sep 2020 09:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgIVHeH (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 22 Sep 2020 03:34:07 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48707 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729634AbgIVHeH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 22 Sep 2020 03:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600760045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PLNLNqxOlhhIUOsZLkynKysFiUo4YS4/xLJlG3EgM6o=;
        b=LU7NOCbfeaZdGhstszFsvV2zEeOBW+lC0x7W8+HqdI4+MjjT2lzLT7m5ABM5FHy4oLZZXM
        QgDJy0XlvG3ZQILtCtm9Er84ygccZnDlx6s1kbqO+i/9ep4om5n2bwA9ztml3BppGwR1/M
        4GlQ0RW8PRkk0LqLa4qZgyae5sBpuiU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-xzKwk_DONXONTx1WHjdsZQ-1; Tue, 22 Sep 2020 03:34:03 -0400
X-MC-Unique: xzKwk_DONXONTx1WHjdsZQ-1
Received: by mail-lj1-f197.google.com with SMTP id b17so4555419ljp.3
        for <autofs@vger.kernel.org>; Tue, 22 Sep 2020 00:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLNLNqxOlhhIUOsZLkynKysFiUo4YS4/xLJlG3EgM6o=;
        b=Eqv07FrbMY5tQzwNNxhjCSMtDJksZLTxLJwtYjzY8dCeItUmaobkJkhDsfb5RpUVCt
         1AbZ//zbCx+bGjBdGBT0+kU7ACqbVVg6UqIMQB1zb4JqkIpRXRH4hzSLmTJMGpqa2FYq
         dIkEpEvu/UK5r4EY7RrUl48+rM4NcDcu8i3bNz0koNy0OMTqmEkEqkwjFezG1PiQzmEk
         rw5L/kBNFtZVqt4Y6anA3ABRq8R9KNbiVWzahDSlUmn4UHfK8BFosbAl0QFtmIEeWVOd
         ITCNWb2MW9pKonbesNo7ktq4pOm1gBBk3+2XH3LmQoPHfTXFsXhOQRzJZE99JEhbvoQr
         cVOA==
X-Gm-Message-State: AOAM530kxK0HxoA0r6+ZNWN92ACkugG41sSvqDHBqzYEn8OnNnTog5ni
        1O1DbPtnm5NpvxDqTT4tomD+jU6Ht13wC+dqZ60rVM2SF8a/mWOHUw6m16p2TxTIhUBUMdXuVwI
        12J52JmatqYhU5h2DPpXr1ZubBUrHHn7b
X-Received: by 2002:a19:4a0b:: with SMTP id x11mr1332266lfa.354.1600760041909;
        Tue, 22 Sep 2020 00:34:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCfXmaAZWxU7YIAHBIcnL0eyOz6zI51uNtK6P4KKpZL1/XDLvA/HS8pMkl2LjNPXCWFmx+KnBdDuK48LAKasQ=
X-Received: by 2002:a19:4a0b:: with SMTP id x11mr1332258lfa.354.1600760041617;
 Tue, 22 Sep 2020 00:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFqZXNsoXr1eA4C8==Nvujs5ONpRnuSqaOQQ0n78R=Dbm-EFGA@mail.gmail.com>
 <20200921160922.GA23870@lst.de> <20200921163011.GZ3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200921163011.GZ3421308@ZenIV.linux.org.uk>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Tue, 22 Sep 2020 09:33:50 +0200
Message-ID: <CAFqZXNsBqvCj0NjEd9+C0H1EPjz7Fst296AA5eOFSVx=SKjfOg@mail.gmail.com>
Subject: Re: Commit 13c164b1a186 - regression for LSMs/SELinux?
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>, Ian Kent <raven@themaw.net>,
        autofs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        Zdenek Pytela <zpytela@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, Sep 21, 2020 at 6:30 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, Sep 21, 2020 at 06:09:22PM +0200, Christoph Hellwig wrote:
> > [adding Linus and Al]
> >
> > On Mon, Sep 21, 2020 at 04:51:35PM +0200, Ondrej Mosnacek wrote:
> > > Hi folks,
> > >
> > > It seems that after commit 13c164b1a186 ("autofs: switch to
> > > kernel_write") there is now an extra LSM permission required (for the
> > > current task to write to the automount pipe) for processes accessing
> > > some yet-to-to-be mounted directory on which an autofs mount is set
> > > up. The call chain is:
> > > [...]
> > > autofs_wait() ->
> > > autofs_notify_daemon() ->
> > > autofs_write() ->
> > > kernel_write() ->
> > > rw_verify_area() ->
> > > security_file_permission()
> > >
> > > The bug report that led me to this commit is at [1].
> > >
> > > Technically, this is a regression for LSM users, since this is a
> > > kernel-internal operation and an LSM permission for the current task
> > > shouldn't be required. Can this patch be reverted? Perhaps
> > > __kernel_{read|write}() could instead be renamed to kernel_*_nocheck()
> > > so that the name is more descriptive?
> >
> > So we obviously should not break existing user space and need to fix
> > this ASAP.  The trivial "fix" would be to export __kernel_write again
> > and switch autofs to use it.  The other option would be a FMODE flag
> > to bypass security checks, only to be set if the callers ensures
> > they've been valided (i.e. in autofs_prepare_pipe).

IMHO that sounds like an overkill in this scenario. I don't think it
makes sense to do the LSM check here (or at least not against the
current task's creds), because it is not the current task that wants
to communicate with the daemon, it just wants to to access some
directory on the system that just happens to be special to the kernel,
which needs to do some communication on the side to service this
request. So if we do want to do any LSM check here, there should at
least be some "bool internal" flag passed to the LSM, signalizing that
this is an internal read/write operation that wasn't directly
initiated/requested by the current process. SELinux could then either
use the kernel secid instead of the current task's secid or skip the
check completely in such case.

I'd like Stephen to weigh in on this, but it looks he might be on
vacation right now...

> >
> > Any opinions?
>
> Reexport for now.  Incidentally, what is LSM doing rejecting writes
> into a pipe?

With SELinux at least, what is allowed or denied is defined in the
policy. And the policy usually defaults to everything denied and then
you add rules to allow what needs (and makes sense) to be allowed.
Since until kernel 5.8 random processes didn't need to write to pipes
created by the automount daemon, it has never been explicitly allowed
and so the automounting now fails. It is in no way obvious that all
processes should have the permission to talk to the automount daemon
just to traverse the filesystem...

--
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

