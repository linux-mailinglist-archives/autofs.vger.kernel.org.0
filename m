Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB141F1673
	for <lists+autofs@lfdr.de>; Mon,  8 Jun 2020 12:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgFHKKp (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 8 Jun 2020 06:10:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45265 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729269AbgFHKKo (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 8 Jun 2020 06:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591611044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=q71Pmx0pP99/OKG1K41gAfAs5Xs0iQU9oujk/sfRygg=;
        b=WGgQnMLhdxgCOnfrQcDr0O7yuRiUzWH8gayYVj0MybZcdoXRsmWt/N93nmMTflmKDbO83g
        vzdFx0NP1HZ9F2Yqam5bUYMgd1yLZTfmJuDFYSvE89fMNelzxdXOg/AaFfqvyEPHDp/uiA
        2hT5CFb+v4be1VL7r6vYEr34+cmIZYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-n3hMhC7JNJG6h8ZUgJ4JxQ-1; Mon, 08 Jun 2020 06:10:41 -0400
X-MC-Unique: n3hMhC7JNJG6h8ZUgJ4JxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64D11BFC0;
        Mon,  8 Jun 2020 10:10:40 +0000 (UTC)
Received: from idlethread.redhat.com (unknown [10.33.36.94])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFFE5D9DD;
        Mon,  8 Jun 2020 10:10:39 +0000 (UTC)
From:   Roberto Bergantinos Corpas <rbergant@redhat.com>
To:     raven@themaw.net
Cc:     autofs@vger.kernel.org
Subject: [PATCH] autofs: add pid/comm to debug on autofs_notify_daemon
Date:   Mon,  8 Jun 2020 12:10:38 +0200
Message-Id: <20200608101038.20426-1-rbergant@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

  This can be useful for troubleshooting purposes and this information
  is not directly avalaible to userland

Signed-off-by: Roberto Bergantinos Corpas <rbergant@redhat.com>
---
 fs/autofs/waitq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
index b04c528b19d3..1a151a3b7d8b 100644
--- a/fs/autofs/waitq.c
+++ b/fs/autofs/waitq.c
@@ -88,9 +88,10 @@ static void autofs_notify_daemon(struct autofs_sb_info *sbi,
 	size_t pktsz;
 	int ret;
 
-	pr_debug("wait id = 0x%08lx, name = %.*s, type=%d\n",
+	pr_debug("wait id = 0x%08lx, name = %.*s, type=%d, requested by (%d/%s)\n",
 		 (unsigned long) wq->wait_queue_token,
-		 wq->name.len, wq->name.name, type);
+		 wq->name.len, wq->name.name, type,
+		 wq->pid, current->comm);
 
 	memset(&pkt, 0, sizeof(pkt)); /* For security reasons */
 
-- 
2.21.0

