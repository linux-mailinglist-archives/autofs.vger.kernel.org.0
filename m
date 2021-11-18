Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455C54553A3
	for <lists+autofs@lfdr.de>; Thu, 18 Nov 2021 05:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242045AbhKREL6 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 17 Nov 2021 23:11:58 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:38611 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240638AbhKREL6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 17 Nov 2021 23:11:58 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 132333201D0A;
        Wed, 17 Nov 2021 23:08:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 17 Nov 2021 23:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        0/ZI2j1kfSHYtLy5CXGw1Pt1LQtNrPewVEdlB5tmaoA=; b=LUPtMp8fzSP8DhWr
        KBWw+/qsXHkqhnXuoaX5DLXMD5Ty+yB4JjyNb28rjREVJe7SEycyoNR3RZ39HGnY
        A3VLyUUkPlpgYRZlABKGbYNTe6Kz+wSqv6M/NA5JxPgl8waGP6dN+1plxHzGCjlL
        OkOxJe7WcM0cOSZMyTkVDGhImCS7CibRuP3C9lQ4YOJBs9jDjrxsTTFIGK2iDddV
        ncU6IhiKIgCZrra4s+kwd2ofvpNHxZtPMWdZo7oJuOl7IYBxsLIteB8vGwU+WTqG
        j+m78S6iSW2b7o6v1Fg6sPzpXKuT88o7Z5c2suo1OUCceAR7kJUX3lBeOT4J7mUc
        sOS/Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=0/ZI2j1kfSHYtLy5CXGw1Pt1LQtNrPewVEdlB5tma
        oA=; b=Yp0fOXyyofSq4RHjcPAbLRg5/SBgf2lvLwhb7QSKkkWtDTKlpiE66vsu3
        rJLYT9EU96clnLWcp7iwtlGasR7OKZ/24t8vqY2uFtFmHV8SyIOr2M4YoT0G6w0I
        7F6DnRlKi6xd9Z2FyXOaLwxmu5hNk7mX4V2anHYQIJs/S/AEBm8botYz3lqmKXjf
        L8wp8DpcRD0SmJ4WqCm38Lm+p54SDO0B0lpj2ywDNbrhoWRCdL8pGV9ngHXwJxcJ
        MJtMkrtajB78EOEe1+XXCTdNIFKXSHnQn5dCYsWX92wd9/hO9RXGBgzUuLkDmvci
        BeN81JgG8OQb7kF7RNUZrAhmL2clA==
X-ME-Sender: <xms:2dGVYde7NLvNoKCj5nw8arnaZgi4o0JYHa08ozItL0rlJ_EKGLhyEg>
    <xme:2dGVYbNAYfr6zJMAlY4SZ3rIL8QcsWqKN1ZDGyeK-cJSeMRceEIDgrDEl8aUWHcIF
    lOSxmxwb1F8>
X-ME-Received: <xmr:2dGVYWi27dEaKG7kXwvhCkUeTvR4SpFs-sAKrcESSFs-ERLm7GIIxPqW42GaeLenJhb4O2c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeehgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepge
    dviefgheduvdffuddtieeuffetvdefuedtgfffvdevgeefveffieeujeffjeevnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:2dGVYW-G25BgGnBMecDVu_TrfcpaUbv6PHUAlZu9gLTePPv4O7xASw>
    <xmx:2dGVYZu711T4Jipm8sFQBAiTdAx-F63mlPNFpclebQ8k-jWG7VvM6g>
    <xmx:2dGVYVG_MtCQZlo36iN_3TvgeKvc8N3TFq_YKq8i6vblzZfVOu3EVg>
    <xmx:2dGVYe62W6ThFV5spmxyUNgXYCxzb9LGBI5ZbXsV-fjvXpQe_Q9EDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 23:08:55 -0500 (EST)
Message-ID: <12697fd2f212d6be9658df6d5f56b34b854cf4c6.camel@themaw.net>
Subject: Re: autofs 5.1.8 and TCP_REQUESTED
From:   Ian Kent <raven@themaw.net>
To:     Stanislav Levin <slev@altlinux.org>, autofs@vger.kernel.org
Date:   Thu, 18 Nov 2021 12:08:51 +0800
In-Reply-To: <7550afb574d26b09ce68b39462a778ed244ece02.camel@themaw.net>
References: <76446ac4-04e1-85d2-1cb2-d7264142cdaa@altlinux.org>
         <7550afb574d26b09ce68b39462a778ed244ece02.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sun, 2021-10-31 at 07:35 +0800, Ian Kent wrote:
