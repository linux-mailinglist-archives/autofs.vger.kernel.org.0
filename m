Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54CF59297B
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiHOGTD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241110AbiHOGS5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:18:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F9F1A392
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:18:56 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b96so8460368edf.0
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=FOK9Ol9L7KodV5A7cHVB1u0Ct32xZS3e3SgkgJ4jiVs=;
        b=Z+wZ2ztybGvFd3zEv1XiBb00yAwUNysdy5+ot2fsPvjFMWAr2j4+Pi0H+XNxrcbeni
         SKONI6CpgEG8q2V6GeKFg73Rc8NFUZ1xQqwfDLqiLLa6z6Xj8qHFbR1Wn+1AwwxPsolx
         T93fnzxLRrguxxyRfggiyHTwTOMByKx0fTegvKxC+VXAywlEs/S5fr04bUk8hqQQnE/s
         d+pt6VQdehc8p5Lg4Rn7fCsMXfBpbUQj0l2jrgfaGZ+S387xaLp11PGhqmk35Vr4L0Eh
         6o19bG2A+M8WUI6BwsVMpqPYqAmByZFlNl1qr8yS0vlgGJMNDkiJmwhnrCGRcnJh2GXg
         cZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=FOK9Ol9L7KodV5A7cHVB1u0Ct32xZS3e3SgkgJ4jiVs=;
        b=7ec9vTpzm5Us5m+q1KROFEAyjuslU1WmQoNNiDq3TdWUrbOCjck0QsFrMV9Uq0d+rZ
         Jj+XPe0aV6IvQKLP/zNlleAWp83abXRRODyIlGIDxzv2diXWAt2j1Gp2OlfRg9QOGQ3b
         lrjTLXTM+1RS8svuyMb2IjTaGTIbYb5cwc32F4ypsomaQ8WoeirdwlbWeMTsc3JJ8Zs/
         r5AbTWxyjdqaUKi2diOSFvyD1+zbU9DmDDL3KpLRtQKRfF+m5Rx9aEhexXlb20x1Hx8O
         4R74qdRGCZzy7XgNQecjvAQlwlZpXWLORNt9mGX0QIXVUU/OtLrngTZ3r/XbQ1IpfcIs
         HmBg==
X-Gm-Message-State: ACgBeo2+gg0jiMmId072Ptnlwr0KKSw4fOquzghhP3PhZS8/6ELEMhHu
        h5YHyz0lpAgxuwvZZDNaff1OqIO5IwIW
X-Google-Smtp-Source: AA6agR5U1vrD5dMm2FUm761aVtstKFgyKiARHErl3cF0yQ5aMIEfliIv9W70gX9Fh9gBUPgBisPOHw==
X-Received: by 2002:a05:6402:2792:b0:43f:6873:7497 with SMTP id b18-20020a056402279200b0043f68737497mr14030578ede.175.1660544334588;
        Sun, 14 Aug 2022 23:18:54 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7d5d4000000b0043c92c44c53sm5984916eds.93.2022.08.14.23.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:18:54 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 0/4] Missing Support of SASL Sign or Seal using Data Security Layer
Date:   Mon, 15 Aug 2022 08:18:44 +0200
Message-Id: <20220815061848.1718068-1-reimth@gmail.com>
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

- v2: Updates after review
    - autofs-5.1.8 - let OpenLDAP handle SASL binding:
        - Parse (final) LDAP SASL bind result and check for errors
        - Fixed LDAP result message (pointer) handling
        - Removed rc shadow declaration
        - Declarations moved to the top of code block
        - Corrected formatting of single-line target code blocks
        - Fixed indents

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
 modules/cyrus-sasl.c  | 150 +++++++++++++++++++++++++++++++++++++++++-
 modules/lookup_ldap.c | 125 ++++++++++++++++++++++++++++++++++-
 6 files changed, 338 insertions(+), 3 deletions(-)

-- 
2.37.1

