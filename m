Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E120440C59
	for <lists+autofs@lfdr.de>; Sun, 31 Oct 2021 01:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhJ3XiI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 30 Oct 2021 19:38:08 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37617 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231387AbhJ3XiI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 30 Oct 2021 19:38:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 095085C0117;
        Sat, 30 Oct 2021 19:35:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 30 Oct 2021 19:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        gG1SoMPlPaw93ev1RrB1zni4uQBAj6in6xxNEGeItI4=; b=c7FTSZqCvx+Vy8LG
        3UiQ2ycCILo92jNeGXFxy0cS2Y6b37uEJ45X25dd7cZJEY9Mah60nnJgh+T4MmDy
        r8VhPltrLJ82AdWyefcJ1FMsk5O9zm9gsmIJ+rU4pnaAosTjNdLhRLo5QfuUyqBK
        c5Up9tgaboZ7I/Sb/5QkOK/NuNB5YZzXQy51qn0pVOjjPLAN4B2xocDxpzQtQiUX
        HM9I/QkyVbf6AkRO0CA4YSy7ehYnyiXJfT8xtFKgz4l1bHsDqBbW+meEQ/1Jd/aD
        7aq/jeMvRGqcO4yarF+glqk4d84cotAAht+Mw5Ia8MALAvqrxFUaOVvXlS8oXzpM
        zhEm5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=gG1SoMPlPaw93ev1RrB1zni4uQBAj6in6xxNEGeIt
        I4=; b=miZkVWXYzf9dKKWovqBGEORwF/SOPf+bkoGRcz2ZaaR95TXf/ZUkB/BEt
        TT54yJxHS46UVkEOqbLtcB6kloV2t+PGiEJdf/+JYbbtHJag0jwvA3/G8b44W97L
        ZA4AxyIgo99vRhJou7Jp1YriaXUGlKritPL33rh5z5cPssAgp+mi7ZffdQRD1tbz
        dGgPG+Bzd7lIwHy+Chc/DW/z9viF8setA/hZOI9Q1sGqaSPCP+Sb3xvkGs5ck+nU
        Ptlayi/lVJmNDd6bFHD6YFXxiLA8EYhPmtZE9fn2gFs/LQQd4YeFZV76Z8rwLhcm
        6JETjeHr8LkRyRGXXs5K11xfNFKzw==
X-ME-Sender: <xms:yNZ9YZEHLxDtywI8pP6pfZiXiVmKxbcQyI67mfwGNHgCr0eJhAkzsw>
    <xme:yNZ9YeWadCThbBt6AaUYxB0h0rCwMPKYDhxMVp5NoFZhFn6nKP9yBjyJz_WWAkkIB
    3BSCajEj7pK>
X-ME-Received: <xmr:yNZ9YbIJTKEhjIp6lM5kMcE8IWSrdHJavWMxBr0gUsg2PgAt9mYhE5wj64lde5NRgcA3MlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegkedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    egvdeigfehuddvffdutdeiuefftedvfeeutdfgffdvveegfeevffeiueejffejveenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:yNZ9YfF4EY8GH0hX8wuV-ziTgW7kFNhNP3kr6MoRXECpBDoAI8P5sA>
    <xmx:yNZ9YfXIiFW4gCf9Uh3J4VCCbAByne2E1As9iA4DdRpM1zgZvXpIew>
    <xmx:yNZ9YaNKjIjy0L9RFwHTJKi9TqUoQn7VB_4OyQHh_WKGLjq9t1tSyA>
    <xmx:ydZ9YWBlGS2-vNwR123i20iqg8I1L8_7zMYXVICit9C4BEKUZ09LVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Oct 2021 19:35:34 -0400 (EDT)
