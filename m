Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE08E1F71B
	for <lists+autofs@lfdr.de>; Wed, 15 May 2019 17:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfEOPGk (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 15 May 2019 11:06:40 -0400
Received: from mhos01.weblink.ch ([91.193.20.22]:55730 "EHLO MHOS01.weblink.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbfEOPGk (ORCPT <rfc822;autofs@vger.kernel.org>);
        Wed, 15 May 2019 11:06:40 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 May 2019 11:06:38 EDT
Received: from MH04.weblink.ch (mh04.weblink.ch [91.193.20.62]) by MHOS01.weblink.ch with SMTP
        (version=TLS\Tls12
        cipher=Aes256 bits=256);
   Wed, 15 May 2019 17:02:01 +0200
Received: from [193.174.51.189] (w610-pc05.inet.dkfz-heidelberg.de [193.174.51.189]) by MH04.weblink.ch with SMTP
        (version=Tls12
        cipher=Aes256 bits=256);
   Wed, 15 May 2019 17:01:18 +0200
Subject: Re: Issue with automounter file breaks cluster
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <06d4b596-8149-9ff8-f8e6-8215d7ccbbfc@drosera.ch>
 <3032c9b19f4f606e0704ab57d2919fcfa8043bed.camel@themaw.net>
From:   Frank Thommen <list.autofs@drosera.ch>
Message-ID: <9763d2f1-e460-50de-ad17-e20b345303f7@drosera.ch>
Date:   Wed, 15 May 2019 17:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3032c9b19f4f606e0704ab57d2919fcfa8043bed.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Exim-Id: 9763d2f1-e460-50de-ad17-e20b345303f7
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian, list,

On 2/2/19 2:16 AM, Ian Kent wrote:
> On Thu, 2019-01-31 at 22:26 +0100, Frank Thommen wrote:
>>
>> We are running autofs 5.0.7, release 70.el7_4.1 on CentOS 7.4.1708.
>> Updating the CentOS release ist not possible due to hardware and
>> software constraints.
>>
> 
> Before I go burning lots of time on trying to reproduce this
> you should check if this happens with the latest CentOS autofs
> package, revision 90 (the CentOS repo doesn't look like it
> retains older revisions).
> 
> There were a couple of regressions fixed in 7.5 amount other
> things.
> 
> I don't think there were updates to dependent packages that
> would cause problems in the subsequent RHEL releases (in fact
> there shouldn't be).
> 
> Another question.
> 
> When you see the problem has occurred did you check that
> automount is actually still running (IOW, did you check if
> it had crashed).
> 
> Ian
> 

Oops, already > three months and I haven't replied yet.  I'm very sorry 
for that, because I really appreciate your reactiveness and helpfulness. 
  Unfortunately other IT problems have outpaced this one.

Summary: In the end we "flattened" the automounter file structure, so 
that instead of using

   auto.master: /base /etc/auto.base browse
   auto.base:   sub1 /sub11 -fstype=autofs,vers=3 file:/etc/auto.sub11
   auto.sub11:  sub11-1 server:/export1
                sub11-2 server:/export2

we now use

   auto.master: /base/sub1 /etc/auto.sub1 browse
   auto.sub1:   sub11 -fstype=nfs,vers=3 \
                   sub11-1 server:/export1 \
                   sub11-2 server:/export2

this solution is as manageable as the first one and the problems 
described in my original post have gone since then. It "works for us", 
even though we don't understand what didn't work.  Since the issue - as 
we have learned in the meantime - overlapped with networking problems of 
the central storage, the problem /could/ have been an unfortunate 
concidence, triggering the described problem.

For the sake of completeness and documentation I'll answer your last and 
still unanswered questions:

>>> Is it always the same directory that becomes unresponsive?
>>
>> It's all the directories managed by this table.
> 
> My original reading of the problem description made me think
> that only certain automount points became unresponsive.
> 
> If "all" the automounts become unresponsive that's a very different
> problem.
> 

only /certain/ directories got lost, but not always the same ones and 
not on all hosts the same ones.


>>> Does the problem also occur if you use a HUP signal to re-read the
>>> maps?
>>
>> Haven't tried this yet. We usually just restart autofs.
> 
> I think this is another misunderstanding of the problem I have.
> 
> The description sounded like it was the restart with a modified
> map that resulted in the problem but based on this and your later
> reply it sounds like the restart fixes the problem.
> 
> That implies that modifying the map results in this automount
> becoming unresponsive at some later time after the map change.
> 
> Have I got it right now?

Not quite :-)  An automounter restart with he /un/modified map always 
solved the issue...for some time until some of the directories became 
unavailable again...


> Is there anything in the debug log about a map re-read (and
> following log entries from that) between the time the map is
> deployed and when the problem occurrs?
> 
> Are you sure you're getting all the debug logging?
> If your assuming that setting "loggin = debug" in the autofs
> configuration and using syslog with a default configuration
> you might not be. How have setup to collect the debug log?

I haven't looked in the details of complete autofs debugging.  Basically 
the daemon is running with "-d --foreground --dont-check-daemon" (set in 
/etc/sysconfig/autofs as 'OPTIONS="-d"')


Again thank you very much for your efforts
frank


