Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90E53E46D6
	for <lists+autofs@lfdr.de>; Mon,  9 Aug 2021 15:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhHINms (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 9 Aug 2021 09:42:48 -0400
Received: from vps.wizdom.nu ([51.222.156.179]:56434 "EHLO mail.wizdom.nu"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233565AbhHINmr (ORCPT <rfc822;autofs@vger.kernel.org>);
        Mon, 9 Aug 2021 09:42:47 -0400
Received: from mail.wizdom.nu (localhost.localdomain [127.0.0.1])
        by mail.wizdom.nu (Proxmox) with ESMTP id 5A2BF420E5
        for <autofs@vger.kernel.org>; Mon,  9 Aug 2021 15:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wizdom.nu; h=cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=mail; bh=FXPLdSRSHHgysfomOMAdAnK3Xlzkh
        6V29MWden5gfRY=; b=CWuoFcuD53Sgq08QFll/LYUuwVD9KN6EVHsuXwR1fw5gg
        ZJANoR2b9HzGgzZa40/8qInDqiUvTSDZRbf9yIgJOKbIh5+T3gY4tGO3d9VGS9Lt
        rhyn2sC9DHcb8mUmyjYJZyWEBBdHZpYjiXsqZ26GkECuf6y+ejSiuAWlqr5LMQo9
        mM0giITxNTUFVoq61yJobndvlTOUCQuZZBFTD/asyesMko4MG31rymvTG+JoVlCR
        nmAgNat8aQx/uKLJ6Killo+oO7+hQzQqPUnh/UxNRFCiYbEy/tjEN3Jv0KFoVjmS
        NoHPvoG9qY5p4ZTNpU0jmkvowTUEjdkABU6OwOUPw==
From:   Sietse van Zanen <sietse@wizdom.nu>
To:     "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Subject: Re: autofs & glibc 2.34
Thread-Topic: autofs & glibc 2.34
Thread-Index: AQHXisCgqJS3by9nT0WvFZys77aXC6tnVroAgAPb6/g=
Date:   Mon, 9 Aug 2021 13:42:16 +0000
Message-ID: <c3a9f593933b4db5907637c505279e1e@wizdom.nu>
References: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>,<62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
In-Reply-To: <62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.21.2]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


If you're already aware and will relwase an update soon there's nothing mor=
e to do. Glibc 2.34 is not even a week old. I noticed that a few packages w=
ere running into this so I thought I'd notify their maintainers.

-Sietse

________________________________
From: Ian Kent <raven@themaw.net>
Sent: Saturday, August 7, 2021 06:44
To: Sietse van Zanen; autofs@vger.kernel.org
Subject: Re: autofs & glibc 2.34

On Fri, 2021-08-06 at 12:46 +0000, Sietse van Zanen wrote:
> Autofs no longer compiles with newest glibc 2.34. From the changelog:
>
> When _DYNAMIC_STACK_SIZE_SOURCE or _GNU_SOURCE are defined,
> PTHREAD_STACK_MIN is no longer constant and is redefined to
> sysconf(_SC_THREAD_STACK_MIN). This supports dynamic sized register
> sets for modern architectural features like Arm SVE.
>
>
> This is causing compilation error in daemon/automount.c line 87:
>
> size_t detached_thread_stack_size =3D PTHREAD_STACK_MIN * 144;
>
>

I'm aware of this.

What would you like me to to do here?

I have two patches for this but haven't pushed them to the repo. yet.
Also there will be a release, probably later this month that will
include these.

Ian



