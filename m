Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 918EB28DAE
	for <lists+autofs@lfdr.de>; Fri, 24 May 2019 01:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388006AbfEWXQp (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 23 May 2019 19:16:45 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49601 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387981AbfEWXQp (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 23 May 2019 19:16:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 2945361B;
        Thu, 23 May 2019 19:16:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 23 May 2019 19:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        zJFJ9n43ZZ3C7lwZO6mQN8qO3P+soHxAlM4Z++hOzCY=; b=Zm/Z1oz7u02Pp5lI
        cBF2fCsbVU9pJcxHlJ36AxdXo8Dc9+ZCnlWC/O4sv/tnoXtiLYp9mA500xC1URUU
        BqEQkD2wvZZLloyZmYfDvKaKkWMdJ8Lw2iRsZp/li2Te4WZIHoyd7cmrvXxmdEE7
        CZX3rymsW9AGnjoazm5Kk47U2j7grpvBXJUSWfKLwCsyGLgD1eJYamkJnRP49gA/
        l0ajJFzDLfp5K/KaKqN2TEyQAzOj+ZqQtPegEuvherPjsKCPbmgfJ7et9azIFVvi
        F+2OB4JWMDYYaaMHz5g1F5GK2UYO6qw5Nd5Kt/m2O3sD3ITaC+ePTSnCVB4qihvA
        AEMhaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=zJFJ9n43ZZ3C7lwZO6mQN8qO3P+soHxAlM4Z++hOz
        CY=; b=Cu2CqXeuWeNzWOCWJPFFYbOFTViFbYoJEoTC1Ig8K0IfFLv64cNQQgeYm
        7hf+lWSRFx4kWb2txplV1dlsSBfGOtWSB1OtuGt75XkJjh32Af9PK+fwdle8MM2w
        waC5KBDtCTaDXybGKMurJjF5u0PXlXQAxSB3qNXIGVdEaN0zE15SfklaBE2sKtIy
        x31IjPL+wLdWkzMyDO9xqRwpeKvEdds4Iv5hhlLA1XziPHCruyCUBZX0ynNJx9qR
        bVRyiRzfjTkfGj7ngUOxhM9t6rkC7FjyBx5jOk95x0ikeBIQFAd55us/GEL3QtX2
        Cx+QjB7nE4jQq6gag+J6Qd0Yk06Ow==
X-ME-Sender: <xms:2innXGc01aMmG0vVVsZ9meTNZVkDFLzfoHU7sG2rqXQI0UBJNKEgMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduhedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtofgggfesthejredtredtjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucffohhmrghinheplhgruh
    hntghhphgrugdrnhgvthdpkhgvrhhnvghlrdhorhhgnecukfhppeduudekrddvtdelrddu
    jeekrdefheenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrd
    hnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:2innXHG-d5REyoPWQKD-_Et-KgDxoBsekSOG8nRkKaDsogjSmZBF4g>
    <xmx:2innXNy91Igdk09s-9iAum2Y-ikICdIRBl1gNPKQY8Z9wQKPFJ2kow>
    <xmx:2innXEXQ15_6lMdBEFuQY1_fPM1LZfvbGYOoVK8R1OL_r8ijFpkKhA>
    <xmx:2innXEu37Scnf8KY3dHmSEATlez6VcYiwHoly5pNpEzmaB6wY8VmEA>
Received: from pluto.themaw.net (unknown [118.209.178.35])
        by mail.messagingengine.com (Postfix) with ESMTPA id AE97B380086;
        Thu, 23 May 2019 19:16:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id 001931C0065;
        Fri, 24 May 2019 07:16:37 +0800 (AWST)
Message-ID: <7740bd6d332a7488f813e4579be311272e819e2f.camel@themaw.net>
Subject: Re: Old patch Ubuntu has been carrying since 2010
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Fri, 24 May 2019 07:16:37 +0800
In-Reply-To: <CANYNYEHDhrOuncbB2Rh+TRN=TUT28PGcPrKhVLZdeQk6KPMjVg@mail.gmail.com>
References: <CANYNYEHDhrOuncbB2Rh+TRN=TUT28PGcPrKhVLZdeQk6KPMjVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-05-23 at 17:22 -0300, Andreas Hasenack wrote:
> Hi,
> 
> I'm updating the autofs version in Ubuntu from 5.1.2 to 5.1.5, and as
> part of that process was looking over the patches we are carrying. I
> found this one:
> Author: Joel Ebel <jbebel@google.com>
> Bug-Ubuntu: https://launchpad.net/bugs/591100
> Description: Increase group buffer size geometrically rather than
> linearly when its found to be small.
> .
> This prevents package to eat the cpu if you have large groups.
> 
> --- a/lib/mounts.c
> +++ b/lib/mounts.c
> @@ -1245,7 +1245,7 @@
>         status = getgrgid_r(gid, pgr, gr_tmp, tmplen, ppgr);
>         if (status != ERANGE)
>             break;
> -       tmplen += grplen;
> +       tmplen *= 2;
>     }
> 
>     if (status || !pgr) {
> 
> That came from https://bugs.launchpad.net/ubuntu/+source/autofs5/+bug/591100,
> and the intention is to speed up the scenario where a user belongs to
> thousands of groups. grplen is 1024, and looping over getgrgid_r()
> hundreds of times took a while of high CPU usage.
> 
> The patch doesn't apply cleanly anymore, but the tmplen+=grplen code
> is still there. Would upstream be interested in adopting this change,
> or something like it?

Sure, I've added the patch below to my patch queue, it will get
committed at some point.

You might also be interested in checking if anything at
https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.6/
might be needed.

I have more patches, I'll post them for review on the autofs list
before committing them, some of those might be of interest to you
too.

If you run into problems ask here and I'll try and help out.

autofs-5.1.5 - Increase group buffer size geometrically

From: Joel Ebel <jbebel@google.com>

Increase group buffer size geometrically rather than linearly
when its found to be small.

This prevents package to eat the cpu if you have large groups.
---
 lib/mounts.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/mounts.c b/lib/mounts.c
index e4092d2f..5a8e8cdb 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1539,7 +1539,7 @@ void set_tsd_user_vars(unsigned int logopt, uid_t uid, gid_t gid)
 		status = getgrgid_r(gid, pgr, gr_tmp, tmplen, ppgr);
 		if (status != ERANGE)
 			break;
-		tmplen += grplen;
+		tmplen *= 2;
 
 		/* Don't tempt glibc to alloca() larger than is (likely)
 		 * available on the stack if limit-getgrgid-size is enabled.

