Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000C9210F0
	for <lists+autofs@lfdr.de>; Fri, 17 May 2019 01:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfEPXLN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 16 May 2019 19:11:13 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33173 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726461AbfEPXLN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 16 May 2019 19:11:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A2DB335A;
        Thu, 16 May 2019 19:11:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 16 May 2019 19:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        7nx7aRbI9e8qPzXz/ZOUG8QdKOQcFI1BCA4FSdGcE3U=; b=lNJ04aw6lebrZj0g
        7OS4kD0Rqp8AHYm5WMfYxAPZ7sbkQo792J+nGT9wNX/PfNL5DQjfHVDLNzUHBtbU
        s7RAtZyRMzeyvA/Frvs3mT9XGL+97fbthX97amNAscwBRl8nuqn0JEcQn10osN3K
        mCjFRc0WV79aWQCgY6bAChMdU04jT47jqASVR4VjpMcJhywSM9NIQFz9Mc0R5izL
        xdDnAUb4VTGZLEj/AZC22UCWLwDZg6/ga71EgHSNGLc9lJgPiLXL9+fWYq2EwajS
        qePfw61RXc2It1iSxwqkhbcpRhif+Z6ij3J9X4MDN3jtMt2mWb6PbI8zqg7o1bBJ
        nmikTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=7nx7aRbI9e8qPzXz/ZOUG8QdKOQcFI1BCA4FSdGcE
        3U=; b=mUSI8jphVX4QewN+DBP9T5L8iEdENw16m0fckIGDjg00q9vdWm/9II+FH
        RGCf3Joik05IAqC1wyqffqn3gK7pEkJDsJYmhXZUo+BWexoj6SNI4rEkmaSueMkx
        kw9Fd8dJ9wneEVbS7yLP1e1httDCD9WxVYOZVLB3qsCnJfY7vlI8ooKT11K0lVTs
        2FTeDYjRqg1IRQbE4F1gzatmhByq0z6UjoF9ZSh6qYfrVZLI7OjhLU0dxuB4hKkc
        2QRORNFSMiKldn3QJ1NVdSe5e1eWpArfMTun8icMfTM6a80v1esZbInybTCnTQG6
        dJkICbg859iUvpFldxJYr4aiwcP/g==
X-ME-Sender: <xms:DO7dXIziTeRNU5Gg5DLerszVbH9jFx2sIX3WijEe3DhhSZspV7q9_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftgfoggfgsehtje
    ertdertdejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecukfhppeduudekrddvtdekrdehiedrudduvdenucfrrghrrghmpehmrghilh
    hfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvghtnecuvehluhhsthgvrhfuihiivgep
    td
X-ME-Proxy: <xmx:De7dXBvTW0Af_e4qJIqJYYkhWlmZn2lzJZP3G74F791n-i52GJnGLA>
    <xmx:De7dXPFDrsAcDSisC0l7mnRPuV1THBULVBE0KJityaIn7Yd0Chhhaw>
    <xmx:De7dXHfc3H8a6vPp4meYWPrPZnaXLtSHvUl09q_PqqFbFwQ2U3msyQ>
    <xmx:De7dXEK5HAnGiPyxxuJTTgnX_opDe9fJnHXOhB27QfAH4guGbghcWg>
Received: from pluto.themaw.net (unknown [118.208.56.112])
        by mail.messagingengine.com (Postfix) with ESMTPA id 752AC80061;
        Thu, 16 May 2019 19:11:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id 3D0181C011B;
        Fri, 17 May 2019 07:11:04 +0800 (AWST)
Message-ID: <25123ff8713c030a2eb83135a7f6533ce849cce1.camel@themaw.net>
Subject: Re: Changes in indirect multi-maps don't become effective w/o
 autofs restart
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <list.autofs@drosera.ch>, autofs@vger.kernel.org
Date:   Fri, 17 May 2019 07:11:04 +0800
In-Reply-To: <64c74407-9980-45a4-185a-48f8e91c1e0e@drosera.ch>
References: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
         <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
         <5e0cd181-00c3-112e-20b1-1ba66f5931fa@drosera.ch>
         <6e26cbfa3b160a5befd1b1aff8b1eeae93ab864a.camel@themaw.net>
         <64c74407-9980-45a4-185a-48f8e91c1e0e@drosera.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-05-16 at 16:24 +0200, Frank Thommen wrote:
