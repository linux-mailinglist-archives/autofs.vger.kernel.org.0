Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96D959297F
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239909AbiHOGTh (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241084AbiHOGTF (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:19:05 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654D21A3B1
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:19:04 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id uj29so12002426ejc.0
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=TTsg+dHp0k7X4vwkSYYcxcRDJyIM6RvJl6eUdlBB9nk=;
        b=fhVjZo73lSN++3/9YLEFjd62iYRrvOqRhBuh1FggbbfqhOec/wqJsw6hxh2URIDgyG
         Rr15tQbvWEnVhENdzdW5FkBcnqxc2G+5scwsp5awLzRGy+KaD+rMf9ZmdeRQaDhgM1il
         ZU+RWsiUsdNC8CncX0x6PjLZvFjWZ27o1npoixJajikgqj7NHhR93MqOxqcwjjXDpyer
         2x/y8a4flmDLf3/GSBx/tBMpds76u5nDzHS9AGdiBH/sxwbrhTY68sT+qL6REdyI8kPb
         85krdesH5kkPvZdNQ/txDs3T9qtSc2Cd+o0+b2E5HJ7QxD5ygjs9DgA3w5e6U/W2FoJ3
         MV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=TTsg+dHp0k7X4vwkSYYcxcRDJyIM6RvJl6eUdlBB9nk=;
        b=7ELQn/js2RaqYdgUDU/KcVPs6SZCAyn8AjcWPSW3i8U9idOfezI5EGoUKAz4OwNQ6T
         VrQOP4gBLgKuRJETw6D4G6oLJwStZHXh63Avjrb3xqLGTUcEBkPGoM/zdZmfUZeS50xy
         kPkwdy5st+NOaSH2gXsltknyV4t2F8J/YSfoF0hHtJzSImeGcRDJHIPZ7MWp6+qpGuyX
         OPYeNVWccob3Fka1v7YSWPiJywbNTDeUay8sXBp78i05z3TTktd/x89Z1qiwajxK0Fh+
         p0Sahb+79FBNvCHcEgHxsJ1WEdza5UZi8mk9hNi5Mh1X8m17RawhrI6sZkqD78OpzIbI
         0uQg==
X-Gm-Message-State: ACgBeo2boeA8Sm1RMlVMQd6+UjhG6YJiqZIPekk2d+sW/1SAgEiV5LPy
        v7+8y+iYcDlF0K1087oA50R09dMvZMS+
X-Google-Smtp-Source: AA6agR5proHPhaGsORub80CIpeBBeZgP1c2IJwIIO6xFql9LflVmwnIkmhq7RgzaGzaAdGFQWwNsxg==
X-Received: by 2002:a17:907:6d98:b0:731:2bb3:8e17 with SMTP id sb24-20020a1709076d9800b007312bb38e17mr9567656ejc.203.1660544342892;
        Sun, 14 Aug 2022 23:19:02 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7d5d4000000b0043c92c44c53sm5984916eds.93.2022.08.14.23.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:19:02 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 4/4] autofs-5.1.8 - configure: LDAP function checks ignore implicit declarations
Date:   Mon, 15 Aug 2022 08:18:48 +0200
Message-Id: <20220815061848.1718068-5-reimth@gmail.com>
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

