Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4C25654AE
	for <lists+autofs@lfdr.de>; Mon,  4 Jul 2022 14:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbiGDMO5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 4 Jul 2022 08:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiGDMO5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 4 Jul 2022 08:14:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387EED4B
        for <autofs@vger.kernel.org>; Mon,  4 Jul 2022 05:14:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j21so15516841lfe.1
        for <autofs@vger.kernel.org>; Mon, 04 Jul 2022 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dneg.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=LUG8ck4FYZyoqRXHuZK1dZGK+f25TNwRPeUMN4uNCEs=;
        b=bRB0WrZav/5ylRH8Og+PjBViizdWHg7P41B9vvmLW9gMyelT7cYoXz5uq9mpKq0ssi
         C1I6FksYROjU+Rfsr3NhWSpa5yy6i3IiB2b5tT8LzMQ693W0R67iyRkzN4dpPExlzHfl
         fPUgqwF/xMOQ1jQVqUWYONcKCtaMZq+6fwZtcirH2gfHDiLO8btuxQSKzxEIcCfg5dWA
         064/nmyPt7QI6XjZm92d+bDGyPYADpmo/2N/GREbNHXZtrBHwKDhOy7Zb0BVdj34rHeB
         vzpwp0Z5uqDRwHb3fvIiW/Br3WBILuNK8XgKsykyvI0Sgz1ll9rP3e/aLhq8YazrPPiX
         b0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LUG8ck4FYZyoqRXHuZK1dZGK+f25TNwRPeUMN4uNCEs=;
        b=KxRkeEOWkM+tEj4Tn5nL39tUzgwy/oqR+V8eb9VnY3BDmYIcIDAKKvpN+3adST8DaN
         9NhMvyL38mpLmR+6z4UpMm+t6njXtldzeCMi6jm+2CSNoS7dC5NKKvV37f9InIV3oRjD
         q/pllaZvGduMk5Vl/Mw1eN1JEo+cGhB82Ycpgyfsw13wUD8Mk/NpsVwmm52QjDDLerHr
         xBnQ1VDvkHArHdgp6YtSj46B+ty245IHKmz3XLZEES5wwG3b/+MRU2pzkm5FqBZsq0R3
         L1qVvWFnZniU/uyOAlpKZr7hleMxF48k/KnkxXhoU2Yv8giINtvoNtUN/W6/jksiFLDN
         gjgg==
X-Gm-Message-State: AJIora+oVIIzeFsCZJAU+XQCkYcNBe5C+xGyRrAxlROR0/j7MnIvV4ci
        MQxwMGcyCy3eG3UWUDVr5Nby1b/Wr/0erU41RYh0d4VwEnkVxt/G
X-Google-Smtp-Source: AGRyM1uZAzin928UqrJdpD/aFICuGKQFO2LxxdhBox4UgB/QUx+R1PtJdX/8mgOcT2zu1T+BTy/AFB3vHBEJPsKVTV4=
X-Received: by 2002:a05:6512:c20:b0:482:ba71:7bbb with SMTP id
 z32-20020a0565120c2000b00482ba717bbbmr816053lfu.33.1656936894405; Mon, 04 Jul
 2022 05:14:54 -0700 (PDT)
MIME-Version: 1.0
From:   Daire Byrne <daire@dneg.com>
Date:   Mon, 4 Jul 2022 13:14:18 +0100
Message-ID: <CAPt2mGM59Kj9cvf83hzA7aGF6XnedXxRmb3TXGDci_zXYxmQGg@mail.gmail.com>
Subject: automounts that reference automounts?
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

I'm trying to create an executable automount script that will use
overlayfs to union paths from another automount executable defined
map. But it seems like this is not automatically triggering the
required mounts.

For example, I have an executable mount that will correctly setup
these paths when accessed (auto.hosts):

/hosts/server1/blah
/hosts/server2/blah

And then I have another executable map (auto.global) that outputs
something like this:

-fstype=overlay,ro,lowerdir=/hosts/server1/blah\:/hosts/server2/blah global

If run the mount directly using "sudo mount -t overlay overlay -o
lowerdir=/hosts/server1/blah\:/hosts/server2/blah /global" it
correctly triggers the mounting of the /hosts paths first.

But if done via the executable automount script above, then it doesn't
trigger the /hosts mounts first and fails. I also can't seem to stat
or trigger the mounts of the /hosts paths in the executable autofs
script prior to outputting the overlayfs mount string.

I can however get it to trigger a mount of a /hosts path if I just try
to do a bind mount of it from another mount map.

Is this something specific to overlayfs and/or is there a limitation
on how mounts across executable autofs maps can interact and trigger
each other?

Cheers,

Daire
