Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7981E495A33
	for <lists+autofs@lfdr.de>; Fri, 21 Jan 2022 07:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244811AbiAUG6k (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 21 Jan 2022 01:58:40 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36903 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240120AbiAUG6k (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 21 Jan 2022 01:58:40 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id B9691320231F;
        Fri, 21 Jan 2022 01:58:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 21 Jan 2022 01:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=SKseRVuJncHrtL
        0TcqSvYfCKK6OU5h4mHOt1b/8jBVU=; b=FaRVWA3f++Ab3v/ToL0dADsW51pO6X
        qbnHdvrU7B9gudCtE9WCvdxG/8SNj7eTHL0ZRcfGDrKAhNk/qe3SUDzUMcvIvQUe
        AQ1glzBdADrXGfqDpoLhijK7cFuh8OoQiVVJOm50k+nHeWp32fEvTklr9kjXqVIL
        5/QIn3vBDrfVJ8t1yh3RF4DcbAG1crRhpqMeCt6JbazOL4OWJZG7ip4raXp+w1+W
        n+jBvjT4cECltlvuhKOK05cJAZWCvK5OzA9LEH9q39anOq2UeHPfhgB6OEwncSd9
        aEEr+k9dxfVMhBtK+Cjkrb4y6IM25PeHWA+verK24/QNbe0tKaPb6JCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=SKseRVuJncHrtL0TcqSvYfCKK6OU5h4mHOt1b/8jBVU=; b=W8U23s3j
        VqyGqP/PbT3s9UnD5LKUA1e/OWJbFbchaq82pbJ1PevBNuvs+YZZw1PwoAV6Si17
        IlcU9vFOsRKCvemX2aVCko2l+3AzJLKOF/Y32DgIvscr3nsKgzBZtL5qV/MYcHqT
        D1Mz+Cyc/iReuJOVU5VWwWnTmJta+dHkveKDwVsg5x5Zk1MqouWML8P4o+zXRrk4
        Fl5PyJVFOMGEaiiye/ziH7UYovLVdTEP1l/2DzgeWtaweRrEWoGgsulZu2RzsiMq
        UcXUC9p9fBo31yHM2cZZ7j8VV8khQWpXanHP4O7P5oEUKS0u8Tfbp5rostbgiji2
        mgvF+JdqRjYZrg==
X-ME-Sender: <xms:n1nqYTTUiPG-w-SqjgpZhGW2TGRpjb0NsPcVvs7o17seq6tcFR4evQ>
    <xme:n1nqYUwuz8WWPrwUtNgHLInxkntZL6QviG3OoPyStAlGil-L93gP3uqbp7UNeB-bJ
    2v0NcJiX0Gg>
X-ME-Received: <xmr:n1nqYY1WP-oRyxL36CGLcTE0Birpnwkr5qTIJri0Cht2CAxu_2VyVjq-roUP0HxyKW41r8cK5az2AUryyO88HAFckiaLE9Spa1qhDttLYlw-TeNuHP2DpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderudenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ffledvtdelheevudevhfekjeefvdekteffueejtdduveeftdevheeuveeihfelffenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:n1nqYTD0mfnFrPh0pMl9Mkl1Ch5jcknreeFawvIkBdveYkYxlCBO-A>
    <xmx:n1nqYcjcc5DKjzbovWa40bJDhfjmlZiqFHXY4v648VIFlnzPxdzgoQ>
    <xmx:n1nqYXpN9xLfrIiXU_LyohF8ZGVFMg00K07IcUF51RSAggbRaIGgyg>
    <xmx:n1nqYadeNoLBybqCTJR5t89iBZzlpWoD-lqddGlSd2RiRWdoWO6_ag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jan 2022 01:58:37 -0500 (EST)
Message-ID: <25f3fdb0fff76a6d347c5e6e1f12d6c6dac40916.camel@themaw.net>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Fri, 21 Jan 2022 14:58:33 +0800
In-Reply-To: <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
         <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
         <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
         <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
         <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2022-01-20 at 14:55 -0300, Andreas Hasenack wrote:
> Hi again,
> 
> On Thu, Jan 20, 2022 at 10:16 AM Andreas Hasenack
> <andreas@canonical.com> wrote:
> > Something still feels wrong, though, and behaves differently from
> > 5.1.7.
> > 
> > I applied all your patches for 5.1.8, even unrelated ones, and
> > tried this:
> > # this would trigger the segfault in plain 5.1.8:
> > root@j-s390x:~# time ls -la /cifs/localhost/private
> > total 4
> > drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> > drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
> > -rwxr-xr-x 1 root root 64 Jan 19 13:02 hello-private.txt
> > 
> > real    0m0.130s
> > user    0m0.000s
> > sys     0m0.001s
> > root@j-s390x:~# time ls -la /cifs/localhost/pub
> > total 4
> > drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> > drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
> > -rwxr-xr-x 1 root root 63 Jan 19 13:02 hello-public.txt
> > 
> > real    0m0.014s
> > user    0m0.001s
> > sys     0m0.001s
> > 
> > # This is expected to fail, because I only have
> > /etc/creds/localhost,
> > not /etc/creds/127.0.0.1
> > root@j-s390x:~# time ls -la /cifs/127.0.0.1/private
> > ls: cannot access '/cifs/127.0.0.1/private': No such file or
> > directory
> > 
> > real    0m0.075s
> > user    0m0.000s
> > sys     0m0.001s
> > 
> > # but this hangs, and ls process goes into D state. With 5.1.7 it
> > works.
> > root@j-s390x:~# time ls -la /cifs/127.0.0.1/pub
> > <hangs>
> 
> The above hang happens for me when patch 5 is applied: [PATCH 05/19]
> autofs-5.1.8 - fix root offset error handling
> 
> In summary, for my s390x case:
> - [PATCH 05/19] autofs-5.1.8 - fix root offset error handling:
> introduces the hang in the above scenario
> - [PATCH 08/19] autofs-5.1.8 - fix loop under run in
> cache_get_offset_parent(): fixes the s390x segfault, and failure to
> mount the private cifs share

Thanks for you efforts on this problem.
The patch 5 introducing a hang is interesting, I'll have to have a
look at that.

Thanks
Ian

