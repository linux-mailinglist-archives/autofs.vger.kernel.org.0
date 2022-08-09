Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B6958D879
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243005AbiHIL5T (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243055AbiHIL5R (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:57:17 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1EA24BC6
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:57:15 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z22so14777298edd.6
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Qo/CdEawPxn/h5rZS0k/r+i9OHrqVkv9XiMZoU2U0iQ=;
        b=ICRo+UxP0gTKOPdRZix1hrc6aGavdEO7gMg0B43JqsdglbZsltkTiOinV0XhaTJXMM
         5pzC4s7cDL5ICOu1OKOiOxMhNIMR5klBj0Urc4rvRGzoVTFst0cCTIPb6ZnTaJea4cq5
         ZFegRqxSNN3fjC80MLlj6QJ0Kl73/6l7WZ2CP5bv4bCQcgzUSGmwvACLj7WItNxlvuX0
         DLFahTjcT3Lpr/gRvA9+gEP5Tc1FHU+y4eyObp6Cz9BT+uK29Yj5A1fOKItmednxgJPj
         7OEPK64k5EOl+eatje42m1vmgtZuruVWTu+5ZhJONMZ2dHmh14vO75dKLAvGD7a4HlaY
         /4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Qo/CdEawPxn/h5rZS0k/r+i9OHrqVkv9XiMZoU2U0iQ=;
        b=1atZjJ2B66qQzZew3Inagop9OUJ6cdqKqQdL9V9VadZfareFvDqjCPrjIoVxgTfEqP
         s6yPQR2LxQHkYMCJSO0TtTdV4WwUSs//K5jzno56l0WcmF8KgPPLFWnnaU9W5i5Pz1FX
         qtfxmSsDGTMFULQgRXr9AR/O82iCAnTYL1r1iicPOWFsAygYPQKBSpQYmOpiNxjlBReh
         5Ryhb1a4nzbuA0sNLJPxfKl4AXyLzh38++fkIoW5iG8jxYAUZiImGOROrJEf1qLmCcny
         /cNh6TKGi0chCueqSBzNMAx4eE2+0wWLtEqy85F2OnuLbaS02wq9kIq5Vt35LN9BVi6L
         saQQ==
X-Gm-Message-State: ACgBeo3F3gjcdDfATgSNigIqX2btQBxc32KYNznI3TcTDlFj2PQn8DaB
        PwyVHGzl4P93QvC6kYjYLpypDXWmuo8N
X-Google-Smtp-Source: AA6agR7/Y8ahvXw7jNP9rRw8nKN727RfqheWtgPJ5Fe5Nv+MN+uVsuNLgj/gHvNcDBLqGo+CuNyqkQ==
X-Received: by 2002:a05:6402:447:b0:440:d482:495f with SMTP id p7-20020a056402044700b00440d482495fmr6384514edw.264.1660046234063;
        Tue, 09 Aug 2022 04:57:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id hb9-20020a170906b88900b0072b85a735afsm1039994ejb.113.2022.08.09.04.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:57:13 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 0/4] Improve SASL and LDAP (Debug) Logging
Date:   Tue,  9 Aug 2022 13:57:06 +0200
Message-Id: <20220809115710.108512-1-reimth@gmail.com>
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
 modules/cyrus-sasl.c  | 37 +++++++++++++++++++++++++++++++++++--
 modules/lookup_ldap.c | 41 +++++++++++++++++++++++++++++++++++++++--
 7 files changed, 140 insertions(+), 23 deletions(-)

-- 
2.37.1

