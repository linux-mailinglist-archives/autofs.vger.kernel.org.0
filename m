Return-Path: <autofs+bounces-29-lists+autofs=lfdr.de@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C324E816F76
	for <lists+autofs@lfdr.de>; Mon, 18 Dec 2023 14:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31CC2B22616
	for <lists+autofs@lfdr.de>; Mon, 18 Dec 2023 13:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87A51D12C;
	Mon, 18 Dec 2023 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZXFqf0G"
X-Original-To: autofs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD77129EFE
	for <autofs@vger.kernel.org>; Mon, 18 Dec 2023 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702903749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=FHvfwz3OpUoYCzRRLHeQK+SIP27qBn4yTQIkmU7c6lM=;
	b=VZXFqf0GvXjtQR/1EFV2D4tk5rMuG6lH3xamFOzD9yby1LlQ7mHuFjEl14QaOl35P0UB7z
	uziHCBhYAGSs3TZSO7VrTsfRJ8SHeb80CHwt6SzMCbXCQXBSFIyzsR5cE3Q0K58A9OrRTX
	cpUy5m+FJeidplxZ5atmMRHESBzyLfA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-FpbWXQeyP6qHXzJwvHDQwA-1; Mon,
 18 Dec 2023 07:49:07 -0500
X-MC-Unique: FpbWXQeyP6qHXzJwvHDQwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C22338562CA
	for <autofs@vger.kernel.org>; Mon, 18 Dec 2023 12:49:07 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 127CA1C060B2
	for <autofs@vger.kernel.org>; Mon, 18 Dec 2023 12:49:06 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: autofs@vger.kernel.org
Subject: [PATCH] configure: Fix type error for ldap_parse_page_control
Date: Mon, 18 Dec 2023 13:49:05 +0100
Message-ID: <874jgf4qwu.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Fix argument type for ldap_parse_page_control in configure probe,
to suppress an incompatible-pointer-types error.

diff --git a/aclocal.m4 b/aclocal.m4
index 1046d72b1560a8ea..8dad987224fe5094 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -427,7 +427,7 @@ AC_LINK_IFELSE(
       struct berval *c;
       int ret;
       LDAPControl **clp;
-      ret = ldap_parse_page_control(ld,clp,ct,c); ]])],
+      ret = ldap_parse_page_control(ld,clp,ct,&c); ]])],
   [ af_have_ldap_parse_page_control=yes
     AC_MSG_RESULT(yes) ],
   [ AC_MSG_RESULT(no) ])


