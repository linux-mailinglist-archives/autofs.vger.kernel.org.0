Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3782203E6
	for <lists+autofs@lfdr.de>; Thu, 16 May 2019 12:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfEPKx6 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 16 May 2019 06:53:58 -0400
Received: from mhos01.weblink.ch ([91.193.20.22]:63438 "EHLO MHOS01.weblink.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbfEPKx6 (ORCPT <rfc822;autofs@vger.kernel.org>);
        Thu, 16 May 2019 06:53:58 -0400
Received: from MH04.weblink.ch (mh04.weblink.ch [91.193.20.62]) by MHOS01.weblink.ch with SMTP
        (version=TLS\Tls12
        cipher=Aes256 bits=256);
   Thu, 16 May 2019 12:54:23 +0200
Received: from [193.174.51.189] (w610-pc05.inet.dkfz-heidelberg.de [193.174.51.189]) by MH04.weblink.ch with SMTP
        (version=Tls12
        cipher=Aes256 bits=256);
   Thu, 16 May 2019 12:53:41 +0200
Subject: Re: Changes in indirect multi-maps don't become effective w/o autofs
 restart
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
 <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
From:   Frank Thommen <list.autofs@drosera.ch>
Message-ID: <5e0cd181-00c3-112e-20b1-1ba66f5931fa@drosera.ch>
Date:   Thu, 16 May 2019 12:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Exim-Id: 5e0cd181-00c3-112e-20b1-1ba66f5931fa
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org



On 5/16/19 3:01 AM, Ian Kent wrote:
> On Wed, 2019-05-15 at 18:00 +0200, Frank Thommen wrote:
>> Dear all,
>>
>> the autofs manpages says:
>>
>> "If  an  indirect  map  is modified then the change will become
>> effective immediately.  If an indirect map uses the browse option, the
>> master map contains direct mount maps or the auto.master map is modified
>> then the autofs service control reload action must be rerun to activate
>> the changes."
>>
>> However this doesn't seem true when using multi-maps:
>>
>> In /etc/auto.master:
>>
>>       /base/data /etc/auto.data
>>
>>
>> In /etc/auto.data:
>>
>>      # section 1
>>      #
>>      p1  -fstype=nfs,vers=3,sec=sys  srv:/export/p1
>>      p2  -fstype=nfs,vers=3,sec=sys  srv:/export/p2
>>
>>      # section 2
>>      #
>>      others   -fstype=nfs,vers=3,sec=sys \
>>         /p3   srv:/export/p2 \
>>         /p4   srv:/export/p4
>>
>> When adding an entry
>>
>>      p5  -fstype=nfs,vers=3,sec=sys  srv:/export/p5
>>
>> in section 1, I can immediately change into /base/data/p2 and it is
>> mounted.  All well.  But when I add an entry
>>
>>      /p5 srv:/export/p5
>>
>> to section 2, then this new entry is not accessible as
>> /base/data/others/p5 even after a `systemctl reload autofs`.  autofs has
>> to be completely restarted.  Unfortunately we've had many issues
>> (crashes) with clusterjobs accessing NFS shares during autofs restarts.
>> That's why we'd like to avoid complete autofs restart whenever possible.
> 
> Yes, on restart there is a window of time where automounting won't
> be happening.
> 
> That can be a problem and there's little I can do about it
> but existing mounts should continue to function fine.
> 
> If you have an environment that's busy enough to get caught by
> this then you have no choice but to avoid restarts.

I wouldn't have problems avoiding starts if the reload refreshed the 
multi-mount maps.


>>
>> Can you confirm that multi-maps are not updated by autofs reloads and/or
>> is there a way to achieve this?
> 
> I call these multi-mounts because there's a different construct
> I call multi-maps.

the autofs(5) manpage calls them "multi-map" in the "EXAMPLES" section 
and "multi-mount map" in the "FEATURES" section.  That might be a point 
for the "Future changes to documentation" thread?


> 
> Anyway, for a very long time an active (ie. currently mounted)
> multi-mount would be ignored on map update requests because of
> potential problems with mount dependencies.
> 
> A while ago I did try hard to improve this and allow multi-mount
> map entries to be updated on reload and, for the cases I tested,
> it seemed to function.
> 
> But other subsequent changes could have affected this or the
> version of autofs might not have those changes.
> 
>>
>> We are running autofs-5.0.7-70.el7_4.1.x86_64 on CentOS 7.4.1708 and we
>> cannot update to newer CentOS releases due to other restrictions
>> (special hardware/drivers).
> 
> Mmm ... CentOS 7.4, that's a while ago so I'm not sure if the
> changes are present but I suspect they are.
> 
> So it's likely the changes made for this are not working properly.
> 
> I'll check if the changes are present (it will take a while as
> I'll need to track down what those changes were first) and try
> to duplicate it to see what's going on.

Since this specific issue is interfering with productive jobs on the 
cluster I might be prepared to build autofs from the newest sources 
manually for the cluster.

> 
> Ian
> 

frank


