Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9FDAB0EA
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 05:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391312AbfIFDWn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 23:22:43 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40615 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731938AbfIFDWn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 23:22:43 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 89A9521903;
        Thu,  5 Sep 2019 23:22:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 05 Sep 2019 23:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        anbBu7P/3h9DZc3n+mLlRRIFNP1Hq4N9h+BR+gLwzK8=; b=Zk2Ow0sd3ju4IJ6U
        Ou6scfDzdufd7XsO6kXUmLRYpUYVCppPLiHBDfWktnQzfeaTlG96zJsuNDPZHJ5u
        hSkWJhIz5B3b8jRrlutwZczZHC+kDlWUoF/RcR9ol+6l2/VQfby4t4YuUovm52NJ
        GIfmAle/Z/jXdYhFDB4VGvQLmI8PgBN80E10W7+fDujx5ZBjuFiXTL3GxqvECMHg
        ibHhQnpIe1TvFmHWJ7TDpJ+to5PmLvegjAPVkTPXyo+P7FJ+4gSvpSqcep8u71v9
        dtC4Rk7XVAGTa4a8GW0jSxuurKf+geIfJ+T421Vmwp2lWTuGoXuGq79Sd+IYIbys
        bymwiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=anbBu7P/3h9DZc3n+mLlRRIFNP1Hq4N9h+BR+gLwz
        K8=; b=1S3318zeGt5b/ix0EtGp5OpGFKYqcyanDrNNqNX0a0iW06Uc4DoDuXspK
        okSF9T9rcffKlvG3wzzDQBGAkc/6qavSLspu+s9Ycg88XuE6AO3+OjsRIlfJKdO8
        JFHkdbwI6ORQ3DHPBkhHP1U/SzxtylSiWDm4Gg+250NB+8/CMHXwQKN/y4lz8n4v
        IH6iU0YILI55NHPJZWLSYBcVxLnu+pWUR+FBciP6mIO6c/ZRsLARsInnikfWj4bv
        n126QCPSg8IgvSKfBwrF1i6rNih+hkBY3C6a0n0IBzRiOGU/JDSVdgDyuqlCktPe
        vJgG2C2gjCAZPzn/1JMCqSHBJZ9BQ==
X-ME-Sender: <xms:AdFxXZtWZgBlFDnKKgotn86ubaWC77ID8NUXJqmaMXBBcnv7-ndyyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejkedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtle
    drudekfedrleefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgr
    fidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AdFxXXppxo6t6UVMHvH-HK9xB752BdhP0aFUPgyhGN9r7r5nDFEe_g>
    <xmx:AdFxXQINITUrUMAejGwmchM3C_x04BO2oLtHGxl2QVRrRNFCkOjXbg>
    <xmx:AdFxXfuUuKgimFSKm5ID5O302c-rjK2WOdLw7AnaSRuwycz9SOLBMw>
    <xmx:AtFxXd4w5E_9bUa9T1VvL7oAKUZnHXUuMylC66iGt6mYwjdAO1_1nQ>
Received: from mickey.themaw.net (unknown [118.209.183.93])
        by mail.messagingengine.com (Postfix) with ESMTPA id 86B5E80060;
        Thu,  5 Sep 2019 23:22:40 -0400 (EDT)
Message-ID: <f9deab01025b1b57f6297fab44264a85c3814bef.camel@themaw.net>
Subject: Re: [PATCH 09/32] autofs-5.1.5 - update autofs(8) offset map entry
 update description
From:   Ian Kent <raven@themaw.net>
To:     "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 11:22:36 +0800
In-Reply-To: <20190906001659.qkr2baeo6mburhzn@mayhem.atnf.CSIRO.AU>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
         <156772689839.5865.7283001077042699778.stgit@mickey.themaw.net>
         <20190906001659.qkr2baeo6mburhzn@mayhem.atnf.CSIRO.AU>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2019-09-06 at 00:16 +0000, McIntyre, Vincent (CASS, Marsfield)
wrote:

And again, thanks.

> On Fri, Sep 06, 2019 at 07:41:38AM +0800, Ian Kent wrote:
> > The autofs(8) man page imples that map entries that have offsets
> > will
> > be updated in the ame way as top level map keys.
> > 
> > This isn't correct, if a map entry has offsets and is in use when
> > the
> > map is updated the mount must expire before it will see the update.
> > 
> > Signed-off-by: Ian Kent <raven@themaw.net>
> > ---
> >  CHANGELOG       |    1 +
> >  man/autofs.8.in |    5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/CHANGELOG b/CHANGELOG
> > index 89b1545b..64eb0926 100644
> > --- a/CHANGELOG
> > +++ b/CHANGELOG
> > @@ -15,6 +15,7 @@ xx/xx/2019 autofs-5.1.6
> >  - plus map includes are only allowed in file sources.
> >  - Update README.
> >  - fix additional typing errors.
> > +- update autofs(8) offset map entry update description.
> >  
> >  30/10/2018 autofs-5.1.5
> >  - fix flag file permission.
> > diff --git a/man/autofs.8.in b/man/autofs.8.in
> > index 9f03eada..909bdfd3 100644
> > --- a/man/autofs.8.in
> > +++ b/man/autofs.8.in
> > @@ -56,6 +56,11 @@ map is modified then the
> >  .B autofs
> >  service control reload action must be rerun to activate the
> > changes.
> >  .P
> > +However, if a map entry has offsets and is currently is use the
> > offset
> 
> s/is/in/:
> 
>   +However, if a map entry has offsets and is currently in use the
> offset
> 
> > +mounts cannot be updated due to potential mount dependencies. In
> > this
> > +case the map entry offsets will not be updated until after the map
> > +entry has expired.
> > +.P
> >  .B @@initdir@@/autofs status
> >  or
> >  .B systemctl autofs.service status
> > 
> 
> -- 

