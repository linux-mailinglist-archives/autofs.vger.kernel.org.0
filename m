Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E349959298D
	for <lists+autofs@lfdr.de>; Mon, 15 Aug 2022 08:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiHOGXA (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 15 Aug 2022 02:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiHOGW6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 15 Aug 2022 02:22:58 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C791193C2
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:57 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id y13so11913302ejp.13
        for <autofs@vger.kernel.org>; Sun, 14 Aug 2022 23:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RC/tzwu0z2NQqWCJ1rkpPolj1VE2uuQ2rRC4q6+8S0o=;
        b=nR8rWd9u10Dl7D64qNdLDxEfaD71DIGyzVpXvCjwNfZnkSEsNr8BMTi8JdJhY1eAib
         /8UNgRwWRLhzR3Rgqek9TyLuyWnBFtlYPrqMBD2A10XzeAs3wIssxz0S+V8FdgLJxl8y
         06xUTIoppnSNZQxyRq/EumlrYPDn77/Nr4TyAQNqN/cc7IShANXNMdw9MAZTC0lIzAhC
         jwwDLF3g2Kd1n7GEMTMF5R7nq/Wp4XCip0lnOWZr5tcKkVy04bPEDOyhs65FcrcXOAL2
         FpgcsQ3mZ6PDrI45LC9BIAOIas282D5NHjC02hC/Db/txO2W2IyqisRlpqGnO1adKO6P
         /NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RC/tzwu0z2NQqWCJ1rkpPolj1VE2uuQ2rRC4q6+8S0o=;
        b=VBir7e87YdDTKSI3uBUGvRuNa7Qopmp0VIcmtii+VgNuCEcHQ9osjPPWK6UNkIuKq5
         80xPE9GCx+QjW8mvVupktt9oWn3A1crTuR4cdl68gysldkIlDmYyAePiZMGHR5Usl3Ia
         4zb4uODANXc3q9jHGTRJFgMDnSC+Gf2mC6CVV3ctze1mB08PW4PzH/3lJWHQe6Jm59/h
         YPd3T1gei9iZcf01LkZLQis+FZNUEPTl2CNy1txFP7E5+Y4QWCO8f16FheXbX27dSuqZ
         o1uaWmB4c2TUXq/Vqt6INOil8kCYzCmkGbRsnfUrFzkVkIKXUbM+EuBD4bnScXazTBsa
         uvxg==
X-Gm-Message-State: ACgBeo1HwD9SbvR+Cb9dAzX5n4X6RtEeMUI58bvj4hLwxcYoXiVttvcI
        pCTwojQ2oFSC4MvP9YB0M+bAMBjPEPhT
X-Google-Smtp-Source: AA6agR7AIj2pA5KaQ6DWG5KVviFa3wBCCWM5P+YEG8Q+5X4/ATNTuEltM9TwKJ+8mwlrlwKVm8ZHew==
X-Received: by 2002:a17:907:8a1a:b0:731:6475:68f7 with SMTP id sc26-20020a1709078a1a00b00731647568f7mr9419939ejc.359.1660544575766;
        Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
Received: from localhost.localdomain ([77.189.63.104])
        by smtp.gmail.com with ESMTPSA id fu18-20020a170907b01200b007308bdef04bsm3662838ejc.103.2022.08.14.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:22:55 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH v2 4/4] autofs-5.1.8 - more comprehensive verbose logging for LDAP maps
Date:   Mon, 15 Aug 2022 08:22:45 +0200
Message-Id: <20220815062245.1719099-5-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815062245.1719099-1-reimth@gmail.com>
References: <20220815062245.1719099-1-reimth@gmail.com>
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

Current logging of LDAP map lookups in verbose mode is not very
comprehensive. It's not clear for what purpose connections to the LDAP
directory are made as the only result that will be reported is the autofs
mount point creation.

Inform users about the intention of the LDAP directory access in verbose
mode.

