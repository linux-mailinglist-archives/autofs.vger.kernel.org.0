Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E336A69C4CE
	for <lists+autofs@lfdr.de>; Mon, 20 Feb 2023 05:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjBTEuF (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Feb 2023 23:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjBTEuE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Feb 2023 23:50:04 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E65A7686
        for <autofs@vger.kernel.org>; Sun, 19 Feb 2023 20:50:03 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A562720FC2;
        Mon, 20 Feb 2023 04:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676868600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G4j3Kn+1subP7xvn+/VNcIRPHV8iVqnlel+K2Ew8KXg=;
        b=nOn6sFrcHTJAuBxmprPdkMQCWJIWk9SVkRZVJZstgOF0hOAovbwMlxw5oa+B2dgkjdOgEi
        3gDckiHAX+HbdJRxxlB3P2GMoHJg7/zbLkl1r7W7a0ZC226NaSDUTDduTlQbObrh2P77gi
        wVl9jmYQTz9H+AC6DToscg1Tpnp5q0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676868600;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G4j3Kn+1subP7xvn+/VNcIRPHV8iVqnlel+K2Ew8KXg=;
        b=fXhD/cXo3RLdJ5rwb/dHMqxvBIU7JDMqRdngXizN8LN2iRg7HXR6BVkfbl4J0AJOoFnwHx
        l/waeEpJUDVhBpDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A591134BA;
        Mon, 20 Feb 2023 04:49:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GjGwLvb78mONDAAAMHmgww
        (envelope-from <neilb@suse.de>); Mon, 20 Feb 2023 04:49:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Ian Kent" <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Re: Help with autofs hang
In-reply-to: <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
References: <167684642746.11359.12533584244594425604@noble.neil.brown.name>,
 <8aac4b1b-d26a-181f-d23f-ce99023c773d@themaw.net>
Date:   Mon, 20 Feb 2023 15:49:54 +1100
Message-id: <167686859468.11359.12004508002400033963@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 20 Feb 2023, Ian Kent wrote:
> On 20/2/23 06:40, NeilBrown wrote:
> > Hi,
> >   I have a customer who is experiencing problems with automountd.  I
> >   think I know what is happening, but I'm not sure if what I imagine is
> >   possible, or what the best solution is.
> >
> >   The kernel is 4.12 and automountd is 5.1.3 - so not the newest, but not
> >   ancient.  I cannot see any changes since that look like they might be
> >   relevant.
> >
> >   The problem is that after a while automountd stops expiring direct
> >   mounts, and doesn't mount any new direct mounts that are added to the
> >   map.
> >   
> >   When this happens an automountd thread has sent an
> >   AUTOFS_IOC_EXPIRE_MULTI ioctl to the kernel, the kernel has sent a
> >   NFY_EXPIRE back up to automountd.  automountd reported
> >
> >     handle_packet_expire_direct: can't find map entry for ....
> >
> >   and the kernel never gets an ACK for the message and things hang.
> 
> Yes, that case is fatal.
> 
> 
> Because the kernel communications pipe might not be able to convey
> 
> the direct mount path a bogus value is encoded into the packet and
> 
> an inode number to path index is used to lookup the path. Without
> 
> the path we can't continue.
> 
> 
> But this hasn't happened to me for a long time.
> 
> 
> >
> >   When I look, the mount point that the kernel is asking automountd to
> >   expire has already been unmounted.
> 
> That's not right ...
> 
> 
> >
> >   The mount map uses LDAP and changes quite often.  My guess is that
> >   automountd notices that some directory has been removed from the map,
> >   and so removes the map entry.  This presumably races with the expiry
> >   process.  The mount gets unmounted because it is removed from the map
> >   at the same time that expiry wants to remove it, and confusion results.
> 
> That sounds different to the terminology I'd use but I think I get what
> 
> your saying.
> 
> 
> I would describe it as, a map entry has been removed from the map when
> 
> it's in use causing expires for that map entry to be done on an entry
> 
> that's been removed from the index we need for the map entry lookup.
> 
> This map entry shouldn't be removed in this case.
> 
> 
> >   
> >   My current thought for a solution is to change the way the kernel waits
> >   for NFY_EXPIRE replies.  Instead of waiting indefinitely it waits with
> >   a timeout.  If the wait times out and the filesystem is still mounted,
> >   it just loops around and waits again.  If after the timeout the
> >   filesystem has been unmounted it waits one more time (just in case
> >   automountd is about to reply) and then aborts the wait with -EAGAIN.
> >   I've provided the customer with a patch to do this using a 5 second
> >   wait.  I don't have test results yet.
> 
> I really don't think this is a kernel problem, it's a user space problem.
> 
> 
> Some time ago there was a weird case where an active map entry was being
> 
> removed from the map entry cache. I had a little trouble even working out
> 
> what I had done when I cam across it in a clean up a while ago. So if
> 
> this is what your seeing we'll need to do some work to work out what
> 
> I saw and what I was doing to fix it.
> 
> 
> Let me check 5.1.3 and get back to you.
> 
> 
> >
> >   So my questions are:
> >    - is this race really possible? Can removal-from-map race with expiry?
> 
> Well, maybe but it shouldn't because walking into an expiring mount
> 
> or one that's being mounted shouldn't be possible and I haven't seen
> 
> symptoms of that happening for a very long time, certainly not with
> 
> a kernel as recent as 4.12.
> 
> 
> I really think it's a mistake I'm making in the user space code.
> 
> 
> >    - is my timeout fix reasonable?  Might it cause other problems?  Is
> >      there a better way to fix this inside automountd?
> 
> Probably and don't know.
> 
> 
> I think user space is the problem here and I suspect trying to change
> 
> the kernel won't actually fix the problem because it's a user space
> 
> mistake that could still happen.
> 
> 
> I'm not sure about the wisdom of my not trying to recover from this
> 
> either. Originally it was done because if this happened things would
> 
> only get worse and the problem would become hidden. So I made the fail
> 
> fatal so I could get a core of the state at the time it happened and
> 
> that would be more likely to yield information about the cause. And
> 
> this should never happen so the only choice is to fix it.
> 

Thanks - you've given me some useful pointers.  I'll look some more.

I have a core of automountd while it is hanging (so after the initial
problem) and also a core of the kernel.  So if you do find more time to
look and want me to find something in a core file, just let me know.

Thanks,
NeilBrown
