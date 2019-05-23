Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7206128B75
	for <lists+autofs@lfdr.de>; Thu, 23 May 2019 22:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731462AbfEWUXI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 23 May 2019 16:23:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58755 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbfEWUXH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 23 May 2019 16:23:07 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1hTuEz-0007Qi-Jd
        for autofs@vger.kernel.org; Thu, 23 May 2019 20:23:05 +0000
Received: by mail-ot1-f70.google.com with SMTP id o98so3394254ota.11
        for <autofs@vger.kernel.org>; Thu, 23 May 2019 13:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=C8JEZofA1Nn82saJAtFc3Kk+8lutsGnGtkd7GkuHg3w=;
        b=OPdcPe9jdYNKVJ5vF/IGFTnwgoY56B67gFEJ0k7JxiX17i21xYOick6wov7f7ZIFrY
         bqjwrj6C1xt1ILoK/2zVvyMehdnAxvt+ZnLVn65mO7xSAj6zGqZVouGtZeRPWGn80B8u
         ggcMae9mtavOaVZlUQZ1YLlXmrwh/iXhFlaYbS4NcbnVX27nqvFVoGY9l0JrtO+Qzdi9
         +CgmBZKGtzBtnU3yJm6E9bLRPpduwgQypA8/lMQiyfqIYbaXeYP0cJyvjTMaG8wFeq/i
         rw5F/m8IU5/y3D2XXSEcWMb+IAkZUf+IWPcnt6UTxrTTtr1MkxP8OEhGqxzJ6Bp+VXwn
         CV9w==
X-Gm-Message-State: APjAAAUnCXrK+7iU/9//Bf9LWK9Zd8pw4x+iHkyB6ZQlPp2hHK3+CPT5
        FbijhPh6kMQm/kVjqbzNZwIgalfOCgZRyUOuWxxaHaFNogEmLZsLeZeGeKSHcvAybMv/KuyjHU6
        Cp8aOATk9Dk0hsKhoC+P5A7hyU6nPyI5vADnmqTvIMxffTxUHVQ==
X-Received: by 2002:aca:58c3:: with SMTP id m186mr3750795oib.96.1558642984336;
        Thu, 23 May 2019 13:23:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1GCUVFEE0JOze8i6o01eSd6bncvKX7EEKgLxWgKURnbZDJkRiEVrDLDPojidylOhcnqgPOXIMHYLihWliPDg=
X-Received: by 2002:aca:58c3:: with SMTP id m186mr3750775oib.96.1558642984037;
 Thu, 23 May 2019 13:23:04 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Thu, 23 May 2019 17:22:53 -0300
Message-ID: <CANYNYEHDhrOuncbB2Rh+TRN=TUT28PGcPrKhVLZdeQk6KPMjVg@mail.gmail.com>
Subject: Old patch Ubuntu has been carrying since 2010
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

I'm updating the autofs version in Ubuntu from 5.1.2 to 5.1.5, and as
part of that process was looking over the patches we are carrying. I
found this one:
Author: Joel Ebel <jbebel@google.com>
Bug-Ubuntu: https://launchpad.net/bugs/591100
Description: Increase group buffer size geometrically rather than
linearly when its found to be small.
.
This prevents package to eat the cpu if you have large groups.

--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -1245,7 +1245,7 @@
        status = getgrgid_r(gid, pgr, gr_tmp, tmplen, ppgr);
        if (status != ERANGE)
            break;
-       tmplen += grplen;
+       tmplen *= 2;
    }

    if (status || !pgr) {

That came from https://bugs.launchpad.net/ubuntu/+source/autofs5/+bug/591100,
and the intention is to speed up the scenario where a user belongs to
thousands of groups. grplen is 1024, and looping over getgrgid_r()
hundreds of times took a while of high CPU usage.

The patch doesn't apply cleanly anymore, but the tmplen+=grplen code
is still there. Would upstream be interested in adopting this change,
or something like it?

Cheers
