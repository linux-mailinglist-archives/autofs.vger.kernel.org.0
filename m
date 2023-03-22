Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92356C4089
	for <lists+autofs@lfdr.de>; Wed, 22 Mar 2023 03:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjCVCwV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 21 Mar 2023 22:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjCVCwU (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 21 Mar 2023 22:52:20 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A3E4DBDE
        for <autofs@vger.kernel.org>; Tue, 21 Mar 2023 19:52:15 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 54AEF20824;
        Wed, 22 Mar 2023 02:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1679453534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r6CtiR05YsR2OHdNM1964f6LEzfon7kXKl1M3SUXwaY=;
        b=IwS1l+XsDr+L2QslSJxz/XV3RLuUI0vQjzXLVTJIInPwCARIo5ySUFJ1TbJXWj9l4bpvBJ
        AxrP2h/OMn6+ZAuE5hGkrgcvVkfUM0wb3dJxj2Li7poW2JLVhnArfucA6cmfrXATKYSB6Q
        ++uDXROQtIDe4nFZKP/pqVdHjWYhmHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1679453534;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r6CtiR05YsR2OHdNM1964f6LEzfon7kXKl1M3SUXwaY=;
        b=E5ZCutpBcKyDabH5rcNGc4p4R3stVSrtIB4f8U6kCLFbbrxtbUmC55/vMircOXTzMRZ0w1
        QrdudpyQsZEUD4BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E47C13596;
        Wed, 22 Mar 2023 02:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id VIuoBF1tGmRPJgAAMHmgww
        (envelope-from <neilb@suse.de>); Wed, 22 Mar 2023 02:52:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Ian Kent" <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Re: [PATCH] autofs-5.1.8 - add "unshared" option to disable mount
 propagation.
In-reply-to: <fc354f86-a31d-5fae-e0da-0cf2749bbe01@themaw.net>
References: <167928279599.8008.18190549797975624979@noble.neil.brown.name>,
 <fc354f86-a31d-5fae-e0da-0cf2749bbe01@themaw.net>
Date:   Wed, 22 Mar 2023 13:52:10 +1100
Message-id: <167945353012.8008.5840128784550260895@noble.neil.brown.name>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 22 Mar 2023, Ian Kent wrote:
> On 20/3/23 11:26, NeilBrown wrote:
> > [[This is a different approach to meeting my customer's need.
> >    Thoughts? - thanks.]]
> 
> I'm a bit lost here now.
> 
> 
> > Sometimes it is useful for an autofs mount to be "private" for mount
> > propagation.  For example, this allows submounts to be moved off with
> > "mount --move" - such movement is not permitted for shared mounts.
> 
> I always use "submount" to refer to map entries that have fstype=autofs,

Now I'm lost.
Do you mean a map containing something like
  key -fstype autofs ....

?? I cannot imaging how that would work.
Or maybe you mean multimounts?

> 
> they are distinct mounts, is that the case here?

No. By "submount" I mean whatever gets automatically mounted onto an
autofs directory.  That mount is subordinate to the autofs directory and
below the autofs mount....  Isn't naming fun ?

> 
> 
> >
> > Changing the autofs mount point to "private" with "mount --make-private"
> > after the automount daemon has started can be problematic.  If the
> > mount point is already shared there will be another copy that will never
> > get acted on by automount and so tools accessing it can hang.
> 
> Right, I get that.
> 

It has occurred to me that this could get addressed in the kernel
instead.
I haven't worked through all the details, but if autofs_d_automount is
called is called with a vfsmnt that is in a different share group to the
one used when the mount was created, then I think it should return an
error, or at least return NULL.

> 
> >
> > So to safely achieve non-shared auto-mountpoints we need to create a
> > transparent bind mount at the mount point, mark it as private, then
> > mount the autofs mount there.
> 
> Yes, it's the parent mount that things need to be done to, was always
> 
> a bit of a pain to understand IMHO, and easy to get confused by.
> 
> 
> So what do we end up with here, a stack of mounts with one extra
> 
> mount?

Correct.  Is doubling the number of mount points a big cost I wonder...

> 
> It sounds like the goal is to set the autofs mount propagation
> 
> private, is that right?

Yes.

> 
> 
> I'm not sure but this might cause some trouble for the kernel.
> 
> I've been working on fixing the expire check for mount trees to
> 
> work for multiple mount namespaces in the kernel and mount stacking
> 
> topology looks a bit odd.
> 
> 
> Do these mount points continue to expire as they should?
> 
> I wonder what this will do to my expire changes ...
> 
> 
> I'm sorry, I feel like I'm being difficult now and I don't want
> 
> to be but what's being done here is puzzling me and sounds just
> 
> a bit unusual.

You seem helpful to me, rather than difficult.  I realise that what I'm
trying a bit odd and it would need a good justification and a clear lack
of alternatives.  I'm not sure yet so there is no reason you should be.

I'm actually hoping that I can convince the customer to solve the
problem internally (maybe by specifying one or two private bind mounts
in /etc/fstab if there are any suitable common roots for all their
thousands of mounts) and at the same time exploring options for changing
automount.  Leave it with me for now - I'll get back to you after I've
done more exploration and heard back from the customer.

BTW, is there a reason that you don't publish all your current work,
possibly some in a "testing" branch or similar?  It might help me to see
where you are headed.

Thanks,
NeilBrown