Message-ID: <7550afb574d26b09ce68b39462a778ed244ece02.camel@themaw.net>
Subject: Re: autofs 5.1.8 and TCP_REQUESTED
From:   Ian Kent <raven@themaw.net>
To:     Stanislav Levin <slev@altlinux.org>, autofs@vger.kernel.org
Date:   Sun, 31 Oct 2021 07:35:30 +0800
In-Reply-To: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
References: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2021-10-29 at 13:02 +0300, Stanislav Levin wrote:
> Hello.
> 
> With switching of autofs 5.1.7 -> 5.1.8 we faced the next issue.
> 
> My Linux distro (ALTLinux) has the policy for rpcbind which controls
> the
> localhostness (localhost only by default). NFSv4 doesn't require
> rpcbind. But with 606795ecfaa1ba45ab58fa20376213f6089e42e9
> (
> https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=606795ecfaa1ba45ab58fa20376213f6089e42e9
> )
> it is mandatory and broken our users.
> 
> autoumount log:
> 
> Oct 28 08:23:24 client3.ipa.test automount[1243]: handle_packet: type
> = 3
> Oct 28 08:23:24 client3.ipa.test automount[1243]:
> handle_packet_missing_indirect: token 2, name athena, request pid
> 1297
> Oct 28 08:23:24 client3.ipa.test automount[1243]: attempting to mount
> entry /home/athena
> Oct 28 08:23:24 client3.ipa.test automount[1243]: lookup_mount:
> lookup(sss): looking up athena
> Oct 28 08:23:24 client3.ipa.test automount[1243]: lookup_mount:
> lookup(sss): athena -> -fstype=nfs4,rw,sec=krb5p
> client1.ipa.test:/krbnfs_home/&
> Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> parse(sun): expanded entry: -fstype=nfs4,rw,sec=krb5p
> client1.ipa.test:/krbnfs_home/athena
> Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> parse(sun): gathered options: fstype=nfs4,rw,sec=krb5p
> Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> parse(sun): dequote("client1.ipa.test:/krbnfs_home/athena") ->
> client1.ipa.test:/krbnfs_home/athena
> Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> parse(sun): core of entry: options=fstype=nfs4,rw,sec=krb5p,
> loc=client1.ipa.test:/krbnfs_home/athena
> Oct 28 08:23:24 client3.ipa.test automount[1243]: sun_mount:
> parse(sun):
> mounting root /home, mountpoint athena, what
> client1.ipa.test:/krbnfs_home/athena, fstype nfs4, options
> rw,sec=krb5p
> Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs):
> root=/home
> name=athena what=client1.ipa.test:/krbnfs_home/athena, fstype=nfs4,
> options=rw,sec=krb5p
> Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): nfs
> options="rw,sec=krb5p", nobind=0, nosymlink=0, ro=0
> Oct 28 08:23:24 client3.ipa.test automount[1243]: get_nfs_info:
> called
> with host client1.ipa.test(172.18.0.2) proto 6 version 0x40
> Oct 28 08:23:24 client3.ipa.test automount[1243]: get_portmap_client:
> error 0x3 getting portmap client
> Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): no
> hosts
> available
> 
> reason:
> 
> (gdb) bt
> #0  get_vers_and_cost (logopt=logopt@entry=1,
> host=host@entry=0x7f239c002240, version=version@entry=65,
> port=port@entry=-1) at /usr/src/debug/autofs-
> 5.1.8/modules/replicated.c:552
> #1  0x00007f23a52a2b12 in prune_host_list (logopt=1,
> list=list@entry=0x7f23a4a64590, vers=vers@entry=65, port=port@entry=-
> 1)
> at /usr/src/debug/autofs-5.1.8/modules/replicated.c:785
> #2  0x00007f23a52a384e in mount_mount (ap=<optimized out>,
> root=<optimized out>, name=<optimized out>, name_len=<optimized out>,
> what=<optimized out>, fstype=<optimized out>, options=<optimized
> out>,
> context=<optimized out>) at
> /usr/src/debug/autofs-5.1.8/modules/mount_nfs.c:270
> #3  0x00007f23a52c4e23 in sun_mount (ap=ap@entry=0x562be0d49120,
> root=root@entry=0x562be0d49200 "/home",
> name=name@entry=0x7f23a4a668d0
> "athena", namelen=namelen@entry=6, loc=loc@entry=0x7f239c001f80
> "client1.ipa.test:/krbnfs_home/athena", loclen=loclen@entry=36,
> options=0x7f23a4a656a0 "rw,sec=krb5p", ctxt=<optimized out>) at
> /usr/src/debug/autofs-5.1.8/modules/parse_sun.c:713
> #4  0x00007f23a52cd1cd in parse_mount (ap=0x562be0d49120,
> name=0x7f23a4a668d0 "athena", name_len=6, mapent=<optimized out>,
> context=0x7f2398000f80) at
> /usr/src/debug/autofs-5.1.8/modules/parse_sun.c:1708
> #5  0x00007f23a52f7f35 in lookup_mount (ap=0x562be0d49120,
> name=<optimized out>, name_len=<optimized out>,
> context=0x7f2398000ef0)
> at /usr/src/debug/autofs-5.1.8/modules/lookup_sss.c:1121
> #6  0x0000562bdf8e7fe7 in do_lookup_mount
> (ap=ap@entry=0x562be0d49120,
> map=0x7f2398000d80, name=name@entry=0x7f23a4a6bd90 "athena",
> name_len=name_len@entry=6) at
> /usr/src/debug/autofs-5.1.8/daemon/lookup.c:823
> #7  0x0000562bdf8ee4ec in lookup_name_source_instance
> (ap=ap@entry=0x562be0d49120, map=map@entry=0x562be0d49220,
> type=type@entry=0x7f239c001ab0 "sss", name=name@entry=0x7f23a4a6bd90
> "athena", name_len=name_len@entry=6) at
> /usr/src/debug/autofs-5.1.8/daemon/lookup.c:993
> #8  0x0000562bdf8ee5d8 in lookup_map_name
> (this=this@entry=0x7f239c001a70, ap=ap@entry=0x562be0d49120,
> map=map@entry=0x562be0d49220, name=name@entry=0x7f23a4a6bd90
> "athena",
> name_len=name_len@entry=6) at
> /usr/src/debug/autofs-5.1.8/daemon/lookup.c:1044
> #9  0x0000562bdf8ef5ae in lookup_nss_mount (ap=0x562be0d49120,
> source=0x0, name=0x7f23a4a6bd90 "athena", name_len=6) at
> /usr/src/debug/autofs-5.1.8/daemon/lookup.c:1241
> #10 0x0000562bdf8e032b in do_mount_indirect (arg=<optimized out>) at
> /usr/src/debug/autofs-5.1.8/daemon/indirect.c:756
> 
> (gdb) info args
> logopt = 1
> host = 0x7f239c002240
> version = 65
> port = -1
> 
> (gdb) p /t version
> $22 = 1000001
> 
> so, version is (NFS4_REQUESTED | TCP_REQUESTED). It's ok.
> 
> vers is defined as (NFS_VERS_MASK | NFS4_VERS_MASK)
> (gdb) p /t 0x0010 | 0x0020 | 0x0040
> $21 = 1110000
> 
> with vers &= version; TCP_REQUESTED is filtered out and only
> NFS4_REQUESTED stay in. Thus, get_nfs_info will never(?) receive
> TCP_REQUESTED and this makes NFSv4 port setting unreachable:
>  294                 if ((version & NFS4_REQUESTED) && (version &
> TCP_REQUESTED))
>  295                         rpc_info->port = NFS_PORT;

Yes, that's broken.

I'll need to fix that, I'll get back with a patch.

Ian

