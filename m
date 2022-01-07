Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27FA487837
	for <lists+autofs@lfdr.de>; Fri,  7 Jan 2022 14:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347569AbiAGN3T (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 7 Jan 2022 08:29:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48842
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238674AbiAGN3Q (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 7 Jan 2022 08:29:16 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4B376406EA
        for <autofs@vger.kernel.org>; Fri,  7 Jan 2022 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641562155;
        bh=N2/QihHhGGEyR9bw4I64hq6j+1g9NNmt1o9dUVhVIxU=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=a0cIoGr32lgkTDt5/KHoyoJXVgS9wNUXwd0ZY1lbokwVU7iHMJ4utmTAxOOihT3+a
         dtPhCNrsaBD9hPCSmjVE4QxmwRfL61S4oOMEpmXrvCY8WRj1ZEYKVLsKtSRdvEvXXB
         wcj1Xufq06+bldEh6Kgl/jmh75TPgeBEWy6i8yXK4DSV4eGO2e9UbQB9XQhuzCKhx7
         Ix0wIn9G8uOrj3RbkjsKzps1reOZacQL1BOMVo7CwKIsnqcWbJifKRfVVsoJi0PSwi
         soca47RcbaEr9NBPw6aN/iCTj30UTKQU94vm6Ob7GOaRd2AJllnBCi/MJRyrIJQXq3
         6y4ALC7EwERww==
Received: by mail-ed1-f71.google.com with SMTP id ec25-20020a0564020d5900b003fc074c5d21so339274edb.19
        for <autofs@vger.kernel.org>; Fri, 07 Jan 2022 05:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N2/QihHhGGEyR9bw4I64hq6j+1g9NNmt1o9dUVhVIxU=;
        b=r+Zo+ghQNVc/XZuam/uyViRkkJ/kpYoLs4Hwb9D/BaliYtxuPiuXFka4J6ApyzQv74
         zF8KQQTEaHzGPiAAzWVDqb3rlwSryj+pI71/y/3ianfCUQ4P9IaKjjq8/ACQBeucDO44
         Oeo3qh14cZ2bRmXLjY8VLT/eTXsrZyEOuZC7394Xd/+Td90659XQxlGG7x6MsnUVkHRf
         pPiso/lT31d2B6BqqksJ8sUvp6U34Bx2C5RbZyZl1axzJmDBGZfn7UhfL4S15sm0GsDP
         y+4ntvnUuTS7kn5B9ab/SnO937fYke+8RrIZA0jKhjFbqpnoJsusjgMQMMqlY8ZRX6R9
         HZ8g==
X-Gm-Message-State: AOAM530gEeNGuKtFIrAZAD2rYmVwq7+Kwjt+1R99SbUX3onPDJlbT3hL
        jgUV+NLkORiC73ICUvPh+941QNb1dVnBthsUnFowXMXgqQUOdnnXjyYUcMk5eYHr5Sr/vS3zZJ0
        pWmtpj2r2VUqmfWx7IrTmYGFTHWghAoJ9hJTcSOBzmA806sbU8g==
X-Received: by 2002:a17:907:2d0c:: with SMTP id gs12mr49935287ejc.100.1641562154136;
        Fri, 07 Jan 2022 05:29:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWBNlzjnhLDQ9CAUgDNEfpJR66z1P9bTrjzzWozCJX4tOKz9JszGMp83ZhDeGcFKpdUDf6DZ4F+cXV5VDAIbA=
X-Received: by 2002:a17:907:2d0c:: with SMTP id gs12mr49935272ejc.100.1641562153827;
 Fri, 07 Jan 2022 05:29:13 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
 <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
In-Reply-To: <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Fri, 7 Jan 2022 10:29:02 -0300
Message-ID: <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Thu, Jan 6, 2022 at 8:27 PM Ian Kent <raven@themaw.net> wrote:
> Maybe, can I get a debug log please.
>
> Set "logging = debug" (without the comment marker of course) then
> use "journalctl | grep automount" to get the entries or if your
> using syslog a similar grep should get the log entries.
>
> I always ask for log output from starting up autofs until after
> the problem has occurred.

This is what I get when running automount in the foreground with debug
and verbose:
root@j-s390x:~# automount -f -d -v
Starting automounter version 5.1.8, master map /etc/auto.master
using kernel protocol version 5.05
lookup_nss_read_master: reading master file /etc/auto.master
do_init: parse(sun): init gathered global options: (null)
lookup_read_master: lookup(file): read entry +dir:/etc/auto.master.d
lookup_nss_read_master: reading master dir /etc/auto.master.d
lookup_read_master: lookup(dir): scandir: /etc/auto.master.d
include_file: lookup(dir): include: /etc/auto.master.d/net.autofs
lookup_nss_read_master: reading master file /etc/auto.master.d/net.autofs
do_init: parse(sun): init gathered global options: (null)
lookup_read_master: lookup(file): read entry /net
lookup_read_master: lookup(file): read entry +auto.master
lookup_nss_read_master: reading master sss auto.master
do_init: parse(sun): init gathered global options: (null)
can't connect to sssd, retry for 10 seconds
lookup_nss_read_master: no map - continuing to next source
lookup_read_master: lookup(file): read entry /cifs
master_do_mount: mounting /net
automount_path_to_fifo: fifo name /var/run/autofs.fifo-net
lookup_nss_read_map: reading map hosts -intr
do_init: parse(sun): init gathered global options: intr,soft
lookup_read_map: lookup(hosts): read hosts map
lookup_read_map: lookup(hosts): map not browsable, update existing
host entries only
mounted indirect on /net with timeout 180, freq 45 seconds
st_ready: st_ready(): state = 0 path /net
master_do_mount: mounting /cifs
automount_path_to_fifo: fifo name /var/run/autofs.fifo-cifs
lookup_nss_read_map: reading map file /etc/auto.smb
do_init: parse(sun): init gathered global options: (null)
mounted indirect on /cifs with timeout 180, freq 45 seconds
st_ready: st_ready(): state = 0 path /cifs
handle_packet: type = 3
handle_packet_missing_indirect: token 2, name localhost, request pid 1534
attempting to mount entry /cifs/localhost
lookup_mount: lookup(program): looking up localhost
lookup_mount: lookup(program): localhost ->
-fstype=cifs,uid=$UID,gid=$GID,credentials=/etc/creds/localhost
"/print$" "://localhost/print$"       "/pub" "://localhost/pub"
"/private" "://localhost/private"
parse_mount: parse(sun): expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
"/print$" "://localhost/print$"       "/pub" "://localhost/pub"
"/private" "://localhost/private"
parse_mount: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mount: parse(sun): dequote(""/print$"") -> /print$
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/print$"") ->
://localhost/print$
update_offset_entry: parse(sun): updated multi-mount offset /print$ ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/print$
parse_mount: parse(sun): dequote(""/pub"") -> /pub
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/pub"") -> ://localhost/pub
update_offset_entry: parse(sun): updated multi-mount offset /pub ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/pub
parse_mount: parse(sun): dequote(""/private"") -> /private
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/private"") ->
://localhost/private
update_offset_entry: parse(sun): updated multi-mount offset /private
-> -fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
tree_mapent_mount_offset: mount offset
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1521,minproto=5,maxproto=5,offset automount
mount_autofs_offset: failed to mount offset trigger  at
failed to mount offset
tree_mapent_mount_offset: mount offset
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1521,minproto=5,maxproto=5,offset automount
mount_autofs_offset: failed to mount offset trigger  at
failed to mount offset
tree_mapent_mount_offset: mount offset
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1521,minproto=5,maxproto=5,offset automount
mount_autofs_offset: failed to mount offset trigger  at
failed to mount offset
mount_subtree: parse(sun): failed to mount offset triggers
dev_ioctl_send_fail: token = 2
failed to mount /cifs/localhost
^C

