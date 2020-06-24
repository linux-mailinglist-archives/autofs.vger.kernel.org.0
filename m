Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEDC2069AE
	for <lists+autofs@lfdr.de>; Wed, 24 Jun 2020 03:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388296AbgFXBr1 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 23 Jun 2020 21:47:27 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47025 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387780AbgFXBr0 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 23 Jun 2020 21:47:26 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id ED17EDC4;
        Tue, 23 Jun 2020 21:47:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 23 Jun 2020 21:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        XMWV6eIUVPNNq76WtGfdvojtAVikc6Xv8teoOkxDqoM=; b=rNQQWvS6BhdqJM32
        y09PYMgx+SKKQWFSy4PJ0SNEL7/h78PRdIWzTktnJf0VyBurGZuBzoNhAzUCXG5g
        vh2xVmUikUGfaLg+GpMd9IXdgxrNEaRd3aMZeNtnCMgejreiDzmIFUwlBlgEDNIH
        lydMsgUPnS34wOMmA2LUgFkSePn2JECqfiMvYpOdmQ/uUN5hjeaOLeNMkhzC59d6
        XFOBf5/SA6E+xYLurqFH3FzLGL/HEPk5KbATBAKdrsqod7CBTfOfM6Ql0q/Cm8CP
        AlLNPC2UolOFToOtZshzlNxYih7EEZQT9nB7+t8nG2P5DlA/R5KPt4sGgqBE/B6I
        8TMaag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=XMWV6eIUVPNNq76WtGfdvojtAVikc6Xv8teoOkxDq
        oM=; b=g+hCX7Iiva3AsG6bC1EixxH4SR1CDvpGKFSnhentlxEzB0vuqI6GuJ1Fg
        8c0Y/rmfLSNwvobbqNP0Y9SBayoyPnvQUYVzawKvdhukHoaGNW0NjPIxIszvCfPk
        isAiK0ENtPVg0fuKXh52IvPa80XUx9EXOgQ6VtH4wzCSksbyPlcfsd09wZmGK+aa
        j0I/lhvaH9PHexHiggkBDLgiU4rquc9ePOa5usdG79QUXXVkXe86/HEpIbxooaJD
        vwnOXoeXrdw9hPG7Q+bsz/tj7gNVJMnzs7iKwWJpzl7TembrymIYuXDZM5CgW2Ze
        8qiAXes8Sd3YbeX+bwU9gVSCrVfUw==
X-ME-Sender: <xms:rbDyXkQ87puvyx4vyvDgo9zRnWtn-3lQpLwxZDeWkavVXiipOJ5wqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekiedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucfk
    phepuddukedrvddtkedrheegrdehtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:rbDyXhzdOj3_-y_xIbZkhFpW0Dj7oOnKVNdP-nOFZHNTP-Ph49nz2w>
    <xmx:rbDyXh2l5wmdENcSjQwrCh9dcnyr966FEQ-LHLh3vvNHEOYHIGbavw>
    <xmx:rbDyXoDHmPcm_gmAFpNniHnsTK603mc5AGDALnUQ6Q4ArdhAsHqH4Q>
    <xmx:rbDyXkRqWvjPsA0sN_PMNOEwA_W5EIXEA81XDOyXF8pXkouwpE70Hg>
Received: from mickey.themaw.net (unknown [118.208.54.50])
        by mail.messagingengine.com (Postfix) with ESMTPA id 33A2D30675B9;
        Tue, 23 Jun 2020 21:47:23 -0400 (EDT)
Message-ID: <536097e116fbba580d79f7148f39260b3322e4ea.camel@themaw.net>
Subject: Re: The automounter hangs on attempts to mount non-existent
 directories unless the option vers=4.2 is specified?
From:   Ian Kent <raven@themaw.net>
To:     Patrick Goetz <pgoetz@math.utexas.edu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Wed, 24 Jun 2020 09:47:20 +0800
In-Reply-To: <66a3171f-c514-8010-c8cb-214d1306351f@math.utexas.edu>
References: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
         <7f144a0767309316dd4662bb5c2fe1472befa724.camel@themaw.net>
         <66a3171f-c514-8010-c8cb-214d1306351f@math.utexas.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2020-06-23 at 12:32 -0500, Patrick Goetz wrote:
> Hi -
> 
> Sorry for the delayed response.  Work has really picked up the last 
> couple of weeks.
> 
> On 6/17/20 8:28 PM, Ian Kent wrote:
> > > Maybe this is just an issue with mount.nfs?
> > 
> > It's hard to say, possibly, that would need a debug log to check it
> > out.
> 
> Although the problem is completely resolved by specifying
> 
>    -tcp,vers=4.2
> 
> in /etc/auto.home, I'm happy to turn on debugging on one of the 
> workstations and send the results if this would help.

The only thing to consider is what's in the distro autofs revision
and what patches may have been added.

The key thing is to not attempt a mount if, for whatever reason, the
server doesn't respond and as long as autofs works this out rather
than letting mount.nfs(8) do it, it should be fine.

The server probing done by autofs deliberately uses quite short
timeouts so things don't get stuck.

And your installed autofs appears to have the the code that ensures
autofs itself does this check so it should be what's working out
whether to attempt a mount or not fairly quickly.

So I'm not sure we need to do more unless there are further problems.

> 
> 
> > If the problem is bad enough it might be worth adding some entries
> > above the wildcard entry that bind mount to one or more directories
> > to keep those applications happy.
> > 
> 
> Or create dummy home directories on the NFS server, or change 
> /etc/passwd to the more correct:
> 
>     /home/syslog  -->  /
> 
> however, given that, for example,
> 
>    $ ls /home/syslog
> 
> returns instantly with "no such file or directory" when the mount 
> options -tcp,vers=4.2 are specified in /etc/auto.home, my problem is 
> functionally resolved; I'm just in the bug reporting stage.

So, as long as your happy to specify those options everything
should fine.

If you wanted autofs to automaticly work out (without those options)
what to do it gets quite a bit harder, particularly when using a
wildcard map entry.

That's because the map entry key will always match the wildcard
entry so there's no way to know if the entry is actually valid
so that mount attempts can be avoided.

That was the point of the suggestion of adding particular problem
entries above the wildcard entry, if needed.

Ian

