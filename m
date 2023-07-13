Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D71875167B
	for <lists+autofs@lfdr.de>; Thu, 13 Jul 2023 04:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjGMCuG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 12 Jul 2023 22:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjGMCuF (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 12 Jul 2023 22:50:05 -0400
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [121.200.0.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD5810EC
        for <autofs@vger.kernel.org>; Wed, 12 Jul 2023 19:50:04 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 8A4E210025D
        for <autofs@vger.kernel.org>; Thu, 13 Jul 2023 12:44:44 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FWP18bboRMLI for <autofs@vger.kernel.org>;
        Thu, 13 Jul 2023 12:44:44 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 550A81002F5; Thu, 13 Jul 2023 12:44:44 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (2403-580e-4b40-0-7968-2232-4db8-a45e.ip6.aussiebb.net [IPv6:2403:580e:4b40:0:7968:2232:4db8:a45e])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id E54A110025D;
        Thu, 13 Jul 2023 12:44:43 +1000 (AEST)
Subject: [PATCH 1/2] autofs-5.1.8 - use correct reference for IN6 macro call
From:   Ian Kent <raven@themaw.net>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>,
        Mike Gabriel <sunweaver@debian.org>,
        autofs mailing list <autofs@vger.kernel.org>
Date:   Thu, 13 Jul 2023 10:44:43 +0800
Message-ID: <168921628349.13982.4102676562391062178.stgit@donald.themaw.net>
In-Reply-To: <168921521309.13982.11820120661485368005.stgit@donald.themaw.net>
References: <168921521309.13982.11820120661485368005.stgit@donald.themaw.net>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

While the usage isn't strickly wrong it's also not correct and it
passes compiler checks but it doesn't match the usage within the
macro it's passed to.

Change it to match the IN6_* macro definition to reduce the potential
for confusion.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG            |    1 +
 modules/replicated.c |    4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index b7ab3591..2f0b9dee 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -90,6 +90,7 @@
 - add soucre parameter to module functions.
 - add ioctlfd open helper.
 - make open files limit configurable.
+- use correct reference for IN6 macro call.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/modules/replicated.c b/modules/replicated.c
index cdb7c617..2e628123 100644
--- a/modules/replicated.c
+++ b/modules/replicated.c
@@ -1032,11 +1032,13 @@ try_name:
 	while (this) {
 		if (this->ai_family == AF_INET) {
 			struct sockaddr_in *addr = (struct sockaddr_in *) this->ai_addr;
+
 			if (addr->sin_addr.s_addr != INADDR_LOOPBACK)
 				rr4++;
 		} else if (this->ai_family == AF_INET6) {
 			struct sockaddr_in6 *addr = (struct sockaddr_in6 *) this->ai_addr;
-			if (!IN6_IS_ADDR_LOOPBACK(addr->sin6_addr.s6_addr32))
+
+			if (!IN6_IS_ADDR_LOOPBACK(&addr->sin6_addr))
 				rr6++;
 		}
 		this = this->ai_next;


