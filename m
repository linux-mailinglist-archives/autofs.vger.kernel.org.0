Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50DB58D871
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242980AbiHIL4m (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242939AbiHIL4j (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:56:39 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1017CE24
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:56:37 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id tl27so21794230ejc.1
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=TTsg+dHp0k7X4vwkSYYcxcRDJyIM6RvJl6eUdlBB9nk=;
        b=ay605B4Sfj8BPISiM9XkWzkQKw92Nc6j0IbjwqojHS9XJX5wfLZUtHUpKeJHSRk/6e
         mWwH6waOIrSwO+o7E+pQQ8/5yk8NAjDuGxIPw2vI67L5suDPBLdYTuOZyBgvhaPtZC1x
         Ob0a88Ri6EKKcJvBfw4/Eesl2UL+1FxGSOTj7NY/D/YUmcTrUvbeDkwGIC86ZNSnf97s
         Ge10mx2F8LhotPYxPppfz/Havuj/xw7iPF/SrZwLy+4IeZ5IkdGqh7efgPhp9OIk6ie1
         RL5Lxw/xBYsmt+7gq9YmbPvMGkbvogm71BqB5VXa0i1VesVMJ5mYJYz+ZzkFcWxEmDr2
         D70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=TTsg+dHp0k7X4vwkSYYcxcRDJyIM6RvJl6eUdlBB9nk=;
        b=WcjLl0nyciXe0wWE7ZUncwaD1bBGDjEypxNOZn9QhPJsNPutZ7rfAWFNpAOoMC/Wo7
         eJXwllTUhHUnQUvfipuIDBJmyezkRjd0wtbQnMmJwOJkU0bfqVwPvtdmXRsgGFdUUynl
         OcyKpuXpqeTnT/wF2Ouq4JmNHmsPjgnAvsGTYQaUBynzOYrfvGS/fRYFDPKCPuVpp1uc
         PRTg98NzgLs2ibEaitOhFev9uJbvoF/Bj1m+YsKfiFXI/Ge6zYGI5nW/2znZYhY8UP8p
         jaK53NT9oK9nKwsLoRjMllu0YkQ4FwCAkHGe3+vUoqjaoeG+6CymK0ZfeH7ZPD2OLkJv
         BxNg==
X-Gm-Message-State: ACgBeo0Ccl9H8gqGAFM0pz6lNtCS1Es3XYV6YWymjWsozHdOCW9GWFz/
        S/q/Ho57CVWJ3XCAe/BVLLl1NO74Jzia
X-Google-Smtp-Source: AA6agR7LVllm0ci8nuZ1BJcVI18CdIQ38I1v9rwrvROaBMcbaNRX+QQzmWyQOSbg5DP6eQidfDVfUQ==
X-Received: by 2002:a17:907:2d0b:b0:730:63dd:748e with SMTP id gs11-20020a1709072d0b00b0073063dd748emr17084372ejc.307.1660046196554;
        Tue, 09 Aug 2022 04:56:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b007304bdf18cfsm1048488ejb.136.2022.08.09.04.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:56:36 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 4/4] autofs-5.1.8 - configure: LDAP function checks ignore implicit declarations
Date:   Tue,  9 Aug 2022 13:56:08 +0200
Message-Id: <20220809115608.107767-5-reimth@gmail.com>
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

Wrong CFLAGS: gcc handles implicit function declaration as warning with current
flag settings. Missing functions in libldap will not be identified.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 aclocal.m4 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/aclocal.m4 b/aclocal.m4
index 91b22da..9fc20bf 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -379,6 +379,8 @@ AC_DEFUN([AF_CHECK_FUNC_LDAP_CREATE_PAGE_CONTROL],
 # save current libs
 af_check_ldap_create_page_control_save_libs="$LIBS"
 LIBS="$LIBS -lldap"
+af_check_ldap_create_page_control_save_cflags="$CFLAGS"
+CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 AC_TRY_LINK(
   [ #include <ldap.h> ],
@@ -399,6 +401,7 @@ fi
 
 # restore libs
 LIBS="$af_check_ldap_create_page_control_save_libs"
+CFLAGS="$af_check_ldap_create_page_control_save_cflags"
 ])
 
 dnl --------------------------------------------------------------------------
@@ -412,6 +415,8 @@ AC_DEFUN([AF_CHECK_FUNC_LDAP_PARSE_PAGE_CONTROL],
 # save current libs
 af_check_ldap_parse_page_control_save_libs="$LIBS"
 LIBS="$LIBS -lldap"
+af_check_ldap_parse_page_control_save_cflags="$CFLAGS"
+CFLAGS="$CFLAGS -Werror=implicit-function-declaration"
 
 AC_TRY_LINK(
   [ #include <ldap.h> ],
@@ -432,6 +437,7 @@ fi
 
 # restore libs
 LIBS="$af_check_ldap_parse_page_control_save_libs"
+CFLAGS="$af_check_ldap_parse_page_control_save_cflags"
 ])
 
 dnl --------------------------------------------------------------------------
-- 
2.37.1

