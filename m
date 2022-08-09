Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4375D58D87D
	for <lists+autofs@lfdr.de>; Tue,  9 Aug 2022 13:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243036AbiHIL5V (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Aug 2022 07:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243056AbiHIL5T (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Aug 2022 07:57:19 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C85A2497F
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 04:57:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w3so14826995edc.2
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DnrZ7mLAGovhTOtJ4iDQqeeqXTnW+M9QDk17RHLXKFY=;
        b=UQSBe3B9f/vRNG/tbH9BXDF+Z4aUWmEGwAjNRxDf5tglibr8I74lWWYOLa4EKNFhOb
         DZgfGQ2F/wgkVsghosv0ublYYjp6lhnXvOUCZIMS9jyF8wgBuI93Vgq9IL1yKSjihj7K
         puYKESn7m4tROH3d1knxoh14k/0N/oRP7U+uLNj8ALz6HFtFc9yq1QoI/WFzQk/fPRK0
         /J7Sr3BC2Lmf9WwW89skYlUd5DwLrJ0hK5POAKJ58YiJ0Vn/IGQgRlwzS1ONT+vSV5I7
         8bu7xYHFjtj/eMaEI+iXNVo84JW62qe4HTLeGNZO8CZ8OC35zj6Y2bcHUQhOpAHZl6Uw
         LCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DnrZ7mLAGovhTOtJ4iDQqeeqXTnW+M9QDk17RHLXKFY=;
        b=rUMkBfvueBoj//qnq87JjfgInhfiUZIFWO8f0zVr/sHHqLEm2d6+7OizldgDtFnx5k
         j/dvoPs16yIvQnSgne7NzfOhX5qVCthI6AwvaSKA6V0GFZcczopA7SblTXiANAxECYAu
         aQShBZLvQ7uHrFYTtZ6cBm+B1ddIbF8RfrTVuMpqLGLltpSMWBlQcY/J10tLiQctRdU+
         l4U8DPfHwLBhgrSTCC9H+H1lpY429KoToRQ0708H/bKDMQHkExs7Jc1P36lMYwFlJ7mz
         Xo57zVXDlnsI+lmmTYDJNXVBmr95uTqaJtL2I8Q8KKafbokQtyES9Tn2u2aW9ALtO+Kc
         XylA==
X-Gm-Message-State: ACgBeo0ODR4bRdyau4XS2ifVSOa2gGRZe20nHwuP0SRV8qKOEeTx/9yD
        MNLNuPzFQ0gGk7m3oYkAPLkqQrre2lq0
X-Google-Smtp-Source: AA6agR6hF90QnbqeaiFB3jv2eOoPkhNxxJ7AiIvdQWNWTLmV7hRPpgw+8Ggq+g1Bo2sdudWxQpYP+A==
X-Received: by 2002:a05:6402:1703:b0:43c:c03a:db3d with SMTP id y3-20020a056402170300b0043cc03adb3dmr21545529edu.384.1660046236789;
        Tue, 09 Aug 2022 04:57:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-179-191-137.77.179.pool.telefonica.de. [77.179.191.137])
        by smtp.gmail.com with ESMTPSA id hb9-20020a170906b88900b0072b85a735afsm1039994ejb.113.2022.08.09.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:57:16 -0700 (PDT)
From:   ThomasReim <reimth@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Thomas Reim <reimth@gmail.com>
Subject: [PATCH 4/4] autofs-5.1.8 - more comprehensive verbose logging for LDAP maps
Date:   Tue,  9 Aug 2022 13:57:10 +0200
Message-Id: <20220809115710.108512-5-reimth@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809115710.108512-1-reimth@gmail.com>
References: <20220809115710.108512-1-reimth@gmail.com>
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
index df9376e..8393c00 100644
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -2591,7 +2591,7 @@ static int do_get_entries(struct ldap_search_params *sp, struct map_source *sour
 	e = ldap_first_entry(sp->ldap, sp->result);
 	if (!e) {
 		debug(ap->logopt,
-		      MODPREFIX "query succeeded, no matches for %s",
+		      MODPREFIX "query succeeded, no matches for query %s",
 		      sp->query);
 		ret = ldap_parse_result(sp->ldap, sp->result,
 					&rv, NULL, NULL, NULL, NULL, 0);
@@ -2614,7 +2614,7 @@ static int do_get_entries(struct ldap_search_params *sp, struct map_source *sour
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

