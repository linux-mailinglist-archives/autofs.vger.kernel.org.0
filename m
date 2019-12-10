Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF803117F12
	for <lists+autofs@lfdr.de>; Tue, 10 Dec 2019 05:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfLJEmG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 9 Dec 2019 23:42:06 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:51423 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbfLJEmG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 9 Dec 2019 23:42:06 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 5F92D224EE;
        Mon,  9 Dec 2019 23:42:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 09 Dec 2019 23:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        KtJ+6gZZxrELRr1bUAajCLD94DdqYY1AoHGeDkgPP7Y=; b=PHayIy2s96GGCIyU
        sYlcFwYFSecr9ggabTKYEre7AvxGgagvqw1EqU6NSaT1KCFfEC2XzCEWVZ5EvQgc
        UKioiPbxqvVbR9BO6ZC7gmldTsgqkCpallDwJlC8w9HKHcNgqIlQffhRIQHyQaPX
        Eyim+sxy3EuD5BQoG8DloqDMEpDg/JEVE/j4ZzXnN/lkK/U57ya+HolN1X/gbuhs
        /Gqsn6rn24Jd7ED+TAjE3NKf3V47P57gBv/wFbV567CG1m0TyWUpPc6MtSubbG/d
        VrZbSUGwN78I9Yz0rlkvV9QbXfmQ1SPeqVGtNABMVm6a+pl8S2SV3PgzmYgP86z7
        06h/qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=KtJ+6gZZxrELRr1bUAajCLD94DdqYY1AoHGeDkgPP
        7Y=; b=NqHtJSZIsKXRWp2YXZEy5bIHQ2nsnOpm0yNuMMAyWF1mfwWHARwvDjTEe
        oiQh8CXBGk8+A1PmebS8CUvQuNhLvXZKxrrMEFR/oVlAnZGoE10Wf5RB+TDU7ULZ
        AaFFTe40r2aek/IDO0HCbewNf8ATF9fF6ZIYD67NwP+FI0Rn9ZQ/J38Z708/V4F9
        meELVec6UgjmLUAPH3iDGcBJWe4zcSI2/ekD0uRWfd61OSDFePeQBf9oHfaw3Rqj
        pgXNqG3ptq5oSWTXZMQZptlI+jPzwP8fIM+qwnAJz1PLC1IHiOhWLgwlGdqtG/PY
        y8K+26xw0q/EVIYcqwGKKDcYtt/9g==
X-ME-Sender: <xms:HCLvXWNzbhwIT_7Sk4V4mh9vNes9eePspdnHEmILTZo1qYrn1s2o4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelvddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtke
    drudejvddrudegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgr
    fidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:HCLvXaMc9Z6ac475-r1_k7fZuvRn3dCa7SNvtq3L5UMqnuj2Oes90w>
    <xmx:HCLvXe9C735tGDa7iJ8wiOiOkKIRGK7zUmxfSiG3UOWbYSKY4f3Z9Q>
    <xmx:HCLvXe4vnyyBaXyPCERVTRH3caTkh9Vz3k7hGbtbfnkFZj1oA9WpNg>
    <xmx:HCLvXfsS_6-hub3XeBzGYJ9YSKutQnJ3J2AA7c497gOa13vIrc-ZGg>
Received: from mickey.themaw.net (unknown [118.208.172.14])
        by mail.messagingengine.com (Postfix) with ESMTPA id ECD0830600DC;
        Mon,  9 Dec 2019 23:42:02 -0500 (EST)
