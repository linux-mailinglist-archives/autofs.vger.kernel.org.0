Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC501272C21
	for <lists+autofs@lfdr.de>; Mon, 21 Sep 2020 18:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgIUQ1v (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 21 Sep 2020 12:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgIUQ1v (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 21 Sep 2020 12:27:51 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179C0C061755
        for <autofs@vger.kernel.org>; Mon, 21 Sep 2020 09:27:51 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w11so14745583lfn.2
        for <autofs@vger.kernel.org>; Mon, 21 Sep 2020 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wkGkb2MrNjid2t2xzsw7KGRSA+5X+/NXfaXYAD63JOQ=;
        b=EbVfWiD/0FwOHmGlMRJzyDefmvEBHwjopQdM0INnp7+G7ymRce/nckc8fZ1BbNObaM
         KYhup5K4TfBuWWI2zp87w7I1NNRFlriw8hPLX5GDXo97vLAs9GvUo9Ux3NCkR0mEYh0d
         B6njjsxpj84PDzjqVDsZyzxBpabTZjipn+vS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wkGkb2MrNjid2t2xzsw7KGRSA+5X+/NXfaXYAD63JOQ=;
        b=VlofaHjnzonPW0Hwiwvi8VjzBUeFTvQ+oc10M8ZDi6SyKc+2P1JG7v02K+xwicvSSy
         PNIQ1KO7mAu4Z6MdOxlqcNvqg6XUFs2x8Ti1i1eZYONFSQY/JirIrgabq0BCoyFAPgle
         ZMNcMfR7t+SKvF2yWqCvB6BxfqaQK0W/PgxDUDtOQsFYhVo8eLo/OPem11Zw3kf9DAMP
         U/khSWSz1QGprCOfQmwG1CzB15dyC27aV4V8NYfFoTmnePrmAmY4F6DRciG9rG/nroL9
         JjD+zSUC8bbsQ4qAiYes1YzvXxCJEebvtnMz5O2k/D84mZTYc9crhXFkC9vsOxUa8OlO
         AKIg==
X-Gm-Message-State: AOAM532GP0YnfTvSs93bF53AczgG+bIdE0+ZL8tMedLUnlvFEsnxCwOF
        msZaA4ZRFXPnVdyThi4HXJbsD9Crass3Ng==
X-Google-Smtp-Source: ABdhPJw1GZK0Ya5jd+viCpQVKhIye/nCHC3LtGA0CAq/NQSODbHxelIU3y9lRDsbFl+m6n9W29lbaQ==
X-Received: by 2002:a19:402:: with SMTP id 2mr221124lfe.279.1600705669267;
        Mon, 21 Sep 2020 09:27:49 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id o17sm2842147ljg.113.2020.09.21.09.27.48
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 09:27:48 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id r24so11637710ljm.3
        for <autofs@vger.kernel.org>; Mon, 21 Sep 2020 09:27:48 -0700 (PDT)
X-Received: by 2002:a2e:84d6:: with SMTP id q22mr156761ljh.70.1600705667861;
 Mon, 21 Sep 2020 09:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAFqZXNsoXr1eA4C8==Nvujs5ONpRnuSqaOQQ0n78R=Dbm-EFGA@mail.gmail.com>
 <20200921160922.GA23870@lst.de>
In-Reply-To: <20200921160922.GA23870@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Sep 2020 09:27:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgTz9h-WCtkEcByebaqv3arZWuUQ7TzfHejo10=bztZeA@mail.gmail.com>
Message-ID: <CAHk-=wgTz9h-WCtkEcByebaqv3arZWuUQ7TzfHejo10=bztZeA@mail.gmail.com>
Subject: Re: Commit 13c164b1a186 - regression for LSMs/SELinux?
To:     Christoph Hellwig <hch@lst.de>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>, Ian Kent <raven@themaw.net>,
        autofs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        Zdenek Pytela <zpytela@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, Sep 21, 2020 at 9:09 AM Christoph Hellwig <hch@lst.de> wrote:
>
> So we obviously should not break existing user space and need to fix
> this ASAP.  The trivial "fix" would be to export __kernel_write again
> and switch autofs to use it.  The other option would be a FMODE flag
> to bypass security checks, only to be set if the callers ensures
> they've been valided (i.e. in autofs_prepare_pipe).
>
> Any opinions?

I'd much rather do the former than add a new dynamic flag that we then
have to worry about somebody being able to set thanks to a bug.

Static behavior is a lot easier to verify and document (ie just a
comment in the code explaining why autofs cannot use the regular
kernel_write()). There's no chance of that static behavior then
leaking to other call sites.

                   Linus
