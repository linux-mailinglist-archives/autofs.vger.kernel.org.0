Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC546B88C6
	for <lists+autofs@lfdr.de>; Tue, 14 Mar 2023 03:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjCNC4u (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 13 Mar 2023 22:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCNC4t (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 13 Mar 2023 22:56:49 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369968F731
        for <autofs@vger.kernel.org>; Mon, 13 Mar 2023 19:56:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 949531F7AB;
        Tue, 14 Mar 2023 02:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678762604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E0Ve/LnCcoAC1XTIcHLrYOmQeE74iTMvSDSysQZl08c=;
        b=oUr5C/FIzxVJ3pg8uqyYzRCgb9VN1wUAZ54uClS0q7egW8oTvMkH/iVia2BCaLrqzyKjFk
        qPd4oxfbMuSo20NBO1ixehsA6kaR1uafVWkVnl2/glfkM17+yHr5OfBrHdqffzK9hW5xgG
        HivpkYANdoCqkpDU/ocRFQdn5uVnR3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678762604;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E0Ve/LnCcoAC1XTIcHLrYOmQeE74iTMvSDSysQZl08c=;
        b=IWxz6NnZ7Cy8ii8aAmaa3F+0ENdZGWcCFA1k6zwInExAFANFNUBpICuonCqMDOmJuOVqXz
        rLIaRFan64WSxuAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD8C413A1B;
        Tue, 14 Mar 2023 02:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xnQzGWviD2SeLwAAMHmgww
        (envelope-from <neilb@suse.de>); Tue, 14 Mar 2023 02:56:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Ian Kent" <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Re: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
In-reply-to: <f748072c-52a0-32a3-aaef-4689c3adaa41@themaw.net>
References: <167825473018.8008.14797686282321546235@noble.neil.brown.name>,
 <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>,
 <167835380568.8008.17125175633261559260@noble.neil.brown.name>,
 <cb91e968-1014-fdfe-596a-fd758856aa44@themaw.net>,
 <78d83b4f-b3c6-eb2e-ab3d-76824b9b29f7@themaw.net>,
 <167867796579.8008.1010314226146743739@noble.neil.brown.name>,
 <f748072c-52a0-32a3-aaef-4689c3adaa41@themaw.net>
Date:   Tue, 14 Mar 2023 13:56:40 +1100
Message-id: <167876260016.8008.10986525185984597321@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 13 Mar 2023, Ian Kent wrote:
> On 13/3/23 11:26, NeilBrown wrote:
> > On Sat, 11 Mar 2023, Ian Kent wrote:
> >> On 11/3/23 14:26, Ian Kent wrote:
> >>> On 9/3/23 17:23, NeilBrown wrote:
> >>>> On Thu, 09 Mar 2023, Ian Kent wrote:
> >>>>> On 8/3/23 13:52, NeilBrown wrote:
> >>>>>> New flags in the master map:
> >>>>>>  =C2=A0=C2=A0=C2=A0 autofsshared
> >>>>>>  =C2=A0=C2=A0=C2=A0 autofsprivate
> >>>>>>  =C2=A0=C2=A0=C2=A0 autofsslave
> >>>>>>
> >>>>>> cause the corresponding mount propagation flags to be set on the
> >>>>>> autofs
> >>>>>> mount point.=C2=A0 If none are specified the current behaviour of
> >>>>>> inheriting
> >>>>>> from the parent unchanged.
> >>>>>>
> >>>>>> For example specify "autofsprivate" allows mount points to be moved
> >>>>>> away from autofs using "mount -M .....".=C2=A0 This is not supported=
 by the
> >>>>>> kernel for the normal default of "shared".
> >>>>>>
> >>>>>> Better flag names should be chosen.=C2=A0 I would have liked to use
> >>>>>> "shared",
> >>>>>> "private", and "slave", but they are already in use and only affect
> >>>>>> bind
> >>>>>> mounts.
> >>>>> Looks fine, I'll add it to my patch queue, can't say when I'll commit
> >>>>>
> >>>>> them though. If you need it committed sooner let me know.
> >>>> No rush at all - that fact that you don't hate it is enough for now.
> >>>> I was hoping you *would* hate the flag names I chose and would suggest
> >>>> something better.
> >>> I think your suggesting merging this with the existing code, that's were
> >>>
> >>> I was going too.
> >>>
> >>>
> >>>> After pondering some more the best I can think of is
> >>>>
> >>>>  =C2=A0=C2=A0 private-autofs
> >>>> etc.
> >>>> Can you think of anything better?
> >>>>
> >>>> maybe
> >>>>  =C2=A0=C2=A0 private=3Dautofs
> >>>> which could later be extended to a list of filesystem types...
> >>>>
> >>>> My other thought is that if they autofs mount is "private" then that is
> >>>> inherited to all descendants including the "bind" mounts.=C2=A0 So if =
we
> >>>> changed "private" to apply to the autofs mounts rather than just the
> >>>> bind mounts, then it would still affect the bind mounts as documented,
> >>>> but it would affect more as well....=C2=A0 I guess that would end up
> >>>> negatively affecting someone though...
> >>> I can't remember now the motivation for what I originally did.
> >>>
> >>>
> >>> I'll need to look at that but I suspect it's similar, if not
> >>>
> >>> the same, as your reasons for needing it. I should get a bit
> >>>
> >>> of time soon to have a look ...
> >> It looks like the only thing to worry about if we decide to merge
> >>
> >> the existing propagation options and these is whether we check
> >>
> >> and stop people from shooting themselves in the foot by causing
> >>
> >> a deadlock and working out if there are other cases of deadlock
> >>
> >> beside bind mounting.
> >>
> > I'm not sure that I understand the cause of the deadlock.
>=20
> It's been a while but IIRC it was because of mounts that were
>=20
> propagation shared.
>=20
>=20
> They were propagating to another mount but were also being
>=20
> propagated back which was strange. Again, IIRC and I'm not sure
>=20
> I do, when a mount was triggered it was causing the propagation
>=20
> (back) to cover original mount and trying to follow it triggered
>=20
> another mount that couldn't be competed (since the first couldn't
>=20
> be completed). It was odd and I'm pretty sure it shouldn't have
>=20
> been happening.
>=20

I didn't some digging and experimenting.
I created


/etc/auto.master.d/tst.autofs :

   /import /etc/import.map shared bind

and=20

/etc/import.map=20

  loop -type=3Dlofs / localhost:/export /B localhost:/export/B /C localhost:/=
export/C

and then tried to access /import/loop/B.  I got a deadlock.

automount has called spawn_bind_mount() which called do_spawn() with
SPAWN_OPT_OPEN set.  After forking and changing pgrp do_spawn() tried to
open the target: /export/B.  This had an autofs mount back-propagated to
it and hung waiting for the bind mount to complete.

I rebuilt after configuring with --enable-mount-locking (which turns off
SPAWN_OPT_OPEN) and don't get the deadlock any more.

I don't think that is a useful solution, just a proof-of-concept
work-around.

>=20
> Fact is it was hard to understand what was going on in the first
>=20
> place, but one thing is sure, propagation shared is not friendly
>=20
> for automounting and is probably a bad choice for the root file
>=20
> system on systemd's part.

You probably aren't alone in that view, but I suspect the are real
advantages.  Probably there is something wrong with the abstraction as
different people want different things for good reasons.  Changing the
abstraction might be hard....

I'll sleep on it and try to provide a credible solution for autofs now
that I understand the problems.  Quite possibly it will just extend the
current "private" etc flags to the autofs mounts...

Thanks,
NeilBrown


>=20
>=20
> >
> > I assume it happens when an autofs mount appears somewhere that the
> > automount daemon doesn't know about, and when propagation is configured
> > so that when automount mounts something on the location it *does* know
> > about, the mount isn't propagated to the problem location.
>=20
> Tbh, I can't remember now.
>=20
>=20
> >
> > And access of that problem location would then block waiting for the
> > automount daemon to mount something, but it never will.
> >
> > Is that correct?  Is that the only problem?
>=20
> I think the only autofs problem is mounts can be set propagation shared.
>=20
>=20
> >
> > So if automount bind-mounts something from elsewhere over an autofs
> > mount point, it doesn't want any autofs mount points is mounts below
> > this to be propagated back to the origin.  This is why it defaults to
> > "slave".  That makes sense.  It would be safe for mounts to propagate
> > back only of the original mount was shared or slave - be we cannot check
> > or enforce that.
>=20
> I don't think there is any autofs case where a mount should be set
>=20
> propagation shared. I am talking about autofs mounts themselves
>=20
> though not the things autofs mounts for us.
>=20
>=20
> >
> > Though if the first autofs mount point were already private, then it
> > should probably leave the child bind-mount as private rather than change
> > it to slave.
>=20
> Yes, I agree.
>=20
>=20
> >
> > It feels like there is a lot of potential for problems if someone
> > creates a bind mount from an automount-manager tree and makes it
> > private, or if the original tree is private.  So maybe we shouldn't
> > support "private" autofs mounts.  They should be shared, slave, or
> > unbindable.
>=20
> I don't think we should allow autofs mounts to be set propagation
>=20
> shared, if someone wants to do this they probably don't actually
>=20
> need to do it and will very likely see a mount hang.
>=20
>=20
> Not sure about private usage, in fact I don't think I care either
>=20
> way. Thing is users might get themselves into odd situations but
>=20
> I don't think it will lead to problems bleeding into other mount
>=20
> trees like we see with shared mount trees.
>=20
>=20
> Clearly binding a private tree elsewhere is going to leave a tree
>=20
> of mounts that will need to be umounted manually unless it is within
>=20
> a new mount namespace.
>=20
>=20
> The use case for bind mounting autofs mounts (well what I mean is
>=20
> actually mount namespace creation but it sounds like and looks like
>=20
> bind mounting when talking about containers) is into containers where
>=20
> they need to have the same path to work and need to be propagation
>=20
> slave for the child directories or mount point triggers that cause
>=20
> automounts to trigger that then propagate to the namespace.
>=20
>=20
> >
> > Similarly slave autofs mounts would be a problem as if they are
> > bind-mounted to somewhere (or just duplicated into a new namespace).
> > Changes made by automount wouldn't propagate elsewhere and so deadlocks
> > could happen.
>=20
> I think we do need to distinguish between bind-mounting and mount namespace
>=20
> creation. I've previously used these interchangeably which is not right.
>=20
> Propagated mounts (I think) are cloned not bound (hehe, sounds like a
>=20
> bind mount).
>=20
>=20
> Straight bind-mounting generally isn't useful. I'm not sure it should be
>=20
> prevented since it's usually not harmful although also not useful. Mount
>=20
> namespace creation should prevent propagation shared autofs mounts being
>=20
> included, and there should be some way to prevent any autofs mounts (trees)
>=20
> from being included, and only specifically requested mounts should be cloned
>=20
> to the target namespace.
>=20
>=20
> But that's kindof a "never ever do this, but allow it if someone says=20
> please"
>=20
> type thing, and I don't know how to do that, ;)
>=20
>=20
> >
> > So maybe the autofs mounts should always be either shared or unbindable.
>=20
> I agree with that.
>=20
> Not sure we care about unbindable since pure bind mounts should not cause
>=20
> harmful side effects but they aren't useful either so ... it's an open
>=20
> question.
>=20
>=20
> >
> > When autofs mounts a new filesystem on an autofs mount it can safely
> > inherit from the parent.  However when it bind-mounts an existing
> > filesystem it needs to ensure it is at most "slave".
> >
> > So I can see two sensible options.
> >
> >   1/ The autofs mount is "shared" if parent is shared, and is
> >      unbindable otherwise.
> >      bind-mounts are "slave" if the parent is shared, or
> >      unbindable otherwise
>=20
> I think it's only necessary to over-ride setting the mount propagation
>=20
> shared, I don't think there's a use case for shared at all. I may be
>=20
> wrong ... time will tell.
>=20
>=20
> >
> >   2/ Everything is unbindable.  This could be achieved with the "private"
> >      option.
>=20
> I must admit I found unbindable behavior odd.
>=20
> I played with it a bit and probably need to do so again.
>=20
> IIRC I thought it wasn't usable to prevent bind mounting.
>=20
>=20
> >
> > I guess that we still need to support "shared" with leaves bind mounts
> > as shared, but with a warning that deadlocks can occur if used
> > carelessly.
>=20
> Haha, did I say I really don't like propagation shared mounts ... just
>=20
> in case, I don't like mount that are propagation shared, ;)
>=20
>=20
> Ian
>=20
>=20

