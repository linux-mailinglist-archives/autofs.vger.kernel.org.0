Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E5C6B1FE5
	for <lists+autofs@lfdr.de>; Thu,  9 Mar 2023 10:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjCIJXn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 9 Mar 2023 04:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjCIJXj (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 9 Mar 2023 04:23:39 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DB177CB1
        for <autofs@vger.kernel.org>; Thu,  9 Mar 2023 01:23:35 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A2E8821D60;
        Thu,  9 Mar 2023 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678353814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0/LMULgUjM/HiaqFYfOzEV9clACa6oBsTJla/FsL9Wo=;
        b=kZaVXHgSEInFFMDFw0X3TwfbTDAOc1NUNNmpkSwgnIZOgpzGHJw3x5RKCZkdSzLVW9O2/a
        ur7aloqkYRlz+hPdKV2Y1IkMW3ssl7dF4T9QX41d+V/iMV+1BrWs9GZo+P9lvTYZoyiiPX
        8BLNifNz9JnwYzCxDDpcaofMHhS0TrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678353814;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0/LMULgUjM/HiaqFYfOzEV9clACa6oBsTJla/FsL9Wo=;
        b=Qo/99fbvrDBGGXSaBDiIel/W9xHAtyGvh8dpzIaq5sMr5ttPp3abyd/0yAQYi67pR4/rca
        Oa+DIlifh0OEK3Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B12B21391B;
        Thu,  9 Mar 2023 09:23:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id dhMMGZWlCWQvDAAAMHmgww
        (envelope-from <neilb@suse.de>); Thu, 09 Mar 2023 09:23:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Ian Kent" <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Re: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
In-reply-to: <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>
References: <167825473018.8008.14797686282321546235@noble.neil.brown.name>,
 <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>
Date:   Thu, 09 Mar 2023 20:23:25 +1100
Message-id: <167835380568.8008.17125175633261559260@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 09 Mar 2023, Ian Kent wrote:
> On 8/3/23 13:52, NeilBrown wrote:
> > New flags in the master map:
> >    autofsshared
> >    autofsprivate
> >    autofsslave
> >
> > cause the corresponding mount propagation flags to be set on the autofs
> > mount point.  If none are specified the current behaviour of inheriting
> > from the parent unchanged.
> >
> > For example specify "autofsprivate" allows mount points to be moved
> > away from autofs using "mount -M .....".  This is not supported by the
> > kernel for the normal default of "shared".
> >
> > Better flag names should be chosen.  I would have liked to use "shared",
> > "private", and "slave", but they are already in use and only affect bind
> > mounts.
> 
> Looks fine, I'll add it to my patch queue, can't say when I'll commit
> 
> them though. If you need it committed sooner let me know.

No rush at all - that fact that you don't hate it is enough for now.
I was hoping you *would* hate the flag names I chose and would suggest
something better.
After pondering some more the best I can think of is

  private-autofs
etc.
Can you think of anything better?

maybe
  private=autofs
which could later be extended to a list of filesystem types...

My other thought is that if they autofs mount is "private" then that is
inherited to all descendants including the "bind" mounts.  So if we
changed "private" to apply to the autofs mounts rather than just the
bind mounts, then it would still affect the bind mounts as documented,
but it would affect more as well....  I guess that would end up
negatively affecting someone though...

> 
> 
> This takes things a bit further than I had.
> 
> May I ask, what was the motivation for adding this?

As the commit message hints, I have a customer with a work-flow that
involves moving mount out of the automount tree with "mount -M ....".
This used to work perfectly in out SLE-11 product which didn't use
systemd and so followed the kernel default that mounts were "private" by
default.  "mount -M" only works out of parents that are private.

But with SLE-12 we use systemd, and systemd sets everything to "shared"
by default.  There are good reasons for this and the customer doesn't
want to over-ride it globally.  They just want the autofs mounts to not
be shared, so that mount -M works.
Don't ask me why they want to move mounts like this - but it doesn't
seem an unreasonable thing to want.

Thanks,
NeilBrown

