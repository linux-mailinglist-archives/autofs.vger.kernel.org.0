Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56775B525F
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 02:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiILA6k (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 20:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiILA6j (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 20:58:39 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B489327DEE
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:58:38 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so6150450wmb.4
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kWNF0Nz7fF1g8crfQVjsbQG0dm+r45JAsZNy8L58tzY=;
        b=JXAiTWb+vFGK0JdmNIsi7j/LvzefgIDls0qYJ3FaVrEZAMmAnwaF21K0jxtB8n8hqk
         xow27OGTC/mME1kX9lcaUu3SAMUKs6yGb8O/AHEJsqR/UteR6PNNdipG8kDme9UsaF2m
         gxa+IeH5urkfUTTI5Id2+8mHpQACpk0AtauLrxIPDlQrShKIur9btdABnxqTEPKVGx4P
         bBwstiU3Cf8SSfglEuCxa1XfyIXstHvUg25tfkiVLc2lzMH36GTfFYivbH4HUYxxNKZ2
         hK7cDOVDQIKBqYTp8INmLBZTyNHx54YvgUx7bM+Z1MsarorL94Xd/304QMc50re9/T96
         hthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kWNF0Nz7fF1g8crfQVjsbQG0dm+r45JAsZNy8L58tzY=;
        b=azWPKxWzvmNmjx8jrJYZe4TVcUNnAStI5lfFFfNaC9CHpD+4EhSyhkwkj1BgkztJyQ
         u1o15R9tulC5/TXBLBBzCTEn5oMHLPUWaBolbPp9HyTIWhkXFIsDQU7XgJDCVmGWJLCQ
         6iRnODdmn6EugmBz2e/Te/wqE7o/oCorZSGYIk/XK/8g5fgazPDppF5h4WKhERIY9hef
         mJz7IqtjUTvYG/NLyY7aDt0vHx/yOeRuR69XuK+GD5krG4K+xD1VU1u0mGQJSJ0uGH1U
         WOmqf9Lc5tRyvR0tjsXy1zNps8K2hz/+thR8h5aduBNOPxWvIlxlFFtzgjwuH0ht/AZt
         jbLA==
X-Gm-Message-State: ACgBeo2dSb40Zu7AQy42UKt5wG0JGdSHA2VEYCbfYoUcGRzw/+uQVvd8
        mMVOMB/k7VFQFjYMXiJMI1qL7mWjew==
X-Google-Smtp-Source: AA6agR76EgzIDxe5Sm7ZBfcCzUylO2+hSIZX2tOG0mXfucB7PA5hVhgY/28pu2d6H7OVm7IcVtLj9g==
X-Received: by 2002:a05:600c:1d1e:b0:3a5:4f8d:743f with SMTP id l30-20020a05600c1d1e00b003a54f8d743fmr12092091wms.121.1662944317266;
        Sun, 11 Sep 2022 17:58:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-190-097-057.77.190.pool.telefonica.de. [77.190.97.57])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c4e8a00b003b31fc77407sm8790814wmq.30.2022.09.11.17.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 17:58:36 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 0/2] LDAP SASL bind further fix series
Date:   Mon, 12 Sep 2022 02:58:20 +0200
Message-Id: <20220912005822.3947426-1-reimth@gmail.com>
X-Mailer: git-send-email 2.37.2
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

Dear Ian,

please find two more patches for update of LDAP SASL bind in autofs. The
provided patches fix following issues:
- Missing support of SCRAM-*
  autofs 5.1.8 blocks use of SCRAM-* for SASL binding. DIGEST-MD5 is regarded
  unsafe and has been marked obsolete by IANA. Implementations should use one
  of the latest Salted Challenge Response Authentication Mechanisms (SCRAM)
  defined by IETF RFC-5802/RFC-7677 instead.
- OpenLDAP SASL mechanism auto-selection requires user credentials
  autofs 5.1.8 does not fetch user credentials from autofs_ldap_auth.conf if
  users set authrequired="autodetect" without specifying one of the user
  credential based SASL mechanisms in attribute authtype. SASL binding using
  function ldap_sasl_interactive_bind() will fail with error SASL(-13): user
  not found: no secret in database. Seamless auto-selection of an SASL mechanism
  using OpenLDAP requires specification of user credentials.

Thomas Reim (2):
  autofs-5.1.8 - support SCRAM for SASL binding
  autofs-5.1.8 - ldap_sasl_interactive_bind() needs credentials for
    auto-detection

 man/autofs_ldap_auth.conf.5.in |  2 +-
 modules/cyrus-sasl.c           |  4 +--
 modules/lookup_ldap.c          | 48 +++++++++++++++++++++++++++-------
 3 files changed, 41 insertions(+), 13 deletions(-)

-- 
2.37.2

