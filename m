Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8225D2677B1
	for <lists+autofs@lfdr.de>; Sat, 12 Sep 2020 06:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgILEW5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 12 Sep 2020 00:22:57 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42105 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725795AbgILEW4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 12 Sep 2020 00:22:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id D4FEB96B;
        Sat, 12 Sep 2020 00:22:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 12 Sep 2020 00:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        yCbcsfNitn34HgeFNb0ztbQoQSDW5mBOXQ4UCNMvntU=; b=SLJrK8FfZfQ8K7/C
        l9t7jaBNerWbMlCdagR28SAHAL4/7veA6/pKnWtXn2LPCXmfZBV/KyV9RQbJZvFN
        Kq56WOdUuXx4A+EcI2NIr2veWWC6VK+sjkiP5tx8paI8zUf14xqBm5wJWtrOdNTf
        W/hvcO+5IZdTWOJAJUOLreWDDivnzBeu/d2bRMFqnmjxNlE2VL3oJlM4mXG8ZJXz
        uMhQadpi21mZOoMAHnh7EVl4kCxqFlTV4f4wHiHxebSFpIHxIMtX/sjP27aJVMd9
        x0ooRpjOUBkZSV48lHNU/Rv/VIwmxh+B8yz1wmN98NudQvR/To4zpw0Tsz7Evxg8
        9LSqQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=yCbcsfNitn34HgeFNb0ztbQoQSDW5mBOXQ4UCNMvn
        tU=; b=MMIZ17qkAiI3THcb6rTGiXRbUkzyn2d75x9GpUZdWO2OMJWt8YQ7P0C3c
        GPZ0TgUD/rcziafrpEFSibVPfVdNQEB8n7AgIAesdbQwnCHFnT2izxKkZUApObWH
        xQQu/lXkfLuG54muE6SjiWPVXBNSyoxhom+Erw0rQhgx0Nfzxmp9VSJv1s0mLODc
        xpS6SQuizZ3snjOUATznBdhzXr7noRRTK4GE3/Z6rZhfXlOl3MCRnh/mxjwJn5pH
        Txl5fSUfOYQHMKv9QaTpPwzyiazV15KBkf8t8QYVX7Uaz4yOlVFQEoCIL42PA3Pe
        nncc0wIcPrWqtaVP8rIRXzAlHQzlw==
X-ME-Sender: <xms:H01cX_YX6__2WTznQ5nADhjNkSN0lkulWFX-HkV0L8MwaXDGQc6ICw>
    <xme:H01cX-ZTXuHjJBa3bFrOB4Uu7VbQV5y1Dz1WgMe5vd3y_oOBWvGtczCQPOWJbB1YC
    LdNn9_Q-zNi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeitddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepkeduvdeutdfgfffhueeggfetieevhfevheelvd
    ejjedukedvhfffledufeefuddvnecuffhomhgrihhnpegrrhgthhhlihhnuhigrdhorhhg
    necukfhppedutdeirdeiledrvdefledrudegjeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:H01cXx-18neV3faLDqo3aYFOx7xlXMhIV2tHfqDhbSUSCZdHQKftlw>
    <xmx:H01cX1pkiEA2CEt-FkUOcEXAfO_NjbARwY0Np0RMaI7FG3A5FfE5iQ>
    <xmx:H01cX6pad8_J2IlUlb5u4DlBUDPy8orlEFwAyQgzMTdWwuZ5SLfQBA>
    <xmx:H01cX31LDs7CPQr3WX9sCiOn5EnHlYod4ITWywG0X0xpN5-S2MLN1w>
Received: from mickey.themaw.net (106-69-239-147.dyn.iinet.net.au [106.69.239.147])
        by mail.messagingengine.com (Postfix) with ESMTPA id 04D0E3064682;
        Sat, 12 Sep 2020 00:22:53 -0400 (EDT)
Message-ID: <8bd1add99eab26f7a5f05ae4f57ed19113429fa8.camel@themaw.net>
Subject: Re: sshfs mount option, 'nonempty', causing mount/connection fails:
 "No such file or directory". still a valid option?
From:   Ian Kent <raven@themaw.net>
To:     pgnet.dev@gmail.com, autofs@vger.kernel.org
Date:   Sat, 12 Sep 2020 12:22:51 +0800
In-Reply-To: <60786168-f6dc-60f1-90e7-c37e65f4ec8e@gmail.com>
References: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
         <97d2b7ab490288a8d45c7463ef8a5609842a136d.camel@themaw.net>
         <c7af3932-6de6-a0a5-285a-e20ee92ffd95@gmail.com>
         <60786168-f6dc-60f1-90e7-c37e65f4ec8e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2020-09-11 at 19:02 -0700, PGNet Dev wrote:
> fyi,
> 
> here, on Fedora32
> 
> 	rpm -qa | grep ^fuse | sort
> 		fuse-2.9.9-9.fc32.x86_64
> 		fuse3-3.9.1-1.fc32.x86_64
> 		fuse3-libs-3.9.1-1.fc32.x86_64
> 		fuse-common-3.9.1-1.fc32.x86_64
> 		fuse-libs-2.9.9-9.fc32.x86_64
> 		fuse-sshfs-3.7.0-3.fc32.x86_64
> 
> 		
> man mount.fuse
> 	...
> 	nonempty
> 	      Allows mounts over a non-empty file or directory. By
> default these  mounts are rejected to prevent accidental covering up
> of data, which could for example prevent automatic backup.
> 	...
> 
> reading
> 
> 	[SOLVED] cannot mount sshfs with "nonempty" option
> 		https://bbs.archlinux.org/viewtopic.php?id=228225
> 
> 		"The "nonempty" option has been removed from libfuse
> since version 3.0.0 to bring fuse "in-line with the behavior of the
> regular mount command".
> 
> 		In version 2.9-1 the sshfs binary links against libfuse
> 2.9.7, the new version links against libfuse 3.1.0."
> 
> 		...
> 
> 		"TL;DR: You can just remove the nonempty mount option,
> it is the default behaviour now."
> 
> 
> iiuc, looks like
> 
>  (1) the Fedora man needs updating

It does, yes.

>  (2) the 'nonempty' option is deprecated, and is functionally the
> default
> 
> perhaps a more informative error is called for?  may be too far gone
> ...

For autofs that improved error message needs to come from the mount,
which I think should be calling mount.fuse, which should know full
well to issue a warning and ignore it.

Ian

