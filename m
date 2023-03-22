Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9FB6C43D7
	for <lists+autofs@lfdr.de>; Wed, 22 Mar 2023 08:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjCVHIg (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 22 Mar 2023 03:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjCVHIf (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 22 Mar 2023 03:08:35 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEAD5550C
        for <autofs@vger.kernel.org>; Wed, 22 Mar 2023 00:08:34 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 81B775C023E;
        Wed, 22 Mar 2023 03:08:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 22 Mar 2023 03:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1679468913; x=1679555313; bh=FgKoBXll1QLU9WQTtM5736aQIFDLlHKbGJq
        l5ZQVa9w=; b=tETfOc8qF/BgoTrWayjciKJmXegi3b/At5LTeceByygPFXigsVt
        /eWuTkV20w8BqX5eEG6gy5HMJkZYlIhX4PQNoHwGlSatYLL0Qh+6TVFahX4cVyUO
        FxTdeq2r1ukaibplSHevHNVFyN9kO+ly2UIAkhGLDOKtyl1ODpu6SdkVvEGzi30v
        +xachX3bUML5d5f8IMw9iCHWNlVqa4C4O1nnmETzNk1EfAVcvh/65j3laVP0LCzp
        QvvRTRzgJovgckPBJ69+kSssA1/qcOPGXqcXHDwcz3QwXFV2kacGYkD3gEnXCbbp
        UcoIgVgcfoYsWWADDOFf2LgWEXiJ79gr94w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679468913; x=1679555313; bh=FgKoBXll1QLU9WQTtM5736aQIFDLlHKbGJq
        l5ZQVa9w=; b=o0lZb+4raPxmCu2oWsiCDCn6gh+wyx6AdHkHF5pxto+J1Qd6/W6
        erboW5WBzT3v9mPAoozc1wLFa4JhTqQHPtcTz00QULEYNGJYA5G4d1aQJEbCCPQo
        YT7tDpOxIGk1GOZsar1+GG5KW1yZWAhclus3LBH1o35j0eY/gqKVHvHz75gURyYT
        joFJYQZH0GOkqViiVN6p6SdCiem3kL+bSd3kbTEzLbpo2K3Wr5DKuaTQWGligZod
        2fUZCjGMFnSBqp7S4w05FB+6iGaYknD/lBYMb3d+riJUHnmdUpEZ76v87/8wMBO6
        QO0CErMS0f8B+LF9bjFsMXGT8l8CQmU4R+g==
X-ME-Sender: <xms:cakaZLYDmoidVRSNvEPk5riRItX9GvoodunkN5C9SjkmPCRcTjJIqA>
    <xme:cakaZKY0pxAfbgtBiO0Bl2awFgh5XoNE9qbqeG7R6B7Je-eD2CoLVhcC32tb6noJe
    alewthjmbXz>
X-ME-Received: <xmr:cakaZN_m5sRrJ69CAQzBddis9j1UZOvVUvy-C3UvrTZ9JP9xPUHrjwDS5HmsJ6eMSDL_F3638U1gWuk_ahD2JLSzPHi53uyyL1mRDXpJQPJmKyc4AAeL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeguddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgse
    htkeertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgr
    fidrnhgvtheqnecuggftrfgrthhtvghrnhepgedvteevvdefiedvueeujeegtedvheelhf
    ehtefhkefgjeeuffeguefgkeduhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:cakaZBoTNMZ2-TfiBmxrjEBwaMpLVd_OK885F_Pll-qraayh2xyOzw>
    <xmx:cakaZGpCkZFbgYQIuze9ABBc-5NF-OMusESOVbcG0xR9C62dUDJWUA>
    <xmx:cakaZHQfIyMLI3EiwHE50nmfq8DMe2T8Ku-NoU9zKvxMnEvI_Ib7hg>
    <xmx:cakaZEEWAyU4FvVSO6DsWqR3R62jaDoTAxr7eVo-_CmfnCDDaAqf9w>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 03:08:31 -0400 (EDT)
Message-ID: <782b2b89-cfce-8f79-fd9d-9de2860e8322@themaw.net>
Date:   Wed, 22 Mar 2023 15:08:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] autofs-5.1.8 - add "unshared" option to disable mount
 propagation.
Content-Language: en-US
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167928279599.8008.18190549797975624979@noble.neil.brown.name>
 <fc354f86-a31d-5fae-e0da-0cf2749bbe01@themaw.net>
 <167945353012.8008.5840128784550260895@noble.neil.brown.name>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167945353012.8008.5840128784550260895@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 22/3/23 10:52, NeilBrown wrote:
> On Wed, 22 Mar 2023, Ian Kent wrote:
>> On 20/3/23 11:26, NeilBrown wrote:
>>> [[This is a different approach to meeting my customer's need.
>>>     Thoughts? - thanks.]]
>> I'm a bit lost here now.
>>
>>
>>> Sometimes it is useful for an autofs mount to be "private" for mount
>>> propagation.  For example, this allows submounts to be moved off with
>>> "mount --move" - such movement is not permitted for shared mounts.
>> I always use "submount" to refer to map entries that have fstype=autofs,
> Now I'm lost.
> Do you mean a map containing something like
>    key -fstype autofs ....
Hehe, no ...
>
> ?? I cannot imaging how that would work.
> Or maybe you mean multimounts?

Again, no ...


Check out these examples from the connectathon test I use, obviously

those, AUTOMAP_DIR, SERVER1, AUTO_SERVER_DIR, get replaced as part

of the test run:


#
# basic tests
#
g1      -fstype=autofs                  :AUTOMAP_DIR/auto_icthon
g1a     -fstype=autofs  /               :AUTOMAP_DIR/auto_icthon
g1b     /       -fstype=autofs          :AUTOMAP_DIR/auto_icthon

##
## subdir support
##
g2       \
         /s1     -fstype=autofs          :AUTOMAP_DIR/auto_icthon \
         /s2     -fstype=autofs          :AUTOMAP_DIR/auto_icthon
g2a      \
         / SERVER1:AUTO_SERVER_DIR/export5/testing/test \
         /s1     -fstype=autofs          :AUTOMAP_DIR/auto_icthon \
         /s2     -fstype=autofs          :AUTOMAP_DIR/auto_icthon
g3b SERVER1:AUTO_SERVER_DIR/export5/testing/test \
         /s1     -fstype=autofs          :AUTOMAP_DIR/auto_icthon \
         /s2     -fstype=autofs          :AUTOMAP_DIR/auto_icthon
g3c      \
         / SERVER1:AUTO_SERVER_DIR/export5/testing/test \
         /s1 SERVER1:AUTO_SERVER_DIR/export5/testing/test/s1 \
         /s2 SERVER1:AUTO_SERVER_DIR/export5/testing/test/s2 \
         /s1/ss1 -fstype=autofs          :AUTOMAP_DIR/auto_icthon \
         /s2/ss2 -fstype=autofs          :AUTOMAP_DIR/auto_icthon

##
## subdir-option support
##
g4      -fstype=autofs  \
         /s1                             :AUTOMAP_DIR/auto_icthon \
         /s2                             :AUTOMAP_DIR/auto_icthon
g4a     -fstype=autofs \
         /                               :AUTOMAP_DIR/auto_icthon
g4b     -fstype=autofs / -fstype=nfs 
SERVER1:AUTO_SERVER_DIR/export5/testing/test \
         /s1                             :AUTOMAP_DIR/auto_icthon \
         /s2                             :AUTOMAP_DIR/auto_icthon

The thing to notice is that a map can be specified for an autofs sub-mount

within the multi-mount tree.


The important thing is that an autofs sub-mount is an independent (autofs)

mount.


>
>> they are distinct mounts, is that the case here?

Sounds like that isn't the case here ... these sound like plain

indirect mounts.


> No. By "submount" I mean whatever gets automatically mounted onto an
> autofs directory.  That mount is subordinate to the autofs directory and
> below the autofs mount....  Isn't naming fun ?

Indeed it is .. I just call these mounts or triggered mounts if I need

to.


>
>>
>>> Changing the autofs mount point to "private" with "mount --make-private"
>>> after the automount daemon has started can be problematic.  If the
>>> mount point is already shared there will be another copy that will never
>>> get acted on by automount and so tools accessing it can hang.
>> Right, I get that.
>>
> It has occurred to me that this could get addressed in the kernel
> instead.
> I haven't worked through all the details, but if autofs_d_automount is
> called is called with a vfsmnt that is in a different share group to the
> one used when the mount was created, then I think it should return an
> error, or at least return NULL.

Mmm share groups are confusing to me, I'm pretty sure I don't understand

them. But, from what I have seen of them, the assertion your making sounds

right.


>
>>> So to safely achieve non-shared auto-mountpoints we need to create a
>>> transparent bind mount at the mount point, mark it as private, then
>>> mount the autofs mount there.
>> Yes, it's the parent mount that things need to be done to, was always
>>
>> a bit of a pain to understand IMHO, and easy to get confused by.
>>
>>
>> So what do we end up with here, a stack of mounts with one extra
>>
>> mount?
> Correct.  Is doubling the number of mount points a big cost I wonder...

Well, maybe, the effort David Howells, et. al. (including myself), made

was in part meant to resolve the problems we had with handling very

large mount tables.

You might remember them, they were ultimately rejected by Linus.


An example of the sort of problem we would see is a few systemd

processes consuming around 80% or more CPU because systemd will

respond to mount table chnages when there was mount activity.


There were quite a few customer bugs because of it, either the

piecemeal changes done over time helped or our customer gave up.


So the question of "is having a large number of mounts a problem"

is very much a maybe.


At least it's worth keeping it in mind (and we know users will do

dumb things and expect us to support them/make them work) but also

