Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D15135B2E6
	for <lists+autofs@lfdr.de>; Sun, 11 Apr 2021 11:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235281AbhDKJvj (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Apr 2021 05:51:39 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53273 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229804AbhDKJvi (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Apr 2021 05:51:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 364A2134A;
        Sun, 11 Apr 2021 05:51:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 11 Apr 2021 05:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        zm1/SPeeMr0ItvH4XFJrHUQVqQsMlbM5l9T3PeMH9+4=; b=xU6oQoqLhZaJAjZo
        TWRslW+DRmaeZCzueFrM+8jL3bZGoA3TK5kFm/t4QIpM7OnLIpyBMrCn8yf4+uzs
        dn9FuiPrx+lMzDsMRungkqCHQWocVeDBSMp8mC4wI2DTMkP3nWDIrf3Y75cfyUFq
        AFwxVOc/NSviAJRV3+MFv+vg+MKsrzEfFzXIfu6tdV0lRNOiHHB6LmwpmEyi1iUL
        mdszK8xo0qewQKHuq+38I9oK/r8rOyPRgDnvJMp5bQFh0QsYIABaOUwLn367Hy9t
        yGDV7mS0HA2AVKRKeUzQGWzNJRivywgcbDU9GKuKjYyvRRnzAjgEBHo/6kD8Rnrk
        rSPxCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=zm1/SPeeMr0ItvH4XFJrHUQVqQsMlbM5l9T3PeMH9
        +4=; b=J/Lr7aZitdXQ94q6cKja9RcdWY7G4oG1xTmmgoC/TtFn4x397wlQLfl0W
        A6pqQ5i6XCVBNwMFH7qn7DQDjz/JtiOJ8Tzlu1z/iPqTUyBZ6j7JO7zFtMrwJwOp
        V8jQjA8xZb143N5SQcvPNsLnHp0MZ6hE/tKITurmTogC6iDrlvrDDOd6hMGrezBp
        dzBZkJTZpfi7g4+RgOBrPQxn/bfV3YihWOy1nruxn5FdI35yhmviEn0WRCIUsPvh
        emSO5LLKj2ynRaiJl+fRAG2dxYVBEK0WQNXtQDghtGBwsz4MiMsptwA/dbTi/97Y
        GF9PGCQGbMK9iBhuOMySY9Nk49/PQ==
X-ME-Sender: <xms:mcZyYGC5BDSusJRvnpvc7aAmUMdjtVV38SO_q8Mnf0U-fe7pCv9tsQ>
    <xme:mcZyYAhKBdHiIhZLDkzxyJG103d5plXcmpP5uamP1wKJjkthZm_kHL_XI4ZGw0yhq
    He7xSab7y0N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekgedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghn
    ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnh
    epfeefteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecu
    kfhppeduvddurdeggedrudeguddrjeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:mcZyYJkNhObfHJPO8L0nQPDcmvU1SyzncfubTXuDTeibNP50eWNCxw>
    <xmx:mcZyYEysYEZqo67yTy3_SS4FzISmrJfReZP1CLryLDqaYT3iNmJBPg>
    <xmx:mcZyYLRoScyWt04homKby8ElR8ENaiW1bx-Gcxcp7jBt_7ZaMBdjsw>
    <xmx:mcZyYOO1lVWCSNiZYbg67lwvX3dOBNkZnl6Cp93jEgjZpKeZH-hCOw>
Received: from mickey.themaw.net (unknown [121.44.141.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1B5511080054;
        Sun, 11 Apr 2021 05:51:19 -0400 (EDT)
Message-ID: <93d635ff8c3a74705a063290b8e9a63d0a0bb955.camel@themaw.net>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
From:   Ian Kent <raven@themaw.net>
To:     Mike Marion <mmarion@qualcomm.com>
Cc:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Date:   Sun, 11 Apr 2021 17:51:16 +0800
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

I tried this with a couple of different paths, the paths in the
example above and another set.

In both cases the umount was performed followed by the mount
without problem.

That doesn't men that this won't happen for other paths or even
these paths on some other system, it just means that the procedure
to reproduce it can't reliably used.

I used direct mounts and assumed you were too, is that right?

Anyway, this does imply that a policy on what to do for busy mounts
is needed possibly more so than umount/mount ordering enforcement
which will be a bit difficult and I would probably want to use code
that's not yet in a release. That's because of the annoying ordering
of operations (mounts and umounts) that's a continual problem, much
more than you would think and much more than it should be.

> 
> and usually requires manual intervention to kick loose nested bits.
> 
> I'd love to see re-reads parse the map, save the new paths, parse the
> removals, then add the new paths after removing/umounting removed
> paths.

Yeah, it isn't quite that simple I think.

Ian

