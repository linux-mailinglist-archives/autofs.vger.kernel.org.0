Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 945AC1FEA3
	for <lists+autofs@lfdr.de>; Thu, 16 May 2019 06:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfEPE6Y (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 16 May 2019 00:58:24 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44637 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfEPE6Y (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 16 May 2019 00:58:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 259253B0;
        Thu, 16 May 2019 00:58:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 16 May 2019 00:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        JjKu8lsyP7vLXxKARe+GYWZMCFFmFpCrDaEHZoIbfTc=; b=rZA3xV2i2yxK/Hy0
        oG7kLlC+ZWNMBCvjrMLnTI2tlBS6IBI7ZQ/a9bjzzodmTyX6joxfwjC1xGZTcAw4
        JwyYVyXb/Of+riPssDHkRwwWw5VXA4IVqWol7z/owoH91HI5g1W/5Q9qidq5L32n
        zsKP1XocQ1gphFwpsQt+uXrYcYJYBlea7pJerhvTA7JGC2zUw3cYTlO2IQdeEVFQ
        nCy+bmXhomDBq+eo6zXDLAR8M+Rn35/hgyYftMYq9zREKnjrzgccXhqVUX/48zLq
        vn8ucWhGOb434GQHwDcd7dkznFTc2o8eXB1ApHXMVvrUMj5DDq2f15YyvdbVHoB5
        KcL65Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=JjKu8lsyP7vLXxKARe+GYWZMCFFmFpCrDaEHZoIbf
        Tc=; b=kIK8TRWBRnHqoGAJLZrckAMV8wBna7/IX67hXiAgssPOSL8u1bPt3BSUc
        SDqTqMiWobfFeIF9hyamBchvo7qGopBLO5IQGu3MiKIz7e616bEkzW4lbFABnL4K
        /kPR4Ktiekip5T8X4tD8KDdkX5lyeDQ/zJOkzw0L92NNDJL6GKfb4S4qGs7p2BBo
        reqPp1dsSBcgAam1IjwMmlUoXE5hJahP+wV++oYSkJklph1dS30vwIRIdhqc41yv
        l5x2mcAMNSL4GpT1ChCdL/lmqlOebW/VWnr8DsVepz0d3q8Try2cQ7M3tuJFPLy3
        wf5+81qStOx7vb+2Nzbh2vzxIUOJA==
X-ME-Sender: <xms:7O3cXEGmiB7-waxCCTuiWg9SK_Ojmy0TRvMBUdSrpUEYopHLz6JCfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleelgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtofgggfesthejre
    dtredtjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucfkphepuddukedrvddtkedrheeirdduuddvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7O3cXJocJCm0YNtXGFVsf0-f-AXBJatLLcu3PLI8rjpqZSiUdfahNQ>
    <xmx:7O3cXA6TCe8p_gYTXFrFB2e6rpBhipErePVku2Flzn_1ZSItVt_E3A>
    <xmx:7O3cXH7Qre6zjslcA-nVEAEYL0tiNlYYpLRpTUskxP58gXURsRtPfQ>
    <xmx:7O3cXPyoEjNZ2RQV-ZTONPEZq8xtVZJQmDqfB0OWFGSeVH_fMYBh0g>
Received: from pluto.themaw.net (unknown [118.208.56.112])
        by mail.messagingengine.com (Postfix) with ESMTPA id B1B811037C;
        Thu, 16 May 2019 00:58:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id 4D98B1C0154;
        Thu, 16 May 2019 12:58:15 +0800 (AWST)
Message-ID: <309672538baaec7b1c6ebfd9026ac93a64bd0efd.camel@themaw.net>
Subject: Re: Changes in indirect multi-maps don't become effective w/o
 autofs restart
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <list.autofs@drosera.ch>, autofs@vger.kernel.org
Date:   Thu, 16 May 2019 12:58:15 +0800
In-Reply-To: <93d8c49815cc059c80bd43493e8a3e0a7a79c8e0.camel@themaw.net>
References: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
         <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
         <93d8c49815cc059c80bd43493e8a3e0a7a79c8e0.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-05-16 at 09:28 +0800, Ian Kent wrote:
> On Thu, 2019-05-16 at 09:01 +0800, Ian Kent wrote:
> > 
> > > We are running autofs-5.0.7-70.el7_4.1.x86_64 on CentOS 7.4.1708 and we 
> > > cannot update to newer CentOS releases due to other restrictions 
> > > (special hardware/drivers).
> > 
> > Mmm ... CentOS 7.4, that's a while ago so I'm not sure if the
> > changes are present but I suspect they are.
> > 
> > So it's likely the changes made for this are not working properly.
> > 
> > I'll check if the changes are present (it will take a while as
> > I'll need to track down what those changes were first) and try
> > to duplicate it to see what's going on.
> 
> Yes, that's not working properly even with the current upstream
> code.
> 
> I'll look further into it.

I can't find the changes I was thinking of but I did find some
changes I did for updating the internal hosts map on re-read
since this map essentially turns the list of exports into a
multi-mount map entry for each host.

I think that I did that to see how it would go and was planning
of going further with it if there were no adverse reports.

But looking at it again now, in spite of not seeing reported
problems with it, I'm very reluctant to do it for multi-mounts
in general.

The problem with updating multi-mounts is it's very easy to get
problems similar to the dead mount problem you've recently already
encountered due to mount dependencies within the mount tree.

For example if you have:

ent \
	/s1	   <server>:/<path1> \
	/s1/s2/s3  <server>:/<path2>

and it changes to:

ent \
	/s1	   <server>:/<path1> \
	/s1/s2	   <server>:/<path3> \
	/s1/s2/s3  <server>:/<path2>

then I need to ensure that the mount trigger mounted on <base>/s1/s2/s3
is umounted before mounting the mount trigger on <base>/s1/s2 and then
remount the mount trigger on <base>/s1/s2/s3.

If there's an actual mount on <base>/s1/s2/s3 you can't do the update
for this offset until the real mount gets umounted leading to partially
updated multi-mounts that don't look like the updated map should and
might not be able to be reverted to behave like the original either.

Ian