> On Fri, 2021-10-29 at 13:02 +0300, Stanislav Levin wrote:
> > Hello.
> > 
> > With switching of autofs 5.1.7 -> 5.1.8 we faced the next issue.
> > 
> > My Linux distro (ALTLinux) has the policy for rpcbind which controls
> > the
> > localhostness (localhost only by default). NFSv4 doesn't require
> > rpcbind. But with 606795ecfaa1ba45ab58fa20376213f6089e42e9
> > (
> > https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=606795ecfaa1ba45ab58fa20376213f6089e42e9
> > )
> > it is mandatory and broken our users.
> > 
> > autoumount log:
> > 
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: handle_packet: type
> > = 3
> > Oct 28 08:23:24 client3.ipa.test automount[1243]:
> > handle_packet_missing_indirect: token 2, name athena, request pid
> > 1297
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: attempting to mount
> > entry /home/athena
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: lookup_mount:
> > lookup(sss): looking up athena
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: lookup_mount:
> > lookup(sss): athena -> -fstype=nfs4,rw,sec=krb5p
> > client1.ipa.test:/krbnfs_home/&
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> > parse(sun): expanded entry: -fstype=nfs4,rw,sec=krb5p
> > client1.ipa.test:/krbnfs_home/athena
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> > parse(sun): gathered options: fstype=nfs4,rw,sec=krb5p
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> > parse(sun): dequote("client1.ipa.test:/krbnfs_home/athena") ->
> > client1.ipa.test:/krbnfs_home/athena
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: parse_mount:
> > parse(sun): core of entry: options=fstype=nfs4,rw,sec=krb5p,
> > loc=client1.ipa.test:/krbnfs_home/athena
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: sun_mount:
> > parse(sun):
> > mounting root /home, mountpoint athena, what
> > client1.ipa.test:/krbnfs_home/athena, fstype nfs4, options
> > rw,sec=krb5p
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs):
> > root=/home
> > name=athena what=client1.ipa.test:/krbnfs_home/athena, fstype=nfs4,
> > options=rw,sec=krb5p
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): nfs
> > options="rw,sec=krb5p", nobind=0, nosymlink=0, ro=0
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: get_nfs_info:
> > called
> > with host client1.ipa.test(172.18.0.2) proto 6 version 0x40
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: get_portmap_client:
> > error 0x3 getting portmap client
> > Oct 28 08:23:24 client3.ipa.test automount[1243]: mount(nfs): no
> > hosts
> > available
> > 
> > reason:
> > 
> > (gdb) bt
> > #0  get_vers_and_cost (logopt=logopt@entry=1,
> > host=host@entry=0x7f239c002240, version=version@entry=65,
> > port=port@entry=-1) at /usr/src/debug/autofs-
> > 5.1.8/modules/replicated.c:552
> > #1  0x00007f23a52a2b12 in prune_host_list (logopt=1,
> > list=list@entry=0x7f23a4a64590, vers=vers@entry=65, port=port@entry=-
> > 1)
> > at /usr/src/debug/autofs-5.1.8/modules/replicated.c:785
> > #2  0x00007f23a52a384e in mount_mount (ap=<optimized out>,
> > root=<optimized out>, name=<optimized out>, name_len=<optimized out>,
> > what=<optimized out>, fstype=<optimized out>, options=<optimized
> > out>,
> > context=<optimized out>) at
> > /usr/src/debug/autofs-5.1.8/modules/mount_nfs.c:270
> > #3  0x00007f23a52c4e23 in sun_mount (ap=ap@entry=0x562be0d49120,
> > root=root@entry=0x562be0d49200 "/home",
> > name=name@entry=0x7f23a4a668d0
> > "athena", namelen=namelen@entry=6, loc=loc@entry=0x7f239c001f80
> > "client1.ipa.test:/krbnfs_home/athena", loclen=loclen@entry=36,
> > options=0x7f23a4a656a0 "rw,sec=krb5p", ctxt=<optimized out>) at
> > /usr/src/debug/autofs-5.1.8/modules/parse_sun.c:713
> > #4  0x00007f23a52cd1cd in parse_mount (ap=0x562be0d49120,
> > name=0x7f23a4a668d0 "athena", name_len=6, mapent=<optimized out>,
> > context=0x7f2398000f80) at
> > /usr/src/debug/autofs-5.1.8/modules/parse_sun.c:1708
> > #5  0x00007f23a52f7f35 in lookup_mount (ap=0x562be0d49120,
> > name=<optimized out>, name_len=<optimized out>,
> > context=0x7f2398000ef0)
> > at /usr/src/debug/autofs-5.1.8/modules/lookup_sss.c:1121
> > #6  0x0000562bdf8e7fe7 in do_lookup_mount
> > (ap=ap@entry=0x562be0d49120,
> > map=0x7f2398000d80, name=name@entry=0x7f23a4a6bd90 "athena",
> > name_len=name_len@entry=6) at
> > /usr/src/debug/autofs-5.1.8/daemon/lookup.c:823
> > #7  0x0000562bdf8ee4ec in lookup_name_source_instance
> > (ap=ap@entry=0x562be0d49120, map=map@entry=0x562be0d49220,
> > type=type@entry=0x7f239c001ab0 "sss", name=name@entry=0x7f23a4a6bd90
> > "athena", name_len=name_len@entry=6) at
> > /usr/src/debug/autofs-5.1.8/daemon/lookup.c:993
> > #8  0x0000562bdf8ee5d8 in lookup_map_name
> > (this=this@entry=0x7f239c001a70, ap=ap@entry=0x562be0d49120,
> > map=map@entry=0x562be0d49220, name=name@entry=0x7f23a4a6bd90
> > "athena",
> > name_len=name_len@entry=6) at
> > /usr/src/debug/autofs-5.1.8/daemon/lookup.c:1044
> > #9  0x0000562bdf8ef5ae in lookup_nss_mount (ap=0x562be0d49120,
> > source=0x0, name=0x7f23a4a6bd90 "athena", name_len=6) at
> > /usr/src/debug/autofs-5.1.8/daemon/lookup.c:1241
> > #10 0x0000562bdf8e032b in do_mount_indirect (arg=<optimized out>) at
> > /usr/src/debug/autofs-5.1.8/daemon/indirect.c:756
> > 
> > (gdb) info args
> > logopt = 1
> > host = 0x7f239c002240
> > version = 65
> > port = -1
> > 
> > (gdb) p /t version
> > $22 = 1000001
> > 
> > so, version is (NFS4_REQUESTED | TCP_REQUESTED). It's ok.
> > 
> > vers is defined as (NFS_VERS_MASK | NFS4_VERS_MASK)
> > (gdb) p /t 0x0010 | 0x0020 | 0x0040
> > $21 = 1110000
> > 
> > with vers &= version; TCP_REQUESTED is filtered out and only
> > NFS4_REQUESTED stay in. Thus, get_nfs_info will never(?) receive
> > TCP_REQUESTED and this makes NFSv4 port setting unreachable:
> >  294                 if ((version & NFS4_REQUESTED) && (version &
> > TCP_REQUESTED))
> >  295                         rpc_info->port = NFS_PORT;
> 
> Yes, that's broken.
> 
> I'll need to fix that, I'll get back with a patch.

