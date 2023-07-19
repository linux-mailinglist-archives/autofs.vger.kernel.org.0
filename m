Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA36759A9D
	for <lists+autofs@lfdr.de>; Wed, 19 Jul 2023 18:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjGSQTf (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 Jul 2023 12:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjGSQTe (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 19 Jul 2023 12:19:34 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C421733
        for <autofs@vger.kernel.org>; Wed, 19 Jul 2023 09:19:33 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a3fbfb616dso4459062b6e.3
        for <autofs@vger.kernel.org>; Wed, 19 Jul 2023 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689783573; x=1690388373;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rvjb+381BrE4gvUOPr/LCQNM85AUfR+bmUOf2Rz6i8w=;
        b=R9g56pW7ETCcNcgZRLL1yq8EiOebqmGZKZ+R547lC3eJ8Gap15T8tzHYdJTvMmoYRJ
         09iRzafgqsWP+EP5cxA3W1LXAc43kGHgdWqLQ23DByn5PxBLMJjGRFaZ6cIUw3fT0zkE
         Iesac/i30B7+V1D3eJqvCTYnEfQfmE+JUTRKD2Sma0skWVNJBlIOZbtbH8LixLBRt0yu
         5B4QVfrZoA1ejTK/nXd7A6ppAk+lhGqM6ZTo213L8yVCVvCdtMHhDlib0RVWvtymjeta
         XmL/8s2rUrSs5UADy4oBBva6G+501HZBoNJLdcX/BFWAyCiiY7i2WFHo8+OZSHau/Tkr
         K8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689783573; x=1690388373;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rvjb+381BrE4gvUOPr/LCQNM85AUfR+bmUOf2Rz6i8w=;
        b=jpf71DY2CY8CF45WPmGXFS77iJgpvMNqf8uUdGtiZhTntcHqcBoKwbEM+MzhNXVb0F
         thaPwRwqfz+YcbxTr9/HpiHbZGRr7uUMtJClytyyscWpF8GKeSYp9M0i0ypqkqcw+90f
         o2CB5NCRFQneXPs50lMfSgdWgoUvm6hEYbbF0eawDrcVj3CuhEi8RjukJPiSmUShLA1G
         wBTCvOsf1rtYkWtYwmkRmayGq2AVBa2WryPjKvGwfcw69XxfZUdHRRi41CAjbJU3OHQy
         n5dLEbcRf1yzhgEHqq3CaJfpsYECMkH7mE9dZBvAc3rObJbqlKZXaBx+Z3Hp7Ubh7ZMN
         axzg==
X-Gm-Message-State: ABy/qLbXd01KWF7wpF8WGRdqIHgbbYYGyMe8k5CMBzPHR6Xi2Mbk6t6o
        U2xFbBqVBGNq0PrWH2HGQ+Nuqibhjp/HG9JvP4potuu8HTs=
X-Google-Smtp-Source: APBJJlHGMTfgcOc5Pq5pUSDVHpp46U2+6WisAg0Ae3gDr1GU+kU2sjiTWthPZGIOVLACj0bSwUzPgrvOdLuq1dZc9mE=
X-Received: by 2002:aca:1814:0:b0:3a4:2c7a:5fc7 with SMTP id
 h20-20020aca1814000000b003a42c7a5fc7mr2626264oih.33.1689783573076; Wed, 19
 Jul 2023 09:19:33 -0700 (PDT)
MIME-Version: 1.0
From:   Robert Vasek <rvasek01@gmail.com>
Date:   Wed, 19 Jul 2023 18:19:21 +0200
Message-ID: <CADVsYmjJcyK4NZTiaPmvsLa0K_qEXGsF8cAqT_T5DLYn_r0RqA@mail.gmail.com>
Subject: stat shows stale info on autofs-managed mounts
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear autofs mailing list,

When stat()-ing mountpoints under autofs, the info it returns is
stale, and takes about 3min to for it to reflect up-to-date data after
it's changed. I suspect this is related to some caching and timeout
settings, but I'm having trouble finding the right config options to
set the refresh interval to something shorter. Is there a way to
configure this?

What I mean by stale info: in my setup, the mounts under autofs are
backed by a FUSE-based driver. If the driver process goes down (for
any reason; crashing, exiting without first unmounting, being
killed...), stat()-ing the mountpoint should normally fail with
ENOTCONN. I need to detect these situations and reconcile. When the
mounts are managed by autofs however, once the FUSE process is down,
it takes around 3min for it to go from returning the old stat info
until it gives me ENOTCONN.

# automount --version

Linux automount version 5.1.7-36.el9

Directories:
config dir: /etc/sysconfig
maps dir: /etc
modules dir: /usr/lib64/autofs

Compile options:
  DISABLE_MOUNT_LOCKING ENABLE_FORCED_SHUTDOWN ENABLE_IGNORE_BUSY_MOUNTS
  WITH_SYSTEMD WITH_LDAP WITH_SASL LIBXML2_WORKAROUND WITH_LIBTIRPC

# uname -srvmpio
Linux 5.19.9-200.fc36.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 15
09:49:52 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

Contents of /etc/auto.master.d/eos.autofs map:
/eos /etc/auto.eos

Contents of /etc/auto.eos:
ams -fstype=eosx,fsname=ams  :eosxd
atlas -fstype=eosx,fsname=atlas  :eosxd
cms -fstype=eosx,fsname=cms  :eosxd
experiment -fstype=eosx,fsname=experiment  :eosxd
geant4 -fstype=eosx,fsname=geant4  :eosxd
lhcb -fstype=eosx,fsname=lhcb  :eosxd
...

The automount daemon is set to run with a timeout of 300 seconds.

# stat /eos/atlas
  File: /eos/atlas
  Size: 4096       Blocks: 8          IO Block: 4096   directory
Device: 100033h/1048627d Inode: 26193792    Links: 2
Access: (0700/drwx------)  Uid: (110701/ UNKNOWN)   Gid: ( 2763/ UNKNOWN)
Access: 2023-07-11 15:29:03.528901692 +0200
Modify: 2023-07-11 15:29:03.528901692 +0200
Change: 2023-07-11 15:29:03.528901692 +0200
 Birth: -

# kill <PID>

(stat keeps showing the same output)
(... ~3 minutes later ...)

# stat /eos/atlas
stat: cannot statx '/eos/atlas': Transport endpoint is not connected

Thanks!

Cheers,
Robert
