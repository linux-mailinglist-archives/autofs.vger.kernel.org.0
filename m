Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C74D29151D
	for <lists+autofs@lfdr.de>; Sun, 18 Oct 2020 02:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439951AbgJRANn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 17 Oct 2020 20:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439950AbgJRANn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 17 Oct 2020 20:13:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06D4C0613CE
        for <autofs@vger.kernel.org>; Sat, 17 Oct 2020 17:13:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a4so7054913lji.12
        for <autofs@vger.kernel.org>; Sat, 17 Oct 2020 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cxGkthbhuOicJJzYUAHjMjkOp7k2zTWOMFRCAnwQA1o=;
        b=SIiMEuHhWb/JI2XHUI3ytOG/T1lgKfGalFCYU4XjJy7kbVQpoJnmHks4O2StGkpTwY
         4JuguGBTT8R+rr+OVnZufPo0cty+s4jaM1FRw+y365EmNCZ4ClaIfGi/7WMYvRAz49Nu
         MTR+Z+wjn+DqwA5LUGleZ54vjoimkx6W3PnJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cxGkthbhuOicJJzYUAHjMjkOp7k2zTWOMFRCAnwQA1o=;
        b=fJXjrHj9EEG8FyLALqYD5K5AKqGTK0mZCLexsm4qd6EoLpIExY40Rb8+pDLFzSprJP
         A4Yy9w6rS5eGF/Fb/J4ns3B2lQAzfpYzGUJW80abptqHamc1UrH2fyp/wwAVt5W7WWT7
         Irj1cZPg/XTXxe570twxEMYg1yGUBMfnzpfX8D+HJKElooiUoX/9N87YI54q3yiE9VY8
         Ys972MGIAcaa965dsj4gqpM1irNXcRbKA5TyLNOra6naydkHp4Huhqa6U/QyxTkuvC4p
         59LNl0JtJiE6EL21jbpFF2p2DN5gQGobZUKEmAeRxEEMw9AbPRQzOg4cNwuH8/6hmF2x
         Xi6g==
X-Gm-Message-State: AOAM532LCt+RDynejJRZ0fQI6rG24lZHkLYK+8sXxPGTtTPtefen5eU0
        VAWZ7WivbQqqyvCLrHzK9AP8Gb3LHkeg8g==
X-Google-Smtp-Source: ABdhPJzZsj4zw8ff0XIn6h0Ma9N5jloWvtJDF4feEbd169GPCdDiV/7+9fM6i8hC/GDjRNVwF/V5Rw==
X-Received: by 2002:a05:651c:234:: with SMTP id z20mr254133ljn.337.1602980018880;
        Sat, 17 Oct 2020 17:13:38 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id b15sm2574242ljk.37.2020.10.17.17.13.36
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 17:13:37 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id d24so7064645ljg.10
        for <autofs@vger.kernel.org>; Sat, 17 Oct 2020 17:13:36 -0700 (PDT)
X-Received: by 2002:a2e:868b:: with SMTP id l11mr3911884lji.102.1602980016454;
 Sat, 17 Oct 2020 17:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201016123530.GA30444@duo.ucw.cz> <bfac7ed28d79b8696cb8576790b27027a78cd3b7.camel@themaw.net>
 <20201017100234.GA3797@amd> <CAHk-=whFVYJabpFsSRL-t7PjDfisvNU=kUMPQUh=SDtLtT587w@mail.gmail.com>
 <20201017194758.GA9904@duo.ucw.cz>
In-Reply-To: <20201017194758.GA9904@duo.ucw.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 17 Oct 2020 17:13:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikZkCGVkeuDUb6jvz7xyeO4RsH3zQU4bCCnP=MBrd95g@mail.gmail.com>
Message-ID: <CAHk-=wikZkCGVkeuDUb6jvz7xyeO4RsH3zQU4bCCnP=MBrd95g@mail.gmail.com>
Subject: Re: autofs: use __kernel_write() for the autofs pipe writing causes
 regression in -next was Re: 5.9.0-next-20201015: autofs oops in update-binfmts
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Ian Kent <raven@themaw.net>, Ondrej Mosnacek <omosnace@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        kernel list <linux-kernel@vger.kernel.org>,
        autofs@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Peter Anvin <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, Oct 17, 2020 at 12:48 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> But: you are the last one to sign it off, so I assume committed it to
> git, and you are the one to talk to about fixing it.

The thing is, the commit you point to - and the one I signed off on - is fine.

The buggy one is in linux-next, which breaks that whole "NULL means no
position" thing.

IOW, the real bug is in commit 4d03e3cc5982 ("fs: don't allow kernel
reads and writes without iter ops"), which does that bogus

        kiocb.ki_pos = *pos;

and no, I never signed off on that.

Get it? Stop confusing people. This bug does not exist in mainline,
and never will. Because I'm not pulling that buggy commit.

The commit you talk about IS NOT THE BUGGY ONE.

                 Linus
