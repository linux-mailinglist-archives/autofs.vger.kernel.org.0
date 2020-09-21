Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B197271A69
	for <lists+autofs@lfdr.de>; Mon, 21 Sep 2020 07:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIUFeZ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 21 Sep 2020 01:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgIUFeZ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 21 Sep 2020 01:34:25 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8F3C061755
        for <autofs@vger.kernel.org>; Sun, 20 Sep 2020 22:34:21 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so11283119wrn.13
        for <autofs@vger.kernel.org>; Sun, 20 Sep 2020 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPwvp1H01WJUmelQONwVHSNF4wgFfmcahSQRnFoou80=;
        b=fwho7yZpwlRM8T/atHqxpLbIvQAZ0GD47g0WjDHiKydztEOo7rcDpcVmhKy9qwczBQ
         VXMFVblsyeDYaR/vsZs/2Y8QIC/FscB/oehKP2uP3lN7C5UsKubuRZvvZG5IVOTpEoAM
         uu3iSPX2gbdGPm4EiDKJClLavjl+Fp9G5x2OJhBE4XbKsy3g12GWT0anO13vJNDuR0bE
         2lRmDVFYSzffnWmZs3IBIy5rs3JSmoRY34JXRU2olL9MjEqS0jkDUx6h7XsKvowH8NS6
         GiN+kNYGYen/AnSeq8wvjYAHQ4GIXwSh7TMIq/LfmM7LkSY0RSRrU+HB7ZRQBkWKKtwV
         6/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPwvp1H01WJUmelQONwVHSNF4wgFfmcahSQRnFoou80=;
        b=SAE68FuLuwzW6ORGjhSSNpQUuY05E2ldrF5uxUd8LPETfmUFHpMiYTxOy3/UHsyPlG
         1dYKYDmvs30Yanq6/7KOwqofBbnKIBdL3i6qrrxqXJAIK0Y2HYGys4VYbw9vxWSgRG9A
         bdo2H99MjfKfYQwrLqcDtfl8+8xr5sV5AsxDLQVKkWJuJ5LVHalhwrOKVqNC9R8juIfd
         4UGD9aohPeYfFMj6fgRnmjVVoewawAPVGA2aPiTOq36KJToBWd6a7Bua0Qlx7AQ0iB0M
         z1GLjz4/jkx+I0EyAKltkLmGMuJAO2ozq6xuAymPhbfY9e39IzSNdH19J9zeTZ7jt3Y9
         bvyg==
X-Gm-Message-State: AOAM530K1tS2saB8GvKQLuJpJ4fUMhtZDsCDP5JAuy1pB7n185bJhK1Q
        U0rV3YNacRfKg2VNVKdlrly03622QeU=
X-Google-Smtp-Source: ABdhPJxAVkPpyOkB3cYVeSXK9SaQdzSBI7NKV5RnKi3jcLKugtyvkgzp28M8f+Cn4365VXVtmWxamw==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr52228768wru.374.1600666459270;
        Sun, 20 Sep 2020 22:34:19 -0700 (PDT)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr. [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
        by smtp.gmail.com with ESMTPSA id j10sm19314116wrn.2.2020.09.20.22.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 22:34:18 -0700 (PDT)
From:   Fabrice Fontaine <fontaine.fabrice@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Andreas Oberritter <obi@opendreambox.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
Date:   Mon, 21 Sep 2020 07:33:05 +0200
Message-Id: <20200921053305.1895230-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Andreas Oberritter <obi@opendreambox.org>

Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
nothing but "#include linux/nfs.h". rpc_subs.h already includes
other linux/nfs*.h files directly.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Upstream-Status: Pending
---
 include/rpc_subs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/rpc_subs.h b/include/rpc_subs.h
index b6d59f9..a2d9648 100644
--- a/include/rpc_subs.h
+++ b/include/rpc_subs.h
@@ -18,7 +18,7 @@
 
 #include <rpc/rpc.h>
 #include <rpc/pmap_prot.h>
-#include <nfs/nfs.h>
+#include <linux/nfs.h>
 #include <linux/nfs2.h>
 #include <linux/nfs3.h>
 
-- 
1.7.10.4

