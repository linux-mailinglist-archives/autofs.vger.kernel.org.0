Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7A2F4178
	for <lists+autofs@lfdr.de>; Fri,  8 Nov 2019 08:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfKHHmD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 8 Nov 2019 02:42:03 -0500
Received: from e2i250.smtp2go.com ([103.2.140.250]:56909 "EHLO
        e2i250.smtp2go.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfKHHmC (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 8 Nov 2019 02:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpcorp.com; s=a1-4; h=Feedback-ID:X-Smtpcorp-Track:Date:Message-ID:To:
        From:Subject:Reply-To:Sender:List-Unsubscribe;
        bh=jMjYCkgmUQfjsaUxLa8BsRwSw3M6p6juwSj9PYVHlTE=; b=plltDSK6sqOmubVUrqiGBpO9ui
        R2dHhpOBi2MAaIocW3RJJvFbml9JmPtW8VZ6k2KTESJ7uVBXRdTZjx9H6TyyIiZKEIew0cu3e45sc
        Yc0j++MlaW3qxACjh6MKRKGrN1B4slQ9P1z9YIvwCcysEFxiUf3UPu9z1Z9XFSTQV92HXuYamhoBY
        880AIFQBUnn8gLOBlJ5c8Bmyba5zCUnfhIppWhTv6wU/4/kNqQ2CtSOKyUOtJo8rGOlVIh4jmKxQ/
        Zdm4tQw3WVrDVhgKLpdig44dwwDbtY0Y7x2o6OADjrf+Eb+eXxGrEHhOccdUWftnpFuHFtg2DT28R
        LdvGA5BA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linagora.com; 
 i=@linagora.com; q=dns/txt; s=s266739; t=1573198920; 
 h=from : subject : to : message-id : date; 
 bh=jMjYCkgmUQfjsaUxLa8BsRwSw3M6p6juwSj9PYVHlTE=; 
 b=iS5Px3v6W7PjS0BDD2r2KKKsd+55+MoWdp8aE30BCVqTwE+Z/o/n38Bn
 7r/xuwOdQpXdkZq4fo+r86o0k0ii0sGlK3icPzqI4tmRfi+wsBvVhxEKVg
 eydYrraLRxHggr4AC21Kh8DMvW2ISoT5ChVocXxyP3bEmGNUSh6qcFOFji
 Uhh4PrHVa0MiI2P1fLeEMVEgzui4w2kLXRnfB1YDvc9KkgxC/PDBoNyvcn
 bnKaQqkfgFKPslP2E5/9JqyTi1qcg3a7M4wv81wirPRorHTPwl42FFwhR2
 q4s/8h70SGv9TOmiJPasUVdTCJXg9uFUa3EQlT06v+SBoPSp4umknw==
Received: from [10.45.79.71] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
 id 1iSyu3-Y8PKfp-OF; Fri, 08 Nov 2019 07:41:55 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
 by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
 id 1iSyu1-DuuaUS-TU; Fri, 08 Nov 2019 07:41:54 +0000
Received: from [10.75.71.198] (reverse.completel.net [92.103.166.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.linagora.com (Postfix) with ESMTPSA id 0C16641950;
 Fri,  8 Nov 2019 08:41:52 +0100 (CET)
Subject: Re: [RHEL 5.11][5.0.1] autofs hangs up
X-LINAGORA-Copy-Delivery-Done: 1
From:   Simon Elbaz <selbaz@linagora.com>
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
 <4ae85bbb2b8ac8f50e16aee16c94861dbb33da36.camel@themaw.net>
 <8c111edb-978d-b97a-6849-e3a2cd982de9@linagora.com>
 <220ac8b0-b2a6-14b0-3914-ede21608f844@linagora.com>
Message-ID: <0546269d-b006-368d-fa1e-6084245406ae@linagora.com>
Date:   Fri, 8 Nov 2019 08:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <220ac8b0-b2a6-14b0-3914-ede21608f844@linagora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: 1iSyI1DIIalSTl.xaxDexYCt
Feedback-ID: 266739m:266739aja3LFS:266739sOzsOaxwwe
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I can see this message in the client uysubsp05 log:

Nov  6 09:43:40 uysubsp05 kernel: INFO: task df:14473 blocked for more 
than 120 seconds.
Nov  6 09:43:40 uysubsp05 kernel: "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov  6 09:43:40 uysubsp05 kernel: df            D ffff810002536420     0 
14473  14454                     (NOTLB)
Nov  6 09:43:40 uysubsp05 kernel: ffff81007fe3bc18 0000000000000086 
ffffffff8009b6bc ffffffff8001e2fa
Nov  6 09:43:40 uysubsp05 kernel: ffff81005c3a8e40 000000000000000a 
ffff81004007d040 ffffffff8031db60
Nov  6 09:43:40 uysubsp05 kernel: 0001da0a7ab5bff5 0000000000001524 
ffff81004007d228 000000007bec5800
Nov  6 09:43:40 uysubsp05 kernel: Call Trace:
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8009b6bc>] 
recalc_sigpending+0xe/0x25
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8001e2fa>] sigprocmask+0xb7/0xdb
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff885580ac>] 
:nfs:nfs3_rpc_wrapper+0x60/0x6d
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff80063171>] 
wait_for_completion+0x79/0xa2
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8008f4e9>] 
default_wake_function+0x0/0xe
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff884c6c15>] 
:autofs4:autofs4_expire_wait+0x4d/0x6c
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff884c4db1>] 
:autofs4:autofs4_d_manage+0x3e/0x61
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff800ed2b9>] 
managed_dentry+0x60/0x27b
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8000d034>] do_lookup+0x8f/0x24b
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8000a2a3>] 
__link_path_walk+0x9f4/0xf39
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8000ebb3>] 
link_path_walk+0x45/0xb8
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8000ce24>] 
do_path_lookup+0x294/0x311
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff800129eb>] getname+0x15b/0x1c2
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff80023f9e>] 
__user_walk_fd+0x37/0x4c
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff800e484e>] sys_statfs+0x25/0x79
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8002e4cc>] __wake_up+0x38/0x4f
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8003abfb>] 
tty_ldisc_deref+0x6a/0x7d
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff800bb295>] 
audit_syscall_entry+0x1a8/0x1d3
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8005d23a>] tracesys+0x71/0xdf
Nov  6 09:43:40 uysubsp05 kernel: [<ffffffff8005d29e>] tracesys+0xd5/0xdf
Nov  6 09:43:40 uysubsp05 kernel:

Regards
Simon

On 08/11/2019 08:19, Simon Elbaz wrote:
> I meant on clients  uysubsp05/06. Sorry.
> 
> On 08/11/2019 08:06, Simon ELBAZ wrote:
>> Hi Ian,
>>
>> Thanks for your answer.
>>
>> I read about bz1049017. However, it seems that autofs hangs at maps 
>> reload in the previsou issue whereas in the customer issue, the maps 
>> are not reloaded.
>>
>> /HOME/svsi_emr is the autofs home directory i am focusing on to debug 
>> the issue.
>>
>> Please find the logs attached. The issue happens before 11h18 
>> Europe/Paris time on servers uysubsp05/06.
>>
>> Regards
>> Simon
>>
>> On 08/11/2019 07:50, Ian Kent wrote:
>>> On Thu, 2019-11-07 at 15:57 +0100, Simon ELBAZ wrote:
>>>> Hi,
>>>>
>>>> I am working on an autofs issue.
>>>>
>>>> Linux kernel: 2.6.18-398.el5
>>>> autofs: autofs-5.0.1-0.rc2.184.el5
>>>
>>> This is really, really old, but not quite as old as I thought.
>>>
>>> * Fri Jul 11 2014 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.184.el5
>>> - bz1049017 - Regression: autofs mounts hang if maps are reloaded 
>>> while the
>>>    mount is expiring
>>>    - check for existing offset mount before mounting.
>>> - Resolves: rhbz#1049017
>>>
>>> The latest revision is 186 but that doesn't look like it would help.
>>>
>>> * Mon Feb 27 2017 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.186.el5
>>> - bz1130829 - Memory leak in get_exports
>>>    - fix package revision in spec file.
>>> - Related: rhbz#1130829
>>>
>>> * Wed Feb 08 2017 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.185.el5
>>> - bz1130829 - Memory leak in get_exports
>>>    - fix memory leak in get_exports().
>>> - Resolves: rhbz#1130829
>>>
>>>>
>>>> There are 2 RHEL 5.11 servers accessing an NFS server.
>>>> They are rebooted every morning.
>>>>
>>>> Sometimes, during the day, autofs hangs up on both servers. When one
>>>> of
>>>> the server is rebooted, the other autofs can resume its NFS access.
>>>
>>> I'm not sure what this means, how about we call machines on which
>>> autofs is running clients and NFS servers they are trying to mount
>>> from servers.
>>>
>>>>
>>>> I am focusing on the /HOME/svsi_emr offset to debug the issue.
>>>
>>> Again, don't know what that means, no information on it.
>>>
>>>>
>>>> I suggested the customer to update the kernel to 2.6.18-419.el5
>>>> version
>>>> but without being sure it will solve the issue.
>>>>
>>>> The autofs is in debug mode. Logs are available.
>>>
>>> I can look at the logs but even though the last updates are fairly
>>> recent this is really old and upstream is usually focused on recent
>>> revisions.
>>>
>>> Even if you log a bug at bugzilla.redhat.com and we work out what
>>> the problem is getting that into a release will be like pulling
>>> teeth at this point of the RHEL-5 life cycle.
>>>
>>> Ian
>>>
>>>
>>
> 

-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 7 81 06 08 43
80 rue Roque de Fillol
92800 Puteaux
FRANCE