Message-ID: <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
Subject: Re: Failure of program map to recover after failure
From:   Ian Kent <raven@themaw.net>
To:     Doug Nazar <nazard@nazar.ca>, autofs@vger.kernel.org
Date:   Tue, 10 Dec 2019 12:41:59 +0800
In-Reply-To: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-12-05 at 04:26 -0500, Doug Nazar wrote:
> On autofs 5.1.6, after an unsuccessful mount attempt (stopped
> server) 
> using a program map for /net, it'll never recover once the server is 
> started again.
> 
> Here's the initial debug log for the failure:
> 
> handle_packet: type = 3
> handle_packet_missing_indirect: token 6631, name wraith, request pid
> 32245
> attempting to mount entry /net/wraith
> lookup_mount: lookup(program): looking up wraith
> lookup_mount: lookup(program): wraith -> 
> -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
> parse_mount: parse(sun): expanded entry: 
> -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
> parse_mount: parse(sun): gathered options: 
> fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
> parse_mount: parse(sun): dequote("/") -> /
> parse_mapent: parse(sun): gathered options: 
> fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
> parse_mapent: parse(sun): dequote("wraith:/") -> wraith:/
> update_offset_entry: parse(sun): updated multi-mount offset / -> 
> -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 wraith:/
> parse_mapent: parse(sun): gathered options: 
> fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
> parse_mapent: parse(sun): dequote("wraith:/") -> wraith:/
> sun_mount: parse(sun): mounting root /net/wraith/, mountpoint
> wraith, 
> what wraith:/, fstype nfs, options hard,intr,nodev,nosuid,sec=krb5
> mount(nfs): root=/net/wraith/ name=wraith what=wraith:/, fstype=nfs, 
> options=hard,intr,nodev,nosuid,sec=krb5
> mount(nfs): nfs options="hard,intr,nodev,nosuid,sec=krb5", nobind=0, 
> nosymlink=0, ro=0
> get_nfs_info: called with host wraith(192.168.21.90) proto 6 version
> 0x20
> get_nfs_info: called with host wraith(192.168.21.90) proto 17 version
> 0x20
> get_nfs_info: called with host wraith(fde2:2b6c:2d24:21::5a) proto 6 
> version 0x20
> get_nfs_info: called with host wraith(fde2:2b6c:2d24:21::5a) proto
> 17 
> version 0x20
> mount(nfs): no hosts available
> dev_ioctl_send_fail: token = 6631
> failed to mount /net/wraith
> 
> After a few minutes another attempt after I've re-started the server
> on 
> target:
> 
> handle_packet: type = 3
> handle_packet_missing_indirect: token 6635, name wraith, request pid
> 32309
> attempting to mount entry /net/wraith
> lookup_mount: lookup(program): wraith -> 
> -fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
> lookup(program): unexpected lookup for active multi-mount key
> wraith, 
> returning fail
> dev_ioctl_send_fail: token = 6635
> failed to mount /net/wraith
> 
> I'm currently running this patch but don't have much confidence in
> it. 
> I'm unsure of the lifetime rules for me->multi, maybe it should have 
> been cleared after failure mounting?

I've returned to look at this a few times now but don't have an
proper answer for you just yet, thought I'd let you know I am
thinking about it.

> 
> diff --git a/modules/lookup_program.c b/modules/lookup_program.c
> index fcb1af7..b6f854b 100644
> --- a/modules/lookup_program.c
> +++ b/modules/lookup_program.c
> @@ -646,7 +646,7 @@ int lookup_mount(struct autofs_point *ap, const
> char 
> *name, int name_len, void *
>                                   name_len, ent, ctxt->parse-
> >context);
>                          goto out_free;
>                  } else {
> -                       if (me->multi) {
> +                       if (me->multi && me->multi != me) {
>                                  cache_unlock(mc);
>                                  warn(ap->logopt, MODPREFIX
>                                       "unexpected lookup for active 
> multi-mount"

Yes, the problem occurs because it's a top level singleton multi-mount
otherwise you wouldn't get a lookup taking this code path.

And even the entry delete below it should be ok because it will
just lookup (aka. run the program map again to get the map entry)
and then update the multi-mount during the entry parse.

So while the change above isn't strictly the way this should be
handled it probably should be ok.

I haven't worked out how to handle it immediately after the fail
just yet but the change above probably should be kept as part of
that as well, not sure yet.

Ian

