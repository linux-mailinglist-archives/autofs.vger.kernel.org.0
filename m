Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E877849C751
	for <lists+autofs@lfdr.de>; Wed, 26 Jan 2022 11:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239820AbiAZKS3 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Jan 2022 05:18:29 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:60010 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239818AbiAZKS1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Jan 2022 05:18:27 -0500
Date:   Wed, 26 Jan 2022 18:18:25 +0800
From:   Yixun Lan <dlan@gentoo.org>
To:     Fabian Groffen <grobian@gentoo.org>
Cc:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YfEf8RoMPbjSylm8@ofant>
References: <YeaWIKm/9szaWHIA@gentoo.org>
 <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
 <YehQdqiLSz6LMPVi@gentoo.org>
 <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
 <YekOscjFLNMjggd7@gentoo.org>
 <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
 <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
 <YepbqFeUBns+KRbj@gentoo.org>
 <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
 <YfEV6b6ZGNJHavr2@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfEV6b6ZGNJHavr2@gentoo.org>
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

HI Fabian:

On 10:35 Wed 26 Jan     , Fabian Groffen wrote:
> On 21-01-2022 20:24:14 +0800, Ian Kent wrote:
> > > (this is identical to the 5.1.6 output)
> > > 
> > > build-log attached
> > 
> > That all looks good, including the build log.
> > 
> > How about we try stopping the autofs service and run automount
> > manually and see what we get.
> > 
> > Stop the service then run "automount -fd | tee autofs.log".
> > 
> > It might be useful to add a stderr redirect too but I usually
> > don't need it, eg. "automount -fd 2>&1 | tee autofs.log".
> 
> Sorry for the delay.
> 
> What I see is a difference in the mount sequence.
> 
> 5.1.6:
> 
> attempting to mount entry /net/host/export/gentoo
> lookup_mount: lookup(program): /net/host/export/gentoo -> -fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768 host:/export/gentoo
> parse_mount: parse(sun): expanded entry: -fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768 host:/export/gentoo
> parse_mount: parse(sun): gathered options: fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> sun_mount: parse(sun): mounting root /net/host/export/gentoo, mountpoint /net/host/export/gentoo, what host:/export/gentoo, fstype nfs4, options hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> mount(nfs): root=/net/host/export/gentoo name=/net/host/export/gentoo what=host:/export/gentoo, fstype=nfs4, options=hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768
> mount(nfs): nfs options="hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768", nobind=0, nosymlink=0, ro=0
> get_nfs_info: called with host host(127.0.0.65) proto 6 version 0x40
> get_nfs_info: nfs v4 rpc ping time: 0.010256
> get_nfs_info: host host cost 10255 weight 0
> prune_host_list: selected subset of hosts that support NFS4 over TCP
> 
> while 5.1.8 does:
> 
> attempting to mount entry /net/host/export/gentoo
> lookup_mount: lookup(program): /net/host/export/gentoo -> -fstype=nfs,hard,nodev,nosuid host:/export/gentoo
                                                              ~~~~~~~~~
				        somehow, it pass the "nfs(v3)" at begining?

> parse_mount: parse(sun): expanded entry: -fstype=nfs,hard,nodev,nosuid host:/export/gentoo

> parse_mount: parse(sun): gathered options: fstype=nfs,hard,nodev,nosuid
> sun_mount: parse(sun): mounting root /net/host/export/gentoo, mountpoint /net/host/export/gentoo, what host:/export/gentoo, fstype nfs, options hard,nodev,nosuid
> mount(nfs): root=/net/host/export/gentoo name=/net/host/export/gentoo what=host:/export/gentoo, fstype=nfs, options=hard,nodev,nosuid
> mount(nfs): nfs options="hard,nodev,nosuid", nobind=0, nosymlink=0, ro=0
> get_nfs_info: called with host host(127.0.0.65) proto 6 version 0x20
> get_nfs_info: nfs v3 rpc ping time: 0.008827
> get_nfs_info: host host cost 8827 weight 0
> get_nfs_info: called with host host(127.0.0.65) proto 17 version 0x20
> prune_host_list: selected subset of hosts that support NFS3 over TCP
> 
> So it's not using NFSv4 here.
> 
> Is this enough of the logs?  Else I need to do some more redaction here.
> 
> Fabian
> 
> -- 
> Fabian Groffen
> Gentoo on a different level



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
