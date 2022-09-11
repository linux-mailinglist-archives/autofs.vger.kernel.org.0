Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEDD5B4F71
	for <lists+autofs@lfdr.de>; Sun, 11 Sep 2022 16:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiIKOlz (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 10:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIKOly (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 10:41:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B32628E07
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 07:41:52 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lz22so14689839ejb.3
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 07:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=clpE3YXw92NY9t6CaD7KF5qLJwiy8C2JhVIycsEORMY=;
        b=LSlA6Rt8nGHe6V8qYx5nzFI5JN+eUlXNUK0GDzVxg9jfW3tzJXk4yQx5XjQRrazCrB
         ioQsO4khGAyyXnQLcEJv+OG45JvdjJTfmrd5lr0v4EZIouDsXwz44sSnjErQXLPUnB7t
         DpluBGqS0h6AMUC4Zklr9Ob5r46G6FCp2TtKQzJN6CszX4ex+SDn1q2eTFWbR9IMnCyF
         CejMUeGJzM7di4X+c8HYtI5Zr5N2nCXaeTQRrlYRye3EpJskCVZ6ji3gDfEKtxPNgtVP
         SqwelaowVYC/DkVDUTlBSznxFdETO2Z0KDH+uvLdwJEZVVX/J7aYv/ebfnmFZ5w5j8yT
         qFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=clpE3YXw92NY9t6CaD7KF5qLJwiy8C2JhVIycsEORMY=;
        b=cqSINzuj0JylmGqqHwFra+PVYBc4IpAZfy9QIE7QBywgdvF/kuJxBpXFIgWyYHWwk4
         Xj/0741uaBeDH/JSzwyzyg+7dAL8hJZXd2IB1c0Y4TD6olEsAZdX/PwyXnop0x5d4Den
         XAcdnHYp2O1+41oCH3o+RNvDt1QTylnbn9g9NF3PiJlP07Br7ve3rRcfmiv77t0V23u/
         EEf1BnpqS942OTw/WJTa/2sbWZAmq+cPEkhfZX2hh+PUnFVx1OC6/aAJl/FG15eZAdVx
         MKX/9YgFxI1yNwwc5DNZi98E7YR+3JnRJ6L2r+R1YS7pt7fXvsCBQhmkEMj6skwGDfa6
         l08A==
X-Gm-Message-State: ACgBeo2jx4elZd4YpRnahTtzt5TbMwQL06cxn/3b2UwmRJdNO4TB43/x
        NDgjPLkwY/ogq7x0Vfz4HNF3paGx8A==
X-Google-Smtp-Source: AA6agR5NXfcWFEV7P5+/vgClig4RAkf6+KVIBEBnjXnvDmgGI2g1rkZjd9/zHLkpsk6Ttt0g+3aSBA==
X-Received: by 2002:a17:907:7b94:b0:731:1b11:c241 with SMTP id ne20-20020a1709077b9400b007311b11c241mr16347387ejc.676.1662907310824;
        Sun, 11 Sep 2022 07:41:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-190-210-194.77.190.pool.telefonica.de. [77.190.210.194])
        by smtp.gmail.com with ESMTPSA id fd2-20020a056402388200b0044ed4d02483sm3993787edb.67.2022.09.11.07.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:41:50 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 0/2] LDAP SASL bind further fix series
Date:   Sun, 11 Sep 2022 16:41:37 +0200
Message-Id: <20220911144139.3525598-1-reimth@gmail.com>
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
 modules/cyrus-sasl.c           |  4 ++--
 modules/lookup_ldap.c          | 41 +++++++++++++++++++++++++---------
 3 files changed, 34 insertions(+), 13 deletions(-)

-- 
2.37.2

