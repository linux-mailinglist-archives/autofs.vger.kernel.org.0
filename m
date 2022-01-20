Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E383494EBB
	for <lists+autofs@lfdr.de>; Thu, 20 Jan 2022 14:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiATNRU (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Jan 2022 08:17:20 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48788
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231658AbiATNRS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Jan 2022 08:17:18 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 00EDE3F19C
        for <autofs@vger.kernel.org>; Thu, 20 Jan 2022 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642684630;
        bh=OkXs1l46QwU5TqjuRCr+Ow3ZvADA2sHU73cegDVdwOw=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=T17+nXoMC7JvkB+qMq7/Q8195PSeuARgMzUJtBocoNtDPt/C5KR3vBBmFpl17P1/W
         G3V1kM+Q7gNIi0DmEAtM9N6WqzuWYPfSLtsW3cCY189WOnAYVaMeciVG1aiCPgUJM2
         7cyDpY/XsddnmQeS0AMOQmCsHvaTTtVIx8n96Y4BOdqOfFUvqoB3rU0Xsui5RherTv
         UWjRncjESQTeoT1X69b3EfecRYTOzHDW5pGln6LTSSboeEPAA4kwQwIpPYjXvEWoJp
         kVuamlpqzRzhNRRqR2aDI/YIw/D6kJvPaR2GtVaO7mxEtZumyBXgLVGtdDfAjCi7LA
         G+Ig6NeA4W6MQ==
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a50fd16000000b00405039f2c59so1804196eds.1
        for <autofs@vger.kernel.org>; Thu, 20 Jan 2022 05:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=OkXs1l46QwU5TqjuRCr+Ow3ZvADA2sHU73cegDVdwOw=;
        b=r0gWgsBAookpxOuxrlbrpirgVsZa8WP6qEDay1TxCyE6RwSm+EejWEj9T03AhAukmZ
         nwZAgufA3WpwgYq2pkqmHmTSuH/oOwykxtrm4RBC91Y/7CQ8L9t709dsRcGfcdW8pzH9
         8EiFCnCF7JNDdTUA8+fZAk9GIdbnEu3PX5ZjdQAVODiyPKLKD5LC2OdDNMeo9DELaQSI
         k906KP7qW584cpwL0oFxIrmNU/VWeHTvOJqbtTmR0Z7e7805Cb1aTSGgmPQFra59RoSt
         bfPGzxzNhGLPpFzlD4rt407xBiXjlFIk8+fVJXLdd18IKO7YkYf1OjqqohkYKJ7O9a9U
         VQsA==
X-Gm-Message-State: AOAM533zOS/bH45x/K7ep7hJKSEhlGrIsNovPtQQSL1gbUKCsQ2sq1Rz
        FRdOKHZv6n8MSaH0qt0c/YqUfr1JT8b7RZT/laEdjnGggAQ4PZleNLu29BJIQMWOnqQFZjLAj4h
        55Q5V7hVpfPs0Nnrpl6bkgU8rl45GXMBCJw0ZbbVq18ZN9H0pQw==
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr28256477ejc.716.1642684628078;
        Thu, 20 Jan 2022 05:17:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDjzCtSL1MVa8OgtMxOigiVZR6Zwgz7cUu9ev4nHsf17Ej0IZdS9U6ieLAt8e+WYSOxe0lIyFonMeEE8V4zJ8=
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr28256433ejc.716.1642684627440;
 Thu, 20 Jan 2022 05:17:07 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
 <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net> <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
In-Reply-To: <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Thu, 20 Jan 2022 10:16:55 -0300
Message-ID: <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Fri, Jan 7, 2022 at 10:29 AM Andreas Hasenack <andreas@canonical.com> wrote:
> This is what I get when running automount in the foreground with debug
> and verbose:

I have some new information. When running automount 5.1.8 via systemd
as usual, not only does it break, but it also segfaults. This does not
happen when run in the foreground, or I missed it:

[Thu Jan 20 12:37:45 2022] User process fault: interruption code 0010
ilc:2 in libautofs.so[3ffa0300000+29000]
[Thu Jan 20 12:37:45 2022] Failing address: 000003ff87fff000 TEID:
000003ff87fff800
[Thu Jan 20 12:37:45 2022] Fault in primary space mode while using user ASCE.
[Thu Jan 20 12:37:45 2022] AS:000000000616c1c7 R3:0000000006160007
S:0000000000000020
[Thu Jan 20 12:37:45 2022] CPU: 0 PID: 1088 Comm: automount Not
tainted 5.15.0-17-generic #17-Ubuntu
[Thu Jan 20 12:37:45 2022] Hardware name: IBM 2964 N63 400 (KVM/Linux)
[Thu Jan 20 12:37:45 2022] User PSW : 0705100180000000 000003ffa030b6e0
[Thu Jan 20 12:37:45 2022]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0
P:1 AS:0 CC:1 PM:0 RI:0 EA:3
[Thu Jan 20 12:37:45 2022] User GPRS: 0000000000000400
000003ff0000006e 0000000000000000 000003ff880019b0
[Thu Jan 20 12:37:45 2022]            0000000000000000
0000000000000000 000003ff976f6570 000003ff88001df0
[Thu Jan 20 12:37:45 2022]            000002aa26061340
000003ff880019b0 0000000000000000 000003ff87ffffff
[Thu Jan 20 12:37:45 2022]            000003ffa062ef98
000002aa260611e0 000003ffa030b706 000003ff976f6388
[Thu Jan 20 12:37:45 2022] User Code: 000003ffa030b6ce: ec180030007e
 cij     %r1,0,8,000003ffa030b72e
                                      000003ffa030b6d4: ec18000a2f7e
 cij     %r1,47,8,000003ffa030b6e8
                                     #000003ffa030b6da: e3b0bfffff71
 lay     %r11,-1(%r11)
                                     >000003ffa030b6e0: 952fb000
         cli     0(%r11),47
                                      000003ffa030b6e4: a774fffb
         brc     7,000003ffa030b6da
                                      000003ffa030b6e8: 9200b000
         mvi     0(%r11),0
                                      000003ffa030b6ec: e3b0bfffff71
 lay     %r11,-1(%r11)
                                      000003ffa030b6f2: ec9b001e8064
 cgrj    %r9,%r11,8,000003ffa030b72e
[Thu Jan 20 12:37:45 2022] Last Breaking-Event-Address:
[Thu Jan 20 12:37:45 2022]  [<000003ffa030b6e4>] 0x3ffa030b6e4

Specifically this issue, your patch 08 (fix loop under run in
cache_get_offset_parent()) fixes it, and the private cifs mount
happens.

Something still feels wrong, though, and behaves differently from 5.1.7.

I applied all your patches for 5.1.8, even unrelated ones, and tried this:
# this would trigger the segfault in plain 5.1.8:
root@j-s390x:~# time ls -la /cifs/localhost/private
total 4
drwxr-xr-x 2 root root  0 Dec 27 20:15 .
drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
-rwxr-xr-x 1 root root 64 Jan 19 13:02 hello-private.txt

real    0m0.130s
user    0m0.000s
sys     0m0.001s
root@j-s390x:~# time ls -la /cifs/localhost/pub
total 4
drwxr-xr-x 2 root root  0 Dec 27 20:15 .
drwxr-xr-x 5 root root  0 Jan 20 13:03 ..
-rwxr-xr-x 1 root root 63 Jan 19 13:02 hello-public.txt

real    0m0.014s
user    0m0.001s
sys     0m0.001s

# This is expected to fail, because I only have /etc/creds/localhost,
not /etc/creds/127.0.0.1
root@j-s390x:~# time ls -la /cifs/127.0.0.1/private
ls: cannot access '/cifs/127.0.0.1/private': No such file or directory

real    0m0.075s
user    0m0.000s
sys     0m0.001s

# but this hangs, and ls process goes into D state. With 5.1.7 it works.
root@j-s390x:~# time ls -la /cifs/127.0.0.1/pub
<hangs>

dmesg shows
[Thu Jan 20 13:03:38 2022] FS-Cache: Loaded
[Thu Jan 20 13:03:38 2022] FS-Cache: Netfs 'cifs' registered for caching
[Thu Jan 20 13:03:38 2022] Key type cifs.spnego registered
[Thu Jan 20 13:03:38 2022] Key type cifs.idmap registered
[Thu Jan 20 13:03:38 2022] CIFS: No dialect specified on mount.
Default has changed to a more secure dialect, SMB2.1 or later (e.g.
SMB3.1.1), from CIFS (SMB1). To use the less secure SMB1 dialect to
access old servers which do not support SMB3.1.1 (or even SMB3 or
SMB2.1) specify vers=1.0 on mount.
[Thu Jan 20 13:03:38 2022] CIFS: Attempting to mount \\localhost\private
[Thu Jan 20 13:03:45 2022] CIFS: Attempting to mount \\localhost\pub
[Thu Jan 20 13:03:52 2022] CIFS: Attempting to mount \\127.0.0.1\private
[Thu Jan 20 13:03:52 2022] FS-Cache: Duplicate cookie detected
[Thu Jan 20 13:03:52 2022] FS-Cache: O-cookie c=00000003 [p=00000002
fl=222 nc=2 na=1]
[Thu Jan 20 13:03:52 2022] FS-Cache: O-cookie
d=00000000027c3c77{CIFS.server} n=0000000006d1ef64
[Thu Jan 20 13:03:52 2022] FS-Cache: O-key=[8] '000201bd7f000001'
[Thu Jan 20 13:03:52 2022] FS-Cache: N-cookie c=00000006 [p=00000002
fl=2 nc=0 na=1]
[Thu Jan 20 13:03:52 2022] FS-Cache: N-cookie
d=00000000027c3c77{CIFS.server} n=00000000a2a23604
[Thu Jan 20 13:03:52 2022] FS-Cache: N-key=[8] '000201bd7f000001'
[Thu Jan 20 13:03:52 2022] CIFS: VFS: cifs_mount failed w/return code = -13
[Thu Jan 20 13:03:58 2022] CIFS: Attempting to mount \\127.0.0.1\pub
[Thu Jan 20 13:03:58 2022] FS-Cache: Duplicate cookie detected
[Thu Jan 20 13:03:58 2022] FS-Cache: O-cookie c=00000003 [p=00000002
fl=222 nc=2 na=1]
[Thu Jan 20 13:03:58 2022] FS-Cache: O-cookie
d=00000000027c3c77{CIFS.server} n=0000000006d1ef64
[Thu Jan 20 13:03:58 2022] FS-Cache: O-key=[8] '000201bd7f000001'
[Thu Jan 20 13:03:58 2022] FS-Cache: N-cookie c=00000007 [p=00000002
fl=2 nc=0 na=1]
[Thu Jan 20 13:03:58 2022] FS-Cache: N-cookie
d=00000000027c3c77{CIFS.server} n=00000000b85aa60f
[Thu Jan 20 13:03:58 2022] FS-Cache: N-key=[8] '000201bd7f000001'


syslog, with automount in debug mode, shows this:
Jan 20 13:03:39 j-s390x automount[970]: handle_packet: type = 3
Jan 20 13:03:39 j-s390x automount[970]:
handle_packet_missing_indirect: token 1, name localhost, request pid
1006
Jan 20 13:03:39 j-s390x automount[970]: attempting to mount entry
/cifs/localhost
Jan 20 13:03:39 j-s390x automount[970]: lookup_mount: lookup(program):
looking up localhost
Jan 20 13:03:39 j-s390x automount[970]: lookup_mount: lookup(program):
localhost -> -fstype=cifs,uid=$UID,gid=$GID,credentials=/etc/creds/localhost
 #011 "/print$" "://localhost/print$"  #011 "/pub" "://localhost/pub"
#011 "/private" "://localhost/private"
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost  #011
"/print$" "://localhost/print$"  #011 "/pub" "://localhost/pub"  #011
"/private" "://localhost/private"
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
dequote(""/print$"") -> /print$
Jan 20 13:03:39 j-s390x automount[970]: parse_mapent: parse(sun):
gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:39 j-s390x automount[970]: parse_mapent: parse(sun):
dequote(""://localhost/print$"") -> ://localhost/print$
Jan 20 13:03:39 j-s390x automount[970]: update_offset_entry:
parse(sun): updated multi-mount offset /print$ ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/print$
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
dequote(""/pub"") -> /pub
Jan 20 13:03:39 j-s390x automount[970]: parse_mapent: parse(sun):
gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:39 j-s390x automount[970]: parse_mapent: parse(sun):
dequote(""://localhost/pub"") -> ://localhost/pub
Jan 20 13:03:39 j-s390x automount[970]: update_offset_entry:
parse(sun): updated multi-mount offset /pub ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/pub
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
dequote(""/private"") -> /private
Jan 20 13:03:39 j-s390x automount[970]: parse_mapent: parse(sun):
gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:39 j-s390x automount[970]: parse_mapent: parse(sun):
dequote(""://localhost/private"") -> ://localhost/private
Jan 20 13:03:39 j-s390x automount[970]: update_offset_entry:
parse(sun): updated multi-mount offset /private ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
Jan 20 13:03:39 j-s390x automount[970]: tree_mapent_mount_offset:
mount offset /cifs/localhost/print$
Jan 20 13:03:39 j-s390x automount[970]: mount_autofs_offset: calling
mount -t autofs -s  -o fd=13,pgrp=970,minproto=5,maxproto=5,offset
automount /cifs/localhost/print$
Jan 20 13:03:39 j-s390x automount[970]: mounted offset on
/cifs/localhost/print$ with timeout 180, freq 45 seconds
Jan 20 13:03:39 j-s390x automount[970]: mount_autofs_offset: mounted
trigger /cifs/localhost/print$
Jan 20 13:03:39 j-s390x automount[970]: tree_mapent_mount_offset:
mount offset /cifs/localhost/private
Jan 20 13:03:39 j-s390x automount[970]: mount_autofs_offset: calling
mount -t autofs -s  -o fd=13,pgrp=970,minproto=5,maxproto=5,offset
automount /cifs/localhost/private
Jan 20 13:03:39 j-s390x automount[970]: mounted offset on
/cifs/localhost/private with timeout 180, freq 45 seconds
Jan 20 13:03:39 j-s390x automount[970]: mount_autofs_offset: mounted
trigger /cifs/localhost/private
Jan 20 13:03:39 j-s390x automount[970]: tree_mapent_mount_offset:
mount offset /cifs/localhost/pub
Jan 20 13:03:39 j-s390x automount[970]: mount_autofs_offset: calling
mount -t autofs -s  -o fd=13,pgrp=970,minproto=5,maxproto=5,offset
automount /cifs/localhost/pub
Jan 20 13:03:39 j-s390x automount[970]: mounted offset on
/cifs/localhost/pub with timeout 180, freq 45 seconds
Jan 20 13:03:39 j-s390x automount[970]: mount_autofs_offset: mounted
trigger /cifs/localhost/pub
Jan 20 13:03:39 j-s390x automount[970]: dev_ioctl_send_ready: token = 1
Jan 20 13:03:39 j-s390x automount[970]: handle_packet: type = 5
Jan 20 13:03:39 j-s390x automount[970]: handle_packet_missing_direct:
token 2, name /cifs/localhost/private, request pid 1006
Jan 20 13:03:39 j-s390x automount[970]: mounted /cifs/localhost
Jan 20 13:03:39 j-s390x automount[970]: attempting to mount entry
/cifs/localhost/private
Jan 20 13:03:39 j-s390x automount[970]: lookup_mount: lookup(program):
/cifs/localhost/private ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/private
Jan 20 13:03:39 j-s390x automount[970]: parse_mount: parse(sun):
gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:39 j-s390x automount[970]: sun_mount: parse(sun):
mounting root /cifs/localhost/private, mountpoint
/cifs/localhost/private, what //localhost/private, fstype cifs,
options uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:39 j-s390x automount[970]: do_mount: //localhost/private
/cifs/localhost/private type cifs options
uid=0,gid=0,credentials=/etc/creds/localhost using module generic
Jan 20 13:03:39 j-s390x automount[970]: mount_mount: mount(generic):
calling mkdir_path /cifs/localhost/private
Jan 20 13:03:39 j-s390x automount[970]: mount(generic): calling mount
-t cifs -o uid=0,gid=0,credentials=/etc/creds/localhost
//localhost/private /cifs/localhost/private
Jan 20 13:03:39 j-s390x kernel: [  103.861647] FS-Cache: Loaded
Jan 20 13:03:39 j-s390x kernel: [  103.876101] FS-Cache: Netfs 'cifs'
registered for caching
Jan 20 13:03:39 j-s390x kernel: [  103.878204] Key type cifs.spnego registered
Jan 20 13:03:39 j-s390x kernel: [  103.878218] Key type cifs.idmap registered
Jan 20 13:03:39 j-s390x kernel: [  103.878949] CIFS: No dialect
specified on mount. Default has changed to a more secure dialect,
SMB2.1 or later (e.g. SMB3.1.1), from CIFS (SMB1). To use the less
secure SMB1 dialect to access old servers which do not support
SMB3.1.1 (or even SMB3 or SMB2.1) specify vers=1.0 on mount.
Jan 20 13:03:39 j-s390x kernel: [  103.878951] CIFS: Attempting to
mount \\localhost\private
Jan 20 13:03:39 j-s390x automount[970]: mount_mount: mount(generic):
mounted //localhost/private type cifs on /cifs/localhost/private
Jan 20 13:03:39 j-s390x automount[970]: dev_ioctl_send_ready: token = 2
Jan 20 13:03:39 j-s390x automount[970]: mounted /cifs/localhost/private
Jan 20 13:03:45 j-s390x automount[970]: handle_packet: type = 5
Jan 20 13:03:45 j-s390x automount[970]: handle_packet_missing_direct:
token 3, name /cifs/localhost/pub, request pid 1059
Jan 20 13:03:45 j-s390x automount[970]: attempting to mount entry
/cifs/localhost/pub
Jan 20 13:03:45 j-s390x automount[970]: lookup_mount: lookup(program):
/cifs/localhost/pub ->
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/pub
Jan 20 13:03:45 j-s390x automount[970]: parse_mount: parse(sun):
expanded entry:
-fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
://localhost/pub
Jan 20 13:03:45 j-s390x automount[970]: parse_mount: parse(sun):
gathered options:
fstype=cifs,uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:45 j-s390x automount[970]: sun_mount: parse(sun):
mounting root /cifs/localhost/pub, mountpoint /cifs/localhost/pub,
what //localhost/pub, fstype cifs, options
uid=0,gid=0,credentials=/etc/creds/localhost
Jan 20 13:03:45 j-s390x automount[970]: do_mount: //localhost/pub
/cifs/localhost/pub type cifs options
uid=0,gid=0,credentials=/etc/creds/localhost using module generic
Jan 20 13:03:45 j-s390x automount[970]: mount_mount: mount(generic):
calling mkdir_path /cifs/localhost/pub
Jan 20 13:03:45 j-s390x automount[970]: mount(generic): calling mount
-t cifs -o uid=0,gid=0,credentials=/etc/creds/localhost
//localhost/pub /cifs/localhost/pub
Jan 20 13:03:45 j-s390x kernel: [  110.000597] CIFS: Attempting to
mount \\localhost\pub
Jan 20 13:03:45 j-s390x automount[970]: mount_mount: mount(generic):
mounted //localhost/pub type cifs on /cifs/localhost/pub
Jan 20 13:03:45 j-s390x automount[970]: dev_ioctl_send_ready: token = 3
Jan 20 13:03:45 j-s390x automount[970]: mounted /cifs/localhost/pub
Jan 20 13:03:52 j-s390x automount[970]: handle_packet: type = 3
Jan 20 13:03:52 j-s390x automount[970]:
handle_packet_missing_indirect: token 4, name 127.0.0.1, request pid
1066
Jan 20 13:03:52 j-s390x automount[970]: attempting to mount entry
/cifs/127.0.0.1
Jan 20 13:03:52 j-s390x automount[970]: lookup_mount: lookup(program):
looking up 127.0.0.1
Jan 20 13:03:53 j-s390x automount[970]: lookup_mount: lookup(program):
127.0.0.1 -> -fstype=cifs,guest  #011 "/print$" "://127.0.0.1/print$"
#011 "/pub" "://127.0.0.1/pub"  #011 "/private" "://127.0.0.1/private"
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
expanded entry: -fstype=cifs,guest  #011 "/print$"
"://127.0.0.1/print$"  #011 "/pub" "://127.0.0.1/pub"  #011 "/private"
"://127.0.0.1/private"
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
gathered options: fstype=cifs,guest
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
dequote(""/print$"") -> /print$
Jan 20 13:03:53 j-s390x automount[970]: parse_mapent: parse(sun):
gathered options: fstype=cifs,guest
Jan 20 13:03:53 j-s390x automount[970]: parse_mapent: parse(sun):
dequote(""://127.0.0.1/print$"") -> ://127.0.0.1/print$
Jan 20 13:03:53 j-s390x automount[970]: update_offset_entry:
parse(sun): updated multi-mount offset /print$ -> -fstype=cifs,guest
://127.0.0.1/print$
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
dequote(""/pub"") -> /pub
Jan 20 13:03:53 j-s390x automount[970]: parse_mapent: parse(sun):
gathered options: fstype=cifs,guest
Jan 20 13:03:53 j-s390x automount[970]: parse_mapent: parse(sun):
dequote(""://127.0.0.1/pub"") -> ://127.0.0.1/pub
Jan 20 13:03:53 j-s390x automount[970]: update_offset_entry:
parse(sun): updated multi-mount offset /pub -> -fstype=cifs,guest
://127.0.0.1/pub
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
dequote(""/private"") -> /private
Jan 20 13:03:53 j-s390x automount[970]: parse_mapent: parse(sun):
gathered options: fstype=cifs,guest
Jan 20 13:03:53 j-s390x automount[970]: parse_mapent: parse(sun):
dequote(""://127.0.0.1/private"") -> ://127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: update_offset_entry:
parse(sun): updated multi-mount offset /private -> -fstype=cifs,guest
://127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: tree_mapent_mount_offset:
mount offset /cifs/127.0.0.1/print$
Jan 20 13:03:53 j-s390x automount[970]: mount_autofs_offset: calling
mount -t autofs -s  -o fd=13,pgrp=970,minproto=5,maxproto=5,offset
automount /cifs/127.0.0.1/print$
Jan 20 13:03:53 j-s390x automount[970]: mounted offset on
/cifs/127.0.0.1/print$ with timeout 180, freq 45 seconds
Jan 20 13:03:53 j-s390x automount[970]: mount_autofs_offset: mounted
trigger /cifs/127.0.0.1/print$
Jan 20 13:03:53 j-s390x automount[970]: tree_mapent_mount_offset:
mount offset /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: mount_autofs_offset: calling
mount -t autofs -s  -o fd=13,pgrp=970,minproto=5,maxproto=5,offset
automount /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: mounted offset on
/cifs/127.0.0.1/private with timeout 180, freq 45 seconds
Jan 20 13:03:53 j-s390x automount[970]: mount_autofs_offset: mounted
trigger /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: tree_mapent_mount_offset:
mount offset /cifs/127.0.0.1/pub
Jan 20 13:03:53 j-s390x automount[970]: mount_autofs_offset: calling
mount -t autofs -s  -o fd=13,pgrp=970,minproto=5,maxproto=5,offset
automount /cifs/127.0.0.1/pub
Jan 20 13:03:53 j-s390x automount[970]: mounted offset on
/cifs/127.0.0.1/pub with timeout 180, freq 45 seconds
Jan 20 13:03:53 j-s390x automount[970]: mount_autofs_offset: mounted
trigger /cifs/127.0.0.1/pub
Jan 20 13:03:53 j-s390x automount[970]: dev_ioctl_send_ready: token = 4
Jan 20 13:03:53 j-s390x automount[970]: handle_packet: type = 5
Jan 20 13:03:53 j-s390x automount[970]: handle_packet_missing_direct:
token 5, name /cifs/127.0.0.1/private, request pid 1066
Jan 20 13:03:53 j-s390x automount[970]: mounted /cifs/127.0.0.1
Jan 20 13:03:53 j-s390x automount[970]: attempting to mount entry
/cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: lookup_mount: lookup(program):
/cifs/127.0.0.1/private -> -fstype=cifs,guest ://127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
expanded entry: -fstype=cifs,guest ://127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: parse_mount: parse(sun):
gathered options: fstype=cifs,guest
Jan 20 13:03:53 j-s390x automount[970]: sun_mount: parse(sun):
mounting root /cifs/127.0.0.1/private, mountpoint
/cifs/127.0.0.1/private, what //127.0.0.1/private, fstype cifs,
options guest
Jan 20 13:03:53 j-s390x automount[970]: do_mount: //127.0.0.1/private
/cifs/127.0.0.1/private type cifs options guest using module generic
Jan 20 13:03:53 j-s390x automount[970]: mount_mount: mount(generic):
calling mkdir_path /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: mount(generic): calling mount
-t cifs -o guest //127.0.0.1/private /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x kernel: [  117.582841] CIFS: Attempting to
mount \\127.0.0.1\private
Jan 20 13:03:53 j-s390x kernel: [  117.585855] FS-Cache: Duplicate
cookie detected
Jan 20 13:03:53 j-s390x kernel: [  117.585860] FS-Cache: O-cookie
c=00000003 [p=00000002 fl=222 nc=2 na=1]
Jan 20 13:03:53 j-s390x kernel: [  117.585864] FS-Cache: O-cookie
d=00000000027c3c77{CIFS.server} n=0000000006d1ef64
Jan 20 13:03:53 j-s390x kernel: [  117.585866] FS-Cache: O-key=[8]
'000201bd7f000001'
Jan 20 13:03:53 j-s390x kernel: [  117.585874] FS-Cache: N-cookie
c=00000006 [p=00000002 fl=2 nc=0 na=1]
Jan 20 13:03:53 j-s390x kernel: [  117.585877] FS-Cache: N-cookie
d=00000000027c3c77{CIFS.server} n=00000000a2a23604
Jan 20 13:03:53 j-s390x kernel: [  117.585879] FS-Cache: N-key=[8]
'000201bd7f000001'
Jan 20 13:03:53 j-s390x automount[970]: >> mount error(13): Permission denied
Jan 20 13:03:53 j-s390x automount[970]: >> Refer to the mount.cifs(8)
manual page (e.g. man mount.cifs) and kernel log messages (dmesg)
Jan 20 13:03:53 j-s390x automount[970]: mount(generic): failed to
mount //127.0.0.1/private (type cifs) on /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x automount[970]: dev_ioctl_send_fail: token = 5
Jan 20 13:03:53 j-s390x automount[970]: failed to mount /cifs/127.0.0.1/private
Jan 20 13:03:53 j-s390x kernel: [  117.594982] CIFS: VFS: cifs_mount
failed w/return code = -13
Jan 20 13:03:59 j-s390x automount[970]: handle_packet: type = 5
Jan 20 13:03:59 j-s390x automount[970]: handle_packet_missing_direct:
token 6, name /cifs/127.0.0.1/pub, request pid 1097
Jan 20 13:03:59 j-s390x automount[970]: attempting to mount entry
/cifs/127.0.0.1/pub
Jan 20 13:03:59 j-s390x automount[970]: lookup_mount: lookup(program):
/cifs/127.0.0.1/pub -> -fstype=cifs,guest ://127.0.0.1/pub
Jan 20 13:03:59 j-s390x automount[970]: parse_mount: parse(sun):
expanded entry: -fstype=cifs,guest ://127.0.0.1/pub
Jan 20 13:03:59 j-s390x automount[970]: parse_mount: parse(sun):
gathered options: fstype=cifs,guest
Jan 20 13:03:59 j-s390x automount[970]: sun_mount: parse(sun):
mounting root /cifs/127.0.0.1/pub, mountpoint /cifs/127.0.0.1/pub,
what //127.0.0.1/pub, fstype cifs, options guest
Jan 20 13:03:59 j-s390x automount[970]: do_mount: //127.0.0.1/pub
/cifs/127.0.0.1/pub type cifs options guest using module generic
Jan 20 13:03:59 j-s390x automount[970]: mount_mount: mount(generic):
calling mkdir_path /cifs/127.0.0.1/pub
Jan 20 13:03:59 j-s390x automount[970]: mount(generic): calling mount
-t cifs -o guest //127.0.0.1/pub /cifs/127.0.0.1/pub
Jan 20 13:03:59 j-s390x kernel: [  123.577997] CIFS: Attempting to
mount \\127.0.0.1\pub
Jan 20 13:03:59 j-s390x kernel: [  123.581183] FS-Cache: Duplicate
cookie detected
Jan 20 13:03:59 j-s390x kernel: [  123.581186] FS-Cache: O-cookie
c=00000003 [p=00000002 fl=222 nc=2 na=1]
Jan 20 13:03:59 j-s390x kernel: [  123.581189] FS-Cache: O-cookie
d=00000000027c3c77{CIFS.server} n=0000000006d1ef64
Jan 20 13:03:59 j-s390x kernel: [  123.581192] FS-Cache: O-key=[8]
'000201bd7f000001'
Jan 20 13:03:59 j-s390x kernel: [  123.581200] FS-Cache: N-cookie
c=00000007 [p=00000002 fl=2 nc=0 na=1]
Jan 20 13:03:59 j-s390x kernel: [  123.581203] FS-Cache: N-cookie
d=00000000027c3c77{CIFS.server} n=00000000b85aa60f
Jan 20 13:03:59 j-s390x kernel: [  123.581205] FS-Cache: N-key=[8]
'000201bd7f000001'
Jan 20 13:03:59 j-s390x automount[970]: mount_mount: mount(generic):
mounted //127.0.0.1/pub type cifs on /cifs/127.0.0.1/pub
Jan 20 13:04:24 j-s390x automount[970]: st_expire: state 1 path /cifs
Jan 20 13:04:24 j-s390x automount[970]: expire_proc: exp_proc =
4396016457840 path /cifs
Jan 20 13:04:24 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/private
Jan 20 13:04:24 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/pub
Jan 20 13:04:24 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost
Jan 20 13:04:24 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/127.0.0.1
Jan 20 13:04:24 j-s390x automount[970]: expire_proc_indirect: 4
remaining in /cifs
Jan 20 13:04:24 j-s390x automount[970]: expire_cleanup: got thid
4396016457840 path /cifs stat 4
Jan 20 13:04:24 j-s390x automount[970]: expire_cleanup: sigchld: exp
4396016457840 finished, switching from 2 to 1
Jan 20 13:04:24 j-s390x automount[970]: st_ready: st_ready(): state =
2 path /cifs
Jan 20 13:05:09 j-s390x automount[970]: st_expire: state 1 path /cifs
Jan 20 13:05:09 j-s390x automount[970]: expire_proc: exp_proc =
4396016457840 path /cifs
Jan 20 13:05:09 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/private
Jan 20 13:05:09 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/pub
Jan 20 13:05:09 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost
Jan 20 13:05:09 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/127.0.0.1
Jan 20 13:05:09 j-s390x automount[970]: expire_proc_indirect: 4
remaining in /cifs
Jan 20 13:05:09 j-s390x automount[970]: expire_cleanup: got thid
4396016457840 path /cifs stat 4
Jan 20 13:05:09 j-s390x automount[970]: expire_cleanup: sigchld: exp
4396016457840 finished, switching from 2 to 1
Jan 20 13:05:09 j-s390x automount[970]: st_ready: st_ready(): state =
2 path /cifs
Jan 20 13:05:54 j-s390x automount[970]: st_expire: state 1 path /cifs
Jan 20 13:05:54 j-s390x automount[970]: expire_proc: exp_proc =
4396016457840 path /cifs
Jan 20 13:05:54 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/private
Jan 20 13:05:54 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/pub
Jan 20 13:05:54 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost
Jan 20 13:05:54 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/127.0.0.1
Jan 20 13:05:54 j-s390x automount[970]: expire_proc_indirect: 4
remaining in /cifs
Jan 20 13:05:54 j-s390x automount[970]: expire_cleanup: got thid
4396016457840 path /cifs stat 4
Jan 20 13:05:54 j-s390x automount[970]: expire_cleanup: sigchld: exp
4396016457840 finished, switching from 2 to 1
Jan 20 13:05:54 j-s390x automount[970]: st_ready: st_ready(): state =
2 path /cifs
Jan 20 13:06:39 j-s390x automount[970]: st_expire: state 1 path /cifs
Jan 20 13:06:39 j-s390x automount[970]: expire_proc: exp_proc =
4396016457840 path /cifs
Jan 20 13:06:39 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/private
Jan 20 13:06:39 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/pub
Jan 20 13:06:39 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost
Jan 20 13:06:39 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/127.0.0.1
Jan 20 13:06:39 j-s390x automount[970]: expire_proc_indirect: 4
remaining in /cifs
Jan 20 13:06:39 j-s390x automount[970]: expire_cleanup: got thid
4396016457840 path /cifs stat 4
Jan 20 13:06:39 j-s390x automount[970]: expire_cleanup: sigchld: exp
4396016457840 finished, switching from 2 to 1
Jan 20 13:06:39 j-s390x automount[970]: st_ready: st_ready(): state =
2 path /cifs
Jan 20 13:07:24 j-s390x automount[970]: st_expire: state 1 path /cifs
Jan 20 13:07:24 j-s390x automount[970]: expire_proc: exp_proc =
4396016457840 path /cifs
Jan 20 13:07:24 j-s390x automount[970]: expire_proc_indirect: expire
/cifs/localhost/private
Jan 20 13:07:24 j-s390x automount[970]: handle_packet: type = 6


With 5.1.7, that last `ls -la /cifs/127.0.0.1/pub` does not hang and
shows the content correctly.