remembering that it's user buy-in controlled by an option.


>> It sounds like the goal is to set the autofs mount propagation
>>
>> private, is that right?
> Yes.

And we need to deal with the annoyance of needing to have a parent

mount to propagate from (while at the same time not interfering

with other mounts below it). That was always the thing that caused

me pain and it seemed like an odd and inconvenient design to me.


>
>>
>> I'm not sure but this might cause some trouble for the kernel.
>>
>> I've been working on fixing the expire check for mount trees to
>>
>> work for multiple mount namespaces in the kernel and mount stacking
>>
>> topology looks a bit odd.
>>
>>
>> Do these mount points continue to expire as they should?
>>
>> I wonder what this will do to my expire changes ...
>>
>>
>> I'm sorry, I feel like I'm being difficult now and I don't want
>>
>> to be but what's being done here is puzzling me and sounds just
>>
>> a bit unusual.
> You seem helpful to me, rather than difficult.  I realise that what I'm
> trying a bit odd and it would need a good justification and a clear lack
> of alternatives.  I'm not sure yet so there is no reason you should be.

Haha, you have certainly picked a difficult problem.

Mount namespaces and propagation are, IMO, difficult to grok, to

say the least.


I'm glad I'm not coming across as difficult, ;)


>
> I'm actually hoping that I can convince the customer to solve the
> problem internally (maybe by specifying one or two private bind mounts
> in /etc/fstab if there are any suitable common roots for all their
> thousands of mounts) and at the same time exploring options for changing
> automount.  Leave it with me for now - I'll get back to you after I've
> done more exploration and heard back from the customer.

You could add a directory to the master map mount point path and

set it propagation private then mount the autofs mount in there.


No-one will want to make that sort of change though, likely will

have numerous references to the existing path ... etc.


>
> BTW, is there a reason that you don't publish all your current work,
> possibly some in a "testing" branch or similar?  It might help me to see
> where you are headed.

There's no reason not to, mostly there's no reason to do so either.

But I could publish a snapshot of what I have if that will help you.

You would need to remember that often it would be out of date almost

immediately, ;)


We would need two git repos, one the the user space changes, and one

for the kernel expire changes.


The later would be interesting as it starts with a patch from Al that

stops child mounts taking a reference to their parent. That makes the

autofs busyness check very straight forward.


Ian

