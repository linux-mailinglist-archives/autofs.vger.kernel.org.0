Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C35A117F35
	for <lists+autofs@lfdr.de>; Tue, 10 Dec 2019 05:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLJEtJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 9 Dec 2019 23:49:09 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52881 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726819AbfLJEtI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 9 Dec 2019 23:49:08 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6DA4522616;
        Mon,  9 Dec 2019 23:49:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 09 Dec 2019 23:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        pi8HHIkw++qHoG5vqXLPFCVQrH0oTiOl0jrbThQ70Qg=; b=nr6UqRVN1+6YIfWr
        keuyBA6SPuiOgdy6pjkXshPJWkeE9vUShYlDnNtgbOJSFy/J2ZD93sv9c/O7i2sg
        jhL1ttB+KNkis1a350j4mGF1OuOelI23lQUlYD1b8T7c/x63KD7oQhgCTi/gqGyg
        fDEU5UGsDPMTqGKAwxSaeRcqSJC5h6LjaT+l4H9ttwln1m2eag8d/uI5m+AoIhmH
        U4o0SsszKlpxxPFXSoAgUkKirF0KJNIuuQprrwpkZaWiOjFCxM+mLJsj5g3LpfdF
        uLnkpuRG8q7rd12nvNsHfsB2UJ38bzUy14eLUT+CNn/MRw5WY+ytTPlu/dHvLV/Z
        3hKHfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=pi8HHIkw++qHoG5vqXLPFCVQrH0oTiOl0jrbThQ70
        Qg=; b=jKYLOjIbIikGMrtpD2r0gXmySpaVTsIuhasbZJTNZhhdnEjE8PcD9TwTz
        3YeWnp/L2+QI3DPCXlgqSuA02MIwkpa3LWdTxQVGYf/WJBjI+lvV0OZtnDHk3+r3
        RTsKKjqRaEVVio0gJimTZlz4MvUpfrGrdeqRKgwdVANMQ62Qak/Z5BFnqFAKckWk
        OQLM+VSzGYKl6CWCPCZdcn8Tc1W0bSxphpaDcd+0eI02yVNnNJsaS/qFu18zbitk
        GWPojsVyYc8DDmTf29o84SOQIuFn+6Fweh7Wge1dOJDsQDDraT3cHA7Gt2K+fsHO
        OOCOS7hYoLjsCJiALNY9tt8N4+6gA==
X-ME-Sender: <xms:wyPvXWDYIQyr8CAmBvEGx1KPRHiQzuG8lxlpCmQ6bRL3Hy6S-YOxJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelvddgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtke
    drudejvddrudegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgr
    fidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:wyPvXfdlet8FYArKeIRVKezj_4vxJlqaUwvNhf0Jrxo3vCkepRHf-g>
    <xmx:wyPvXVrHF4QzFr6bS1c323P9mHx0FSeyY19WhtyWGRBIuEAr5hfT-Q>
    <xmx:wyPvXYQtFs_VTYVLOTYhW3tQ60bmDnvHVKbqmfswsXdtpvuSWqoC4Q>
    <xmx:wyPvXYEEo_imm5bp9jwOc1isOxXU4oq75E3C7OI5lTHxRPrP8Xfy0A>
Received: from mickey.themaw.net (unknown [118.208.172.14])
        by mail.messagingengine.com (Postfix) with ESMTPA id E25AA8005A;
        Mon,  9 Dec 2019 23:49:05 -0500 (EST)
Message-ID: <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
Subject: Re: Failure of program map to recover after failure
From:   Ian Kent <raven@themaw.net>
To:     Doug Nazar <nazard@nazar.ca>, autofs@vger.kernel.org
Date:   Tue, 10 Dec 2019 12:49:02 +0800
In-Reply-To: <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
         <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2019-12-10 at 12:41 +0800, Ian Kent wrote:
