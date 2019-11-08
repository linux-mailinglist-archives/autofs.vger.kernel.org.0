Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBA8F40C7
	for <lists+autofs@lfdr.de>; Fri,  8 Nov 2019 07:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfKHGu4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 8 Nov 2019 01:50:56 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43097 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725802AbfKHGu4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 8 Nov 2019 01:50:56 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 356852A4;
        Fri,  8 Nov 2019 01:50:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 08 Nov 2019 01:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        PGNEElvIjijoOq3WlN0hqV9YytoYqQuO1e7chBYG2MY=; b=jJSu+lh7TSa9myP/
        J6ESlyW0BS8AzGjEfPxIPUNw2dlU2VhOdMRjkQHrf+nImGDwmXU5TCFeXxAAjXUD
        RN3ESdYLud6DvK8/zE0EaJKOLD3sgW3rcN4EZYVz5hxTGHuJWpJqtUKPLhFw+6J+
        PPBIEKMhKXEDjp2ONcIPOmllu8f+fgf4pVo/HDkKa/Av22HVPhMeFqAG/27wp5GU
        xQLTMnT/iKmgGD0M5QBzsP394SoTDyyq84V8z3d/W7N4aeJoAM8mVo3/byxGp+e1
        dX0vjCs6D235j6bOcv7bmSPAu+O7pXaf+gewiHLL62Z+TIF1bcxnvrCQSsVCuLbn
        3e39uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=PGNEElvIjijoOq3WlN0hqV9YytoYqQuO1e7chBYG2
        MY=; b=Bf+y6SsiccDy94vQ6Rw1DBMiCYXRL+4Berbof3An9hfaKxt2WppBlmo/7
        39pDLiQ7sWCtfV6iGOsaz6nHmctaMDY/12PnP9bTIgs+PSb295M5lmq5qp83lYCT
        0xIWpjpVBVErgRMvT8wg++B42WcHG0UjKSVb1musF/AuFa0jWdlnKD+9kA959mvS
        wmI5HBTWoVHxr28hBBQYWIA3C3A0Ww8mVBRibllzBFbbbUTI7DfUzzpIubvCcU0m
        mHd2LPTinOtCMjVitm+xqCNFKkvVfWUJVn24tIj0fXGLDO16dWxHijlz0H6bG+Pv
        t3ppLtR4AGVxk9BwXBALJ1ZgSeAfg==
X-ME-Sender: <xms:ThDFXVtKPGyqYKK7qjr1qFIStwG6VG7MZ0q_0MGaw1yCpdvRTq_wLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvtddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghn
    ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuffhomhgrihhnpehrvg
    guhhgrthdrtghomhenucfkphepuddukedrvddtkedrudekledrudeknecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenucevlhhushhtvghruf
    hiiigvpedt
X-ME-Proxy: <xmx:ThDFXZaJjUVrhNHSr4bJFSDqqfGMDRZ82soqKxNskj5Fz4U6_kDWxw>
    <xmx:ThDFXXzPML-4Sa-5-S_SU6BNyPb8lXSy0ixel3c-KNbsTannXckB-A>
    <xmx:ThDFXRjETw8874M2FFnTooNPvuRfEF0rkA4vBPvk81nRpnCSCBAF5Q>
    <xmx:ThDFXQL8Ql6m_H8wom8FkgGUOU6i5cl4D-BsFOEinTwbvdM8T_XqXw>
Received: from mickey.themaw.net (unknown [118.208.189.18])
        by mail.messagingengine.com (Postfix) with ESMTPA id 292C3306005E;
        Fri,  8 Nov 2019 01:50:52 -0500 (EST)
Message-ID: <4ae85bbb2b8ac8f50e16aee16c94861dbb33da36.camel@themaw.net>
Subject: Re: [RHEL 5.11][5.0.1] autofs hangs up
From:   Ian Kent <raven@themaw.net>
To:     Simon ELBAZ <selbaz@linagora.com>, autofs@vger.kernel.org
Date:   Fri, 08 Nov 2019 14:50:49 +0800
In-Reply-To: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
References: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-11-07 at 15:57 +0100, Simon ELBAZ wrote:
> Hi,
> 
> I am working on an autofs issue.
> 
> Linux kernel: 2.6.18-398.el5
> autofs: autofs-5.0.1-0.rc2.184.el5

This is really, really old, but not quite as old as I thought.

* Fri Jul 11 2014 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.184.el5
- bz1049017 - Regression: autofs mounts hang if maps are reloaded while the
  mount is expiring
  - check for existing offset mount before mounting.
- Resolves: rhbz#1049017

The latest revision is 186 but that doesn't look like it would help.

* Mon Feb 27 2017 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.186.el5
- bz1130829 - Memory leak in get_exports
  - fix package revision in spec file.
- Related: rhbz#1130829

* Wed Feb 08 2017 Ian Kent <ikent@redhat.com> - 5.0.1-0.rc2.185.el5
- bz1130829 - Memory leak in get_exports
  - fix memory leak in get_exports().
- Resolves: rhbz#1130829

> 
> There are 2 RHEL 5.11 servers accessing an NFS server.
> They are rebooted every morning.
> 
> Sometimes, during the day, autofs hangs up on both servers. When one
> of 
> the server is rebooted, the other autofs can resume its NFS access.

I'm not sure what this means, how about we call machines on which
autofs is running clients and NFS servers they are trying to mount
from servers.

> 
> I am focusing on the /HOME/svsi_emr offset to debug the issue.

Again, don't know what that means, no information on it.

> 
> I suggested the customer to update the kernel to 2.6.18-419.el5
> version 
> but without being sure it will solve the issue.
> 
> The autofs is in debug mode. Logs are available.

I can look at the logs but even though the last updates are fairly
recent this is really old and upstream is usually focused on recent
revisions.

Even if you log a bug at bugzilla.redhat.com and we work out what
the problem is getting that into a release will be like pulling
teeth at this point of the RHEL-5 life cycle.

Ian

