Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC9A35910D
	for <lists+autofs@lfdr.de>; Fri,  9 Apr 2021 02:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhDIAur (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 8 Apr 2021 20:50:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37633 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232984AbhDIAup (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 8 Apr 2021 20:50:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 540AE5C00EF;
        Thu,  8 Apr 2021 20:50:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 08 Apr 2021 20:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        ZYiNnHYh1xHg3aMfNrztGeMLZ3FYJrey/un0RHNrj1M=; b=197Czd4w2YMDr4SM
        HGEbpR5CldfmYdq9iyBYMDLCOeRqTj/oDPKjzTrf0VssY9C6AhF1FpIWf12Dakrt
        090U1OBLAjk2hWndRSpV4d2t7QZvfdqA1Al10OvNFCSTtHT+NYgqvek7YFfQnMJe
        WPCinuR8WunXvKz6btzDjONtK0zY1IVnPt0RJaauceDm2sLSW3aY2Pg56w6cSisw
        r0aPlAbYzmz7MLn9bE23eukW11GoLdb3I3X1a7R3yPs1DYgd9JsVytqU/VUFRkmJ
        2epc4P1j5UCrtHvB/wsqN7rvZzG7iC6NUbt6KR2K49tNvCcXHZrZPJLlXPD5J0mx
        9gIZhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=ZYiNnHYh1xHg3aMfNrztGeMLZ3FYJrey/un0RHNrj
        1M=; b=ZE+ETWAlSTDYsvMo3JuzyAGbubLnx/6RtPHQMAktHvRbEdYZqu/bsZjqZ
        pIaeceA0uzGAdbijSsYdgmJ1WmI/ctKKydm7B/Ud9Vlfozu8L5Jhd/4eLZdfF0dz
        YhI6pqOL5xLQQgkHbO+VCZXOQmRF82nmJG+bt1jUQhuyqmMKkOenNhu1cA8uSBCl
        vMkgGKh068W4neycEUuhwGq476pnbRrxNxWtws8WGG0bXbCMNdYNHH0q97E1TH91
        XE3uai558RJvfck5Ph6YpzbHUgeWXTIe7NrtbhjsKcwGl/EJ1mWQNNHpaYFt/yxU
        bCrXWU01lE9g0xQEEczSlAIjSD1vQ==
X-ME-Sender: <xms:2KRvYH_3R_7coVa6CtJqdhy6Z1OHTO0sXax2CpfX_hJZ0Uk3QN_Z3Q>
    <xme:2KRvYDuXCoCMe0FyV_kVMAGIQ4qVf6_8V5mVY84ooSToTHvSwO7GHTEklFfUg-uNW
    TZctfHQUizN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepfeefteetvdeguddvveefveeftedtffduudehue
    eihfeuvefgveehffeludeggfejnecukfhppeduvddurdeggedrudeggedrudeiudenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:2KRvYFC-JZQuz24Utz1kPAj7nAQk6CSVht5LyR4NQdpMzPwAS1wmlg>
    <xmx:2KRvYDdUsRPu78lngvi2q1e8G19YgwTHevf8QJAZlLuUYOBxPk21Ag>
    <xmx:2KRvYMMJIkWDT40pHRZE1bGdka8xe_-2jrtF2aWSgvn55k3seyMa1g>
    <xmx:2aRvYCYzqqwAEgXr4AEsNK84PjXpmLG7zSpACgPif5wBbK10aZWXmw>
Received: from mickey.themaw.net (unknown [121.44.144.161])
        by mail.messagingengine.com (Postfix) with ESMTPA id B9E9024005A;
        Thu,  8 Apr 2021 20:50:31 -0400 (EDT)
Message-ID: <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Date:   Fri, 09 Apr 2021 08:50:27 +0800
In-Reply-To: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2021-04-08 at 19:50 +0200, Frank Thommen wrote:
> Dear all,
> 
> I have problems "submounting" a share when using direct mounts.
> Given 
> the following automounter tables:
> 
> /etc/auto.master:
> -----------------------------------
> /-  /etc/auto.groups
> 
> 
> /etc/auto.groups
> -----------------------------------
> /groups/group1/int        server:/export/group1
> /groups/group1/int/svc/a  server2:/export/service_a
> /groups/group2/int        server2:/export/group2
> /groups/group3/int        server:/export/group3
> [... ca. 100 entries here ...]
> 
> 
> /groups/group1/int/svc/a is not mounted and I get the error message 
> "do_mount_autofs_direct: failed to create mount directory 
> /groups/group1/int/svc/a" on any host which doesn not have root 
> permissions (no_root_squash) on server:/export/group1 (which is on
> 99% 
> of all clients).

autofs won't (shouldn't) create directories in remote file systems
to perform mounts, it requires they are already present.

> 
> The directory "svc/a" has been created on server:/export/group1, so 
> there is no need to recreate it.

Which you have done.
Presumably the permissions are ok?

I haven't looked at this case for a very long time but I'm pretty
sure nesting isn't allowed in direct mount maps (with any map type
really). I'm also pretty sure I don't test for nesting in direct
mount maps (quite difficult to do) and fail the trigger mount.

If you need to nest mounts your supposed to use offsets in the
mount entry (with both direct or indirect maps).

For example:
/groups/group1/int  /       server:/export/group1
                    /svc/a  server2:/export/service_a

where the "/" for the root offset is optional but may help with
map readability.

I've not seen problem reports like this from direct mount map users
so I'm pretty sure nesting isn't normally used so I'm not sure it
will work properly.

However the testing I use does include pass/fail tests for direct
mount map entries with offsets so it should work.

There could unfixed problems with the version of autofs you are using
which we would need to look at separately. 

> 
> There are additional subdirectories in /groups/group1/int/svc/ which 
> directly reside on server:/export/group1.  Only "a" need to be
> mounted 
> from a second location.

I think this should work fine using an offset as described above.

Those other directories are present in the mount that contains the
offset trigger so it should appear the same as you were hoping the
original map entry would except that by using an offset the expire
should now work.

> 
> 
> Can this be solved with direct mounts?  How?  We would prefer to use 
> direct mounts, as this has shown to create the least problems when 
> dynamically changing the mount tables (no automounter restart is 
> required).  However I would not have a problem to use some indirect 
> mount mechanism for /groups/group1/int/svc/a as long as the main 
> /groups/groupN/int can stay in a direct mount table.

But you do need to do a reload for the direct mount triggers to
be updated, right?

Ian

