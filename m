Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507EA1EDB17
	for <lists+autofs@lfdr.de>; Thu,  4 Jun 2020 04:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgFDCPr (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 3 Jun 2020 22:15:47 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35433 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgFDCPq (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 3 Jun 2020 22:15:46 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id C3CF65C0004;
        Wed,  3 Jun 2020 22:15:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 03 Jun 2020 22:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        W4lvcYQj9Aw7wcKrjQwNixDEBlPkuaeuVxb7yeZYVD8=; b=v1CTiA5by5nkrzTi
        Ck3lsa+9Hvy2JHQe0488nUFU07V3nhAD21M0uTGIR3k0gKElLWlCQjxcq87nIGxi
        qDYjF8seVyjG61ZUe7wxE8aASQ/UWOWihXoFAMntR4JBAxNds48JD0I0GriL23IU
        Ftr/rDNCABQfLY2/QhG5JcvL79gl4uJmS5jL89oTOVFbO4tSAL5i/3JXhzsd7VtU
        Mc9H42A7SXoM/uQDfzIzGG4uIKdt8jtcGsSEUEvgs8G696dYAZBJCJN7pb65dbb3
        RBEKyh1KFYI/jO+vD1TZFQhyStT7SPKmI6MeX9M1QRUNoeJBMB7EdkGN/CpAerDL
        7DGcHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=W4lvcYQj9Aw7wcKrjQwNixDEBlPkuaeuVxb7yeZYV
        D8=; b=lvRhhc2FJkreiTOygMP5G2tyOSKRT30BZ/sFPEMMLv/KnBuIi6PJmzp7V
        MF2cvC2XrlbEo487D3prnJ4P4pPPh7JL5mVyRw9JBoO62A0X0debnNTz0Vzl2Ibm
        6jVxwuoZVy4UxQB4jtPwLirMm8xJS8l1njYynLncdERnHEz7HQa1LFdfMfkAP+vU
        7Lyq1DL5XeS6xgnrLs12GcxEqOn0jqNymFoMWCo9o/WgcQSkhJB36UOtxSxG9hzc
        EDp7A+eRMuem17Jf11yb4Y9qb8fgbrWzMrjujugu90gmCGTSt3Rk8jslc67vAPKy
        8xf+C1X+EGZsJxnYJOfOo7YtYvoXQ==
X-ME-Sender: <xms:T1nYXliZhJpWhcJmqXVudjWo8xx7Pz25rezr4qTv2EtIDKX9X3g_tQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegtddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    eikefhvdehteekjefgtdfgveekffetteeuteeffedvueefveejudeigefgteeftdenucff
    ohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhmnecukfhppeehkedrjedrvdehfe
    drudeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:T1nYXqB2UOEUhNSYw8py1nO_wqXqSYVFODQxWSvrpeHHxEIDpHT-Ug>
    <xmx:T1nYXlGatkyFG8A77SEtOyjNZpaUKSsO1Es5pbAGMBGIGlAdO-USWQ>
    <xmx:T1nYXqTm832dK_zPMTcS9cPstQuBq0RAY-Nzfva6S4kdlvvGry_F5g>
    <xmx:T1nYXqjXJcuaj-DT0AeV7MUtrUa1Ao6JmlBCwAku2Jz-cgKlU77vhA>
Received: from mickey.themaw.net (58-7-253-166.dyn.iinet.net.au [58.7.253.166])
        by mail.messagingengine.com (Postfix) with ESMTPA id 590653061CB6;
        Wed,  3 Jun 2020 22:15:42 -0400 (EDT)
Message-ID: <629ee74db8305269bd132b63f651407d1f7abab0.camel@themaw.net>
Subject: Re: auto.smb and escaping of $ and &
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Thu, 04 Jun 2020 10:15:38 +0800
In-Reply-To: <CANYNYEEJDyQ7gfB0JTULz1r8hZ4fORRLymH36G4G++G9V=SkYQ@mail.gmail.com>
References: <CANYNYEEJDyQ7gfB0JTULz1r8hZ4fORRLymH36G4G++G9V=SkYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2020-06-03 at 13:55 -0300, Andreas Hasenack wrote:
> Hi,
> 
> https://kernel.googlesource.com/pub/scm/linux/storage/autofs/autofs/+/a557e6261afc87d3849b557257185ff72be15a82%5E%21/#F0
> dropped the escaping of "$", since the whole thing is later double
> quoted anyway. That fixes automounting of windows administrative
> shares (ending in "$" like "C$"):
> 
> --- autofs-5.1.6.orig/samples/auto.smb
> +++ autofs-5.1.6/samples/auto.smb
> @@ -75,8 +75,6 @@ $SMBCLIENT $smbopts -gL "$key" 2>/dev/nu
>           dir = $2
>           loc = $2
>           # Enclose mount dir and location in quotes
> -         # Double quote "$" in location as it is special
> -         gsub(/\$$/, "\\$", loc);
>           gsub(/\&/,"\\\\&",loc)
>           print " \\\n\t \"/" dir "\"", "\"://" key "/" loc "\""
>         }
> 
> I think that the escaping of "&" should also be removed, otherwise we
> get the same issue there:

Again because of the double quoting, yes, that sounds sensible to
me too.

> attempting to mount entry /cifs/localhost/a&b
> lookup_mount: lookup(program): /cifs/localhost/a&b ->
> -fstype=cifs,guest ://localhost/a\&b
> parse_mount: parse(sun): expanded entry: -fstype=cifs,guest
> ://localhost/a\&b
> parse_mount: parse(sun): gathered options: fstype=cifs,guest
> sun_mount: parse(sun): mounting root /cifs/localhost/a&b, mountpoint
> /cifs/localhost/a&b, what //localhost/a\&b, fstype cifs, options
> guest
> do_mount: //localhost/a\&b /cifs/localhost/a&b type cifs options
> guest
> using module generic
> mount_mount: mount(generic): calling mkdir_path /cifs/localhost/a&b
> mount_mount: mount(generic): calling mount -t cifs -o guest
> //localhost/a\&b /cifs/localhost/a&b
> > > mount error(2): No such file or directory
> > > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs)
> mount(generic): failed to mount //localhost/a\&b (type cifs) on
> /cifs/localhost/a&b
> dev_ioctl_send_fail: token = 10
> failed to mount /cifs/localhost/a&b
> 
> $ /etc/auto.smb localhost
> -fstype=cifs,guest \
>          "/print$" "://localhost/print$" \
>          "/myshare" "://localhost/myshare" \
>          "/C$" "://localhost/C$" \
>          "/a&b" "://localhost/a\&b"
> 
> It's a bit scary to deal with $ and & in shell, so maybe I'm missing
> something, but the current auto.smb script doesn't work with shares
> that have "&" in their names.

Sounds correct to me too.

As you point out the mount fails, maybe because mount.cifs has changed
or maybe because I've had it wrong for ages, don't know.

Either way it fails now so I think I should make that change, anyone
on the list have any evidence to the contrary?

Ian

