Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8534F4841EF
	for <lists+autofs@lfdr.de>; Tue,  4 Jan 2022 13:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbiADM5c (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 4 Jan 2022 07:57:32 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37092
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229543AbiADM5c (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 4 Jan 2022 07:57:32 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BED1D3F1AA
        for <autofs@vger.kernel.org>; Tue,  4 Jan 2022 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641301050;
        bh=52VnkK45BD8AIl4OxnD4tmEgd1E+3Xmze0TOq1MrJPE=;
        h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
        b=waPyMgDbuXSpnM7pEAnBT3ZrELTgc51GDROKIaoPeo118VuKyRzFauDzoXqpqbs0j
         8ANrYu3Flw+ehVWWa17bbDrlJJPaSsPaab/76Ou0BahN0wzTZ6/hYi2p9LDTnp5SW5
         NIuxqxw4fWiqxo2geOjMDAoUnL3QtFwKZPK0xn1uZJby0qD6hO/V0XgbVuQ6yN3mhA
         KGABqpDVgJ/c7Zv8qIC3tGcqPUqYcTH0l6KzXGdCXmTEhSL9WJYAtbekCMruJq1apQ
         aoYLkslsZh5V/vnLYiH/JbA180wcUYGcFutVVDl9VOlQgQveyOtS5TD3qJYmiRVpPL
         qY4iZnq4OZMtA==
Received: by mail-ed1-f70.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso25144549edt.20
        for <autofs@vger.kernel.org>; Tue, 04 Jan 2022 04:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=52VnkK45BD8AIl4OxnD4tmEgd1E+3Xmze0TOq1MrJPE=;
        b=isuLCyOR2f97rBq+fL1LjY7oSUcX+yAoaN2feZZjywRTjYZFkEtwS+HTO/LWiqDgWk
         1f2lngAiqfko1K8RJ356rlld3B9qy1abvsNZpKlxq3WlfuHlCEd7AoDt39lUz9epe4qd
         vm8Fex4qkbDtkPgjF+iMWZjzCEPy2t5o0X7kPiYtRmOqhmwap3v6ukomDAXagiCc4+Tn
         52Q2fAitTpCHb5T51gnj15JA8K7X50RDSbUT6N15GuXxi2PHTXZ9MD/JmG/bHkLDO9mb
         mXgZPBDUZywpCwUoujVODlynRdbW/fn9t0g6J2NdTG0/33YTZLRZ9bRglxBMs5mbKoDG
         ih/A==
X-Gm-Message-State: AOAM531P9FhQaunE7168K0kTx0DhP0VJ61jDHkzW1bTzc8xcslHzRpvw
        6fVzGOtlvGhNOcvkeAGR9ZYfDiIxSuvYcjEIJOqvurhVct/l0CWpQvas2TdLnXKR+e+0XPox14o
        doGkjhj3AZO5fnhaM9WfYvr8jXy2KyfyZTyIrHcktWJJI/DFE0Q==
X-Received: by 2002:a17:907:d23:: with SMTP id gn35mr38576556ejc.572.1641301050410;
        Tue, 04 Jan 2022 04:57:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTy08WI6Xk8dmZIas15w+ZEqXGkade1gwPPPPgs9TZlSFgHjMgdxBIZjqjVJFNiCsfnLcp7F+vtbj6A87XcSg=
X-Received: by 2002:a17:907:d23:: with SMTP id gn35mr38576549ejc.572.1641301050143;
 Tue, 04 Jan 2022 04:57:30 -0800 (PST)
MIME-Version: 1.0
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Tue, 4 Jan 2022 09:57:18 -0300
Message-ID: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
Subject: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

the autopkgtests for autofs started to fail in Ubuntu in the s390x
architecture only. The scenario is an authenticated localhost cifs
mount.

When I try it, I get:
root@j-s390x:~# l /cifs/localhost
ls: cannot access '/cifs/localhost': No such file or directory

I get this in syslog:
Jan  4 12:52:48 j-s390x automount[1969]: mount_autofs_offset: failed
to mount offset trigger  at
Jan  4 12:52:48 j-s390x automount[1969]: message repeated 2 times: [
mount_autofs_offset: failed to mount offset trigger  at ]
Jan  4 12:52:48 j-s390x automount[1969]: mount_subtree: parse(sun):
failed to mount offset triggers
Jan  4 12:52:48 j-s390x kernel: [ 1582.465030]
autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
cmd(0xc018937e)
Jan  4 12:52:48 j-s390x kernel: [ 1582.465306]
autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
cmd(0xc018937e)
Jan  4 12:52:48 j-s390x kernel: [ 1582.465358]
autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
cmd(0xc018937e)
Jan  4 12:52:48 j-s390x kernel: [ 1582.465405]
autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
cmd(0xc018937e)
Jan  4 12:52:48 j-s390x kernel: [ 1582.465409]
autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
cmd(0xc018937e)
Jan  4 12:52:48 j-s390x kernel: [ 1582.465412]
autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
cmd(0xc018937e)

With 5.1.7, it works:
root@j-s390x:~# l /cifs
total 4.0K
drwxr-xr-x  2 root root    0 Jan  4 12:55 .
drwxr-xr-x 23 root root 4.0K Jan  4 12:55 ..
root@j-s390x:~# l /cifs/localhost
total 0
drwxr-xr-x 5 root root 0 Jan  4 12:55  .
drwxr-xr-x 3 root root 0 Jan  4 12:55  ..
drwxr-xr-x 2 root root 0 Dec 27 20:14 'print$'
drwxr-xr-x 2 root root 0 Dec 27 20:15  private
drwxr-xr-x 2 root root 0 Dec 27 20:15  pub
root@j-s390x:~# l /cifs/localhost/private
total 4.0K
drwxr-xr-x 2 root root  0 Dec 27 20:15 .
drwxr-xr-x 5 root root  0 Jan  4 12:55 ..
-rwxr-xr-x 1 root root 64 Dec 29 17:16 hello-private.txt

and syslog shows just:
Jan  4 12:55:54 j-s390x kernel: [ 1768.290258] CIFS: Attempting to
mount \\localhost\pub
Jan  4 12:55:54 j-s390x kernel: [ 1768.318174] CIFS: Attempting to
mount \\localhost\private
Jan  4 12:55:54 j-s390x kernel: [ 1768.328218] CIFS: Attempting to
mount \\localhost\print$


I have this config:
root@j-s390x:~# cat /etc/auto.master|grep -vE "^($|#)"
+dir:/etc/auto.master.d
+auto.master
/cifs /etc/auto.smb --timeout=180

The shares:
[pub]
  path = /pub
  read only = no
  guest ok = yes
[private]
  path = /private
  read only = no
  guest ok = no

root@j-s390x:~# cat /etc/creds/localhost
username=smbtest9614
password=9614
domain=WORKGROUP

I see the 5.1.8 patches directory has a ton of patches, is this a
known issue already perhaps? Or do you have any other troubleshooting
tips?

Thanks!