Signed-off-by: Thomas Reim <reimth@gmail.com>
---
 daemon/lookup.c       | 20 ++++++++++----------
 modules/lookup_ldap.c |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/daemon/lookup.c b/daemon/lookup.c
index 4a286d6..b2fd488 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -169,7 +169,7 @@ int lookup_nss_read_master(struct master *master, time_t age)
 	/* If it starts with a '/' it has to be a file or LDAP map */
 	if (*master->name == '/') {
 		if (*(master->name + 1) == '/') {
-			debug(logopt, "reading master ldap %s", master->name);
+			info(logopt, "reading ldap master %s", master->name);
 			result = do_read_master(master, "ldap", age);
 		} else {
 			debug(logopt, "reading master file %s", master->name);
@@ -215,7 +215,7 @@ int lookup_nss_read_master(struct master *master, time_t age)
 				 */
 				if (strncmp(name, "ldap", 4)) {
 					master->name = tmp + 1;
-					debug(logopt, "reading master %s %s",
+					info(logopt, "reading %s master %s",
 					      source, master->name);
 				} else {
 					master->name = name;
@@ -260,8 +260,8 @@ int lookup_nss_read_master(struct master *master, time_t age)
 		    strncmp(this->source, "sss", 3))
 			continue;
 
-		debug(logopt,
-		      "reading master %s %s", this->source, master->name);
+		info(logopt,
+		      "reading %s master %s", this->source, master->name);
 
 		result = read_master_map(master, this->source, age);
 
@@ -549,8 +549,8 @@ int lookup_nss_read_map(struct autofs_point *ap, struct map_source *source, time
 			if (!strncmp(map->type, "multi", 5))
 				debug(ap->logopt, "reading multi map");
 			else
-				debug(ap->logopt,
-				      "reading map %s %s",
+				info(ap->logopt,
+				      "reading %s map %s",
 				       map->type, map->argv[0]);
 			result = lookup_map_read_map(ap, map, age);
 			map = map->next;
@@ -566,8 +566,8 @@ int lookup_nss_read_map(struct autofs_point *ap, struct map_source *source, time
 					continue;
 				}
 				map->type = tmp;
-				debug(ap->logopt,
-				      "reading map %s %s", tmp, map->argv[0]);
+				info(ap->logopt,
+				      "reading %s map %s", tmp, map->argv[0]);
 				result = do_read_map(ap, map, age);
 			} else {
 				debug(ap->logopt,
@@ -602,8 +602,8 @@ int lookup_nss_read_map(struct autofs_point *ap, struct map_source *source, time
 				continue;
 			}
 
-			debug(ap->logopt,
-			      "reading map %s %s", this->source, map->argv[0]);
+			info(ap->logopt,
+			      "reading %s map %s", this->source, map->argv[0]);
 
 			result = read_map_source(this, ap, map, age);
 			if (result == NSS_STATUS_UNKNOWN)
diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
index c174426..c44e248 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -2489,7 +2489,7 @@ static int do_get_entries(struct ldap_search_params *sp, struct map_source *sour
 	e = ldap_first_entry(sp->ldap, sp->result);
 	if (!e) {
 		debug(ap->logopt,
-		      MODPREFIX "query succeeded, no matches for %s",
+		      MODPREFIX "query succeeded, no matches for query %s",
 		      sp->query);
 		ret = ldap_parse_result(sp->ldap, sp->result,
 					&rv, NULL, NULL, NULL, NULL, 0);
@@ -2512,7 +2512,7 @@ static int do_get_entries(struct ldap_search_params *sp, struct map_source *sour
 			e = ldap_next_entry(sp->ldap, e);
 			if (!e) {
 				debug(ap->logopt, MODPREFIX
-				      "failed to get next entry for query %s",
+				      "query succeeded, no more matches for query %s",
 				      sp->query);
 				ret = ldap_parse_result(sp->ldap,
 							sp->result, &rv,
-- 
2.37.1

