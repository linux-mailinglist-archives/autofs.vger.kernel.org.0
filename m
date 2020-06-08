Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADC61F17E7
	for <lists+autofs@lfdr.de>; Mon,  8 Jun 2020 13:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbgFHLer (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 8 Jun 2020 07:34:47 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41905 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729532AbgFHLer (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 8 Jun 2020 07:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591616085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kJSWJfIq14kp+QBFqyCQyWR+tjbtwsPd2mTE86IhFFw=;
        b=WOm1d3ZmIfB8T+2/ItB8zXE55hugDB0k9gYOz0c2tpYAVCyIFIzU3fVUTJ/GIL4MQG3/PE
        E7urP7IR/iseuBX9kGdlMTDDYu529WyiDWym5vuv1cIBdOS6EqhO4WQ8xjmEb+FOwOr3WU
        54Jd3jgQ3ScIho7y1jMwCfh9VqI+IE8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-VHInjOSpNNuSaHjdqN3FhQ-1; Mon, 08 Jun 2020 07:34:44 -0400
X-MC-Unique: VHInjOSpNNuSaHjdqN3FhQ-1
Received: by mail-io1-f69.google.com with SMTP id h65so10674210ioa.7
        for <autofs@vger.kernel.org>; Mon, 08 Jun 2020 04:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJSWJfIq14kp+QBFqyCQyWR+tjbtwsPd2mTE86IhFFw=;
        b=YXvdHRIySVaV8tlLdTsphKyVliaV0eRuzOTNM71D6L8b2N+o9mxohpDvtiAQSBzos+
         EcmuW5jHsIB0687z0PDhzB5i8kqWRpAArnF+tVYSE9SCh9aZMsrKdRGnzOav2qLyaneJ
         o5i+wilzi0qwwmwe64+fggkFkvIFGblZ/CBtsL9m9NuQT6I6A9xXhj0N4CQ/hSs7ORpu
         3eu5twDeH9f8cX8Wx0acCDlHzBCiMJblztSp0w6FGre8MJas3aArgvKMiqz0EmLuloyZ
         cr+Gb0okmDxklwctycQDqZHlkdPMA3Rbh6E72RQwTLww7yW9g7cmzgZzUC7lxCY2h38d
         iVRA==
X-Gm-Message-State: AOAM533LT6u+zal1DUGxi+nZxa8ifdfAufEW7wMXtyjgEs+hb97Q8O7n
        FwpOIm/f0Mh/Jmi9jAuyFJbBIqVIeeU6tt8oegqLCG7Ug1j/TFiB+ScEusKA4q3F+tuiY1PKjyZ
        R0AAZoTuhDdh9mgQetHLAZUxZ7nCW3eSC
X-Received: by 2002:a05:6e02:d2:: with SMTP id r18mr21929247ilq.263.1591616083800;
        Mon, 08 Jun 2020 04:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmUlRqZWdYrv7l7G+yUFpwj4FxBlgeOrRaBZlcO35EEXnVy+paNwxEVZuL99Rhs4QaQ0/ymDY2bZa2Y7dNlWY=
X-Received: by 2002:a05:6e02:d2:: with SMTP id r18mr21929222ilq.263.1591616083581;
 Mon, 08 Jun 2020 04:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200608101038.20426-1-rbergant@redhat.com> <1e74e950-ca17-ecff-9820-cee6107a5aa9@molgen.mpg.de>
In-Reply-To: <1e74e950-ca17-ecff-9820-cee6107a5aa9@molgen.mpg.de>
From:   Roberto Bergantinos Corpas <rbergant@redhat.com>
Date:   Mon, 8 Jun 2020 13:34:32 +0200
Message-ID: <CACWnjLzJf+kADzkPaOSua3d0S8npH9EGUCCFWwUfhxsiwWRh4Q@mail.gmail.com>
Subject: Re: [PATCH] autofs: add pid/comm to debug on autofs_notify_daemon
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     raven@themaw.net, autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Ian, Paul

  Thanks for your suggestions. I'll send a new version addressing your
comments. I'll get rid of pid logging as in the end
  it does not add much value in this context. Command name can be more
useful for troubleshooting purposes.

rgds
roberto

On Mon, Jun 8, 2020 at 12:55 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Roberto,
>
>
> Thank you for the patch.
>
>
> Am 08.06.20 um 12:10 schrieb Roberto Bergantinos Corpas:
> >    This can be useful for troubleshooting purposes and this information
> >    is not directly avalaible to userland
>
> s/avalaible/available/
>
> It looks like you copied this from `git show`, which adds four trailing
> spaces in front of the commit message. Could you please remove those,
> should you resubmit? In the future, I recommend to use `git
> format-patch` and `git send-email`.
>
> Maybe, also add an example output of the new debug message.
>
> > Signed-off-by: Roberto Bergantinos Corpas <rbergant@redhat.com>
> > ---
> >   fs/autofs/waitq.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
>
>
> Kind regards,
>
> Paul
>

