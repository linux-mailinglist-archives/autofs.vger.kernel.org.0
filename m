Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2708335D07C
	for <lists+autofs@lfdr.de>; Mon, 12 Apr 2021 20:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237221AbhDLSkh (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Apr 2021 14:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbhDLSkh (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Apr 2021 14:40:37 -0400
Received: from wp110.webpack.hosteurope.de (wp110.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8475::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8432C061574
        for <autofs@vger.kernel.org>; Mon, 12 Apr 2021 11:40:18 -0700 (PDT)
Received: from hsi-kbw-109-192-201-039.hsi6.kabel-badenwuerttemberg.de ([109.192.201.39] helo=w610-mb05.fritz.box); authenticated
        by wp110.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lW1Tr-0007NU-Ri; Mon, 12 Apr 2021 20:40:15 +0200
From:   Frank Thommen <autofs@lists.drosera.ch>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
 <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
 <54a4b76d-3a46-00c5-8888-6aec74715a78@lists.drosera.ch>
 <3c305bd12fce8b1431f9d5cb2c5ff6aa892dad21.camel@themaw.net>
Message-ID: <46056a24-9d69-8ad2-1067-c1cc21a8413f@drosera.ch>
Date:   Mon, 12 Apr 2021 20:40:08 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3c305bd12fce8b1431f9d5cb2c5ff6aa892dad21.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;autofs@lists.drosera.ch;1618252818;ae6bd86b;
X-HE-SMSGID: 1lW1Tr-0007NU-Ri
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org



On 11.04.21 04:58, Ian Kent wrote:
> On Sat, 2021-04-10 at 23:50 +0200, Frank Thommen wrote:
>> On 09.04.21 02:50, Ian Kent wrote:
>>> On Thu, 2021-04-08 at 19:50 +0200, Frank Thommen wrote:
>>>> Dear all,
>>>>
>>>> I have problems "submounting" a share when using direct mounts.
>>>> Given
>>>> the following automounter tables:
>>>>
>>>> /etc/auto.master:
>>>> -----------------------------------
>>>> /-  /etc/auto.groups
>>>>
>>>>
>>>> /etc/auto.groups
>>>> -----------------------------------
>>>> /groups/group1/int        server:/export/group1
>>>> /groups/group1/int/svc/a  server2:/export/service_a
>>>> /groups/group2/int        server2:/export/group2
>>>> /groups/group3/int        server:/export/group3
>>>> [... ca. 100 entries here ...]
>>>>
>>>>
>>>> /groups/group1/int/svc/a is not mounted and I get the error
>>>> message
>>>> "do_mount_autofs_direct: failed to create mount directory
>>>> /groups/group1/int/svc/a" on any host which doesn not have root
>>>> permissions (no_root_squash) on server:/export/group1 (which is
>>>> on
>>>> 99%
>>>> of all clients).
>>>
>>> autofs won't (shouldn't) create directories in remote file systems
>>> to perform mounts, it requires they are already present.
>>>
>>>> The directory "svc/a" has been created on server:/export/group1,
>>>> so
>>>> there is no need to recreate it.
>>
>> I am sure autofs /did/ recreate it.  But I will doublecheck that.
> 
> I think you'll find the directory must already exist on the server
> in this case since it's inside a containing NFS mount.
> 
> If it doesn't exist mounting the offset trigger will fail and the
> non-strict default can lead to other problems if that mount is
> expected to be there (non-strict is mean to prevent fails from
> administrative access restrictions on mounts to hosts rather
> than this case).

Hm.  I checked.  Yes, it seems, that the directory has to be created on 
the server, *but* on a server which has root permissions on the "base" 
share (/groups/group1/int, i.e. server:/export/group1), I see the 
following entries in the autofs debug log (note the call to "mkdir_path"):

automount[18052]: mount_mount: mount(nfs): calling mkdir_path 
/groups/group1/int/svc/a
automount[18052]: mount(nfs): calling mount -t nfs4 -s -o 
vers=4.0,rw,sec=sys server2:/export/service_a /groups/group1/int/svc/a
automount[18052]: mount_mount: mount(nfs): mounted 
server2:/export/service_a/icgc/dmg/otp on /groups/group1/int/svc/a
automount[18052]: mounted /groups/group1/int/svc/a

and there is a mount in place at that path


On a server which does *not* habe root permissions on the base share, I 
get a

automount[21701]: do_mount_autofs_direct: failed to create mount 
directory /groups/group1/int/svc/a

and there is /no/ mount in place at that path.

I don't understand that...


>>> Which you have done.
>>> Presumably the permissions are ok?
>>
>> Are special permissions required?
> 
> Well, no, but I have seen strange behaviours with restricted
> permissions settings, it shouldn't be a problem I guess.
> 
>>
>>> I haven't looked at this case for a very long time but I'm pretty
>>> sure nesting isn't allowed in direct mount maps (with any map type
>>> really). I'm also pretty sure I don't test for nesting in direct
>>> mount maps (quite difficult to do) and fail the trigger mount.
>>>
>>> If you need to nest mounts your supposed to use offsets in the
>>> mount entry (with both direct or indirect maps).
>>>
>>> For example:
>>> /groups/group1/int  /       server:/export/group1
>>>                       /svc/a  server2:/export/service_a
>>>
>>> where the "/" for the root offset is optional but may help with
>>> map readability.
>>
>> I wasn't aware that multi-maps were also possible with direct maps.
> 
> Ha, multi-mount please, multi-maps are a different feature and we
> don't want to get confused.
> 
>> However we had major issues with updating such configurations, as an
>> update of the "nested" part requires an autofs re/start/, while
>> otherwise a re/load/ suffices.  We must avoid autofs restarts in our
> 
> Actually I think that's not quite what is happening.
> 
> I'm going by memory here so I might not be completely accurate.
> 
> The re-load will update the map entry that has the offsets but
> the mounts won't change until the multi-mount is mounted again
> from it's base.
> 
> IIRC the internal hosts map will try and re-configure the offsets
> of the mounted multi-mount on re-load but I haven't expanded that
> multi-mount feature to other areas.
> 
> Expanding that that is one possible way I could help but equally
> the umount vs. mount order fix on re-load needs to be done too.
> 
>> environment at all costs, as they can lead to short interruptions in
>> the
>> accessibility of shares, which is a problem in a cluster environment
>> where theses accesses happen all the time. See also our long thread
>> "Changes in indirect multi-maps don't become effective w/o autofs
>> restart" in 2019 ;-)
> 
> Ok, I don't remember that so I'm not sure what I said or did or
> didn't do. But the situation I described above is essentially
> what we have and so far I had only implemented it for the
> internal hosts map.
> 
> The fact is that without a policy that minimises disruption on
> mounts that are busy sufficient for a broad range of environments
> the only choice is to ignore that bit of the update (and anything
> below it) until it expires.
> 
> The bottom line is that if the update is forced some processes
> will end in tears sooner or later and there's no way around it.
> 
> Fixing the mount/umount ordering on reload seems like the simplest
> improvement but, again, in use mounts will be a problem.
> 
>>From what I've seen forcing the update by lazy umounting the busy
> mount(s) is probably the least disruptive way to do it but that
> will mean the change will be more extensive since I try and avoid
> doing that by ignoring these (which I think is the cause of a fair
> amount of the problems your seeing).
> 
>>
>> If I may digress with a short syntactical question: Is the \ at the
>> end
>> of the line in multi-maps not required?  This would explain strange
>> effects that we had when we indented some of the keys in some direct
>> maps (to enhance readability)
> 
> My mistake, the line continuation is definitely needed there.
> 
>>
>>
>>> I've not seen problem reports like this from direct mount map users
>>> so I'm pretty sure nesting isn't normally used so I'm not sure it
>>> will work properly.
>>>
>>> However the testing I use does include pass/fail tests for direct
>>> mount map entries with offsets so it should work.
>>>
>>> There could unfixed problems with the version of autofs you are
>>> using
>>> which we would need to look at separately.
>>>
>>>> There are additional subdirectories in /groups/group1/int/svc/
>>>> which
>>>> directly reside on server:/export/group1.  Only "a" need to be
>>>> mounted
>>>> from a second location.
>>>
>>> I think this should work fine using an offset as described above.
>>>
>>> Those other directories are present in the mount that contains the
>>> offset trigger so it should appear the same as you were hoping the
>>> original map entry would except that by using an offset the expire
>>> should now work.
>>>
>>>>
>>>> Can this be solved with direct mounts?  How?  We would prefer to
>>>> use
>>>> direct mounts, as this has shown to create the least problems
>>>> when
>>>> dynamically changing the mount tables (no automounter restart is
>>>> required).  However I would not have a problem to use some
>>>> indirect
>>>> mount mechanism for /groups/group1/int/svc/a as long as the main
>>>> /groups/groupN/int can stay in a direct mount table.
>>>
>>> But you do need to do a reload for the direct mount triggers to
>>> be updated, right?
>>
>> yes a reload is required, but a reload doesn't disrupt access to NFS
>> shares while a restart can/does (which is a major issue in our
>> cluster
>> environment, see above)
> 
> Yep, I get that and that pause in access is a problem I'm aware of,
> and it's a problem that I can't resolve, and it's particularly bad
> for busy sites, such as yours.
> 
> Anyway, you've got me at a good time to get some attention on this,
> just don't don't let me forget about it if I get loaded with other
> things ...

So if understand correctly, you see a possible way to alleviate (but not 
completely solve) the situation with mount disruptions.  What can/should 
I do to not let you forget about it? ;-)


Frank

> 
> Ian
> 
> 
