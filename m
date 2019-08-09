Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C275886EE
	for <lists+autofs@lfdr.de>; Sat, 10 Aug 2019 01:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfHIXbn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 9 Aug 2019 19:31:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:43342 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbfHIXbn (ORCPT <rfc822;autofs@vger.kernel.org>);
        Fri, 9 Aug 2019 19:31:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2417EAF80;
        Fri,  9 Aug 2019 23:31:42 +0000 (UTC)
Date:   Fri, 9 Aug 2019 18:31:39 -0500
From:   Goldwyn Rodrigues <rgoldwyn@suse.com>
To:     autofs@vger.kernel.org
Cc:     raven@themaw.net
Subject: [PATCH] Do not lockup the kernel in case of deadlock
Message-ID: <20190809233139.qurn5zciauyhjozl@fiona>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

We should not deadlock the kernel, or wait infinitely in case the
user users incorrect mount options. One example is when
indirect mount and mount offsets are bind mounts which are not
private, and automount waits to complete a mount propagation.
Use the expire timeout as the limit to wait for automount
to complete, or return -EWOULDBLOCK/-EAGAIN.

Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>

diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
index b04c528b19d3..da1f01a73ffb 100644
--- a/fs/autofs/waitq.c
+++ b/fs/autofs/waitq.c
@@ -476,8 +476,11 @@ int autofs_wait(struct autofs_sb_info *sbi,
 	 * wq->name.name is NULL iff the lock is already released
 	 * or the mount has been made catatonic.
 	 */
-	wait_event_killable(wq->queue, wq->name.name == NULL);
-	status = wq->status;
+	status = wait_event_killable_timeout(wq->queue, wq->name.name == NULL, sbi->exp_timeout);
+	if (status > 0)
+		status = wq->status;
+	else if (status == 0)
+		status = -EAGAIN;
 
 	/*
 	 * For direct and offset mounts we need to track the requester's

-- 
Goldwyn
