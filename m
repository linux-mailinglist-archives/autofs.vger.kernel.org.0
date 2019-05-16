Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9473E1FD47
	for <lists+autofs@lfdr.de>; Thu, 16 May 2019 03:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfEPBqd (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 15 May 2019 21:46:33 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35889 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726290AbfEPBBM (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 15 May 2019 21:01:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C99E025A49;
        Wed, 15 May 2019 21:01:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 15 May 2019 21:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        1tmyu7oO7MkM8Mw3ja6UoN0haGShenyCm6hkKavwjIs=; b=L0Qd/6Wlv4qdUGcT
        uRbUXr7oGA6zgMco0uhWnLJT7m81K1UhhSG0NyCbmvkSoaVbhFoXNEJ7+pkL2bzp
        CARtJP/2jQILCpYmCK2pRAhZkySz6qqt0OIljTY5AGne1XbYrv5CRnIy96du9fWy
        xTnBIynEdqTww1yEqeMvytB1zFuRIO9t2QwlqX4pKtWTd88tJ0DOhvwirePV/Xk0
        b1I/3xKzq3vE2ovN/yrMIdBULDCvYjI6AqynTwwnWHC8KwK7wnBccOpVvb2k7EFa
        4ya6ihMHkTOIEGAgB2RQrn+VDiMi7i94PkM6AtD6AIV9+eUIpM+p48OBQ8Dt3QRM
        xV6g9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=1tmyu7oO7MkM8Mw3ja6UoN0haGShenyCm6hkKavwj
        Is=; b=IE5xm79at45LY2hPevIeOPVEgmSFACS2/3YfJ/jSESwSdSF3U7oIXh8FT
        4/HBIddUgeK9FUVr3bV6VA8g235XzTAM6JmO5bmt55fnO1RbYCjwjfoBvnTNa+o1
        HD3G7VHnZFJ/xREmbLBEQb0DhNG7EvXHFgPSPCzMTkluY1eCl4I5Slwhd6FmhvWh
        pTapVET5LVO5mQABdPZ5dk5E14Y3nvOFIu2ncZJQkYtgx/vUG/LL/Bq/8D7ltjHe
        FF/lRqnzdIpj/uf756s9T1dWr+UblgLT7kH4RFBRfJqjyhreBnNA5zdguq6ejOGk
        C3hUn3CCmLXbuFcn5TExLjbGd8PFQ==
X-ME-Sender: <xms:V7bcXOFTisjms1OJVK0knSX2R4N9UtdhXbLZlBnT2ViSqxAD9WPEGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleelgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtofgggfesthejre
    dtredtjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucfkphepuddukedrvddtkedrheeirdduuddvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:V7bcXAHmIF34t-f3jFs4oQQvOFV9HcfRgAQGJo9kNXvPRJXVqKwJrA>
    <xmx:V7bcXBAEWEqq3RbC4rH7jX8AE6bWjkWSaOQ8mBYxurxm4MEkUe26fA>
    <xmx:V7bcXP-wfp8PU4PNuLn6L8P4LNG9mQ5gp0zzMc9PgRJI5LzDozoQSA>
    <xmx:V7bcXOhEFzgRW_QCKilwU1kVDmaLwXUJpIcRjNnlnSEqh66mYrZ0zg>
Received: from pluto.themaw.net (unknown [118.208.56.112])
        by mail.messagingengine.com (Postfix) with ESMTPA id C0D0D80068;
        Wed, 15 May 2019 21:01:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id 3093D1C0133;
        Thu, 16 May 2019 09:01:06 +0800 (AWST)
Message-ID: <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
Subject: Re: Changes in indirect multi-maps don't become effective w/o
 autofs restart
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <list.autofs@drosera.ch>, autofs@vger.kernel.org
Date:   Thu, 16 May 2019 09:01:06 +0800
In-Reply-To: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
References: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2019-05-15 at 18:00 +0200, Frank Thommen wrote:
> Dear all,
> 
> the autofs manpages says:
> 
> "If  an  indirect  map  is modified then the change will become 
> effective immediately.  If an indirect map uses the browse option, the 
> master map contains direct mount maps or the auto.master map is modified 
> then the autofs service control reload action must be rerun to activate 
> the changes."
> 
> However this doesn't seem true when using multi-maps:
> 
> In /etc/auto.master:
> 
>      /base/data /etc/auto.data
> 
> 
> In /etc/auto.data:
> 
>     # section 1
>     #
>     p1  -fstype=nfs,vers=3,sec=sys  srv:/export/p1
>     p2  -fstype=nfs,vers=3,sec=sys  srv:/export/p2
> 
>     # section 2
>     #
>     others   -fstype=nfs,vers=3,sec=sys \
>        /p3   srv:/export/p2 \
>        /p4   srv:/export/p4
> 
> When adding an entry
> 
>     p5  -fstype=nfs,vers=3,sec=sys  srv:/export/p5
> 
> in section 1, I can immediately change into /base/data/p2 and it is 
> mounted.  All well.  But when I add an entry
> 
>     /p5 srv:/export/p5
> 
> to section 2, then this new entry is not accessible as 
> /base/data/others/p5 even after a `systemctl reload autofs`.  autofs has 
> to be completely restarted.  Unfortunately we've had many issues 
> (crashes) with clusterjobs accessing NFS shares during autofs restarts. 
> That's why we'd like to avoid complete autofs restart whenever possible.

Yes, on restart there is a window of time where automounting won't
be happening.

That can be a problem and there's little I can do about it
but existing mounts should continue to function fine.

If you have an environment that's busy enough to get caught by
this then you have no choice but to avoid restarts.

> 
> Can you confirm that multi-maps are not updated by autofs reloads and/or 
> is there a way to achieve this?

I call these multi-mounts because there's a different construct
I call multi-maps.

Anyway, for a very long time an active (ie. currently mounted)
multi-mount would be ignored on map update requests because of
potential problems with mount dependencies.

A while ago I did try hard to improve this and allow multi-mount
map entries to be updated on reload and, for the cases I tested,
it seemed to function.

But other subsequent changes could have affected this or the
version of autofs might not have those changes.

> 
> We are running autofs-5.0.7-70.el7_4.1.x86_64 on CentOS 7.4.1708 and we 
> cannot update to newer CentOS releases due to other restrictions 
> (special hardware/drivers).

Mmm ... CentOS 7.4, that's a while ago so I'm not sure if the
changes are present but I suspect they are.

So it's likely the changes made for this are not working properly.

I'll check if the changes are present (it will take a while as
I'll need to track down what those changes were first) and try
to duplicate it to see what's going on.

Ian

