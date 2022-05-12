Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B5D5258B8
	for <lists+autofs@lfdr.de>; Fri, 13 May 2022 01:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238274AbiELXss (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 12 May 2022 19:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359558AbiELXsn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 12 May 2022 19:48:43 -0400
X-Greylist: delayed 398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 May 2022 16:48:41 PDT
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6F11C6C9E
        for <autofs@vger.kernel.org>; Thu, 12 May 2022 16:48:40 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4KzpGH3c2Vz9sdG;
        Fri, 13 May 2022 01:41:59 +0200 (CEST)
From:   Clayton Craft <clayton@igalia.com>
To:     autofs@vger.kernel.org
Subject: [PATCH 1/1] daemon: initialize pthread key before attempting to log
Date:   Thu, 12 May 2022 16:41:46 -0700
Message-Id: <20220512234145.18308-2-clayton@igalia.com>
In-Reply-To: <20220512234145.18308-1-clayton@igalia.com>
References: <20220512234145.18308-1-clayton@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4KzpGH3c2Vz9sdG
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Fixes a segfault when running the automount daemon with -v, where
log.c:prepare_attempt_prefix calls pthread_getspecific when no
key_thread_attempt_id exists.

Signed-off-by: Clayton Craft <clayton@igalia.com>
---
 daemon/automount.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/daemon/automount.c b/daemon/automount.c
index 32f95a5..b941129 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -2629,15 +2629,9 @@ int main(int argc, char *argv[])
 		exit(1);
 	}
 
-	info(logging, "Starting automounter version %s, master map %s",
-		version, master_list->name);
-	info(logging, "using kernel protocol version %d.%02d",
-		get_kver_major(), get_kver_minor());
-
-	status = pthread_key_create(&key_thread_stdenv_vars,
-				key_thread_stdenv_vars_destroy);
+	status = pthread_key_create(&key_thread_attempt_id, free);
 	if (status) {
-		logerr("%s: failed to create thread data key for std env vars!",
+		logerr("%s: failed to create thread data key for attempt ID!",
 		       program);
 		master_kill(master_list);
 		if (start_pipefd[1] != -1) {
@@ -2649,9 +2643,15 @@ int main(int argc, char *argv[])
 		exit(1);
 	}
 
-	status = pthread_key_create(&key_thread_attempt_id, free);
+	info(logging, "Starting automounter version %s, master map %s",
+		version, master_list->name);
+	info(logging, "using kernel protocol version %d.%02d",
+		get_kver_major(), get_kver_minor());
+
+	status = pthread_key_create(&key_thread_stdenv_vars,
+				key_thread_stdenv_vars_destroy);
 	if (status) {
-		logerr("%s: failed to create thread data key for attempt ID!",
+		logerr("%s: failed to create thread data key for std env vars!",
 		       program);
 		master_kill(master_list);
 		if (start_pipefd[1] != -1) {
-- 
2.36.1

