Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E315511DCA9
	for <lists+autofs@lfdr.de>; Fri, 13 Dec 2019 04:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731389AbfLMDoL (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 12 Dec 2019 22:44:11 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:57693 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731357AbfLMDoK (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 12 Dec 2019 22:44:10 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A503F22790;
        Thu, 12 Dec 2019 22:44:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 12 Dec 2019 22:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        KQulzzXGWVCQ6Dj7jC58pseesJmVG2maJFuUVeOQ0fU=; b=RVq1T1VDQ0SKpA4k
        GYwTMCq6V6A1iCZ+3DgzBa5PaKCp3cLYz7wBgvgqT3WfRnssFJCSPIzKmDhcVIWp
        aE79krs1T3sI6taSrLEsgIdODfJVWB+5/qO98S5hKFn78oz+tTZcOdKDVXOzHTgb
        CM3mOjcPuUHguU52fiHkNcSes+DjYsxqnFGyRePftCeNDuAgILpPYy3sDBFBl1qI
        u1nSVIctlL3gtX7eEiQ2h3VitRtsKe6QolSnB0au8b017PREjODv0CDTwQKspPWF
        PVu+YR1bIeHt1DCxheQS7AIxzr8krd3/phN9wyZZir8EwKbDtea0qt0yVof8KnxQ
        wHM8wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=KQulzzXGWVCQ6Dj7jC58pseesJmVG2maJFuUVeOQ0
        fU=; b=EPUcltZXe94lVs/oUm/oSZG6Ta8JrWLk2N0tXmtOv+rZ1EbeIZpwKmBZ8
        WSXEsY5vnRKJj6qmBClSqTjrUuiYkUuHjS/HlB5+8HuPqD2YjmscZdsDY8jZSSX8
        tL+uxHas6B+sRFtpvMK+dgn60ffJnn+IyRusLJB0lTtfXq5Pa13sG1lo0RpY7ymB
        XpZGBIKI57ngi1Qz+zafcSvoCKh14Qj6zHoiSfOXaQIZb0WFWtcUFTmMzY1drXDG
        gE7CpOfKGJ+XRwWTdgTtD4M5967QN6wcG/z7MimdF3E2TzOrJasGWDZ2t+WLjlU2
        pZGA9/WLdmxOrwjVybdd1lCkpmFIQ==
X-ME-Sender: <xms:CQnzXY4GAWaj7vms2-LevQ-llWqiqC-Uy9a7tDGV8qGnnYFeF7nCUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtle
    drudekledrudelkeenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghm
    rgifrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:CQnzXS24N41CriTWa53xSNOdWjO07h5M18TD9Qp8nKX3crHJ7k-ChQ>
    <xmx:CQnzXTAh51WiftiJhSBsXtPoA8540MUvJxteuk2eJJxkkR7ck7D2LQ>
    <xmx:CQnzXdOC62qXNzFgMMlLCRDSFivBKrEBL6xddUKC188epH55FPpw3Q>
    <xmx:CQnzXT5d6YIzjWLTt-uFkCtWnch9_q0GMzypjT5Wp006__7imaZFGA>
Received: from mickey.themaw.net (unknown [118.209.189.198])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0563C80065;
        Thu, 12 Dec 2019 22:44:07 -0500 (EST)
Message-ID: <73361ae992142cab45b58a19c2ee8d2e4e24f8f7.camel@themaw.net>
Subject: Re: Failure of program map to recover after failure
From:   Ian Kent <raven@themaw.net>
To:     Doug Nazar <nazard@nazar.ca>, autofs@vger.kernel.org
Date:   Fri, 13 Dec 2019 11:44:03 +0800
In-Reply-To: <ec053fc2a4b5d64c29d9c5125a1c988acc3c3af2.camel@themaw.net>
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
         <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
         <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
         <a4119d82-b722-1723-65f6-3e5550e5e62f@nazar.ca>
         <882530b92d107607777570d344d14f04f027a078.camel@themaw.net>
         <5fc61848a17c431d8b529b220e8c83ba9846f47e.camel@themaw.net>
         <ec053fc2a4b5d64c29d9c5125a1c988acc3c3af2.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2019-12-13 at 11:23 +0800, Ian Kent wrote:
> On Fri, 2019-12-13 at 10:18 +0800, Ian Kent wrote:
> > On Thu, 2019-12-12 at 10:07 +0800, Ian Kent wrote:
> > > On Wed, 2019-12-11 at 05:54 -0500, Doug Nazar wrote:
> > > > On 2019-12-09 23:49, Ian Kent wrote:
> > > > > I also need to work out why you don't get caught by the
> > > > > negative
> > > > > map entry check that's meant to prevent multiple retries for
> > > > > a
> > > > > failing map entry for a configured time.
> > > > 
> > > > Sorry, I should have been more explicit. The several minute
> > > > wait
> > > > was
> > > > to 
> > > > exceed the negative cache timeout. That part was working fine.
> > > > 
> > > > > > And even the entry delete below it should be ok because it
> > > > > > will
> > > > > > just lookup (aka. run the program map again to get the map
> > > > > > entry)
> > > > > > and then update the multi-mount during the entry parse.
> > > > > > 
> > > > > > So while the change above isn't strictly the way this
> > > > > > should
> > > > > > be
> > > > > > handled it probably should be ok.
> > > > > > 
> > > > > > I haven't worked out how to handle it immediately after the
> > > > > > fail
> > > > > > just yet but the change above probably should be kept as
> > > > > > part
> > > > > > of
> > > > > > that as well, not sure yet.
> > > > > > 
> > > > > > Ian
> > > > 
> > > > I did that based on my greps, that seems to be a fairly common
> > > > check. 
> > > > However, it kind of felt wrong, in the sense that the 2nd
> > > > attempt, 
> > > > shouldn't depend on any previous status. I was just having
> > > > trouble 
> > > > trying to figure out the lifetime rules for the various
> > > > fields/states.
> > > 
> > > Yes, the root of a multi-mount has all sorts of special case
> > > handling
> > > in a number of places.
> > 
> > I think this is what should be done.
> > 
> > Could you check and see if it behaves as required please, of course
> > the CHANGELOG hunk needs to be dropped.
> > 
> > autofs-5.1.6 - fix program map multi-mount lookup after mount fail
> > 
> > From: Ian Kent <raven@themaw.net>
> > 
> > For the case of a singleton multi-mount program map lookup
> > following
> > a mount fail (and the negative timeout has passed) the lookup key
> > is
> > what's expected for an indirect map key but the the root offset map
> > entry already exists. This causes autofs to think it has an
> > incorrect
> > lookup key and it fails the lookup when it should take the
> > opptunity
> > to delete and update the cache entry since it's not actually in use
> > yet.
> > 
> > Also, if a check is done to see if the lookup is for the root
> > offset,
> > deleting the entry fails because it contains an offset so it
> > doesn't
> > get updated.
> 
> Actually that's not entirely accurate.
> 
> Not deleting the entry (and it's offsets) should result in a
> "duplcate
> offset detected for key" (spelling needs to be corrected) error but I
> think the check is not quite right so that doesn't happen.
> 
> So the change here is meant to take account of that being fixed at
> some point.

That's not quite right either, it would result in a warning and the
offset being updated. But the owner of the multi-mount can get out
of sync with the offsets that have been added (which isn't a problem
as long as the offsets can be deleted on expire) so the right thing
to do is clean it out and start a fresh so the most up to date map
entry is being used.

I'll update the description in the patch.

> 
> > Signed-off-by: Ian Kent <raven@themaw.net>
> > ---
> >  CHANGELOG                |    1 +
> >  modules/lookup_program.c |    7 +++++--
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/CHANGELOG b/CHANGELOG
> > index 981a0333..3c784d34 100644
> > --- a/CHANGELOG
> > +++ b/CHANGELOG
> > @@ -1,6 +1,7 @@
> >  xx/xx/2020 autofs-5.1.7
> >  - make bind mounts propagation slave by default.
> >  - update ldap READMEs and schema definitions.
> > +- fix program map multi-mount lookup after mount fail.
> >  
> >  07/10/2019 autofs-5.1.6
> >  - support strictexpire mount option.
> > diff --git a/modules/lookup_program.c b/modules/lookup_program.c
> > index fcb1af74..ca209488 100644
> > --- a/modules/lookup_program.c
> > +++ b/modules/lookup_program.c
> > @@ -646,7 +646,7 @@ int lookup_mount(struct autofs_point *ap, const
> > char *name, int name_len, void *
> >  				 name_len, ent, ctxt->parse->context);
> >  			goto out_free;
> >  		} else {
> > -			if (me->multi) {
> > +			if (me->multi && me->multi != me) {
> >  				cache_unlock(mc);
> >  				warn(ap->logopt, MODPREFIX
> >  				     "unexpected lookup for active
> > multi-mount"
> > @@ -656,8 +656,11 @@ int lookup_mount(struct autofs_point *ap,
> > const
> > char *name, int name_len, void *
> >  			cache_unlock(mc);
> >  			cache_writelock(mc);
> >  			me = cache_lookup_distinct(mc, name);
> > -			if (me)
> > +			if (me) {
> > +				if (me->multi)
> > +					cache_delete_offset_list(mc,
> > name);
> >  				cache_delete(mc, name);
> > +			}
> >  			cache_unlock(mc);
> >  		}
> >  	}
> > 

