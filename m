Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2712E58D86F
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbiHIL4i (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbiHIL4g (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:56:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4121EC40
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:56:36 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k26so21784841ejx.5
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=k0hY1dPMsE2R2AWbhdxJeICdrpgnVSDc0B82OyB89qk=;
        b=oH0ilPPQB9A44U2FdAztYvUaH18mnaStFhyrz+75Jx5ImZ3HJVSOvIOsyO/kmivc7t
         rkR0DqI8AQI/kxox+FXMvf9YzcSW1I30QCE8p6l/uA9slypwyrbSnnoMv7FFnRpw3nHO
         Mob954s8UFQB3M/MT7UIuig0KMpwG883Sn26jKhhKH5JZNd+hXXKTpgQJaAif1ASIWOt
         Jb3Y87q2EXcmiJUhoWrcjthAvrzBxiZSTqedILHiuez/h4lJoHIcnFBnd37dDFcFkjW/
         gkfxY9u2+irN0TUUHVPIMW8Z4oeaFvGO74Qu8EHSVdxxIRlhJHbDWtUmjkcptRAEdoWI
         7NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=k0hY1dPMsE2R2AWbhdxJeICdrpgnVSDc0B82OyB89qk=;
        b=AUi87kFBlbzI08K5WwMR3wl+RqQOp1SVjvBHBwXf2Jq3spczmxlQ/7swU/7TICZax3
         cjYyr3/x9FcWv3uq1pP1BC9SphiDGCV6+1extLRuTiU9PxGkWSbKKHNAlv0i5u5htryc
         4+HNVtLaNyP/jlMLb91Eu81pcwFVifSZQEigkWLu1U+yCmUQc3RgVeQl9A4mYOC8h5Ey
         SZ+SuH0nbJgmBQK4lY00dhlY48zv8sXnUC7Nlmi5BwdTgB9/ROTa87HWvrDvXKIVuigD
         iRl1xvYIKZ5LpoYNhLNAAbtxMDDMXq2cHv9ONVSEXA1ZzLMMOBBAfOydRCS48YxuNHdn
         IDgw==
X-Gm-Message-State: ACgBeo3UDt1BIVW76EBsvPxUozUQe2ySovbGWXpF2s4lrmW0i+uj1NTx
        YPpwUn/nKPfCir86hvQcRhUBtgRiyvIF
X-Google-Smtp-Source: AA6agR6HSa6aSyMy8LHnUZcGs0GqiphBnmwTORiCyQE4kFGD7VC2h1euUuM1gmATlL1/UBJYk1IhNQ==
X-Received: by 2002:a17:906:dc90:b0:72f:cf96:50a1 with SMTP id cs16-20020a170906dc9000b0072fcf9650a1mr17122349ejc.546.1660046194709;
        Tue, 09 Aug 2022 04:56:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b007304bdf18cfsm1048488ejb.136.2022.08.09.04.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:56:34 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 1/4] autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
Date:   Tue,  9 Aug 2022 13:56:05 +0200
Message-Id: <20220809115608.107767-2-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809115608.107767-1-reimth@gmail.com>
References: <20220809115608.107767-1-reimth@gmail.com>
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

