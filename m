Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A98A260F31
	for <lists+autofs@lfdr.de>; Tue,  8 Sep 2020 12:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgIHKCv (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 8 Sep 2020 06:02:51 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:41289 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728137AbgIHKCu (ORCPT <rfc822;autofs@vger.kernel.org>);
        Tue, 8 Sep 2020 06:02:50 -0400
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id C53C4206462B7;
        Tue,  8 Sep 2020 12:02:47 +0200 (CEST)
Subject: Re: [PATCH] autofs: Fix crash in sun_mount()
To:     Helge Deller <deller@gmx.de>
References: <20200908095402.GA25766@ls3530.fritz.box>
Cc:     autofs@vger.kernel.org, Ian Kent <raven@themaw.net>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <a3fd2f9c-6371-5d6d-bbf7-ea5222344e98@molgen.mpg.de>
Date:   Tue, 8 Sep 2020 12:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908095402.GA25766@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Helge,


Thank you very much for your patch.

Am 08.09.20 um 11:54 schrieb Helge Deller:
> In sun_mount() the the variable np gets initialized to an alloca()

s/the the/the/

> memory area:
>    np = noptions = alloca();
> Later on, at the end of a loop, it may get accessed like this:
>    *(np - 1) = '\0';
> 
> If np hasn't been increased in between those lines, this access triggers
> an out-of-bounds access which overwrites stack area and on the parisc
> architecture segfaults the automount executable as desribed in the Debian

described

> bugzilla #892953.

Debian just calls it Debian BTS.

> The patch below adds the necessary check and thus fixes the crash.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=892953
> 
> diff -up ./modules/parse_sun.c.org ./modules/parse_sun.c
> --- ./modules/parse_sun.c.org	2020-09-08 09:13:03.843105425 +0000
> +++ ./modules/parse_sun.c	2020-09-08 09:16:49.321534049 +0000
> @@ -575,8 +575,9 @@ static int sun_mount(struct autofs_point
>   		if (np > noptions + len) {
>   			warn(ap->logopt, MODPREFIX "options string truncated");
>   			np[len] = '\0';
> -		} else
> +		} else if (np > noptions) {
>   			*(np - 1) = '\0';
> +		}
> 
>   		options = noptions;
>   	}

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

