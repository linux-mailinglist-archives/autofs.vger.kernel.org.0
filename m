Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5746A754C23
	for <lists+autofs@lfdr.de>; Sat, 15 Jul 2023 23:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjGOVmn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 15 Jul 2023 17:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGOVmm (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 15 Jul 2023 17:42:42 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F0F213F
        for <autofs@vger.kernel.org>; Sat, 15 Jul 2023 14:42:40 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-57026f4bccaso32637267b3.2
        for <autofs@vger.kernel.org>; Sat, 15 Jul 2023 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689457359; x=1692049359;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jjiv6qB3jpMGsVhuo3kk8lwrnsl9iZDDBs5pN7U6L98=;
        b=r/bsY9VcOE5/7nfRahsC1E1zhBOKOtbvUFsPiySVjQOaUxofngpCcT30SLqcAtftAQ
         sYEVWHKeWlIrwttVdTDwb6t61fpQd8U8cQeJ29+45JLpYd4YsPRn6JjF4aeZy8JceShH
         yzy7NAnTiGXjyGABwVfsr3Io7Ykn+C+B4yowGMmeCh+uRCm7rmyv4rLcMIr8m3dTrZAP
         ITUuTUXFgtgI1GIR2lcTtIJcsPdDjYVUtrERqiGInHKQ2XGXYHzIgAvyI3kZU3LxAjrE
         vQhzES0mZC1aXK+HKnRDLdA/XrRsNlUOmc/FvtZZrMRAzs1QksgBCq9B/ySS/3ejdrRq
         3W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689457359; x=1692049359;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jjiv6qB3jpMGsVhuo3kk8lwrnsl9iZDDBs5pN7U6L98=;
        b=DpGSfJj5oBTerVraMpNVDzvoDpPy0hu77/2l8eAT1Tpswmr/GnPegPm/suPTrVrxAT
         2vEobnb5G0EyI3Xi/4WtqXcIxBM4h8abe9kDHsToVYgsY1xM+Owcl/GcG8btoZjatsXs
         F5Z3VPpyrEMZyy3qwbUBbOWg6UGRJjuekzcZbkQHfB3Nxr9p54rIrI6yH5bt0xRyOlb3
         QQjJkCCFwtfzk1jBk7bOtshk8BwPG4ogptoxmGs81pw9kFw00ThQF1YUnF+YTv+smRtg
         FWvsCvzVYF515HBfo08q7yOgDMOZ7JrXsz7HXS5BMPXBGj0zfWUVem23JLnMlB02DF24
         q0Kg==
X-Gm-Message-State: ABy/qLYUYL+ZeXXw7ZvsLYGn5BMuAG4AhiRtqKf6iBm9lBlAI/CfY0Ws
        fKkjoo00uIztA2MgMlY0pmjPW8z157CxGHJx1NOlxVQCD+nY/Q==
X-Google-Smtp-Source: APBJJlEGlYJitsWK/7MGtjGh6ot3eT//gd43yoiWC+TCb+XNSwos9uhJeJzL2lisn04ugxzn3dGgxjt0AiFoK2nItkk=
X-Received: by 2002:a0d:de05:0:b0:580:d073:73b9 with SMTP id
 h5-20020a0dde05000000b00580d07373b9mr9990061ywe.23.1689457359658; Sat, 15 Jul
 2023 14:42:39 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Micha=C5=82_Liszcz?= <liszcz.michal@gmail.com>
Date:   Sat, 15 Jul 2023 23:42:28 +0200
Message-ID: <CAEQCH4G+8026FCTtRv_Yizjz28T-9LYGPAV3Pbo3m_98y6smsA@mail.gmail.com>
Subject: Support for arbitrary mount dependencies
To:     raven@themaw.net
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello,

I'm trying to migrate my setup from systemd.mount[1] to autofs/automount
userspace daemon. I have a local disk encrypted with LUKS and a samba share
with a keyfile for this disk. The goal is to automatically mount and decrypt
this disk when connected to my home network.

Below is my configuration. I'm mounting the encrypted disk with
/sbin/mount.crypt helper from pam_mount[2].

# Master map file
/- /home/mliszcz/var/autofs/router.map --timeout=60
/- /home/mliszcz/var/autofs/disk.map --timeout=60
# router.map
/mnt/router -fstype=cifs,ro,guest,vers=2.0 ://172.18.0.5/USB_DISK
# disk map
/mnt/data -fstype=crypt,keyfile=/mnt/router/encryption.keyfile,fsk_cipher=none
:/dev/loop0p1

While /mnt/data is being mounted I'm seeing below logs:

attempting to mount entry /mnt/data
mount(generic): failed to mount /dev/loop0p1 (type crypt) on /mnt/data
failed to mount /mnt/data

I debugged this a bit. The mount helper for /mnt/data tries to access
/mnt/router/encryption.keyfile, but it does not trigger automounting of
/mnt/router. It seems that this is by design - there is already some code
in autofs for handling dependent mounts (open(2) call with changed uid/gid
to trigger mounting of the dependency before executing the actual mount
command). But it only works if the two mounts share the mountpoint prefix.

I verified this by changing the daemon/spawn.c file as follows:

@@ -454,6 +454,9 @@ static int do_spawn(unsigned logopt, unsigned int wait,
                         * let the VFS handle returns to each individual
                         * waiter.
                         */
+                       if(strcmp(argv[loc], "/dev/loop0p1") == 0)
+                           fd = open("/mnt/router", O_DIRECTORY);
+                       else
                        fd = open(argv[loc], O_DIRECTORY);
                        if (fd != -1)
                                close(fd);

Now I'm wondering if it would be possible to add a generic mechanism for
declaring dependencies in autofs maps to make this work. If this could be
accepted I can even work on a patch, provided that I get some pointers.

Kind regards,
Michal


[1]: https://www.freedesktop.org/software/systemd/man/systemd.mount.html
[2]: https://inai.de/projects/pam_mount/
