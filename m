Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5CA58D86E
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242941AbiHIL4h (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236839AbiHIL4g (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:56:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A975DFD7
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:56:35 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id qn6so9946609ejc.11
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=SH/TR2TXWfR64oKoWBX5ApSiOVg7d7MU59wTSmGU0TU=;
        b=RK6jN1PTYWcypPsIoMMMyeb+3S1gsSvQDlzYJUu4azd5DvEv+/8I68qjHCMN4ZOZYl
         Mf1qu5gqSE3uiGrF7k5sFFvssWWNONmMpYVlN+rKVWz3Qwg9eUprFkv+HG1OKk7fha/M
         +AbYqqzhelwMrqBP58Zq6X1YuwO6Q42f3uCGLx2y5OlKZiNCFYNG2AqZCvNaz1GmCqGR
         +3BBaXRFJWY1lfSfgjrYk/ye8vzjrvpVIFLxye7IJXdh0xKJhKNB+NV97lTZXfHXxT1J
         oQHNiMD9BJvbymijxYfig8pv035wv9UTg7soqjFFWBogsirGmN2SohB7WM8H4NKU8xaQ
         +u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=SH/TR2TXWfR64oKoWBX5ApSiOVg7d7MU59wTSmGU0TU=;
        b=oCPv1VIliwAK4J94jgJwNtjuJMAxtG/h22xlrczF1K2Po44CLmQKWDXrbWHkQu86kT
         fWZP6WFx7nz73RyAICaOndhRtaYDnXHtg5D0xTxwxVDe1sjYOotG1zpkl89hSChaoMZI
         xXxnej8VYAdaZ2Lr5Bz7NrzXzkKsEMq569Kr3YdGtrqpLc5Q9ayXpRFSlJHyUEqTjnkt
         CrSfGB7bjuMDkBx23uZ5rlGhens4pHzT7fVufglTRcpioiLBMHJODkOl7MTzT1V0foII
         cLS7l7vy0rC7btgySSGTb7jGA8zm9K5I8EEKs1WyszDu7DEXvhwu3bRNd+7xvcNrw+vh
         DmsA==
X-Gm-Message-State: ACgBeo0Co0cL8zha7Hj1yBjqqmWlVLXs4/RZRrMNv2K9qEpzZqj452Kk
        WUDrMsf3azI4HiFZOomFUF/5UWIDShqf
X-Google-Smtp-Source: AA6agR7uQ0DvURsF9STtNeEfuGLY62/5cWzxswSicJXSOg2s0wh178PvdBy9rm3bmxSziWUyF723aQ==
X-Received: by 2002:a17:907:6092:b0:731:59f0:49ac with SMTP id ht18-20020a170907609200b0073159f049acmr6799847ejc.383.1660046194062;
        Tue, 09 Aug 2022 04:56:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b007304bdf18cfsm1048488ejb.136.2022.08.09.04.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:56:33 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 0/4] Missing Support of SASL Sign or Seal using Data Security Layer
Date:   Tue,  9 Aug 2022 13:56:04 +0200
Message-Id: <20220809115608.107767-1-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
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

Since version 4.4 Samba AD domain controllers default settings only allow
for simple SASL binds over TLS encrypted connections or SASL binds with
sign or seal, i. e. data security layer encryption, over unencrypted
connections. Therefore, current automounter cannot fetch autofs maps from
Samba AD DCs using SASL anymore without setting Samba configuration
parameter "ldap server require strong auth" to "no" or "allow_sasl_over_tls".

Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode using
an SASL data security layer according to IETF RFC 2078. This security layer
provides for traffic encryption during authentication and authorization
towards an OpenLDAP based server and for subsequent encryption of data
traffic for the LDAP session. Current automounter does not implement SASL
security layer encryption and only relies on TLS to protect LDAP
communication.

OpenLDAP libldap if compiled with Cyrus SASL supports negotiation of an
SASL data security layer based encryption of LDAP traffic. libldap also
provides automatic negotiation of the best suited SASL mechanism taking
into account application required defaults.

This series of patches updates automounter to let OpenLDAP and Cyrus SASL
handle SASL binding and traffic security configuration. Proposed changes
are backward compatible for clients that use LDAP libraries different from
OpenLDAP. When using SASL mechanism GSSAPI or simple authentication with
TLS encryption automounter seamlessly interworks with latest Samba AD DCs.

Please review and provide your comments or suggestions.

Thomas Reim (4):
  autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
  autofs-5.1.8 - prepare for OpenLDAP SASL binding
  autofs-5.1.8 - let OpenLDAP handle SASL binding
  autofs-5.1.8 - configure: LDAP function checks ignore implicit
    declarations

 aclocal.m4            |  52 +++++++++++++++
 configure.in          |   5 +-
 include/config.h.in   |   3 +
 include/lookup_ldap.h |   6 ++
 modules/cyrus-sasl.c  | 148 +++++++++++++++++++++++++++++++++++++++++-
 modules/lookup_ldap.c | 102 ++++++++++++++++++++++++++++-
 6 files changed, 312 insertions(+), 4 deletions(-)

-- 
2.37.1

