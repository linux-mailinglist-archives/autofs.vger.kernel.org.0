Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91FF835B0A1
	for <lists+autofs@lfdr.de>; Sat, 10 Apr 2021 23:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhDJVuW (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 10 Apr 2021 17:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbhDJVuW (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 10 Apr 2021 17:50:22 -0400
Received: from wp110.webpack.hosteurope.de (wp110.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8475::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9D2C06138A
        for <autofs@vger.kernel.org>; Sat, 10 Apr 2021 14:50:06 -0700 (PDT)
Received: from hsi-kbw-109-192-201-039.hsi6.kabel-badenwuerttemberg.de ([109.192.201.39] helo=drosera.fritz.box); authenticated
        by wp110.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lVLUR-0001TJ-13; Sat, 10 Apr 2021 23:50:03 +0200
From:   Frank Thommen <autofs@lists.drosera.ch>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
To:     autofs@vger.kernel.org
Cc:     Ian Kent <raven@themaw.net>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
 <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
Message-ID: <54a4b76d-3a46-00c5-8888-6aec74715a78@lists.drosera.ch>
Date:   Sat, 10 Apr 2021 23:50:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;autofs@lists.drosera.ch;1618091406;daceb355;
X-HE-SMSGID: 1lVLUR-0001TJ-13
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 09.04.21 02:50, Ian Kent wrote:
> On Thu, 2021-04-08 at 19:50 +0200, Frank Thommen wrote:
>> Dear all,
>>
>> I have problems "submounting" a share when using direct mounts.
>> Given
>> the following automounter tables:
>>
>> /etc/auto.master:
>> -----------------------------------
>> /-  /etc/auto.groups
>>
>>
>> /etc/auto.groups
>> -----------------------------------
>> /groups/group1/int        server:/export/group1
>> /groups/group1/int/svc/a  server2:/export/service_a
>> /groups/group2/int        server2:/export/group2
>> /groups/group3/int        server:/export/group3
>> [... ca. 100 entries here ...]
>>
>>
>> /groups/group1/int/svc/a is not mounted and I get the error message
>> "do_mount_autofs_direct: failed to create mount directory
>> /groups/group1/int/svc/a" on any host which doesn not have root
>> permissions (no_root_squash) on server:/export/group1 (which is on
>> 99%
>> of all clients).
> 
> autofs won't (shouldn't) create directories in remote file systems
> to perform mounts, it requires they are already present.
> 
>>
>> The directory "svc/a" has been created on server:/export/group1, so
>> there is no need to recreate it.

I am sure autofs /did/ recreate it.  But I will doublecheck that.

> 
> Which you have done.
> Presumably the permissions are ok?

Are special permissions required?

> I haven't looked at this case for a very long time but I'm pretty
> sure nesting isn't allowed in direct mount maps (with any map type
> really). I'm also pretty sure I don't test for nesting in direct
> mount maps (quite difficult to do) and fail the trigger mount.
> 
> If you need to nest mounts your supposed to use offsets in the
> mount entry (with both direct or indirect maps).
> 
> For example:
> /groups/group1/int  /       server:/export/group1
>                      /svc/a  server2:/export/service_a
> 
> where the "/" for the root offset is optional but may help with
> map readability.

I wasn't aware that multi-maps were also possible with direct maps. 
However we had major issues with updating such configurations, as an 
update of the "nested" part requires an autofs re/start/, while 
otherwise a re/load/ suffices.  We must avoid autofs restarts in our 
environment at all costs, as they can lead to short interruptions in the 
accessibility of shares, which is a problem in a cluster environment 
where theses accesses happen all the time. See also our long thread 
"Changes in indirect multi-maps don't become effective w/o autofs 
restart" in 2019 ;-)

If I may digress with a short syntactical question: Is the \ at the end 
of the line in multi-maps not required?  This would explain strange 
effects that we had when we indented some of the keys in some direct 
maps (to enhance readability)


> I've not seen problem reports like this from direct mount map users
> so I'm pretty sure nesting isn't normally used so I'm not sure it
> will work properly.
> 
> However the testing I use does include pass/fail tests for direct
> mount map entries with offsets so it should work.
> 
> There could unfixed problems with the version of autofs you are using
> which we would need to look at separately.
> 
>>
>> There are additional subdirectories in /groups/group1/int/svc/ which
>> directly reside on server:/export/group1.  Only "a" need to be
>> mounted
>> from a second location.
> 
> I think this should work fine using an offset as described above.
> 
> Those other directories are present in the mount that contains the
> offset trigger so it should appear the same as you were hoping the
> original map entry would except that by using an offset the expire
> should now work.
> 
>>
>>
>> Can this be solved with direct mounts?  How?  We would prefer to use
>> direct mounts, as this has shown to create the least problems when
>> dynamically changing the mount tables (no automounter restart is
>> required).  However I would not have a problem to use some indirect
>> mount mechanism for /groups/group1/int/svc/a as long as the main
>> /groups/groupN/int can stay in a direct mount table.
> 
> But you do need to do a reload for the direct mount triggers to
> be updated, right?

yes a reload is required, but a reload doesn't disrupt access to NFS 
shares while a restart can/does (which is a major issue in our cluster 
environment, see above)

Frank

> 
> Ian
> 
> 
