Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAE59533EB7
	for <lists+autofs@lfdr.de>; Wed, 25 May 2022 16:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242485AbiEYOGL (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 25 May 2022 10:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbiEYOFK (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 25 May 2022 10:05:10 -0400
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AFCB0414
        for <autofs@vger.kernel.org>; Wed, 25 May 2022 07:02:24 -0700 (PDT)
Received: by mail-io1-f72.google.com with SMTP id a11-20020a6b660b000000b0066577bb520dso2661290ioc.8
        for <autofs@vger.kernel.org>; Wed, 25 May 2022 07:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HKCgwzbPBNhtLwjBdZBQTCRZmgb1oc+nVB2lvf4UOTo=;
        b=m2QYvoJn1qRtbbAczJx43n+hGqxx/LIxiP3aJ91rTjXn4Y3W2QMYygkLJyR9s0mseU
         9jN6CA98ylmzSKZteykAR0eO4+Xrm+aD48N7b3rBOLXhqM2UtryxC/D4l3lvvKVFbsf0
         Wj5DAp7fbDs7u2iw0+pNorxkPGXE+9E/G99ervPctmn2lRFz8SD7qEo6cgmlquHXaoJU
         KVuwrubIcpl5U7csWcs+qCUMzvsM1KnetfA6jX1o03o1NyX4s380tGKuFtzAvPpsu0p2
         6COMCf4m7DN4c039SyRZzhy0KtjmdyK/9PFv9yJ3TmpBdnCqdWdJRNUXdU2FjID6B1ZE
         cozw==
X-Gm-Message-State: AOAM532PNthYw5x7Zsgv1LiMC3me0ntr5VlgyIJWwCmUtJe/tJIepn5r
        DEEt8qndv7loo0k55Z2alKCyEg1XiQecYkAo8QryK6/VNnkP
X-Google-Smtp-Source: ABdhPJyDNDE0vvoTPT9iPJl/B5TbQR9ZNEMQcHwWFNzQTiH75yQgMB1nty1WGvvZ1BBDEB6iStsgepTARoVUfx9BalneY0JasALA
MIME-Version: 1.0
X-Received: by 2002:a92:cc82:0:b0:2d1:8efa:f8f4 with SMTP id
 x2-20020a92cc82000000b002d18efaf8f4mr11100166ilo.23.1653487343850; Wed, 25
 May 2022 07:02:23 -0700 (PDT)
Date:   Wed, 25 May 2022 07:02:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5f92d05dfd68500@google.com>
Subject: [syzbot] memory leak in autofs_wait
From:   syzbot <syzbot+5e53f70e69ff0c0a1c0c@syzkaller.appspotmail.com>
To:     autofs@vger.kernel.org, linux-kernel@vger.kernel.org,
        raven@themaw.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3b5e1590a267 Merge tag 'gpio-fixes-for-v5.18' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ae2bfdf00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50f4d49cdcacc43c
dashboard link: https://syzkaller.appspot.com/bug?extid=5e53f70e69ff0c0a1c0c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152799c5f00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128ba38df00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5e53f70e69ff0c0a1c0c@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810c87a400 (size 96):
  comm "syz-executor416", pid 3611, jiffies 4294957452 (age 13.060s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 a4 87 0c 81 88 ff ff  ................
    08 a4 87 0c 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81bae93e>] kmalloc include/linux/slab.h:581 [inline]
    [<ffffffff81bae93e>] autofs_wait+0x3fe/0x9a0 fs/autofs/waitq.c:378
    [<ffffffff81bafbf7>] autofs_do_expire_multi+0xa7/0x3e0 fs/autofs/expire.c:593
    [<ffffffff81baff83>] autofs_expire_multi+0x53/0x80 fs/autofs/expire.c:619
    [<ffffffff81bad942>] autofs_root_ioctl_unlocked+0x322/0x3b0 fs/autofs/root.c:905
    [<ffffffff81bada65>] autofs_root_ioctl+0x25/0x30 fs/autofs/root.c:918
    [<ffffffff815e422c>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff815e422c>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff815e422c>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff815e422c>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:856
    [<ffffffff84565f05>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84565f05>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84600068>] entry_SYSCALL_64_after_hwframe+0x44/0xae



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
