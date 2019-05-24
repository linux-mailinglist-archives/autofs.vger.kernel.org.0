Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CACEE29196
	for <lists+autofs@lfdr.de>; Fri, 24 May 2019 09:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388934AbfEXHN4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 May 2019 03:13:56 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:53481 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388979AbfEXHN4 (ORCPT <rfc822;autofs@vger.kernel.org>);
        Fri, 24 May 2019 03:13:56 -0400
Received: from [192.168.0.3] (ip5f5bd3f5.dynamic.kabel-deutschland.de [95.91.211.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id BB5EB2000C035;
        Fri, 24 May 2019 09:13:52 +0200 (CEST)
Subject: Re: Old patch Ubuntu has been carrying since 2010
To:     Ian Kent <raven@themaw.net>,
        Andreas Hasenack <andreas@canonical.com>
References: <CANYNYEHDhrOuncbB2Rh+TRN=TUT28PGcPrKhVLZdeQk6KPMjVg@mail.gmail.com>
 <7740bd6d332a7488f813e4579be311272e819e2f.camel@themaw.net>
Cc:     autofs@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <ea0cb765-5883-594c-754e-a434369a85e2@molgen.mpg.de>
Date:   Fri, 24 May 2019 09:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7740bd6d332a7488f813e4579be311272e819e2f.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian,


On 24.05.19 01:16, Ian Kent wrote:
> On Thu, 2019-05-23 at 17:22 -0300, Andreas Hasenack wrote:
>> Hi,
>>
>> I'm updating the autofs version in Ubuntu from 5.1.2 to 5.1.5, and as
>> part of that process was looking over the patches we are carrying. I
>> found this one:
>> Author: Joel Ebel <jbebel@google.com>
>> Bug-Ubuntu: https://launchpad.net/bugs/591100
>> Description: Increase group buffer size geometrically rather than
>> linearly when its found to be small.
>> .
>> This prevents package to eat the cpu if you have large groups.
>>
>> --- a/lib/mounts.c
>> +++ b/lib/mounts.c
>> @@ -1245,7 +1245,7 @@
>>          status = getgrgid_r(gid, pgr, gr_tmp, tmplen, ppgr);
>>          if (status != ERANGE)
>>              break;
>> -       tmplen += grplen;
>> +       tmplen *= 2;
>>      }
>>
>>      if (status || !pgr) {
>>
>> That came from https://bugs.launchpad.net/ubuntu/+source/autofs5/+bug/591100,
>> and the intention is to speed up the scenario where a user belongs to
>> thousands of groups. grplen is 1024, and looping over getgrgid_r()
>> hundreds of times took a while of high CPU usage.
>>
>> The patch doesn't apply cleanly anymore, but the tmplen+=grplen code
>> is still there. Would upstream be interested in adopting this change,
>> or something like it?
> 
> Sure, I've added the patch below to my patch queue, it will get
> committed at some point.
> 
> You might also be interested in checking if anything at
> https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.6/
> might be needed.
> 
> I have more patches, I'll post them for review on the autofs list
> before committing them, some of those might be of interest to you
> too.
> 
> If you run into problems ask here and I'll try and help out.
> 
> autofs-5.1.5 - Increase group buffer size geometrically

Andreas, thank you for pushing this upstream, and Ian, thank you for 
picking it up so quickly.

> From: Joel Ebel <jbebel@google.com>
> 
> Increase group buffer size geometrically rather than linearly
> when its found to be small.
> 
> This prevents package to eat the cpu if you have large groups.

Could you please reference the bug report in the commit message, and 
even use Andreas’ summary as the message?

[…]


Kind regards,

Paul