I have /etc/creds/localhost:
root@j-s390x:~# cat /etc/creds/localhost
username=smbtest9614
password=9614
domain=WORKGROUP
root@j-s390x:~# smbclient //localhost/private -U smbtest9614%9614
Try "help" to get a list of possible commands.
smb: \> dir
  .                                   D        0  Mon Dec 27 20:15:36 2021
  ..                                  D        0  Fri Jan  7 12:54:40 2022
  hello-private.txt                   N       64  Wed Dec 29 17:16:01 2021

        20826628 blocks of size 1024. 17344120 blocks available
smb: \>

Here is a different run. I reproduced the error, hit enter a few times
in the automount terminal to insert some blank lines, and let it sit
for a while. After a few minutes, I retried the failing ls
/cifs/localhost/private, and then it worked. Here is the debug output
of that run:
root@j-s390x:~# automount -f -d -v
Starting automounter version 5.1.8, master map /etc/auto.master
using kernel protocol version 5.05
lookup_nss_read_master: reading master file /etc/auto.master
do_init: parse(sun): init gathered global options: (null)
lookup_read_master: lookup(file): read entry +dir:/etc/auto.master.d
lookup_nss_read_master: reading master dir /etc/auto.master.d
lookup_read_master: lookup(dir): scandir: /etc/auto.master.d
include_file: lookup(dir): include: /etc/auto.master.d/net.autofs
lookup_nss_read_master: reading master file /etc/auto.master.d/net.autofs
do_init: parse(sun): init gathered global options: (null)
lookup_read_master: lookup(file): read entry /net
lookup_read_master: lookup(file): read entry +auto.master
lookup_nss_read_master: reading master files auto.master
do_init: parse(sun): init gathered global options: (null)
lookup_nss_read_master: reading master sss auto.master
do_init: parse(sun): init gathered global options: (null)
can't connect to sssd, retry for 10 seconds
lookup_nss_read_master: no map - continuing to next source
lookup_read_master: lookup(file): read entry /cifs
master_do_mount: mounting /net
automount_path_to_fifo: fifo name /var/run/autofs.fifo-net
lookup_nss_read_map: reading map hosts -intr
do_init: parse(sun): init gathered global options: intr,soft
lookup_read_map: lookup(hosts): read hosts map
lookup_read_map: lookup(hosts): map not browsable, update existing
host entries only
mounted indirect on /net with timeout 180, freq 45 seconds
st_ready: st_ready(): state = 0 path /net
master_do_mount: mounting /cifs
automount_path_to_fifo: fifo name /var/run/autofs.fifo-cifs
lookup_nss_read_map: reading map file /etc/auto.smb
do_init: parse(sun): init gathered global options: (null)
mounted indirect on /cifs with timeout 180, freq 45 seconds
st_ready: st_ready(): state = 0 path /cifs
handle_packet: type = 3
handle_packet_missing_indirect: token 24, name localhost, request pid 1847
attempting to mount entry /cifs/localhost
lookup_mount: lookup(program): looking up localhost
lookup_mount: lookup(program): localhost ->
-fstype=cifs,uid=$UID,gid=$GID,credentials=/etc/creds/localhost
"/print$" "://localhost/print$"       "/pub" "://localhost/pub"
"/private" "://localhost/private"
parse_mount: parse(sun): expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
"/print$" "://localhost/print$"       "/pub" "://localhost/pub"
"/private" "://localhost/private"
parse_mount: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mount: parse(sun): dequote(""/print$"") -> /print$
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/print$"") ->
://localhost/print$
update_offset_entry: parse(sun): updated multi-mount offset /print$ ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/print$
parse_mount: parse(sun): dequote(""/pub"") -> /pub
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/pub"") -> ://localhost/pub
update_offset_entry: parse(sun): updated multi-mount offset /pub ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/pub
parse_mount: parse(sun): dequote(""/private"") -> /private
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/private"") ->
://localhost/private
update_offset_entry: parse(sun): updated multi-mount offset /private
-> -fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
tree_mapent_mount_offset: mount offset
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1836,minproto=5,maxproto=5,offset automount
mount_autofs_offset: failed to mount offset trigger  at
failed to mount offset
tree_mapent_mount_offset: mount offset
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1836,minproto=5,maxproto=5,offset automount
mount_autofs_offset: failed to mount offset trigger  at
failed to mount offset
tree_mapent_mount_offset: mount offset
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1836,minproto=5,maxproto=5,offset automount
mount_autofs_offset: failed to mount offset trigger  at
failed to mount offset
mount_subtree: parse(sun): failed to mount offset triggers
dev_ioctl_send_fail: token = 24
failed to mount /cifs/localhost



