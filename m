Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA972389277
	for <lists+autofs@lfdr.de>; Wed, 19 May 2021 17:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346807AbhESPXx (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 May 2021 11:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240263AbhESPXw (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 19 May 2021 11:23:52 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E43C06175F
        for <autofs@vger.kernel.org>; Wed, 19 May 2021 08:22:32 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id t193so9709005pgb.4
        for <autofs@vger.kernel.org>; Wed, 19 May 2021 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unibs.it; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=hD+YsziQ/gbStwAjW1TjfrMTT1olxJIr42r3NVlCJxA=;
        b=bLdmjXiAKnVSIW27W0tIHH4imOoOmmW+OZ2ozX6X3UhjRSIzleRSaPLl2vJGVux3a9
         eoj2jT98Dg7VhXprc9dYkb8TOlrnxgij+wF3NKTWAYAaaX9YWrR5vAugyeOkNCWUHO0x
         AjeILcs1PclUMjeu6AR26oW+dYFPWpjNWwoc7rxcHZ3mQNnDfqyqy0fUUOZun/jbi6Wf
         xrpca4ZG8PRHCLlfkx/pCMoScgeUYZSdqcLOC6iRWtzeFRrCHyYATTKZiS77GQ98GsfG
         K2AltpZOVs05v9rVWvZVBKgJJ7dR4ySCE+uH0dafJF1rwW9hWiObAEplWtoqZkTknqk7
         QRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hD+YsziQ/gbStwAjW1TjfrMTT1olxJIr42r3NVlCJxA=;
        b=uZt8BWJIAWMFsItjNcPj/sCU/bDmzUXs/B2HWyZhraVoltuKEDaCY+G3dJKyOupBFC
         Cn1MV5oFZLFKlUfMjuapSlPoGxOFD36NTSB/iC8yQym51hYYCpcf/mpJEMD2hqpaVQgA
         FyW52EZ4S3eEhUD1FqbzXnIwtsRZ+4DZcJUJZ8fIwer22zaix4l0TOMNB7troPOspk63
         kLAyO1W81Cv8eNjCgOL/DsPlktu6E53k3ctdv4d46N4C4rRp+trw/wDzAcBsfKf6l75I
         20SJEPd1IaZGpKh8Y4/B1hYA46YxlUFxz4uzFwSuTNjexd0i4ZaRewiBaDsMS8P2CX9e
         ikzg==
X-Gm-Message-State: AOAM533dPBtx6l0phMoFhTze/bSvY992XpYY4M8GXani3imOh4JUjpl2
        PsN4hAwC7sJef8/Fi4CfmbKF3m0vtxCQDT4BdpRpVeeInBIY7VpMcaM7zpwdeNbnnmphWOKbc77
        PuDmXI9LzgVDZ0M2xuvkGsabOkZVTPjql
X-Google-Smtp-Source: ABdhPJyU71S0iJXb/vFEkHD+nHd3Y8gDFhLDr3/OgsD6nK0Xd3gfrpUFV/mOyL8iZgS6nlGt7y34FYbmp97Rbqp5WXU=
X-Received: by 2002:a63:145e:: with SMTP id 30mr11464122pgu.174.1621437752146;
 Wed, 19 May 2021 08:22:32 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Pedretti <fabio.pedretti@unibs.it>
Date:   Wed, 19 May 2021 17:22:21 +0200
Message-ID: <CAGpfsQ2rMhtEwdzLXFmRpJz3WDC+bcLe5eag_x0oUiKf8-6uUA@mail.gmail.com>
Subject: error after upgrade from 5.1.2 to 5.1.7 - nfs: Unknown parameter 'O'
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi, I was using auto.master with this line in my Debian 10 system:
/net   -hosts -O noatime,nodiratime --timeout=0

Then I upgraded Debian from buster/10 to current bullseye/11, and
autofs got upgraded from 5.1.2-4 to 5.1.7-1 (official Debian
packages).

Now I am getting this error:
nfs: Unknown parameter 'O'

(Same issue if I replace -O with --global-options.)

Indeed, removing "-O noatime,nodiratime" from auto.master, so, leaving
with just:
/net   -hosts --timeout=0
works again.

Is this a issue that can be fixed?
Thanks.

-- 


Informativa sulla Privacy: http://www.unibs.it/node/8155 
<http://www.unibs.it/node/8155>