> On Thu, 2019-12-05 at 04:26 -0500, Doug Nazar wrote:
> > On autofs 5.1.6, after an unsuccessful mount attempt (stopped
> > server) 
> > using a program map for /net, it'll never recover once the server
> > is 
> > started again.
> > 
> > Here's the initial debug log for the failure:
> > 
> > handle_packet: type = 3
> > handle_packet_missing_indirect: token 6631, name wraith, request
> > pid
> > 32245
> > attempting to mount entry /net/wraith
> > lookup_mount: lookup(program): looking up wraith
> > lookup_mount: lookup(program): wraith -> 
> > -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
> > parse_mount: parse(sun): expanded entry: 
> > -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
> > parse_mount: parse(sun): gathered options: 
> > fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
> > parse_mount: parse(sun): dequote("/") -> /
> > parse_mapent: parse(sun): gathered options: 
> > fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
> > parse_mapent: parse(sun): dequote("wraith:/") -> wraith:/
> > update_offset_entry: parse(sun): updated multi-mount offset / -> 
> > -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 wraith:/
> > parse_mapent: parse(sun): gathered options: 
> > fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
> > parse_mapent: parse(sun): dequote("wraith:/") -> wraith:/
> > sun_mount: parse(sun): mounting root /net/wraith/, mountpoint
> > wraith, 
> > what wraith:/, fstype nfs, options hard,intr,nodev,nosuid,sec=krb5
> > mount(nfs): root=/net/wraith/ name=wraith what=wraith:/,
> > fstype=nfs, 
> > options=hard,intr,nodev,nosuid,sec=krb5
> > mount(nfs): nfs options="hard,intr,nodev,nosuid,sec=krb5",
> > nobind=0, 
> > nosymlink=0, ro=0
> > get_nfs_info: called with host wraith(192.168.21.90) proto 6
> > version
> > 0x20
> > get_nfs_info: called with host wraith(192.168.21.90) proto 17
> > version
> > 0x20
> > get_nfs_info: called with host wraith(fde2:2b6c:2d24:21::5a) proto
> > 6 
> > version 0x20
> > get_nfs_info: called with host wraith(fde2:2b6c:2d24:21::5a) proto
> > 17 
> > version 0x20
> > mount(nfs): no hosts available
> > dev_ioctl_send_fail: token = 6631
> > failed to mount /net/wraith
> > 
> > After a few minutes another attempt after I've re-started the
> > server
> > on 
> > target:
> > 
> > handle_packet: type = 3
> > handle_packet_missing_indirect: token 6635, name wraith, request
> > pid
> > 32309
> > attempting to mount entry /net/wraith
> > lookup_mount: lookup(program): wraith -> 
> > -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
> > lookup(program): unexpected lookup for active multi-mount key
> > wraith, 
> > returning fail
> > dev_ioctl_send_fail: token = 6635
> > failed to mount /net/wraith
> > 
> > I'm currently running this patch but don't have much confidence in
> > it. 
> > I'm unsure of the lifetime rules for me->multi, maybe it should
> > have 
> > been cleared after failure mounting?
> 
> I've returned to look at this a few times now but don't have an
> proper answer for you just yet, thought I'd let you know I am
> thinking about it.
> 
> > diff --git a/modules/lookup_program.c b/modules/lookup_program.c
> > index fcb1af7..b6f854b 100644
> > --- a/modules/lookup_program.c
> > +++ b/modules/lookup_program.c
> > @@ -646,7 +646,7 @@ int lookup_mount(struct autofs_point *ap, const
> > char 
> > *name, int name_len, void *
> >                                   name_len, ent, ctxt->parse-
> > > context);
> >                          goto out_free;
> >                  } else {
> > -                       if (me->multi) {
> > +                       if (me->multi && me->multi != me) {
> >                                  cache_unlock(mc);
> >                                  warn(ap->logopt, MODPREFIX
> >                                       "unexpected lookup for
> > active 
> > multi-mount"
> 
> Yes, the problem occurs because it's a top level singleton multi-
> mount
> otherwise you wouldn't get a lookup taking this code path.

I also need to work out why you don't get caught by the negative
map entry check that's meant to prevent multiple retries for a
failing map entry for a configured time.

> 
> And even the entry delete below it should be ok because it will
> just lookup (aka. run the program map again to get the map entry)
> and then update the multi-mount during the entry parse.
> 
> So while the change above isn't strictly the way this should be
> handled it probably should be ok.
> 
> I haven't worked out how to handle it immediately after the fail
> just yet but the change above probably should be kept as part of
> that as well, not sure yet.
> 
> Ian

