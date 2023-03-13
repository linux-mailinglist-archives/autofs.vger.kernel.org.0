Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1236B6DF3
	for <lists+autofs@lfdr.de>; Mon, 13 Mar 2023 04:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCMD0O (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 12 Mar 2023 23:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCMD0O (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 12 Mar 2023 23:26:14 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA04F2DE73
        for <autofs@vger.kernel.org>; Sun, 12 Mar 2023 20:26:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 532BD229E6;
        Mon, 13 Mar 2023 03:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678677970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YA3gkLQnRtcp9s3jvLqlv02hhhWS1/5Czk6+IvFliiw=;
        b=rHfDpFE96Fh+ZxMQMnOHN6PFFY+ht//wX9ySakB9C7wTr0GfYZ9+gULfWgk+UsEwZv8OEZ
        bibMH0HBVsgWVR/N2ZzYJA+7zW4KrIfVsCEq83+LGBL0KJy4HeN9BOoGKbOITX1A4/NrAb
        jKCDnvqfdbaETPN2ADGWZ6muhR/j7cM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678677970;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YA3gkLQnRtcp9s3jvLqlv02hhhWS1/5Czk6+IvFliiw=;
        b=paVfSdH/xUoXg92mu/86l6RYp0XzRva/NwYQ3ClcGhxbPgyoqy2vtM71bTEwj8pwmI1ETY
        HjtUzO2VO4qgO0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7000813463;
        Mon, 13 Mar 2023 03:26:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id J0h4CtGXDmSZAQAAMHmgww
        (envelope-from <neilb@suse.de>); Mon, 13 Mar 2023 03:26:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Ian Kent" <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Re: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
In-reply-to: <78d83b4f-b3c6-eb2e-ab3d-76824b9b29f7@themaw.net>
References: <167825473018.8008.14797686282321546235@noble.neil.brown.name>,
 <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>,
 <167835380568.8008.17125175633261559260@noble.neil.brown.name>,
 <cb91e968-1014-fdfe-596a-fd758856aa44@themaw.net>,
 <78d83b4f-b3c6-eb2e-ab3d-76824b9b29f7@themaw.net>
Date:   Mon, 13 Mar 2023 14:26:05 +1100
Message-id: <167867796579.8008.1010314226146743739@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, 11 Mar 2023, Ian Kent wrote:
> On 11/3/23 14:26, Ian Kent wrote:
> > On 9/3/23 17:23, NeilBrown wrote:
> >> On Thu, 09 Mar 2023, Ian Kent wrote:
> >>> On 8/3/23 13:52, NeilBrown wrote:
> >>>> New flags in the master map:
> >>>>     autofsshared
> >>>>     autofsprivate
> >>>>     autofsslave
> >>>>
> >>>> cause the corresponding mount propagation flags to be set on the 
> >>>> autofs
> >>>> mount point.  If none are specified the current behaviour of 
> >>>> inheriting
> >>>> from the parent unchanged.
> >>>>
> >>>> For example specify "autofsprivate" allows mount points to be moved
> >>>> away from autofs using "mount -M .....".  This is not supported by the
> >>>> kernel for the normal default of "shared".
> >>>>
> >>>> Better flag names should be chosen.  I would have liked to use 
> >>>> "shared",
> >>>> "private", and "slave", but they are already in use and only affect 
> >>>> bind
> >>>> mounts.
> >>> Looks fine, I'll add it to my patch queue, can't say when I'll commit
> >>>
> >>> them though. If you need it committed sooner let me know.
> >> No rush at all - that fact that you don't hate it is enough for now.
> >> I was hoping you *would* hate the flag names I chose and would suggest
> >> something better.
> >
> > I think your suggesting merging this with the existing code, that's were
> >
> > I was going too.
> >
> >
> >> After pondering some more the best I can think of is
> >>
> >>    private-autofs
> >> etc.
> >> Can you think of anything better?
> >>
> >> maybe
> >>    private=autofs
> >> which could later be extended to a list of filesystem types...
> >>
> >> My other thought is that if they autofs mount is "private" then that is
> >> inherited to all descendants including the "bind" mounts.  So if we
> >> changed "private" to apply to the autofs mounts rather than just the
> >> bind mounts, then it would still affect the bind mounts as documented,
> >> but it would affect more as well....  I guess that would end up
> >> negatively affecting someone though...
> >
> > I can't remember now the motivation for what I originally did.
> >
> >
> > I'll need to look at that but I suspect it's similar, if not
> >
> > the same, as your reasons for needing it. I should get a bit
> >
> > of time soon to have a look ...
> 
> It looks like the only thing to worry about if we decide to merge
> 
> the existing propagation options and these is whether we check
> 
> and stop people from shooting themselves in the foot by causing
> 
> a deadlock and working out if there are other cases of deadlock
> 
> beside bind mounting.
> 

I'm not sure that I understand the cause of the deadlock.

I assume it happens when an autofs mount appears somewhere that the
automount daemon doesn't know about, and when propagation is configured
so that when automount mounts something on the location it *does* know
about, the mount isn't propagated to the problem location.

And access of that problem location would then block waiting for the
automount daemon to mount something, but it never will.

Is that correct?  Is that the only problem?

So if automount bind-mounts something from elsewhere over an autofs
mount point, it doesn't want any autofs mount points is mounts below
this to be propagated back to the origin.  This is why it defaults to
"slave".  That makes sense.  It would be safe for mounts to propagate
back only of the original mount was shared or slave - be we cannot check
or enforce that.

Though if the first autofs mount point were already private, then it
should probably leave the child bind-mount as private rather than change
it to slave.

It feels like there is a lot of potential for problems if someone
creates a bind mount from an automount-manager tree and makes it
private, or if the original tree is private.  So maybe we shouldn't
support "private" autofs mounts.  They should be shared, slave, or
unbindable.

Similarly slave autofs mounts would be a problem as if they are
bind-mounted to somewhere (or just duplicated into a new namespace).
Changes made by automount wouldn't propagate elsewhere and so deadlocks
could happen.

So maybe the autofs mounts should always be either shared or unbindable.

When autofs mounts a new filesystem on an autofs mount it can safely
inherit from the parent.  However when it bind-mounts an existing
filesystem it needs to ensure it is at most "slave".

So I can see two sensible options.

 1/ The autofs mount is "shared" if parent is shared, and is
    unbindable otherwise.
    bind-mounts are "slave" if the parent is shared, or
    unbindable otherwise

 2/ Everything is unbindable.  This could be achieved with the "private"
    option.

I guess that we still need to support "shared" with leaves bind mounts
as shared, but with a warning that deadlocks can occur if used
carelessly.

Have I missed anything important?

Thanks,
NeilBrown