Does this patch fix the problem you are seeing (note the CHANGELOG
hunk won't apply but should be straight forward to fix)?

autofs-5.1.8 - fix nfsv4 only mounts should not use rpcbind

From: Ian Kent <raven@themaw.net>

Commit 606795ecfaa1 ("autofs-5.1.7 - also require TCP_REQUESTED when
setting NFS port" together with commit 26fb6b5408be) caused NFSv4 only
mounts to also use rpcbind to probe availability which breaks the
requirememt that this type of mount not use rpcbind at all.

Fix this by treating fstype=nfs4 mounts as a special case which doesn't
use rpcbind.
---
 CHANGELOG            |    1 +
 include/replicated.h |    2 ++
 modules/mount_nfs.c  |   13 +++++++------
 modules/replicated.c |    4 ++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 9d92229a..0f7beba2 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,4 +1,5 @@
 - fix kernel mount status notificantion.
+- fix nfsv4 only mounts should not use rpcbind.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/include/replicated.h b/include/replicated.h
index 95ff1f0d..f889a56a 100644
--- a/include/replicated.h
+++ b/include/replicated.h
@@ -35,6 +35,8 @@
 #define NFS3_REQUESTED		NFS3_SUPPORTED
 #define NFS4_REQUESTED		NFS4_SUPPORTED
 
+#define NFS4_ONLY_REQUESTED	0x0800
+
 #define TCP_SUPPORTED		0x0001
 #define UDP_SUPPORTED		0x0002
 #define TCP_REQUESTED		TCP_SUPPORTED
diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
index 0ab87dcf..feb5afcd 100644
--- a/modules/mount_nfs.c
+++ b/modules/mount_nfs.c
@@ -92,7 +92,7 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
 	mount_default_proto = defaults_get_mount_nfs_default_proto();
 	vers = NFS_VERS_DEFAULT | NFS_PROTO_DEFAULT;
 	if (strcmp(fstype, "nfs4") == 0)
-		vers = NFS4_VERS_DEFAULT | TCP_SUPPORTED;
+		vers = NFS4_VERS_DEFAULT | TCP_SUPPORTED | NFS4_ONLY_REQUESTED;
 	else if (mount_default_proto == 4)
 		vers = vers | NFS4_VERS_DEFAULT;
 
@@ -157,15 +157,16 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
 			} else {
 				/* Is any version of NFSv4 in the options */
 				if (_strncmp("vers=4", cp, 6) == 0 ||
-				    _strncmp("nfsvers=4", cp, 9) == 0)
-					vers = NFS4_VERS_MASK | TCP_SUPPORTED;
-				else if (_strncmp("vers=3", cp, o_len) == 0 ||
+				    _strncmp("nfsvers=4", cp, 9) == 0) {
+					vers &= ~(NFS_VERS_MASK);
+					vers |= NFS4_VERS_MASK | TCP_SUPPORTED | NFS4_ONLY_REQUESTED;
+				} else if (_strncmp("vers=3", cp, o_len) == 0 ||
 					 _strncmp("nfsvers=3", cp, o_len) == 0) {
-					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK);
+					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK | NFS4_ONLY_REQUESTED);
 					vers |= NFS3_REQUESTED;
 				} else if (_strncmp("vers=2", cp, o_len) == 0 ||
 					 _strncmp("nfsvers=2", cp, o_len) == 0) {
-					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK);
+					vers &= ~(NFS4_VERS_MASK | NFS_VERS_MASK | NFS4_ONLY_REQUESTED);
 					vers |= NFS2_REQUESTED;
 				} else if (strstr(cp, "port=") == cp &&
 					 o_len - 5 < 25) {
diff --git a/modules/replicated.c b/modules/replicated.c
index 09075dd0..cdb7c617 100644
--- a/modules/replicated.c
+++ b/modules/replicated.c
@@ -291,7 +291,7 @@ static unsigned int get_nfs_info(unsigned logopt, struct host *host,
 
 	rpc_info->proto = proto;
 	if (port < 0) {
-		if ((version & NFS4_REQUESTED) && (version & TCP_REQUESTED))
+		if (version & NFS4_REQUESTED && (version & NFS4_ONLY_REQUESTED))
 			rpc_info->port = NFS_PORT;
 		else
 			port = 0;
@@ -525,7 +525,7 @@ static int get_vers_and_cost(unsigned logopt, struct host *host,
 {
 	struct conn_info pm_info, rpc_info;
 	time_t timeout = RPC_TIMEOUT;
-	unsigned int supported, vers = (NFS_VERS_MASK | NFS4_VERS_MASK);
+	unsigned int supported, vers = (NFS_VERS_MASK | NFS4_VERS_MASK | NFS4_ONLY_REQUESTED);
 	int ret = 0;
 
 	if (!check_address_proto(logopt, host, version))



