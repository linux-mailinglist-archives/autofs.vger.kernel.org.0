Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D604B497F6B
	for <lists+autofs@lfdr.de>; Mon, 24 Jan 2022 13:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239414AbiAXM0Q (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 24 Jan 2022 07:26:16 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40724
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234482AbiAXM0P (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 24 Jan 2022 07:26:15 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 140EB3F1E7
        for <autofs@vger.kernel.org>; Mon, 24 Jan 2022 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643027168;
        bh=GAnhK7T+b1vc73hbQVdYFEM9q6DbFeLXznZb7i50HOo=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=F3a7of2rX67HFgPyQqXSJUOVRt6ElB77H1/E8pdB5gdCo9fiqzfLZkweM6c2aYS3W
         iS1LP059t7EuS3uC4qGowy0/6xC3W73lXMf1ScMU7rShrN4jrtzo7OebHsqIF9RHAC
         zxy8J4Y9WL2683mqVAkRI/ZmljatOegBL1Ox1dqq38b1QoM8ixV8o3vuhkg09zZKFf
         /rKbeo5Cy8WvGqoj36SrzNsIuVcNIwcXfijD2yjCg+QfMDO7qduw2c3mgAip6mIaIC
         lDBlwjdmUf7pWsGytviUOqt2TPpdoGEutpkDv8pHVbnpIjWpFTn5HEPKIPg2drs11E
         cB7Mmrizti1qw==
Received: by mail-ed1-f70.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso13060721ede.12
        for <autofs@vger.kernel.org>; Mon, 24 Jan 2022 04:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=GAnhK7T+b1vc73hbQVdYFEM9q6DbFeLXznZb7i50HOo=;
        b=ZGG2oeKmQbTYC7lHaHNKX05emaOOCe+TKkthr2cmMbox5K1Dgapmr73lbUTf6LfBQf
         8b1Xhja/8pMDJykm2ZeVglwRAwHqwuXExN7exC97xTvWUNlIMNJ7EO1P9mpg1j5Za4a3
         ReJOyFXz3fAavzXXf0DPbDbAvaGXTkNmM4kX6PVlElRNtQhQcKkV6pswxDodfxfn4COI
         Ih876UcvSrIApVPvyl/HPikgi4YnKb8b/k7v0OsVtHRa1Fn6IZYlod8Xfib/QcV6hpmV
         1/cynH9+6L0Z5JKZrUz8rxyLLgb/hqa/nUzlNdBJd66qZtcKdZ8FSWn4EIwXvFtThiYZ
         ni6A==
X-Gm-Message-State: AOAM532SQJLVk0bp+Sci8YZoc1K2D7efqhwK0CpUZuNkvAvNfhZXa06Q
        VOpbe5tqLFfBWvReKJ9J1xz7UmI1Ti9bUX8w0lggFosUuUEd2qMlNPVl+lxbBc0wrie3bfio4C/
        c0Fbw+JY8ydu9bYIVVyK+Cw3S1KaJAMOdQ4t7LUMsvSqZ4ldPvw==
X-Received: by 2002:a05:6402:270f:: with SMTP id y15mr15922763edd.408.1643027167774;
        Mon, 24 Jan 2022 04:26:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxegRiud1HysW4F7uS2E/nGZHUpFqkuDOm3XmeTsU0hCnX6E3uyMpzRa3M365VY0c6uIr6865F4xJIABY4mzZ4=
X-Received: by 2002:a05:6402:270f:: with SMTP id y15mr15922755edd.408.1643027167639;
 Mon, 24 Jan 2022 04:26:07 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
 <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
 <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
 <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
 <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
 <25f3fdb0fff76a6d347c5e6e1f12d6c6dac40916.camel@themaw.net>
 <7967061ccfa8de983f7a0c0320547011228cd1f8.camel@themaw.net>
 <CANYNYEG4uA8Tp5+W3=XHkXzaBWv1f9Sq5Re+oahGB4jNwYa6BQ@mail.gmail.com> <aca5cb6920b313953289db25adc8d63703af6b38.camel@themaw.net>
In-Reply-To: <aca5cb6920b313953289db25adc8d63703af6b38.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Mon, 24 Jan 2022 09:25:56 -0300
Message-ID: <CANYNYEGe0PDwmPwUGTT7REgh1eagaMXCeAkWU60r3hjCfhbY1Q@mail.gmail.com>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Sun, Jan 23, 2022 at 11:42 PM Ian Kent <raven@themaw.net> wrote:
>
> On Fri, 2022-01-21 at 09:35 -0300, Andreas Hasenack wrote:
> > Hello,
> >
> > On Fri, Jan 21, 2022 at 5:08 AM Ian Kent <raven@themaw.net> wrote:
> >
> > > I think this patch might help with that hang.
> > > I may merge that into the original patch but it's separate for now
> > > to facilitate testing.
> > >
> > > autofs-5.1.8 - fix fix root offset error handling
> >
> >
> > This indeed fixes the hang after patch 5, thanks! \o/
>
> btw, I will fold that into the above patch since this is all being
> done as development, hence the mistakes we are seeing.

Thanks!
