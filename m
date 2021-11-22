Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4AF458F2E
	for <lists+autofs@lfdr.de>; Mon, 22 Nov 2021 14:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhKVNO2 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 22 Nov 2021 08:14:28 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:51983 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230322AbhKVNO2 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 22 Nov 2021 08:14:28 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 615E15C0043;
        Mon, 22 Nov 2021 08:11:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 22 Nov 2021 08:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        bDVRdKGhy/R+l1LJ79/7ohgdCKLpI69lpsrLYLaT0r0=; b=RolzW7mhw0l+29P3
        Qrk9kxAvP/kT7syM+wUSA7kYLwCjrlGE8Tn74PuK97yIlPPqsTyt6i9i730jHEwr
        BJ4OoNHNir7WDbFjeDO4huOHu7+FooT6RtrdRgXtj6K58VNi3Ad+/1WWehxOprsu
        ncAuJFCHjnHPkCs72//4Ik3w7eu7c9Dl4VS1KAkVk+nZDA5CcY5UBsZ1KMt69gcl
        5EaFGwVcTKvB9AzCsAGJ5mZ6vOaPmda8sA7xoZJybhNKMr1c0yKJE3EvGiD3Oe47
        aqLBVk4KqbZnQWOeSscH+mNW6Lcal6DCdsBeN3BGbxkVBO776sRtmgmCBrWfY0v4
        CUW8OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=bDVRdKGhy/R+l1LJ79/7ohgdCKLpI69lpsrLYLaT0
        r0=; b=moxxF76GVxmMJtXRvLUMwsFUlMqadAGfEC2J4RNfZYmR2hcS+faSpSd34
        YcSAHXhNdEZX/mMvT4vhIdv3fwmsegZf4PFDBZo6WrBOH2/fpsCaDLxMQF5PnyKe
        Nf4tF+ufSGJpH9A31SAOnsII9uJa6j0ThNKSy5f+9o/jr5g8HdyW0nhMuSyOb7UN
        kc6aWZUI/JIyD/e2JXU+aMnifHtD7R/YpLWBQWf3ESus4Xkyex7IlNNaXRhpHOXV
        LhAIFZEsLY470vJu9rKJqWOG3KSi4gA6vCMSCBCkSD8Fl5zibT8Jf7dD+jwAUy6S
        IPqTF+7G3iz5UN3iRUyQEtbi4yvnQ==
X-ME-Sender: <xms:-JabYWAIvqHkN-6Wrl8Xis6UDio-2hs26sXQIbSwOxsw33401101rQ>
    <xme:-JabYQjt5dmC-69Y0157uakc0K-RaLJhe9JimVGVweheYm17N3YtodvRucUwBtohz
    lAncXwHiVPL>
X-ME-Received: <xmr:-JabYZl0m8S2uBMMvaVDaovgx0_mnbXSLvbgv3ayTYrdjE0Asri4O-yPbcaUs-XuhJDJPbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepgf
    elleekteehleegheeujeeuudfhueffgfelhefgvedthefhhffhhfdtudfgfeehnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:-ZabYUyH4dDcKdMLAJ0ZW_zrLklTa7VznBsZ9JE0Wni1aXPIu7-nWg>
    <xmx:-ZabYbSn6G0oouyDrQNnQNeJEV4siF3YQYIdK-YrjwRuHGaZnlbw_g>
    <xmx:-ZabYfa7kQUeqfumnXqMwrIBTzqXSQnqYVY44CqueXZ4CiT4JzVyBA>
    <xmx:-ZabYeO4x44qt5FfdfI5bQXrhaJpJhP7vb1mWK_ZghQllozt2v6o_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 08:11:19 -0500 (EST)
Message-ID: <ac3cb951784202d5cb61993715838e96191954de.camel@themaw.net>
Subject: Re: autofs 5.1.8 and TCP_REQUESTED
From:   Ian Kent <raven@themaw.net>
To:     Stanislav Levin <slev@altlinux.org>, autofs@vger.kernel.org
Date:   Mon, 22 Nov 2021 21:11:15 +0800
In-Reply-To: <a4a4facf-ad90-9f4c-6a38-b7ac132df34c@altlinux.org>
References: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
         <7550afb574d26b09ce68b39462a778ed244ece02.camel@themaw.net>
         <12697fd2f212d6be9658df6d5f56b34b854cf4c6.camel@themaw.net>
         <a4a4facf-ad90-9f4c-6a38-b7ac132df34c@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2021-11-22 at 13:44 +0300, Stanislav Levin wrote:
> Hello,
> 
> 18.11.2021 07:08, Ian Kent пишет:
> > On Sun, 2021-10-31 at 07:35 +0800, Ian Kent wrote:
> > 
> > Does this patch fix the problem you are seeing (note the CHANGELOG
> > hunk won't apply but should be straight forward to fix)?
> > 
> 
> The fix is verified.
> Thank you!

I'll get to committing it to the repo. soonish.

Thanks,
Ian

