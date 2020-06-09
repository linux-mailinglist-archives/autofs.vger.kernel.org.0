Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB69F1F35F2
	for <lists+autofs@lfdr.de>; Tue,  9 Jun 2020 10:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgFIIKm (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 9 Jun 2020 04:10:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50253 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728005AbgFIIKk (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 9 Jun 2020 04:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591690239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=WCIhMZhp9euGzeTGl1lHY3A4Vo2f6CAOtlYe58JqBaQ=;
        b=P48poJiTfu6pnOrLmuph688iHeQuRWuZlyRnXr8lDOBT9nBsLyGOf7tJnRzU/AZ6VHnaAb
        N9J0O2F155IGrJBvxtY8BVxxQrBVjM/raoQWTp0x5+49X9JQkOg9zp9mb1yP2poyQp06DW
        14Q3986Kf1ORMof8UUDKGHXp/xsxvw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-KuMfMCWqP5KIdg3cZHBAHA-1; Tue, 09 Jun 2020 04:10:35 -0400
X-MC-Unique: KuMfMCWqP5KIdg3cZHBAHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058AA1005510;
        Tue,  9 Jun 2020 08:10:35 +0000 (UTC)
Received: from idlethread.redhat.com (unknown [10.33.36.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3FA5D9C9;
        Tue,  9 Jun 2020 08:10:33 +0000 (UTC)
From:   Roberto Bergantinos Corpas <rbergant@redhat.com>
To:     raven@themaw.net
Cc:     autofs@vger.kernel.org
Subject: [PATCH v2] autofs : add command to debug on autofs_notify_daemon
Date:   Tue,  9 Jun 2020 10:10:32 +0200
Message-Id: <20200609081032.5155-1-rbergant@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This can be useful for troubleshooting purposes and this information
is not directly available to userland.

log output :

autofs_notify_daemon: wait id = 0x0000000a, name = 000000009e008b35, type=5, comm = ls
autofs_notify_daemon: wait id = 0x00000009, name = 000000009e008b35, type=6, comm = automount

Signed-off-by: Roberto Bergantinos Corpas <rbergant@redhat.com>
---
 fs/autofs/waitq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
index b04c528b19d3..f1fa81d1c40f 100644
--- a/fs/autofs/waitq.c
+++ b/fs/autofs/waitq.c
@@ -88,9 +88,10 @@ static void autofs_notify_daemon(struct autofs_sb_info *sbi,
 	size_t pktsz;
 	int ret;
 
-	pr_debug("wait id = 0x%08lx, name = %.*s, type=%d\n",
+	pr_debug("wait id = 0x%08lx, name = %.*s, type=%d, comm = %s\n",
 		 (unsigned long) wq->wait_queue_token,
-		 wq->name.len, wq->name.name, type);
+		 wq->name.len, wq->name.name, type,
+		 current->comm);
 
 	memset(&pkt, 0, sizeof(pkt)); /* For security reasons */
 
-- 
2.21.0

