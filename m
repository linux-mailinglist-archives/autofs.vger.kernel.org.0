Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57892592989
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiHOGW7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiHOGWz (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:22:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFB81900F
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id uj29so12013616ejc.0
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2406fo85t+rQEzCE0fTSBba9ltxQTT3RJ7qGOqWQifM=;
        b=nXvW3/RyEUAZjVr1mwVfasjumBAhyhc4TmaB63oq7Bt5iJr9riyHwowzM0M+SfytEa
         XF4aKioVRelE6887zqOfF65ZhRpICPWCX47dknwr9fUy9kp9NPaHUw0Tc6uQo5DyuEtl
         JZzQHUZy/cqGzOfLS7wAm3Tdu93XzRVf+29BmrQAGbcNs3qKCJZXwe/BWezVdskjeSyD
         /JMjULPsYnbe5ejIreRx4Ym9WVXHsuJn2baQBxPqu/E192MXM51uQMgyMgF0xAbrKI8O
         XWROy8cp+xUueitl9LbtGtXFTGFsMk7ehuv4H2DPQsUt2ZfyZP96Vc40EWFjPSiHiPLW
         vHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2406fo85t+rQEzCE0fTSBba9ltxQTT3RJ7qGOqWQifM=;
        b=kbIwfnTsFPgW3xhVPdpssYPI2pwsUzMpmCVHAx2Ue6DSVz7+c9u9qgzYE73P4ex0+2
         4bwdzdwgD2UYIZ0zR+GdLHFol1mUiSACBU8xGcOOy8BOBjBgRMQJ8I7bgLXoLwA15LKV
         eg4NZj4zm2T/v0OCnu7R3v0AKFSz40ZNFV5WSlavpYHF2oPWM2Xlu15Tx1dheWnYoTLO
         +Ytvsx9bX15drinQ/uXCtFBj582eYgy9c3RbYk39kV+8Ubtt0C8f971WZvljDfEibhva
         n1NdCjox74vogSw3SbGiDD1DdIHzSDyWyVyyeTsn9EwIPlBhXVoKP4fydB0jXp7g6E8H
         E0uw==
X-Gm-Message-State: ACgBeo3tLoKXbIePkMkECyAnEcCDQj8a/3RqzvlnHdgY0ERQfdAAzeWm
        34mtcW2XEDcqx/oJ7s9DPrMKZ6+CeNmM
X-Google-Smtp-Source: AA6agR7la+QaaRtHgCRuQVX9teuPITB1VjH0UHy1LqL8uWGH16SETwOZcaZIZOED2BGRsLXJileAdg==
X-Received: by 2002:a17:907:6285:b0:72f:a3b9:9666 with SMTP id nd5-20020a170907628500b0072fa3b99666mr9238098ejc.455.1660544572832;
        Sun, 14 Aug 2022 23:22:52 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id fu18-20020a170907b01200b007308bdef04bsm3662838ejc.103.2022.08.14.23.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:22:52 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 0/4] Improve SASL and LDAP (Debug) Logging
Date:   Mon, 15 Aug 2022 08:22:41 +0200
Message-Id: <20220815062245.1719099-1-reimth@gmail.com>
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

v2:
    - autofs-5.1.8 - improve debug logging of SASL binds:
        - Declarations moved to the top of code block
        - Removed brackets from single-line target code blocks
    - autofs-5.1.8 - internal SASL logging only in debug log mode:
        - Removed brackets from single-line target code blocks

automounter only provides very limited (debug) information when binding
to LDAP directoiry services using OpenLDAP and Cyrus SASL library. LDAP
based directory services are currently all improving their communication
security. This leads to failed authentication binds because of security
policy violations. Current logging capabilities of automounter make it
difficult for system administrators to find the root cause of failed
authentication binds in their networks.

The following patch series is the result of the development and test
activities to solve issue "Missing Support of SASL Sign or Seal using Data
Security Layer" (see previous e-mails). Debug option -d of automounter has
been extended to enable OpenLDAP libldap debugging by specifying a proper
LDAP debug level (e. g. -d5). In addition, option -d now provides for
a more comprehensive logging of SASL security settings.

Please review and provide your comments or suggestions.

Thomas Reim (4):
  autofs-5.1.8 - improve debug logging of LDAP binds
  autofs-5.1.8 - improve debug logging of SASL binds
  autofs-5.1.8 - internal SASL logging only in debug log mode
  autofs-5.1.8 - more comprehensive verbose logging for LDAP maps

 daemon/automount.c    | 31 ++++++++++++++++++++++++++-----
 daemon/lookup.c       | 20 ++++++++++----------
 include/log.h         |  6 +++++-
 lib/log.c             | 19 ++++++++++++++++++-
 man/automount.8       |  9 +++++++--
 modules/cyrus-sasl.c  | 33 ++++++++++++++++++++++++++++++---
 modules/lookup_ldap.c | 41 +++++++++++++++++++++++++++++++++++++++--
 7 files changed, 135 insertions(+), 24 deletions(-)

-- 
2.37.1

