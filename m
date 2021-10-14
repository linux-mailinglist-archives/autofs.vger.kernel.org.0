Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C7642DDC3
	for <lists+autofs@lfdr.de>; Thu, 14 Oct 2021 17:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhJNPOw (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 14 Oct 2021 11:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhJNPOv (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 14 Oct 2021 11:14:51 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219B2C061753
        for <autofs@vger.kernel.org>; Thu, 14 Oct 2021 08:12:46 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id d3so25424738edp.3
        for <autofs@vger.kernel.org>; Thu, 14 Oct 2021 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w45cBwWuxt9fV0sH92Mj0nap7150VQi8dWHb0aDrKOs=;
        b=YRiavibCQ5dBpR8sEKXV0lV/aSByGm8aH6pXObxa96UKqW2Xp1TgT8UGf5o3j2jT/t
         jXFZUixi63N0FP3Ws+XLyyvnKGZpUghoP0ahHvAw6VC7pjQcj1jJyHHYr5ise4ey/pRz
         Z5M9nrJ+4T1D4CggdaoFf9LfYJzN+ShVVq6ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w45cBwWuxt9fV0sH92Mj0nap7150VQi8dWHb0aDrKOs=;
        b=m5uzGoiVg4W8LEPM5Rb4wzqpwkZMgAycfWHrLNxJsUChZ3IdfkgOGA8bmlEYS+pnKJ
         SWWgdbxTv00bIL2TnzElPQKF+l12JLeemZyhJxxoGna3nzcn3Mbma0/xzHPTf8tHCBop
         pg1Gmli9QLLD4Fd76kY0m3MChAKDYn+YSgxE2ZpboqDKlqxrue2BT0RPOyxErgNkISyL
         Gl7GKT4cGxB8QJbOF2bZjL9UMdtEjXMiPU4KIA7rZNWJZ9b/iKRuQlpEC6+kosePrbD+
         patst7Vxw7cMEXChMieZtrTT63QnV9tahwRTEUwt1y3/tPDKiBxOM29OzXqeMlJcZ2EC
         gDcw==
X-Gm-Message-State: AOAM530q4t8SKKGechMgF5kuPUK5Q/+SsoEjmkeaM/GhhfWyGCsHld78
        0gtw1pWCaqzFbP0N0u8/i35SB5q5ca8G1YwANrO6gA==
X-Google-Smtp-Source: ABdhPJztOK9YaOX30AT6nvALG6RtdQ68Gh/4hLbQNEaGCI4Bs6r5KjWBzetHRYs7WH5ROQK5mxa/IEUBo/AlCydTWlw=
X-Received: by 2002:a05:6402:35d1:: with SMTP id z17mr9678857edc.174.1634224293743;
 Thu, 14 Oct 2021 08:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <163238121836.315941.18066358755443618960.stgit@mickey.themaw.net>
In-Reply-To: <163238121836.315941.18066358755443618960.stgit@mickey.themaw.net>
From:   Justin Forbes <jmforbes@linuxtx.org>
Date:   Thu, 14 Oct 2021 10:11:22 -0500
Message-ID: <CAFxkdAraAe37_5bGLJtTtxZCaKTqgVPh4hTbcVC=08vRt-Zizg@mail.gmail.com>
Subject: Re: [PATCH] autofs: fix wait name hash calculation in autofs_wait()
To:     Ian Kent <raven@themaw.net>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        autofs mailing list <autofs@vger.kernel.org>,
        Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, Sep 23, 2021 at 2:20 AM Ian Kent <raven@themaw.net> wrote:
>
> There's a mistake in commit 2be7828c9fefc ("get rid of autofs_getpath()")
> that affects kernels from v5.13.0, basically missed because of me not
> fully testing the change for Al.
>
> The problem is that the hash calculation for the wait name qstr hasn't
> been updated to account for the change to use dentry_path_raw(). This
> prevents the correct matching an existing wait resulting in multiple
> notifications being sent to the daemon for the same mount which must
> not occur.
>
> The problem wasn't discovered earlier because it only occurs when
> multiple processes trigger a request for the same mount concurrently
> so it only shows up in more aggressive testing.

I suppose it shows up in more than just testing, as we have a bug
where this is impacting a user doing regular desktop things.

Justin

> Fixes: 2be7828c9fefc ("get rid of autofs_getpath()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Kent <raven@themaw.net>
> ---
>  fs/autofs/waitq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
> index 16b5fca0626e..54c1f8b8b075 100644
> --- a/fs/autofs/waitq.c
> +++ b/fs/autofs/waitq.c
> @@ -358,7 +358,7 @@ int autofs_wait(struct autofs_sb_info *sbi,
>                 qstr.len = strlen(p);
>                 offset = p - name;
>         }
> -       qstr.hash = full_name_hash(dentry, name, qstr.len);
> +       qstr.hash = full_name_hash(dentry, qstr.name, qstr.len);
>
>         if (mutex_lock_interruptible(&sbi->wq_mutex)) {
>                 kfree(name);
>
>
