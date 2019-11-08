Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BFAF4136
	for <lists+autofs@lfdr.de>; Fri,  8 Nov 2019 08:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfKHHTh (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 8 Nov 2019 02:19:37 -0500
Received: from e2i250.smtp2go.com ([103.2.140.250]:40307 "EHLO
        e2i250.smtp2go.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfKHHTh (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 8 Nov 2019 02:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpcorp.com; s=a1-4; h=Feedback-ID:X-Smtpcorp-Track:Date:Message-ID:To:
        From:Subject:Reply-To:Sender:List-Unsubscribe;
        bh=NvDvpGhvvx89Dg4oBiJw/hvHU7bY1qjqWWLTzO3tbiY=; b=KSyUTSNNo7gJ18f9JeVobZiv46
        Ax89CVF7nuEAazqi8NU40vrnEz0pGpzsSHIK400U9VyBAD908PNB7OAeQXGk/c4h/hN4W4IB/aMx3
        +OMq8EC7BRhmMuHFU2aBmcPF0Jk1qtZIPYUcE1C89Nw0x1piq44/fiL/GFRR419Vq1poStSIJ3lla
        Mcap9tVrYwYjOHzpvuFPMAR3yoQGP6vjWg/gSdiylg3gHljDg5+XPrwmaQv8Lxyid4r2OCX9NQtg+
        MOkc9J35COLK2IKMLJ5vB+eh36gWwBV2fysOxppT9nMPdhKtcdIuhFNaQVHtOu78vgDqrInOn2NB8
        7OjR3Hfg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linagora.com; 
 i=@linagora.com; q=dns/txt; s=s266739; t=1573197576; 
 h=from : subject : to : message-id : date; 
 bh=NvDvpGhvvx89Dg4oBiJw/hvHU7bY1qjqWWLTzO3tbiY=; 
 b=B5F6DWNzw5Lc157p/MVUcJqB8cDvs1R/ViWme/sgmmSOrWaoG+p05YKC
 /vFwClKcAnnLwNIoi4Lw8UTRwIDfzi52/gKh40KgO353OpV+r2x10uaYCk
 9vuqJxwAzYhy1T+4PChZ8RqeoaRMGNakoT+g1TfWSOeOafTWx8xNWHnfWL
 rG656H2eXrXicSD+ERIJf0YfstVWQlAOS9PrxiQNgmEZ4KjB0L+WBMzRH/
 7VEesuHO7zFYEj4DI/QeBBm07wUdxbEMyQBzSoYRSVQQkzfWA4DJn/VUxY
 ZSDfVaNFaMTTIyEtjP+zoePMGKIIEMbZ4aRdcRIHGtRSaLj/3JH2gw==
Received: from [10.66.228.43] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
 id 1iSyYN-Y8PJJC-St; Fri, 08 Nov 2019 07:19:31 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
 by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
 id 1iSyYM-wSEOwv-RP; Fri, 08 Nov 2019 07:19:30 +0000
Received: from [10.75.71.198] (reverse.completel.net [92.103.166.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.linagora.com (Postfix) with ESMTPSA id 0BEA24192A;
 Fri,  8 Nov 2019 08:19:30 +0100 (CET)
Subject: Re: [RHEL 5.11][5.0.1] autofs hangs up
X-LINAGORA-Copy-Delivery-Done: 1
From:   Simon Elbaz <selbaz@linagora.com>
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
 <4ae85bbb2b8ac8f50e16aee16c94861dbb33da36.camel@themaw.net>
 <8c111edb-978d-b97a-6849-e3a2cd982de9@linagora.com>
Message-ID: <220ac8b0-b2a6-14b0-3914-ede21608f844@linagora.com>
Date:   Fri, 8 Nov 2019 08:19:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8c111edb-978d-b97a-6849-e3a2cd982de9@linagora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: 1iSyYuwSEOwvRe.xacjPdy-U
Feedback-ID: 266739m:266739aja3LFS:266739sOzsOaxwwe
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I meant on clients  uysubsp05/06. Sorry.

On 08/11/2019 08:06, Simon ELBAZ wrote:
> Hi Ian,
> 
> Thanks for your answer.
> 
> I read about bz1049017. However, it seems that autofs hangs at maps 
> reload in the previsou issue whereas in the customer issue, the maps are 
> not reloaded.
> 
> /HOME/svsi_emr is the autofs home directory i am focusing on to debug 
> the issue.
> 
> Please find the logs attached. The issue happens before 11h18 
> Europe/Paris time on servers uysubsp05/06.
> 
> Regards
> Simon
> 
> On 08/11/2019 07:50, Ian Kent wrote:
>> On Thu, 2019-11-07 at 15:57 +0100, Simon ELBAZ wrote:
>>> Hi,
>>>
>>> I am working on an autofs issue.
>>>
>>> Linux kernel: 2.6.18-398.el5
>>> autofs: autofs-5.0.1-0.rc2.184.el5
>>
>> This is really, really old, but not quite as old as I thought.
>>
>> * Fri Jul 11 2014 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.184.el5
>> - bz1049017 - Regression: autofs mounts hang if maps are reloaded 
>> while the
>>    mount is expiring
>>    - check for existing offset mount before mounting.
>> - Resolves: rhbz#1049017
>>
>> The latest revision is 186 but that doesn't look like it would help.
>>
>> * Mon Feb 27 2017 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.186.el5
>> - bz1130829 - Memory leak in get_exports
>>    - fix package revision in spec file.
>> - Related: rhbz#1130829
>>
>> * Wed Feb 08 2017 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.185.el5
>> - bz1130829 - Memory leak in get_exports
>>    - fix memory leak in get_exports().
>> - Resolves: rhbz#1130829
>>
>>>
>>> There are 2 RHEL 5.11 servers accessing an NFS server.
>>> They are rebooted every morning.
>>>
>>> Sometimes, during the day, autofs hangs up on both servers. When one
>>> of
>>> the server is rebooted, the other autofs can resume its NFS access.
>>
>> I'm not sure what this means, how about we call machines on which
>> autofs is running clients and NFS servers they are trying to mount
>> from servers.
>>
>>>
>>> I am focusing on the /HOME/svsi_emr offset to debug the issue.
>>
>> Again, don't know what that means, no information on it.
>>
>>>
>>> I suggested the customer to update the kernel to 2.6.18-419.el5
>>> version
>>> but without being sure it will solve the issue.
>>>
>>> The autofs is in debug mode. Logs are available.
>>
>> I can look at the logs but even though the last updates are fairly
>> recent this is really old and upstream is usually focused on recent
>> revisions.
>>
>> Even if you log a bug at bugzilla.redhat.com and we work out what
>> the problem is getting that into a release will be like pulling
>> teeth at this point of the RHEL-5 life cycle.
>>
>> Ian
>>
>>
> 

-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 7 81 06 08 43
80 rue Roque de Fillol
92800 Puteaux
FRANCE
