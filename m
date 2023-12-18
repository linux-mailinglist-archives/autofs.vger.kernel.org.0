Return-Path: <autofs+bounces-28-lists+autofs=lfdr.de@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4C816F73
	for <lists+autofs@lfdr.de>; Mon, 18 Dec 2023 14:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EDD1C22BF5
	for <lists+autofs@lfdr.de>; Mon, 18 Dec 2023 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA46129EFC;
	Mon, 18 Dec 2023 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QistlKZA"
X-Original-To: autofs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D51D130
	for <autofs@vger.kernel.org>; Mon, 18 Dec 2023 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702903702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=T4EPrxjAIh92vWgtSFQIbH68JsvVC3Ab3gn4ww31yBA=;
	b=QistlKZA63xzQQCB+Usm4zRF9HGATsHaflYGAkdtMsKeZ5inGFhpJwUicetcK51hjeuMVJ
	TB3A89WQNjb15RYF9uw2DvmmP0Gm9Y+l2k/nMinfHDkeS8UDU3JrMe81SCpeh3Wh1HojhC
	fwBPaQt20cCkDrxTMMz/YB0uEp3tfmE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-i2c9ZQbgODScM5B1NnmBJw-1; Mon,
 18 Dec 2023 07:48:21 -0500
X-MC-Unique: i2c9ZQbgODScM5B1NnmBJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE7A41C0170C
	for <autofs@vger.kernel.org>; Mon, 18 Dec 2023 12:48:20 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4451940C6EB9
	for <autofs@vger.kernel.org>; Mon, 18 Dec 2023 12:48:20 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: autofs@vger.kernel.org
Subject: [PATCH] Fix incompatible function pointer types in cyrus-sasl module
Date: Mon, 18 Dec 2023 13:48:18 +0100
Message-ID: <878r5r4qy5.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Add casts to SASL callbacks to avoid incompatible-pointer-types
errors.  Avoids a build failure with stricter compilers.

diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index e742eaf8ebe6ce8a..78b77942ba3efd56 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -109,17 +109,17 @@ static int getpass_func(sasl_conn_t *, void *, int, sasl_secret_t **);
 static int getuser_func(void *, int, const char **, unsigned *);
 
 static sasl_callback_t callbacks[] = {
-	{ SASL_CB_USER, &getuser_func, NULL },
-	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
-	{ SASL_CB_PASS, &getpass_func, NULL },
+	{ SASL_CB_USER, (int(*)(void)) &getuser_func, NULL },
+	{ SASL_CB_AUTHNAME, (int(*)(void)) &getuser_func, NULL },
+	{ SASL_CB_PASS, (int(*)(void)) &getpass_func, NULL },
 	{ SASL_CB_LIST_END, NULL, NULL },
 };
 
 static sasl_callback_t debug_callbacks[] = {
-	{ SASL_CB_LOG, &sasl_log_func, NULL },
-	{ SASL_CB_USER, &getuser_func, NULL },
-	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
-	{ SASL_CB_PASS, &getpass_func, NULL },
+	{ SASL_CB_LOG, (int(*)(void)) &sasl_log_func, NULL },
+	{ SASL_CB_USER, (int(*)(void)) &getuser_func, NULL },
+	{ SASL_CB_AUTHNAME, (int(*)(void)) &getuser_func, NULL },
+	{ SASL_CB_PASS, (int(*)(void)) &getpass_func, NULL },
 	{ SASL_CB_LIST_END, NULL, NULL },
 };
 


