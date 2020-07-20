Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F74225EB6
	for <lists+autofs@lfdr.de>; Mon, 20 Jul 2020 14:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgGTMkN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Jul 2020 08:40:13 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37357 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbgGTMkN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Jul 2020 08:40:13 -0400
Received: by mail-vs1-f66.google.com with SMTP id p25so8396038vsg.4
        for <autofs@vger.kernel.org>; Mon, 20 Jul 2020 05:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRoQkE4ebPL0up9r7e7Uk3WFB7Ja+go7Gk6m9LPuguA=;
        b=oVIpvRkvaCnWnVhdyBjcjGeNhcaFamOTapxm0MagT3WiZDBkEogHow2uUfWUTYheJL
         R+8vDd1fUrrRfnKaWEbKZm5dt+e7gbuVPMdG7Mpb9ja44DSlZtvATBtcZrWp3zcIpDw6
         vyqytLGU3oMY9NBnMM9jpVgv4gAbr8EPTPB5z2c/3+dMIddp4R5TdvtYKLDP72barMwA
         f69EGjhRK98R5ELiR2rKn9pjrM9t1iA7sRV94V4CeCb/O8aDpbqtKzVnK1hj002YoLnR
         QB92fa+rCM/3Nsi0U2IuZHvzA+1cpJazskp1Gu1OW1ZZ3N2rzTUQEFuK9d2X9SAew8Si
         ABPQ==
X-Gm-Message-State: AOAM531f5aaOqCKDHG2ZhcY4l8F97TbJa3eX4qWC1oRoFijRdUHv3JP2
        MVamMT/hH01VmxSl+asHIuVO57oNKE3IvJNqfw3GMx/3
X-Google-Smtp-Source: ABdhPJzNS5SDCFP8YkzXiyylhI34yBKSyuJACUC6TC95JglH0zrEoa0Y+tabn+0tJS3nPCKueJzSeWrh4sKdx7zq0e4=
X-Received: by 2002:a67:330e:: with SMTP id z14mr15146802vsz.94.1595248812489;
 Mon, 20 Jul 2020 05:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9BcdtuGxQBNWhsCdhTjqw=jr5CoHvVFxD1Nw1k5o-xF0PSog@mail.gmail.com>
 <548d94a2ebfc9fe2f5f1c0d736346965b64d18c4.camel@themaw.net>
In-Reply-To: <548d94a2ebfc9fe2f5f1c0d736346965b64d18c4.camel@themaw.net>
From:   Hugh McMaster <hugh.mcmaster@outlook.com>
Date:   Mon, 20 Jul 2020 22:39:59 +1000
Message-ID: <CAN9BcdtFhvEQB_mYzzPUDjR7EQVBsivsZPMTb7mg5JaB3qG_cw@mail.gmail.com>
Subject: Re: [PATCH 3/3] Use PKG_CHECK_MODULES to detect libxml2
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian,

On Mon, 20 Jul 2020 at 17:11, Ian Kent wrote:
>
> On Thu, 2020-07-02 at 23:43 +1000, Hugh McMaster wrote:
> >  # LDAP SASL auth needs libxml and Kerberos
> > -AF_CHECK_LIBXML()
> > +PKG_CHECK_MODULES([XML], [libxml-2.0], [
>
> I think perhaps I will need to change [libxml-2.0] to
> [libxml-2.0 libxml2] ... the Fedora package name.
>
> It's not clear from the PKG_CHECK_MODULES man page if that's the
> correct way to specify this and if a space separator is meant to be
> used between package names.

That won't do what you think it should.

pkg-config has no concept of package names. It only reads information
from module files installed in /usr/lib/pkgconfig or similar paths.

Developers pass the name of the required module (without .pc) to
pkg-config. So, for libxml2, it's libxml-2.0, not libxml2.

Also, pkg-config (and its macros) treat space-separated module names
as one argument. pkg-config will fail if it can't find any one of the
specified modules.
In this case, libxml2.

Hugh
