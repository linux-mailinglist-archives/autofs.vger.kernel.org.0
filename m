Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541C2297F1
	for <lists+autofs@lfdr.de>; Fri, 24 May 2019 14:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391299AbfEXMVG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 May 2019 08:21:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48156 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391216AbfEXMVG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 May 2019 08:21:06 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1hU9C4-0007e3-GW
        for autofs@vger.kernel.org; Fri, 24 May 2019 12:21:04 +0000
Received: by mail-ot1-f70.google.com with SMTP id 73so4396200oty.2
        for <autofs@vger.kernel.org>; Fri, 24 May 2019 05:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwg+pjCfsIyCizWF0DxRHEFEZK46OZxIQk72/1Oj2I4=;
        b=qXui9YQlH/31lWb/wW/3aBWb1190q8yKaWeovq2WpasKliWZDPFK+lMRrWJXOpio05
         kKvDweDT9Zmk4V5j8Ex0zTmwcYKpUY1opMjDvaw8mEHu2rvsJ6Mnmtu4itq6ypdGgjMF
         7I7vzskiGJrk8vpwSMvA53q/F3qkMGK+ONE2mVmiqzKW1eD/ui0EtRDHj5cWNv6L81T4
         F5Ph7KUMyZE97uPR13hcHO7LHnKLmSR2YgJLjwPegpVBzfAzM+WbUjQrcgzG3U3RXOlr
         hCMtTd+/XycgEkSZTnl2t7irGlXoxsdhi5qbAXmyGXQeCEaGjhzj2D4rD4loHJr3D/aO
         WuKg==
X-Gm-Message-State: APjAAAVZtEC8pTn3ryP/Bn7FUKYveghE9bge5rle5PhTTbIa/sjL/0W/
        inv9khPcX15glhdmTAYDWBOs5tpya0TRzVRVzNvA9Zgfq1NtR42JXUS7iRt7jq08/teMKE/hBZR
        gtukZPjr1BsyToYnfKUPp7Byz6gq2kUC/p7lJv5+HcSRkb61NXg==
X-Received: by 2002:a05:6830:1097:: with SMTP id y23mr30935282oto.108.1558700463461;
        Fri, 24 May 2019 05:21:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOJ7y0tf7Tb0oYCQNFtkbwh1ogFZQkaa/K4jVIwpftYkbGTG0Um8h3Lf/SVNQwoKM0dhAmgqkPw3t5e73J9+E=
X-Received: by 2002:a05:6830:1097:: with SMTP id y23mr30935211oto.108.1558700462142;
 Fri, 24 May 2019 05:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <CANYNYEHDhrOuncbB2Rh+TRN=TUT28PGcPrKhVLZdeQk6KPMjVg@mail.gmail.com>
 <7740bd6d332a7488f813e4579be311272e819e2f.camel@themaw.net>
In-Reply-To: <7740bd6d332a7488f813e4579be311272e819e2f.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Fri, 24 May 2019 09:20:51 -0300
Message-ID: <CANYNYEFrMx-LtSr63DSOvzLUq8RePOOsf4KxmS2YGvc9fjmOfQ@mail.gmail.com>
Subject: Re: Old patch Ubuntu has been carrying since 2010
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello Ian,

On Thu, May 23, 2019 at 8:16 PM Ian Kent <raven@themaw.net> wrote:
>
> On Thu, 2019-05-23 at 17:22 -0300, Andreas Hasenack wrote:

> Sure, I've added the patch below to my patch queue, it will get
> committed at some point.

Thanks!

> You might also be interested in checking if anything at
> https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.6/
> might be needed.

Good to know, will check them out
