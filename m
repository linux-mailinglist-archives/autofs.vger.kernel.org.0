Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C532C1294
	for <lists+autofs@lfdr.de>; Sun, 29 Sep 2019 02:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbfI2Av4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 28 Sep 2019 20:51:56 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38669 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728569AbfI2Av4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 28 Sep 2019 20:51:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 4CC7B2A9;
        Sat, 28 Sep 2019 20:51:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 28 Sep 2019 20:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        h0IkSNXsLTWiRPLgPYc3DuCjDu5yZclNHrgnF5cwoVk=; b=gjVPtBYH/9+IaAcq
        u/pr2/Y1wciqDxYzXm+wDF4u1fPtUeNfHFEuAyWIvZzYCJ+3RqyLetw27u6FbRw+
        tdVK/rX1GLRQh674AaaIZ9xxz+n58clF2L9av6WK+Z4HSMuXOy5ak4fUKbtzqhnl
        7ln0oGTDpE8X+Fin9kff7c/CXXSuQ0HlZOOmqCtStHCZcfd+IH4hvLQSH9jTF7Z2
        67vxt7e8MWTVlMwsRxgPw4y7RoDx0OGpT1p4iXj7A8CqjHAKQWnFAydEfjBy6ZYS
        shlEEuoYo4Ub3QYOuYgFH0/5GhowJRf6FRv3QMNakKERPvJBZmrx/gqDiY+ygXBf
        3SGPiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=h0IkSNXsLTWiRPLgPYc3DuCjDu5yZclNHrgnF5cwo
        Vk=; b=u7Sk6N5UisXIqo6NNRxQbxBj1rhLUNwiAB1L2kOwTUuoWLk0qU7r1aQFA
        0b6WpijNpW/r5sLYGIy2w52Jo00QF6nWRzhqkcCtunyCBIJZnPptz+7MS8gNqElm
        z/DYJw7W3wUCRn417+hVl9b02Lp/ARPlSleMCnVvYMDEb4swA/wcQ6jhi8uh4zUJ
        NuGUMXCM38asw+k1JWlEZQpLUF7UZC8UfxtSEzpwL3dwU4r4yAUTMXWhqBuuJ3YP
        pH1T+WLaDkEDXVSVMTNa8q03fwWcUOyH/ujhWx2kjaYLAYnAGruCaHinA81Nlwkv
        EkRp/d96TJjSXyMtMDlNwwryioPmw==
X-ME-Sender: <xms:KgCQXaKdzXqGDJkgg5VePBc0nGH6Cj7t_vJyOCbvcdiv_TMsA80JJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeelgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
    dttderjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucffohhmrghinhepuggvfhgruhhlthdrihhnnecukfhppeduudekrddvtdelrd
    duieekrddvieenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgif
    rdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KgCQXc66ryo1kLUMB3LkOwKKViyn34Tthi_PaWAqHPgev9ELAv5XfQ>
    <xmx:KgCQXZltMvWDuYK57krbcqNuIDlyskCNO3LbQztcPTJoi64cWcuhxw>
    <xmx:KgCQXWJ5RAhqGzl4krRaHXX2SHpKaEGpvNWNxuE5gbqXtYfmtmWXxQ>
    <xmx:KgCQXU6FIBj2ILKkKTA_3EMUaSfiM5QK5CWvUIw3KcAXqOraTw5IyA>
Received: from mickey.themaw.net (unknown [118.209.168.26])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3E9AA8005A;
        Sat, 28 Sep 2019 20:51:52 -0400 (EDT)
Message-ID: <6d4d525c488a658b2e6defb09eee86deb2aa6d6a.camel@themaw.net>
Subject: Re: [PATCH] Update default program values for autofs.conf manual.
From:   Ian Kent <raven@themaw.net>
To:     "aliveTerraN ." <nurgrak@gmail.com>
Cc:     autofs@vger.kernel.org
Date:   Sun, 29 Sep 2019 08:51:49 +0800
In-Reply-To: <CABPfrkxOVe1RV+bdm=WBwRvvfdHJMfix-L8yEEfpxN7ChKq1kw@mail.gmail.com>
References: <CABPfrkyd+o49B=XNYO_KOp_LQ4mar5wcfJ5LZJGSmr+9sME2ww@mail.gmail.com>
         <CABPfrkxOVe1RV+bdm=WBwRvvfdHJMfix-L8yEEfpxN7ChKq1kw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, 2019-09-28 at 11:08 +0200, aliveTerraN . wrote:
> Sent only to Ian by mistake, so here is the forwarded message with
> correct subject.
> 
> ---------- Forwarded message ---------
> 
> Checking the default values we have in redhat/autofs.conf.default.in
> and comparing them to the autofs.conf.5.in manual they differed.
> 
> With current iteration of autofs, we by default have that maps are
> not
> browsable and we now look for NFSv4 by default. So I changed the
> manual so it shows the correct default values for the user.

I don't think it's quite as simple as that.

The man page mentions the program default and those are accurate,
it's the installed configuration that's different and there's two
possibilities for those.

For browse_mode adding something like "installed configuration
default" to distinguish between the configuration setting and
the program source code setting is probably best.

The mount_nfs_default_protocol is different between the two
possible configurations and probably shouldn't be.

The internal program default probably should change to version
4, the configuration and man page updated.

> 
> Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
> ---
> 
> diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
> index 39239d4..6391dc3 100644
> --- a/man/autofs.conf.5.in
> +++ b/man/autofs.conf.5.in
> @@ -63,13 +63,13 @@ but it is the best we can do.
>  .TP
>  .B browse_mode
>  .br
> -Maps are browsable by default (program default "yes").
> +Maps are browsable by default (program default "no").
>  .TP
>  .B mount_nfs_default_protocol
>  .br
>  Set the default protocol that
>  .BR mount.nfs (8)
> -uses when performing a mount (program default 3). Autofs needs to
> know
> +uses when performing a mount (program default 4). Autofs needs to
> know
>  the default NFS protocol that
>  .BR mount.nfs(8)
>  uses so it can do special case handling for its availability probe
> for