(wait a few minutes)

(repeat ls /cifs/localhost/private)


handle_packet: type = 3
handle_packet_missing_indirect: token 25, name localhost, request pid 1858
attempting to mount entry /cifs/localhost
lookup_mount: lookup(program): localhost ->
-fstype=cifs,uid=$UID,gid=$GID,credentials=
tree_mapent_delete_offset_tree: deleting offset key
tree_mapent_delete_offset_tree: deleting offset key
tree_mapent_delete_offset_tree: deleting offset key
lookup_mount: lookup(program): looking up localhost
lookup_mount: lookup(program): localhost ->
-fstype=cifs,uid=$UID,gid=$GID,credentials=/etc/creds/localhost
"/print$" "://localhost/print$"       "/pub" "://localhost/pub"
"/private" "://localhost/private"
parse_mount: parse(sun): expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
"/print$" "://localhost/print$"       "/pub" "://localhost/pub"
"/private" "://localhost/private"
parse_mount: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mount: parse(sun): dequote(""/print$"") -> /print$
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/print$"") ->
://localhost/print$
update_offset_entry: parse(sun): updated multi-mount offset /print$ ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/print$
parse_mount: parse(sun): dequote(""/pub"") -> /pub
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/pub"") -> ://localhost/pub
update_offset_entry: parse(sun): updated multi-mount offset /pub ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/pub
parse_mount: parse(sun): dequote(""/private"") -> /private
parse_mapent: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
parse_mapent: parse(sun): dequote(""://localhost/private"") ->
://localhost/private
update_offset_entry: parse(sun): updated multi-mount offset /private
-> -fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
tree_mapent_mount_offset: mount offset /cifs/localhost/print$
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1836,minproto=5,maxproto=5,offset automount
/cifs/localhost/print$
mounted offset on /cifs/localhost/print$ with timeout 180, freq 45 seconds
mount_autofs_offset: mounted trigger /cifs/localhost/print$
tree_mapent_mount_offset: mount offset /cifs/localhost/private
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1836,minproto=5,maxproto=5,offset automount
/cifs/localhost/private
mounted offset on /cifs/localhost/private with timeout 180, freq 45 seconds
mount_autofs_offset: mounted trigger /cifs/localhost/private
tree_mapent_mount_offset: mount offset /cifs/localhost/pub
mount_autofs_offset: calling mount -t autofs -s  -o
fd=11,pgrp=1836,minproto=5,maxproto=5,offset automount
/cifs/localhost/pub
mounted offset on /cifs/localhost/pub with timeout 180, freq 45 seconds
mount_autofs_offset: mounted trigger /cifs/localhost/pub
dev_ioctl_send_ready: token = 25
handle_packet: type = 5
handle_packet_missing_direct: token 26, name /cifs/localhost/private,
request pid 1858
mounted /cifs/localhost
attempting to mount entry /cifs/localhost/private
lookup_mount: lookup(program): /cifs/localhost/private ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
parse_mount: parse(sun): expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
parse_mount: parse(sun): gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
sun_mount: parse(sun): mounting root /cifs/localhost/private,
mountpoint /cifs/localhost/private, what //localhost/private, fstype
cifs, options uid=0,gid=0,credentials=/etc/creds/localhost
do_mount: //localhost/private /cifs/localhost/private type cifs
options uid=0,gid=0,credentials=/etc/creds/localhost using module
generic
mount_mount: mount(generic): calling mkdir_path /cifs/localhost/private
mount(generic): calling mount -t cifs -o
uid=0,gid=0,credentials=/etc/creds/localhost //localhost/private
/cifs/localhost/private
mount_mount: mount(generic): mounted //localhost/private type cifs on
/cifs/localhost/private
dev_ioctl_send_ready: token = 26
mounted /cifs/localhost/private
