Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361A2272922
	for <lists+autofs@lfdr.de>; Mon, 21 Sep 2020 16:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgIUOvv (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 21 Sep 2020 10:51:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54518 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726592AbgIUOvv (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 21 Sep 2020 10:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600699910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=fS4tEIUXzLiN1infPPE8WhHFvu+7kD6d4GBJkxQpXVA=;
        b=Y2oSJr10CDGKZF+K/mmGqUHyDA2dIXOBxeM0ibem2sBFN+yOASS5JGTm/KImdoWIiN6Gjm
        lgsDSLUebW+ztmM30E6IcjydEHJDYXOsSVl+9Inhy3Z3f5mFQXIUfkTDva1Qhfam1VTokm
        65H2CX5XXRG7NxSuKF9R8g2w6ccPQhk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-lf9qloUsPOij3JI_RSfEwQ-1; Mon, 21 Sep 2020 10:51:48 -0400
X-MC-Unique: lf9qloUsPOij3JI_RSfEwQ-1
Received: by mail-lj1-f200.google.com with SMTP id q19so4228349ljp.13
        for <autofs@vger.kernel.org>; Mon, 21 Sep 2020 07:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=fS4tEIUXzLiN1infPPE8WhHFvu+7kD6d4GBJkxQpXVA=;
        b=YxGTHa4KMC+VKb3Hh7J0N7Vxpv8ZyfLZV+p3r9TIUd7pZ50AIw10QGYe71nly8bUG3
         /YSdqlvyQAYW/rYKCsDjfbb6VSKQZ0X++059pmoAbTcsclRqF3ivufWUMbf9wRNENyOO
         C4UJxTO40ZDm9CHhZKN9E207Mu7Sr1PC9ls9VfCSaf0ng3m4zjlFsTbgxmHl0dotVe5X
         Y+P/HDuDsAumwAR3PiOXyenkzDiWukwEGHMSZ4bJ4aLLkupJEIv+P6sh1ym/kLylcXJT
         bGkJlq9ytIyU2gnL94ofyyAfpkAheyOVI1Uwj4naJSW06KwPkZDly+4T+G+ocxa4cKcW
         OrCw==
X-Gm-Message-State: AOAM530cdzoIle7DrcTqsorViF5jhHhr2xwzYMwh8WI1WrZektdC5vLq
        TAoPlHIg+WUVkrTHzca7GjPoxj4AwDLWKzk0TmTix6H6ik0z+YhJMFIBp52Vmrp7K3KXnXgYG7n
        XUmbU6XRYzUh+5QMSMtQh3ZF1fKZ+SMh+
X-Received: by 2002:a05:651c:38d:: with SMTP id e13mr45401ljp.38.1600699906824;
        Mon, 21 Sep 2020 07:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWDA/v70U48siYhVA/gEo8+KsPOGYyZfPRgMFWmKODx4TZj6mRHbwGLf09leGYyYHOxCYCfm3AB2zLCE926Vk=
X-Received: by 2002:a05:651c:38d:: with SMTP id e13mr45395ljp.38.1600699906595;
 Mon, 21 Sep 2020 07:51:46 -0700 (PDT)
MIME-Version: 1.0
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 21 Sep 2020 16:51:35 +0200
Message-ID: <CAFqZXNsoXr1eA4C8==Nvujs5ONpRnuSqaOQQ0n78R=Dbm-EFGA@mail.gmail.com>
Subject: Commit 13c164b1a186 - regression for LSMs/SELinux?
To:     Christoph Hellwig <hch@lst.de>, Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        Zdenek Pytela <zpytela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi folks,

It seems that after commit 13c164b1a186 ("autofs: switch to
kernel_write") there is now an extra LSM permission required (for the
current task to write to the automount pipe) for processes accessing
some yet-to-to-be mounted directory on which an autofs mount is set
up. The call chain is:
[...]
autofs_wait() ->
autofs_notify_daemon() ->
autofs_write() ->
kernel_write() ->
rw_verify_area() ->
security_file_permission()

The bug report that led me to this commit is at [1].

Technically, this is a regression for LSM users, since this is a
kernel-internal operation and an LSM permission for the current task
shouldn't be required. Can this patch be reverted? Perhaps
__kernel_{read|write}() could instead be renamed to kernel_*_nocheck()
so that the name is more descriptive?

Thanks,

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1874338

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

