Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7B649C5DA
	for <lists+autofs@lfdr.de>; Wed, 26 Jan 2022 10:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238773AbiAZJJ7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Jan 2022 04:09:59 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:48976 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiAZJJ7 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Jan 2022 04:09:59 -0500
Date:   Wed, 26 Jan 2022 17:09:48 +0800
From:   Yixun Lan <dlan@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Fabian Groffen <grobian@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YfEP3K3xwluSg8RR@ofant>
References: <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
 <YeaWIKm/9szaWHIA@gentoo.org>
 <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
 <YehQdqiLSz6LMPVi@gentoo.org>
 <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
 <YekOscjFLNMjggd7@gentoo.org>
 <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
 <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
 <YepbqFeUBns+KRbj@gentoo.org>
 <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <533443bba593e6d7a9cfdbfb8bb4fb95edb010d6.camel@themaw.net>
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 20:24 Fri 21 Jan     , Ian Kent wrote:
> On Fri, 2022-01-21 at 08:07 +0100, Fabian Groffen wrote:
> > On 20-01-2022 19:41:11 +0800, Ian Kent wrote:
> > > > If it's not using the expected location for autofs.conf that's a
> > > > build
> > > > problem.
> > > > 
> > > > Can you get me a build log.
> > > 
> > > And what does "automount -V" say?
> > 
> > Linux automount version 5.1.8
> > 
> > Directories:
> >         config dir:     /etc/conf.d
> >         maps dir:       /etc/autofs
> >         modules dir:    /usr/lib64/autofs
> > 
> > Compile options:
> >   DISABLE_MOUNT_LOCKING ENABLE_FORCED_SHUTDOWN
> > ENABLE_IGNORE_BUSY_MOUNTS 
> >   LIBXML2_WORKAROUND WITH_LIBTIRPC 
> > 
> > (this is identical to the 5.1.6 output)
> > 
> > build-log attached
> 
> That all looks good, including the build log.
> 
> How about we try stopping the autofs service and run automount
> manually and see what we get.
> 
> Stop the service then run "automount -fd | tee autofs.log".
> 
> It might be useful to add a stderr redirect too but I usually
> don't need it, eg. "automount -fd 2>&1 | tee autofs.log".
> 
> Ian
Hi Fabian:
  Any update on this?

Hi ALL:
  I've also give it a shot locally, and still can't reproduce this..

=========== here is logs

$ sudo rc-service autofs start
  * Starting automounter ... [ ok ]

$ sudo  grep automount /var/log/messages | tee automout.log
Jan 26 16:47:30 serv0 automount[21256]: Starting automounter version 5.1.8, master map auto.master
Jan 26 16:47:30 serv0 automount[21256]: using kernel protocol version 5.05
Jan 26 16:47:30 serv0 automount[21256]: lookup_nss_read_master: reading master files auto.master
Jan 26 16:47:30 serv0 automount[21256]: do_init: parse(sun): init gathered global options: (null)
Jan 26 16:47:30 serv0 automount[21256]: spawn_mount: mtab link detected, passing -n to mount
Jan 26 16:47:30 serv0 automount[21256]: spawn_umount: mtab link detected, passing -n to mount
Jan 26 16:47:30 serv0 automount[21256]: lookup_read_master: lookup(file): read entry /net
Jan 26 16:47:30 serv0 automount[21256]: master_do_mount: mounting /net
Jan 26 16:47:30 serv0 automount[21256]: automount_path_to_fifo: fifo name /run/autofs.fifo-net
Jan 26 16:47:30 serv0 automount[21256]: lookup_nss_read_map: reading map file /etc/autofs/auto.net
Jan 26 16:47:30 serv0 automount[21256]: do_init: parse(sun): init gathered global options: (null)
Jan 26 16:47:30 serv0 automount[21256]: spawn_mount: mtab link detected, passing -n to mount
Jan 26 16:47:30 serv0 automount[21256]: spawn_umount: mtab link detected, passing -n to mount
Jan 26 16:47:30 serv0 automount[21256]: mounted indirect on /net with timeout 300, freq 75 seconds
Jan 26 16:47:30 serv0 automount[21256]: st_ready: st_ready(): state = 0 path /net

serv0 ~ $ grep  "^opts" /etc/autofs/auto.net
opts="-fstype=nfs4,hard,sec=sys,nodev,nosuid,wsize=32768,rsize=32768"

serv0 ~ $ mount |grep net
net_cls on /sys/fs/cgroup/net_cls type cgroup (rw,nosuid,nodev,noexec,relatime,net_cls)
net_prio on /sys/fs/cgroup/net_prio type cgroup (rw,nosuid,nodev,noexec,relatime,net_prio)
/etc/autofs/auto.net on /net type autofs (rw,relatime,fd=7,pgrp=21256,timeout=300,minproto=5,maxproto=5,indirect,pipe_ino=11850419)
serv0 ~ $ ls /net/serv2/home/gentoo
distfiles 
serv0 ~ $ mount |grep net
net_cls on /sys/fs/cgroup/net_cls type cgroup (rw,nosuid,nodev,noexec,relatime,net_cls)
net_prio on /sys/fs/cgroup/net_prio type cgroup (rw,nosuid,nodev,noexec,relatime,net_prio)
/etc/autofs/auto.net on /net type autofs (rw,relatime,fd=7,pgrp=21256,timeout=300,minproto=5,maxproto=5,indirect,pipe_ino=11850419)
/etc/autofs/auto.net on /net/serv2/home/gentoo type autofs (rw,relatime,fd=7,pgrp=21256,timeout=300,minproto=5,maxproto=5,offset,pipe_ino=11850419)
serv2:/home/gentoo on /net/serv2/home/gentoo type nfs4 (rw,nosuid,nodev,relatime,vers=4.1,rsize=32768,wsize=32768,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.90.150,local_lock=none,addr=192.168.90.159)

$ automount -V

Linux automount version 5.1.8

Directories:
        config dir:     /etc/conf.d
        maps dir:       /etc/autofs
        modules dir:    /usr/lib64/autofs

Compile options:
  DISABLE_MOUNT_LOCKING ENABLE_FORCED_SHUTDOWN ENABLE_IGNORE_BUSY_MOUNTS
  LIBXML2_WORKAROUND WITH_LIBTIRPC
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
