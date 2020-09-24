Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63982776CF
	for <lists+autofs@lfdr.de>; Thu, 24 Sep 2020 18:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgIXQgX (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 24 Sep 2020 12:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38814 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726516AbgIXQgW (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 24 Sep 2020 12:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600965381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AxICrB75vUoluujWTCcDuo9cfMkVI4Pj4DTs9Y0FloU=;
        b=UuGWKx34f4py1m/BwwfkzGf7Q7h6OaM6D0Oc+pXiICZratjDbHiijtSqU4b/w7U1RM+vAT
        rJk6ey5AdDCdnu4Q1JX/WJvq2xQrT/+LslOGDM0zI6pwOARuA84aoPyi7JUJpAQdEXrPwX
        CjImBJel7R9yo9CgpyPJ1GhgHG734sA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-1jJtf-NNPLqpbybPjIzyhw-1; Thu, 24 Sep 2020 12:36:19 -0400
X-MC-Unique: 1jJtf-NNPLqpbybPjIzyhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DBA2871807;
        Thu, 24 Sep 2020 16:36:18 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.43.2.201])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DB5F41002C05;
        Thu, 24 Sep 2020 16:36:13 +0000 (UTC)
From:   Julia Suvorova <jusual@redhat.com>
To:     autofs@vger.kernel.org
Cc:     Ian Kent <raven@themaw.net>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH] fix typo in daemon/automount.c
Date:   Thu, 24 Sep 2020 18:36:07 +0200
Message-Id: <20200924163607.283012-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

'Random' is spelled like 'ramdom' in the automount help option.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 daemon/automount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/daemon/automount.c b/daemon/automount.c
index 0391bfb..b7d2a04 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -1956,7 +1956,7 @@ static void usage(void)
 		"			run automounter as a systemd service\n"
 		"	-f --foreground do not fork into background\n"
 		"	-r --random-multimount-selection\n"
-		"			use ramdom replicated server selection\n"
+		"			use random replicated server selection\n"
 		"	-m --dumpmaps [<map type> <map name>]\n"
 		"			dump automounter maps and exit\n"
 		"	-n --negative-timeout n\n"
-- 
2.25.4