> 
> On 5/16/19 1:42 PM, Ian Kent wrote:
> > On Thu, 2019-05-16 at 12:53 +0200, Frank Thommen wrote:
> > > 
> > > On 5/16/19 3:01 AM, Ian Kent wrote:
> > > > On Wed, 2019-05-15 at 18:00 +0200, Frank Thommen wrote:
> > > > > Dear all,
> > > > > 
> > > > > the autofs manpages says:
> > > > > 
> > > > > "If  an  indirect  map  is modified then the change will become
> > > > > effective immediately.  If an indirect map uses the browse option, the
> > > > > master map contains direct mount maps or the auto.master map is
> > > > > modified
> > > > > then the autofs service control reload action must be rerun to
> > > > > activate
> > > > > the changes."
> > > > > 
> > > > > However this doesn't seem true when using multi-maps:
> > > > > 
> > > > > In /etc/auto.master:
> > > > > 
> > > > >        /base/data /etc/auto.data
> > > > > 
> > > > > 
> > > > > In /etc/auto.data:
> > > > > 
> > > > >       # section 1
> > > > >       #
> > > > >       p1  -fstype=nfs,vers=3,sec=sys  srv:/export/p1
> > > > >       p2  -fstype=nfs,vers=3,sec=sys  srv:/export/p2
> > > > > 
> > > > >       # section 2
> > > > >       #
> > > > >       others   -fstype=nfs,vers=3,sec=sys \
> > > > >          /p3   srv:/export/p2 \
> > > > >          /p4   srv:/export/p4
> > > > > 
> > > > > When adding an entry
> > > > > 
> > > > >       p5  -fstype=nfs,vers=3,sec=sys  srv:/export/p5
> > > > > 
> > > > > in section 1, I can immediately change into /base/data/p2 and it is
> > > > > mounted.  All well.  But when I add an entry
> > > > > 
> > > > >       /p5 srv:/export/p5
> > > > > 
> > > > > to section 2, then this new entry is not accessible as
> > > > > /base/data/others/p5 even after a `systemctl reload autofs`.  autofs
> > > > > has
> > > > > to be completely restarted.  Unfortunately we've had many issues
> > > > > (crashes) with clusterjobs accessing NFS shares during autofs
> > > > > restarts.
> > > > > That's why we'd like to avoid complete autofs restart whenever
> > > > > possible.
> > > > 
> > > > Yes, on restart there is a window of time where automounting won't
> > > > be happening.
> > > > 
> > > > That can be a problem and there's little I can do about it
> > > > but existing mounts should continue to function fine.
> > > > 
> > > > If you have an environment that's busy enough to get caught by
> > > > this then you have no choice but to avoid restarts.
> > > 
> > > I wouldn't have problems avoiding starts if the reload refreshed the
> > > multi-mount maps.
> > 
> > Tell me more about the topology of your multi-mount map entries?
> > Perhaps you could use a direct mount map instead for these entries,
> > they should update fine on reload?
> > 
> > The problem you may have is that the paths can't be within an
> > indirect mount as the multi-mount entries.
> 
> I will send you the topology and the concrete automounter maps to your 
> personal mailbos assuming that you agree to non-disclosure.  Our data 
> privacy rules are quite strict.

Of course, I always keep anything provided personally between
myself and the one who shared the information unless otherwise
agreed.

> 
> 
> > > > > Can you confirm that multi-maps are not updated by autofs reloads
> > > > > and/or
> > > > > is there a way to achieve this?
> > > > 
> > > > I call these multi-mounts because there's a different construct
> > > > I call multi-maps.
> > > 
> > > the autofs(5) manpage calls them "multi-map" in the "EXAMPLES" section
> > > and "multi-mount map" in the "FEATURES" section.  That might be a point
> > > for the "Future changes to documentation" thread?
> > 
> > Yes, I see that, I'll fix that.
> > 
> > Ian
> > 
> 
> frank
> 
> 

