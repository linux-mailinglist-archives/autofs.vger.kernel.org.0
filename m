Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 893455B4F72
	for <lists+autofs@lfdr.de>; Sun, 11 Sep 2022 16:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiIKOmA (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 10:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIKOl7 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 10:41:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D522873E
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 07:41:58 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id q21so9321379edc.9
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UGE+8EMWxfBxuCLU9umVPQBiD9xb0EJ7TzMtNj42Xbs=;
        b=QK/++tbcmbxz9Z7xGODm4QnIvgKTbW66d/l6B54N2sc3yp2CPIQdUt9UDbaYSNL3WO
         YPPHDG5RBHpJF4Vaw0kyedQuz34Ao2NTGCb8+OOMPJBSI+5Tiw7D1klYJchSzRXFHAPH
         MMoYRbET4ZwZBhaoqNROZWRIEvqoedwCPFQECJKycgAXs3ZqtJahIx/v3b7qln1ys2yO
         CbnImPzNNJLxCjqdDfvRtreyCPsKqNDK253kXMmhn4HLOIMoqUF6M24zyVzkuT+5EHOF
         agLAQOYBsiQ8SMoS00yO9mjeUKFSHlie75nhlPDKZ9XYO6xbufCvCMgNsC1W0ON/Xyyd
         CL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UGE+8EMWxfBxuCLU9umVPQBiD9xb0EJ7TzMtNj42Xbs=;
        b=p+BI3kANyBujY6YviKJD7v9XbCKG8RoOZsi2LAS+qR2ZWsIsFzLHn/zM2A7OJuZUN3
         MrSIJ1mZjvy7rHcFk09vHlyZdkiyac/zH+gcV/73JzAUJ9UNRvhzAgDkWfN7lGkqfdou
         7OQXi/cHEQVLugVKEFISVXEAat+5IAp0SkXNkI+JNFWWPjAMInFag3B83luM9q1oZB6i
         rqBIVklxq2RwSF9ldBkikzBXEqkeoQzeVOPwohOoA7r+qR72lgfZqilKY25hFQs7AkOi
         428ea+G1X+4UDHXBP4hrW5KfczfmQsRY8gMEq/DWYbgfylIAJ4K27x+vjF9kthc9SDXF
         0PIw==
X-Gm-Message-State: ACgBeo17wmnpSIKklf3qlu1lGG3Kt6YRSjlEI1LOUIZi0yhuHZQbHoG4
        4cJHnVzwr76EL5nmW2/InY8bMWS3HA==
X-Google-Smtp-Source: AA6agR49FcVXk0cMwy+RrQmld/5BNqhNQ2vMpzxuvLGwWfaQLsWjqy17hxETxFocA5CqqgXpHkRWIQ==
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id w17-20020a056402269100b0043dba10854bmr18464114edd.158.1662907316944;
        Sun, 11 Sep 2022 07:41:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-190-210-194.77.190.pool.telefonica.de. [77.190.210.194])
        by smtp.gmail.com with ESMTPSA id fd2-20020a056402388200b0044ed4d02483sm3993787edb.67.2022.09.11.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:41:56 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 1/2] autofs-5.1.8 - support SCRAM for SASL binding
Date:   Sun, 11 Sep 2022 16:41:38 +0200
Message-Id: <20220911144139.3525598-2-reimth@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911144139.3525598-1-reimth@gmail.com>
References: <20220911144139.3525598-1-reimth@gmail.com>
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

In general, automount users that apply SASL binding for authentication are
free to use any SASL mechanism supported by the underlying SASL library.
automounter does not check the specified mechanism and transparently
forwards the information to SASL or LDAP.

Most directory services now support the more secure Salted Challenge
Response Authentication Mechanismis (SCRAM) for SASL binding (RFC 5802).
But automount users cannot request use of SCRAM, as automount does not
read user and password credentials for SCRAM mechanisms.

This patch enables SCRAM-SHA-1 and other SCRAM-SHA mechanisms
(if supported by SASL library).

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 man/autofs_ldap_auth.conf.5.in | 2 +-
 modules/cyrus-sasl.c           | 4 ++--
 modules/lookup_ldap.c          | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/man/autofs_ldap_auth.conf.5.in b/man/autofs_ldap_auth.conf.5.in
index 2357566..0b3c706 100644
--- a/man/autofs_ldap_auth.conf.5.in
+++ b/man/autofs_ldap_auth.conf.5.in
@@ -60,7 +60,7 @@ authentication mechanism. If no suitable mechanism can be found, connections
 to the ldap server are made without authentication. Finally, if it is set to
 simple, then simple authentication will be used instead of SASL.
 .TP
-\fBauthtype="GSSAPI"|"LOGIN"|"PLAIN"|"ANONYMOUS"|"DIGEST-MD5|EXTERNAL"\fP
+\fBauthtype="GSSAPI"|"LOGIN"|"PLAIN"|"ANONYMOUS"|"DIGEST-MD5"|"SCRAM-SHA-1"|"EXTERNAL"\fP
 This attribute can be used to specify a preferred authentication mechanism.
 In normal operations, the automounter will attempt to authenticate to the
 ldap server using the list of supportedSASLmechanisms obtained from the
diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index c4b0788..aa523a9 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -35,7 +35,7 @@
  *
  *  This file implements SASL authentication to an LDAP server for the
  *  following mechanisms:
- *    GSSAPI, EXTERNAL, ANONYMOUS, PLAIN, DIGEST-MD5, KERBEROS_V5, LOGIN
+ *    GSSAPI, EXTERNAL, ANONYMOUS, PLAIN, DIGEST-MD5, SCRAM-SHA-*, KERBEROS_V5, LOGIN
  *  The mechanism to use is specified in an external file,
  *  LDAP_AUTH_CONF_FILE.  See the samples directory in the autofs
  *  distribution for an example configuration file.
@@ -1020,7 +1020,7 @@ sasl_choose_mech(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt)
 		 *  This routine is called if there is no configured
 		 *  mechanism.  As such, we can skip over any auth
 		 *  mechanisms that require user credentials.  These include
-		 *  PLAIN, LOGIN, and DIGEST-MD5.
+		 *  PLAIN, LOGIN, SCRAM-SHA-*, and DIGEST-MD5.
 		 */
 		if (authtype_requires_creds(mechanisms[i]))
 			continue;
diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index ce42601..e4cc32b 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -1233,7 +1233,7 @@ int get_property(unsigned logopt, xmlNodePtr node, const char *prop, char **valu
 }
 
 /*
- *  For plain text, login and digest-md5 authentication types, we need
+ *  For plain text, login, scram-sha-* and digest-md5 authentication types, we need
  *  user and password credentials.
  */
 int authtype_requires_creds(const char *authtype)
@@ -1241,6 +1241,7 @@ int authtype_requires_creds(const char *authtype)
 #ifdef WITH_SASL
 	if (!strncmp(authtype, "PLAIN", strlen("PLAIN")) ||
 	    !strncmp(authtype, "DIGEST-MD5", strlen("DIGEST-MD5")) ||
+	    !strncmp(authtype, "SCRAM-SHA-", strlen("SCRAM-SHA-")) ||
 	    !strncmp(authtype, "LOGIN", strlen("LOGIN")))
 		return 1;
 #endif
-- 
2.37.2

