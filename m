Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CAD59297D
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241055AbiHOGTg (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239909AbiHOGTD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:19:03 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968951A392
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:19:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gk3so11939434ejb.8
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=k0hY1dPMsE2R2AWbhdxJeICdrpgnVSDc0B82OyB89qk=;
        b=b/Ix9GyjkiN4sEAvdTyCLe88a0jPxLyzOXTBnNET2MNQbndyuI5DxHlUaI3Osow1Ao
         zavwY1Zy4V7/Qj9Sa62Om+9HjR8gPP3XPm5txHH7kABEcyd+KQmn4glOU2KdzAZhCiFl
         EjuGMR3czvC1RkMOMyIDDfrktiSrTCRGLHC2LXh3/cqkKWJKzOv+n1ZhLt2G1t0+p42v
         5eeSeWZsu01wsobf7yGxUkxpQKNh9sQ80pHqEEFCuC7rqcf1siDK43jubH6s+CrKovkG
         ZClxatSM1BOZ1YFgvOnuZoI2ZzedusWy1YyoiSUD8Wma58QkRPfXwe4PmuZ6UEeUwThk
         YgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=k0hY1dPMsE2R2AWbhdxJeICdrpgnVSDc0B82OyB89qk=;
        b=ofumkMhuia5me3jOm+Mq2zUkrDpe4dBszGqtZ/3GKGTqo+aaft62whrGmSLRB5sFUG
         B+wuzjn15ATV4uiwv8b0gRlPfBpPXDVxczn2N4amFyZLRC7NE6l0FpClww/mbVNBwTHi
         RqdIy+3qPvXpRv3rYsaJn2drd/Q1r3H+Yu8tL48/6lp0Yfg2ABWk2EDkSbWPml6qe6+Q
         A9tSqD0M9EDErx2J8oAxFHPQ5UecpsaiYrg9A2uUlJMY30kYRPg5bCpsqFdpj2HHGEFP
         eZlQKrr84xqKqvAT2jBbOeJYbpyaHMp9uZ0v/99YHvg32SqDSCGt3G8sDQIr2hJT/RTq
         IHmg==
X-Gm-Message-State: ACgBeo2p4D4ceA3mm5gyKTTWQmERmNJ/Y0+jHxhf4mUnPUp63iLe7Syz
        Po30N7Ex8Y8bVCS6AaTzlqZQJGnn9Wrh
X-Google-Smtp-Source: AA6agR4TfxBNsC4Fr5BgutYZohVnQocf1hc8lUptudMq8uAj6SZ6rb4O9lxO4F9WAQMDESHTY/Jg3w==
X-Received: by 2002:a17:907:b14:b0:730:abbd:e965 with SMTP id h20-20020a1709070b1400b00730abbde965mr9346340ejl.245.1660544341122;
        Sun, 14 Aug 2022 23:19:01 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7d5d4000000b0043c92c44c53sm5984916eds.93.2022.08.14.23.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:19:00 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 1/4] autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
Date:   Mon, 15 Aug 2022 08:18:45 +0200
Message-Id: <20220815061848.1718068-2-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815061848.1718068-1-reimth@gmail.com>
References: <20220815061848.1718068-1-reimth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

From: Thomas Reim <reimth@gmail.com>

Heavily modified LIBS and CFLAGS harm succeeding configure checks

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 aclocal.m4 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/aclocal.m4 b/aclocal.m4
index 33561aa..c671b5b 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -296,6 +296,9 @@ else
   LIBS="$LIBS $KRB5_LIBS"
 
   AC_CHECK_FUNCS([krb5_principal_get_realm])
+
+  CFLAGS="$SAVE_CFLAGS"
+  LIBS="$SAVE_LIBS"
 fi])
 
 dnl --------------------------------------------------------------------------
-- 
2.37.1

