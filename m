Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4E22124E6
	for <lists+autofs@lfdr.de>; Thu,  2 Jul 2020 15:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgGBNiQ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 2 Jul 2020 09:38:16 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:37048 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbgGBNiQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 2 Jul 2020 09:38:16 -0400
Received: by mail-vs1-f51.google.com with SMTP id p25so7484147vsg.4
        for <autofs@vger.kernel.org>; Thu, 02 Jul 2020 06:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=A9FN5bFqFA7hl68b6OFzLeGByzW8tcbwbg9nowJv21I=;
        b=TL3gckROmpaKrDhDp9BxHfAGRuHrNm9GP3vbmi6fSo9v9+/XsLUQnN8sIRvdnUEhSL
         0cWGe3yTotjTgo7T4otnEvM9xgqS656ith9jDVilbjGJ0zrfLMatgATNXTQmbl0jtYzz
         kjJIw3NwlH6g+q5Rc+blKWUFkXOK8CTkMtW62oAtMPFqP+9z4XZ63QdnhCKLN4eEeb8E
         1sN/1cn6W4HoxvfXS0y+u2oJmYVNATrR8ibQ6vTbA6ac8FGtUCkPOA7G0R5tUyu2UniJ
         Q8PovGIGxkPqy2jA2U5YewPZPhVuvPMX1m4E/vX+9fK61G8i23seG3TdhzAkxL8Kdk67
         Ebhg==
X-Gm-Message-State: AOAM530EVb/sL3HTgdsoXattP0eMXXH91mtj+TsPcVJRitF8fS0gxF3a
        7mCGr2Godlv4qYnb2tLgEI3XvY8Ii4UX18s95Kf+5BVZ
X-Google-Smtp-Source: ABdhPJwyWINVrepaopqkXkA6kpzhcYQ580kOKJ7nuFvWW2XFmMBRMEMHsTMtuAGqrquMT+Fxpnl0vq1bcCQEMeFZNN8=
X-Received: by 2002:a67:80d3:: with SMTP id b202mr8865496vsd.129.1593697094758;
 Thu, 02 Jul 2020 06:38:14 -0700 (PDT)
MIME-Version: 1.0
From:   Hugh McMaster <hugh.mcmaster@outlook.com>
Date:   Thu, 2 Jul 2020 23:38:01 +1000
Message-ID: <CAN9BcduKq=-8jTP2g4iF+Whd4ufgFdH7ezgny4tt65Y-awm_pw@mail.gmail.com>
Subject: [PATCH 2/3] configure.in: Do not append parentheses to PKG_PROG_PKG_CONFIG
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

The call to the PKG_PROG_PKG_CONFIG macro has parentheses, which are
unnecessary.

This patch removes the parentheses.

--- a/configure.in
+++ b/configure.in
@@ -48,7 +48,7 @@ AF_INIT_D()
 AC_SUBST(initdir)
 AF_PID_D()
 AC_SUBST(piddir)
-PKG_PROG_PKG_CONFIG()
+PKG_PROG_PKG_CONFIG

 #
 # Check for systemd unit files direectory exists if unit file installation
