Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1D349539C
	for <lists+autofs@lfdr.de>; Thu, 20 Jan 2022 18:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbiATRzz (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Jan 2022 12:55:55 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33442
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233004AbiATRzx (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Jan 2022 12:55:53 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8DD6E3F1E9
        for <autofs@vger.kernel.org>; Thu, 20 Jan 2022 17:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642701352;
        bh=Ykkcu4NwLFsRFW5qNeuv6xiCCMAtU0WdpVNpyqdBelI=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=iwau0RI7DV7rr5CoZYi2p311QkCWJkizSHJjwduZbIZVLR/XB7xm4HrJFJp4SPvMw
         qll1ae6WCXmAYBES1lDdA/khr7CANpxV7iyxftijba1y6gWU4qUYcMetAovkS9/9yA
         46bNDxXVjU2pryYiX2cqDuj5CkbSSD6rWh+dl4QmVQiG4KG9ikQtsUmK1mUvSE+lOD
         aZOTln9xcrfAadLyiOIRswMrcjklD5ZGVumFdgor52B8JnhHnmeOAPNRp8Bc1u6DV4
         GQf6ZyvjlG32Hk9pUwxB2BPSAFMUVabB3kcqTfyCiFQELsxtPZ9xETrKYFEXCx7XH9
         hqvRTK93+5k8Q==
Received: by mail-ed1-f69.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso6601458edb.16
        for <autofs@vger.kernel.org>; Thu, 20 Jan 2022 09:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Ykkcu4NwLFsRFW5qNeuv6xiCCMAtU0WdpVNpyqdBelI=;
        b=tUvH7nCKCXF2+J0uO9/T4xTz+KkJeorT4pJZVyYT+eJKDEjBmxUys0Tk4ZDD9aSI2s
         gqqiKSvlBSLq9MvapsFxCSOtXAs/V1bq8l8gy0I3gftZhHxbVOijoY4kfasXKyA2sheX
         v7ZTUfqiOVZqmVHy1NFr5BYe4ULPpvTbHeOJvN9dJADJL0n7k1qU5h6Et+uHyHDhZxvz
         IKXdnn0VJd3ly2pI4u2wFZktr5zBRP4FdTrVvJwvfEcAqI0w3z41Lmmxpmw7UCUEUE6P
         dCHbmrd9+5PhHC55uuTtBYejmrF9Txw+mH++SC87SyJEX7sgJAYAzubWUmzVLYxbXP3E
         AYzg==
X-Gm-Message-State: AOAM533NtztIvHJX0zdbFq90VMaFjhLtVqbfGai4aili+Dd727cs2aZf
        yYAqRAQL2aYuq0tDvB8tKIaBSu8EcdGJo5NCslbDtbp1venwfI+Qq4SGjGLPoi9linx7G7c+svq
        TByMh4F8gyZbWfaA2NYJ8tKcNZuXt5G2H1YgvuPTq1RW1lG/PBA==
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr1056ejc.716.1642701352221;
        Thu, 20 Jan 2022 09:55:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyicJKplhyLe3+nsfxV3PuOnWdbEAMcfAPhX1OVn2G3nGaA8vIyLZ10FE+1hhCGjIqhHISN22FvDXXQmnFphto=
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr1041ejc.716.1642701351993;
 Thu, 20 Jan 2022 09:55:51 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
 <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
 <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com> <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
In-Reply-To: <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Thu, 20 Jan 2022 14:55:40 -0300
Message-ID: <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi again,

On Thu, Jan 20, 2022 at 10:16 AM Andreas Hasenack <andreas@canonical.com> wrote:
> Something still feels wrong, though, and behaves differently from 5.1.7.
>
> I applied all your patches for 5.1.8, even unrelated ones, and tried this:
> # this would trigger the segfault in plain 5.1.8:
> root@j-s390x:~# time ls -la /cifs/localhost/private
> total 4
> drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
> -rwxr-xr-x 1 root root 64 Jan 19 13:02 hello-private.txt
>
> real    0m0.130s
> user    0m0.000s
> sys     0m0.001s
> root@j-s390x:~# time ls -la /cifs/localhost/pub
> total 4
> drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
> -rwxr-xr-x 1 root root 63 Jan 19 13:02 hello-public.txt
>
> real    0m0.014s
> user    0m0.001s
> sys     0m0.001s
>
> # This is expected to fail, because I only have /etc/creds/localhost,
> not /etc/creds/127.0.0.1
> root@j-s390x:~# time ls -la /cifs/127.0.0.1/private
> ls: cannot access '/cifs/127.0.0.1/private': No such file or directory
>
> real    0m0.075s
> user    0m0.000s
> sys     0m0.001s
>
> # but this hangs, and ls process goes into D state. With 5.1.7 it works.
> root@j-s390x:~# time ls -la /cifs/127.0.0.1/pub
> <hangs>

The above hang happens for me when patch 5 is applied: [PATCH 05/19]
autofs-5.1.8 - fix root offset error handling

In summary, for my s390x case:
- [PATCH 05/19] autofs-5.1.8 - fix root offset error handling:
introduces the hang in the above scenario
- [PATCH 08/19] autofs-5.1.8 - fix loop under run in
cache_get_offset_parent(): fixes the s390x segfault, and failure to
mount the private cifs share
