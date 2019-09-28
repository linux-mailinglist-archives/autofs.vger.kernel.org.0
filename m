Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD957C104E
	for <lists+autofs@lfdr.de>; Sat, 28 Sep 2019 11:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfI1JId (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 28 Sep 2019 05:08:33 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:46954 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfI1JIc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 28 Sep 2019 05:08:32 -0400
Received: by mail-ed1-f47.google.com with SMTP id t3so4279229edw.13
        for <autofs@vger.kernel.org>; Sat, 28 Sep 2019 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vxy2zzjcw/GwYNoRc0lVH5gfIbHG1X7e9yWbd2rm4pM=;
        b=vHZVRXdv+jBNaIurexHd0e2PGNZyB3D5Zp0EiCaD6OarNtr2xQRUaxDvs3R6qh0odT
         8cXAYEh8rxKfh8BqkFISW/nq0iW2SNzOghMzmI6yz/e7llAIxq8DhZ2jSpyo35RaPHU7
         +Lb8R8/w98t+UiEm5hFZpSu/Yn9nopOwLhQQnWRuAwF0D/UHEq7zwRTrlYw78gJ6sW7S
         ElfHsNDdMHpGMCgtJ5rKKnMUY0uEG56DAUeWFYTLOBZ9Xo3fOdrNWxzsdEl3k+91K/Dz
         SJlmSa5+Kwrmz0J6IbfalE5yyu3yV82iRjzMyZTza3+/lOOfl0djYsIuSTwR+6NH9RSN
         5zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vxy2zzjcw/GwYNoRc0lVH5gfIbHG1X7e9yWbd2rm4pM=;
        b=K5Ygzptf8eF9eVSfX4wwFysINYQsrrpOMNWRDfvl6+W/3HnRlAwJem8yGG1+aCk4VW
         sB7puj2Mhk4W8y5reinNqa+QJF0Hl6i76MKTAUJa5sFn5qgvjC4Two/QzOFyTrmPPf0r
         vg+VRa0Unk3wkyaF7YLawoyV02/3CEut7PmNfuyhYOOOUij1wHEVKdnWFZvDJ0e06JTZ
         8LwJBZgi17gPKEfNtJJrSlahuCrLVeyB4FJxXi2p51GZg5mQxmRLGc+VHTBfSkKMC1Ff
         gscIN5QO5sWxQvLbK+gT8DePC3vOjV64K6HkzTha7iMx93gSau5hOO4Tk4vALabnlSva
         b0sw==
X-Gm-Message-State: APjAAAVCBihmE6KcmQwrl71aIylCcSHNmpCuD/YLS049lhn1kiQbGOBn
        7gfC/5EtALus3rSNts42U0KJVA/V6EjOajbBpqU=
X-Google-Smtp-Source: APXvYqyyFtRUXuCR2EAqvzYJElr4WLnMToKggP9WiytDWSxVMiiSLeJaaeReGJLGxpsnAnLiZV5yawUxBgvhUXqeAUs=
X-Received: by 2002:a17:906:ce46:: with SMTP id se6mr11211118ejb.198.1569661711113;
 Sat, 28 Sep 2019 02:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <CABPfrkyd+o49B=XNYO_KOp_LQ4mar5wcfJ5LZJGSmr+9sME2ww@mail.gmail.com>
In-Reply-To: <CABPfrkyd+o49B=XNYO_KOp_LQ4mar5wcfJ5LZJGSmr+9sME2ww@mail.gmail.com>
From:   "aliveTerraN ." <nurgrak@gmail.com>
Date:   Sat, 28 Sep 2019 11:08:19 +0200
Message-ID: <CABPfrkxOVe1RV+bdm=WBwRvvfdHJMfix-L8yEEfpxN7ChKq1kw@mail.gmail.com>
Subject: [PATCH] Update default program values for autofs.conf manual.
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Sent only to Ian by mistake, so here is the forwarded message with
correct subject.

---------- Forwarded message ---------

Checking the default values we have in redhat/autofs.conf.default.in
and comparing them to the autofs.conf.5.in manual they differed.

With current iteration of autofs, we by default have that maps are not
browsable and we now look for NFSv4 by default. So I changed the
manual so it shows the correct default values for the user.

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
---

diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
index 39239d4..6391dc3 100644
--- a/man/autofs.conf.5.in
+++ b/man/autofs.conf.5.in
@@ -63,13 +63,13 @@ but it is the best we can do.
 .TP
 .B browse_mode
 .br
-Maps are browsable by default (program default "yes").
+Maps are browsable by default (program default "no").
 .TP
 .B mount_nfs_default_protocol
 .br
 Set the default protocol that
 .BR mount.nfs (8)
-uses when performing a mount (program default 3). Autofs needs to know
+uses when performing a mount (program default 4). Autofs needs to know
 the default NFS protocol that
 .BR mount.nfs(8)
 uses so it can do special case handling for its availability probe for
