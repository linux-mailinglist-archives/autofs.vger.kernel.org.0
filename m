Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8541C35AA02
	for <lists+autofs@lfdr.de>; Sat, 10 Apr 2021 03:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhDJBrI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 9 Apr 2021 21:47:08 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47511 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231946AbhDJBrI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 9 Apr 2021 21:47:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id BBB7AFE6;
        Fri,  9 Apr 2021 21:46:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 09 Apr 2021 21:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        wBDpWQjFUavTOx/FjY7GBGk31Arm83FsFFyUMYZO0qE=; b=2eeS1+7Ds+0WcAPQ
        ypgk8pkLqwh9bF3x8MYaAvUCODP0suQ+vnnNfQ+qtWvnFCMItH20dC0LW6jU9qz0
        R0sxx6/TbPcBHvTfKUhTe2GOxnKbQ0Rsog6mUKRWJHyTcq//y6qNeSVkeY2VxYkk
        Id9C60phyokbeKWWe4sTsgV5lzfwj0xfmfE30ioAAMetd4VXb/MVgi0lUSqnE3Dc
        gmibC+jz/CYUIHAPulbJlQdpjFe1vkXr2Rm7hLJrFbA40YmjG1Zymmz6bO9k5k6w
        hlI3RDQ91LVt6ETDbKVv9NsXxKRV4KsKJQO/kZACrIixA9Dapebhfx3KFW5NEmXG
        Ap0AoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=wBDpWQjFUavTOx/FjY7GBGk31Arm83FsFFyUMYZO0
        qE=; b=dPylucaFLmJljLiODFr3T8xSxyA06S9qTmoCvdnTEmXl1tlCB7inLI6mb
        sR/eHPpW7E/6HdgYFwFO/+TE4kukCTCNcBYiVvwbU/AjzaqgdeuYugKXXQQHgvoc
        R+MurQSHmPWOu3pfPvWx0JdEy1PI6jfjrRZLhOuCyBQ+n7f6gVjIrK4JftyCtaw/
        Q39u2TpMvEaIofBLXuAml93dMOpN8AdrcQepALQTz9u80CQZQZ81BvBFpyS7J5/O
        CLKivGSHISGIXWZW9ZfNjtTjIcR290v0lRoc7GxdalIw2LwZwi9HLr34cabc6n1/
        /jrUUbYvDDzQIuErx0SXw2Ldv7Osg==
X-ME-Sender: <xms:jQNxYKbEWm5RAjM_IPpBmn7uJ0vJLvHufB7-yLNVlzb0RmV0Wvuavg>
    <xme:jQNxYNb6UA5x3t-kENyldDjf3ilvnbgLrJcYL5K6Q5eRe-ayAnp9EerIO7o_MlIuO
    Bzwoa6SUj6Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekvddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucfk
    phepuddvuddrgeegrddugeegrdduiedunecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:jQNxYE9pf6JCGOJZfBeL8tUPrwTbZ6R7A6KJnc3MzO6mAoWqYfFaug>
    <xmx:jQNxYMo8lIQ8aJPL19mXBTAwc5LIP1N_2ic5wSN4-Ny-1GrC5rCHDg>
    <xmx:jQNxYFoiNxTRy3CZ5vEmSuCeiTs4h0Z0byur00eqb8qFc0himFnyDQ>
    <xmx:jQNxYHFy7b42KTLAt2p3A9G7lRF7uN0LbwSWuKl07UnTwxNMdn1ryw>
Received: from mickey.themaw.net (unknown [121.44.144.161])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8B0DE24005B;
        Fri,  9 Apr 2021 21:46:51 -0400 (EDT)
Message-ID: <0602c18ab85c99a98fe6c4f5e189f2f1c06508d0.camel@themaw.net>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
From:   Ian Kent <raven@themaw.net>
To:     Mike Marion <mmarion@qualcomm.com>
Cc:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Date:   Sat, 10 Apr 2021 09:46:47 +0800
In-Reply-To: <20210409234211.GB9279@qualcomm.com>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
         <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
         <20210409234211.GB9279@qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2021-04-09 at 16:42 -0700, Mike Marion wrote:
> On Fri, Apr 09, 2021 at 08:50:27AM +0800, Ian Kent wrote:
> 
> > I haven't looked at this case for a very long time but I'm pretty
> > sure nesting isn't allowed in direct mount maps (with any map type
> > really). I'm also pretty sure I don't test for nesting in direct
> > mount maps (quite difficult to do) and fail the trigger mount.
> 
> IME (or "Our" vs "My") I'd reiterate that nesting (as shown) does
> NOT 
> work.  In fact, it's a been a huge pain for us over the
> years.  We've 
> had to put seatbelts in place to avoid them being created in our
> maps 
> because it can mess with the paths when done or changed.  In fact, I 
> wrote up a long email once to send here and never did, about a
> suggest 
> changes to the logic to help with what we run into often.
> 
> We still have an issue when something happens such as there's a
> directory
> in the map of:
> /prj/foo
> and it needs to be broken up to multiple paths, such as;
> /prj/foo/bar
> /prj/foo/baz
> 
> The problem that arises for us is the people handling the filers and
> maps make that change in one fell swoop.  So what happens on hosts
> already running is the next re-read does logic like:
> - I see new paths /prj/foo/bar and /prj/foo/baz and mounts them as
> type
>   autofs
> - I see that /prj/foo is gone, I need to umount it..
> and the umount fails with:
> do_umount_autofs_direct: ask umount returned busy for /prj/foo
> 
> and usually requires manual intervention to kick loose nested bits.
> 
> I'd love to see re-reads parse the map, save the new paths, parse the
> removals, then add the new paths after removing/umounting removed
> paths.

It sounds simple to do but I think you would be surprised with the
sort of difficulties I would encounter.

But, if that was done, what would be the policy if /prj/foo was in
use, lazy umount /prj/foo mounts, ignore all changes at or below
/prj/foo until it's no longer in use, or something else?

I would be tempted to lazy umount things at or below /prj/foo, after
all they would be using stale paths and will eventually end up in
tears anyway, particularly if processes have open file handles on
paths within the mount.

Don't get me wrong, this does sound sensible and is something that
needs to be fixed, there's just those cases that cause me pain time
and time again that get in the road.

The other problem is I might use features that are as yet unreleased
(but in the current source tree) so that would complicate matters,
OTOH I might not need the new features and, other than the in use
policy, it might straight froward ...

Ian

