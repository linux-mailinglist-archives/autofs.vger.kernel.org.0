Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EA6291366
	for <lists+autofs@lfdr.de>; Sat, 17 Oct 2020 20:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438750AbgJQSFd (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 17 Oct 2020 14:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438736AbgJQSFd (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 17 Oct 2020 14:05:33 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134E5C061755
        for <autofs@vger.kernel.org>; Sat, 17 Oct 2020 11:05:32 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l2so7548137lfk.0
        for <autofs@vger.kernel.org>; Sat, 17 Oct 2020 11:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YzzkfpJGlrB+NzoqhMm5+0wWAh7Rs2lQArX41HEAZCI=;
        b=TKzbCbUH7/c9ZSIadXiw2jBTw8FZOtumacQ3aVsQPG3EMi3ovIrNr1LT83lI/QH6RX
         6SYmz6HeVIjzp5Sr0WpMUwSO9mzQG42mg+5ygnrIHPoOo7L2Cw7XHagFYbBRDwk3tqba
         +KviVi+0xg52SClQeey5o0rS6yC1vNh69NVxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzzkfpJGlrB+NzoqhMm5+0wWAh7Rs2lQArX41HEAZCI=;
        b=P8orvMmXWEdmlWRgmJgJHm1GuMmG9iDhJ4xBDdLe+iC6SKJGIkZ5oSkSw50DWe52Ke
         qhaAJu2lnyYuHSarq4QYXIlayZumsYHM43O7Z0TC3Cj05qGe8WsYKnnWi31ygdFIGsk/
         o81LU/TTnJkcxaxuaclJlHkdURI4wKtHqM10JnH4evbZF+0TlSYJ/cCPPmaj/0zOFxSZ
         P92Gw0wkHznsr5zpDZNv1F9lYoTA/4BudIbygumKr7ZrfKo9QPEZLWd4V8RpdxpfnFkm
         N0Jb9e3K1m3ewcd1hnRt8hQlICDUkzRslNNVyQ5eFNsNBCbihLKFeT/DyoK9INmUSptT
         u/WQ==
X-Gm-Message-State: AOAM533HLJJPz9av0RdPX+uHE263VZLoPJrXkPsaEWsBZjgKnTa03iZo
        iaKZAyoXGj6njk7m0xOoFiNSGb0+3vu4zw==
X-Google-Smtp-Source: ABdhPJx/f6hCz9f7yrab1cbrq4ZtlKu6LFSjoTcJu64U51kmpYmN9Fh75JUXg3QRUTmJYyWwpGguVA==
X-Received: by 2002:a19:cb94:: with SMTP id b142mr3085032lfg.388.1602957924592;
        Sat, 17 Oct 2020 11:05:24 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id v70sm2099577lfa.93.2020.10.17.11.05.22
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 11:05:22 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id b1so7469439lfp.11
        for <autofs@vger.kernel.org>; Sat, 17 Oct 2020 11:05:22 -0700 (PDT)
X-Received: by 2002:a19:4815:: with SMTP id v21mr3692028lfa.603.1602957921972;
 Sat, 17 Oct 2020 11:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201016123530.GA30444@duo.ucw.cz> <bfac7ed28d79b8696cb8576790b27027a78cd3b7.camel@themaw.net>
 <20201017100234.GA3797@amd>
In-Reply-To: <20201017100234.GA3797@amd>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 17 Oct 2020 11:05:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFVYJabpFsSRL-t7PjDfisvNU=kUMPQUh=SDtLtT587w@mail.gmail.com>
Message-ID: <CAHk-=whFVYJabpFsSRL-t7PjDfisvNU=kUMPQUh=SDtLtT587w@mail.gmail.com>
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

On Sat, Oct 17, 2020 at 3:02 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Bad Linus!

Christ people.

The bug is in linux-next, not in mainline.  I've told the people
involved already over a week ago.

I can't do anything about linux-next being broken and people not fixing it.

              Linus
