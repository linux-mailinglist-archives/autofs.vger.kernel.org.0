Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC875B5260
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 02:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiILA6l (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Sep 2022 20:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiILA6k (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Sep 2022 20:58:40 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B25F17E02
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:58:39 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bj14so12897926wrb.12
        for <autofs@vger.kernel.org>; Sun, 11 Sep 2022 17:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UGE+8EMWxfBxuCLU9umVPQBiD9xb0EJ7TzMtNj42Xbs=;
        b=k0oIoHJX8zxwRLO/380WtlvjBBk9oHvjYcBNZU1+JrXBnTpGNO3WGrjO3a4nNa9kXc
         t81//gZrb35TpgGKYdddhMwfNad+7+71DXSS6QjrSEaYOk6pu9AXOX7ArIJ7MUmLaGNg
         QqrL3rJBszalWApaPM2Ig5gtokEHL1jo685uy1K9i+eLcVYBv+GXrJojaW9mMPD2aALg
         qXnOHRJL7zoYXOM3aSty+GWj0IqRMW4F/FMj6qp2Rh7zHGtOK8OOdBWa/W6LBeOwL/zO
         cTLSlLFzh+SB6olB7032A4WF9f01fFXlRZOBwJsrwXLGL06UDoik8Tp72icFZhBFlBpE
         TyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UGE+8EMWxfBxuCLU9umVPQBiD9xb0EJ7TzMtNj42Xbs=;
        b=atBNNiaJhjQYEvwylZmkCzwkEX8M00ygio3KkNYHFfmCzNarcS02oFeBja+wbOKX5v
         PIAPMWM4U9yGVfg0RQm5vSS6eyD12HIgFP5Yx8sLS8ufzqSiXHOAuelQdxOUcc5UH2ql
         hw3KI+WzSUhewDOp+Hg1BkUOoe/+9/+BfhYRZOzrk6ZwpOkrc6Y99TMJZVDmRmpBCeXS
         PrWCUzRW163/Xf6iJkcv34IsORmKmaDTz09PcXMs7mluJIZCY9arL1HYR39TjA2NMKyz
         Lw+q7gPRc1zILuukIRSP7xBjuIBcMh40fbZtquiKUJRNwgoUBT1ZmrTkOmxJNClYQ91o
         y9jw==
X-Gm-Message-State: ACgBeo2rM7UXBY/0tDiH2Ct4JBXRt3TD0oFqlVenFNW4WSnG83F9FOHM
        3tB+a+guHnoDGJtQj/Bf8Gv74/1VXw==
X-Google-Smtp-Source: AA6agR6uuUOHbr6zG6iw8+wDadPuYsxO3JViiWluk2FiFWXLyr9HyowEPjHb1iBAtZxmvVM4r8i8qg==
X-Received: by 2002:a5d:518c:0:b0:228:6253:c4aa with SMTP id k12-20020a5d518c000000b002286253c4aamr13148428wrv.639.1662944317897;
        Sun, 11 Sep 2022 17:58:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-190-097-057.77.190.pool.telefonica.de. [77.190.97.57])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c4e8a00b003b31fc77407sm8790814wmq.30.2022.09.11.17.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 17:58:37 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 1/2] autofs-5.1.8 - support SCRAM for SASL binding
Date:   Mon, 12 Sep 2022 02:58:21 +0200
Message-Id: <20220912005822.3947426-2-reimth@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220912005822.3947426-1-reimth@gmail.com>
References: <20220912005822.3947426-1-reimth@gmail.com>
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

