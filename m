Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234491F16F0
	for <lists+autofs@lfdr.de>; Mon,  8 Jun 2020 12:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgFHKt2 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 8 Jun 2020 06:49:28 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:55453 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729310AbgFHKt1 (ORCPT <rfc822;autofs@vger.kernel.org>);
        Mon, 8 Jun 2020 06:49:27 -0400
Received: from [192.168.0.6] (ip5f5af2bb.dynamic.kabel-deutschland.de [95.90.242.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5E4AA206442FE;
        Mon,  8 Jun 2020 12:49:25 +0200 (CEST)
Subject: Re: [PATCH] autofs: add pid/comm to debug on autofs_notify_daemon
To:     Roberto Bergantinos Corpas <rbergant@redhat.com>, raven@themaw.net
Cc:     autofs@vger.kernel.org
References: <20200608101038.20426-1-rbergant@redhat.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <1e74e950-ca17-ecff-9820-cee6107a5aa9@molgen.mpg.de>
Date:   Mon, 8 Jun 2020 12:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200608101038.20426-1-rbergant@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Roberto,


Thank you for the patch.


Am 08.06.20 um 12:10 schrieb Roberto Bergantinos Corpas:
>    This can be useful for troubleshooting purposes and this information
>    is not directly avalaible to userland

s/avalaible/available/

It looks like you copied this from `git show`, which adds four trailing 
spaces in front of the commit message. Could you please remove those, 
should you resubmit? In the future, I recommend to use `git 
format-patch` and `git send-email`.

Maybe, also add an example output of the new debug message.

> Signed-off-by: Roberto Bergantinos Corpas <rbergant@redhat.com>
> ---
>   fs/autofs/waitq.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)


Kind regards,

Paul
