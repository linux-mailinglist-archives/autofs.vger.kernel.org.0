Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE0D2250F3
	for <lists+autofs@lfdr.de>; Sun, 19 Jul 2020 11:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgGSJpD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Jul 2020 05:45:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24418 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725988AbgGSJpD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Jul 2020 05:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595151902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=/sJ73GXItvYN/jd3P7PpglTKt+l+mA4Md25idAqHAqk=;
        b=BLZgRXWWN3h8S6rN/ck2iCvLKYrjLsLSZnU7zAQJINjRAXTLraqKbRLqIdowoRQN+tmNCv
        iwl7ovDxGVr1sEdPkcPoce5EdNDUfddl2lyMm7kZdy2fdbRtAN/lhe26T9zM63gSrUHbdO
        C8dkJl2YwDra2SlFXa172IIUMM3AVAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-uiLq7WcBPxKEm7iPVQ7SPA-1; Sun, 19 Jul 2020 05:45:00 -0400
X-MC-Unique: uiLq7WcBPxKEm7iPVQ7SPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 292E4107ACCA;
        Sun, 19 Jul 2020 09:44:59 +0000 (UTC)
Received: from nevermore.foobar.lan (unknown [10.74.8.34])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id F0ECD75579;
        Sun, 19 Jul 2020 09:44:57 +0000 (UTC)
Date:   Sun, 19 Jul 2020 15:14:54 +0530
From:   Achilles Gaikwad <agaikwad@redhat.com>
To:     autofs@vger.kernel.org
Cc:     raven@themaw.net
Subject: [PATCH] autofs: mount_nfs.c fix local rdma share not mounting
Message-ID: <20200719094454.GA288362@nevermore.foobar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

When using the same system as nfs-server and nfs-client, and
using `nobind` option for autofs we would fall to the code where
we let `mount.nfs(8)` to handle the mount. However, when the
nfs-server and the nfs-client is the same system we end up calling
`rpc_ping` which gives negative return code. Due to this we fall to
the label next: and never attempt a mount of nfs share.
This patch fixes this BUG by not probing rpc_ping if we're
using rdma.

Signed-off-by: Achilles Gaikwad <agaikwad@redhat.com>
---
 modules/mount_nfs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
index 4e3e703..5a8c3bf 100644
--- a/modules/mount_nfs.c
+++ b/modules/mount_nfs.c
@@ -375,9 +375,13 @@ dont_probe:
 		 */
 		if (this->proximity == PROXIMITY_LOCAL) {
 			char *host = this->name ? this->name : "localhost";
-			int ret;
-
-			ret = rpc_ping(host, port, vers, 2, 0, RPC_CLOSE_DEFAULT);
+			/* If we're using RDMA, rpc_ping will fail
+			 * when nfs-server is local.
+			 * Therefore, don't probe when we're using RDMA
+			 */
+			int ret = 1;
+			if(!rdma)
+				ret = rpc_ping(host, port, vers, 2, 0, RPC_CLOSE_DEFAULT);
 			if (ret <= 0)
 				goto next;
 		}
-- 
2.26.2

