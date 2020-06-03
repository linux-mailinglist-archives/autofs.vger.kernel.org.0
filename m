Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289A21ED493
	for <lists+autofs@lfdr.de>; Wed,  3 Jun 2020 18:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgFCQ4N (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 3 Jun 2020 12:56:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59482 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgFCQ4N (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 3 Jun 2020 12:56:13 -0400
Received: from mail-oo1-f70.google.com ([209.85.161.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1jgWgV-0001YQ-Ay
        for autofs@vger.kernel.org; Wed, 03 Jun 2020 16:56:11 +0000
Received: by mail-oo1-f70.google.com with SMTP id j22so1909489oob.11
        for <autofs@vger.kernel.org>; Wed, 03 Jun 2020 09:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rhMzbolLSh0ZsU+UzdM2U2KEUYcH1dy2NuD0byVT72M=;
        b=ZR+eSJSHOsdeo9wzbn5Nh/3CfFgHEyH1g5q+AsEhaoP27jt0jfGgKdrW1VcwgDJxjL
         wgD52jhAr+M+lEAXOvKtJTQgs8o+CqP5Xd9o8eDUeetu90pdyzpoCcCQ/L/MrecYwNro
         UkIa2oku+b+1e5zQOM71XF6ezNxTiUMPxgfUgCXb2zqyGDie186Qa3pIJDbF1oayiHs9
         dODvT1IFhQJEGlifGaHd2M8nqI7RyQWUK2/C1Myb+5rh98GWe1Sst6ToqgUYrAz4NgHx
         rdQq8hhGS6uQRhyEm1IYSnkyY2BD3NwmJN2IM5lFz8M0GX5Q/P4835yENWFYZk7yMIdT
         PWuw==
X-Gm-Message-State: AOAM533Rm6Hg7S4VxCuffLPxhhn0t52hZmTtLo96SR2VA2V418rCFgQS
        KiAOkqdi2tlkHx3TRhuhOl8UOLHUbIWhtBPCgZOTX3CbikVBjQ9ZSNWHYOFmrBQ7nLAKxgxY2P1
        rY5SKof3f1/op7/nQdPP8pF47mo2TPhlAukV4eqArtT6fSxIUcg==
X-Received: by 2002:a9d:7cd5:: with SMTP id r21mr684279otn.322.1591203370039;
        Wed, 03 Jun 2020 09:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+iphN92WI22Z+tAeo+G5Ok8NIf8swJ6e5ZFGxHBsCobe3x2ltEX5ALKBEhcMG0Il3d/T5gmcLpopfIePTSkc=
X-Received: by 2002:a9d:7cd5:: with SMTP id r21mr684259otn.322.1591203369678;
 Wed, 03 Jun 2020 09:56:09 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Wed, 3 Jun 2020 13:55:58 -0300
Message-ID: <CANYNYEEJDyQ7gfB0JTULz1r8hZ4fORRLymH36G4G++G9V=SkYQ@mail.gmail.com>
Subject: auto.smb and escaping of $ and &
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

https://kernel.googlesource.com/pub/scm/linux/storage/autofs/autofs/+/a557e6261afc87d3849b557257185ff72be15a82%5E%21/#F0
dropped the escaping of "$", since the whole thing is later double
quoted anyway. That fixes automounting of windows administrative
shares (ending in "$" like "C$"):

--- autofs-5.1.6.orig/samples/auto.smb
+++ autofs-5.1.6/samples/auto.smb
@@ -75,8 +75,6 @@ $SMBCLIENT $smbopts -gL "$key" 2>/dev/nu
          dir = $2
          loc = $2
          # Enclose mount dir and location in quotes
-         # Double quote "$" in location as it is special
-         gsub(/\$$/, "\\$", loc);
          gsub(/\&/,"\\\\&",loc)
          print " \\\n\t \"/" dir "\"", "\"://" key "/" loc "\""
        }

I think that the escaping of "&" should also be removed, otherwise we
get the same issue there:
attempting to mount entry /cifs/localhost/a&b
lookup_mount: lookup(program): /cifs/localhost/a&b ->
-fstype=cifs,guest ://localhost/a\&b
parse_mount: parse(sun): expanded entry: -fstype=cifs,guest ://localhost/a\&b
parse_mount: parse(sun): gathered options: fstype=cifs,guest
sun_mount: parse(sun): mounting root /cifs/localhost/a&b, mountpoint
/cifs/localhost/a&b, what //localhost/a\&b, fstype cifs, options guest
do_mount: //localhost/a\&b /cifs/localhost/a&b type cifs options guest
using module generic
mount_mount: mount(generic): calling mkdir_path /cifs/localhost/a&b
mount_mount: mount(generic): calling mount -t cifs -o guest
//localhost/a\&b /cifs/localhost/a&b
>> mount error(2): No such file or directory
>> Refer to the mount.cifs(8) manual page (e.g. man mount.cifs)
mount(generic): failed to mount //localhost/a\&b (type cifs) on
/cifs/localhost/a&b
dev_ioctl_send_fail: token = 10
failed to mount /cifs/localhost/a&b

$ /etc/auto.smb localhost
-fstype=cifs,guest \
         "/print$" "://localhost/print$" \
         "/myshare" "://localhost/myshare" \
         "/C$" "://localhost/C$" \
         "/a&b" "://localhost/a\&b"

It's a bit scary to deal with $ and & in shell, so maybe I'm missing
something, but the current auto.smb script doesn't work with shares
that have "&" in their names.
