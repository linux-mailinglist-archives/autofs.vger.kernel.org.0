Return-Path: <autofs+bounces-546-lists+autofs=lfdr.de@vger.kernel.org>
Delivered-To: lists+autofs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCjWAP7tuWnPPgIAu9opvQ
	(envelope-from <autofs+bounces-546-lists+autofs=lfdr.de@vger.kernel.org>)
	for <lists+autofs@lfdr.de>; Wed, 18 Mar 2026 01:12:46 +0100
X-Original-To: lists+autofs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE02B4915
	for <lists+autofs@lfdr.de>; Wed, 18 Mar 2026 01:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AD3E3018C20
	for <lists+autofs@lfdr.de>; Wed, 18 Mar 2026 00:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837BB70830;
	Wed, 18 Mar 2026 00:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VWKpqRM9"
X-Original-To: autofs@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D33BB4A
	for <autofs@vger.kernel.org>; Wed, 18 Mar 2026 00:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792763; cv=none; b=jpRcgJg0XYdnXWZEj98yqGv+fgK3Irp9UgCytYYzCwfYplK0U2wey/ZxCrfSPJV5HkR+w85u9U7/Rti3mhFzk9cWYXgPUPUWoGEuM6r9Fjjg2apmH3Vb7WglbmdMQcl1OxUzX0y0J6QLkiQbXflprY+sGuCmzE/bbFPDjC5Gdxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792763; c=relaxed/simple;
	bh=/wyeoNSc8VJPOIxl4aULutCs+w8XFz29GTMzofX9+V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjfkpsBgVkOIiqVmToOXitLSpYCVd7L2rgAM0AhSX17IGn//Te2K3yTALxaWhIFtBOH08c5dxY1fjEZw2UFpl1extWngJ39eBgEpuMaSwQLgx4F//44y9msQVek6Ww0Exd4ORuLzvlAf3L5DnX8lTaZeQaMvWfgPx4CQ3sHcPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VWKpqRM9; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773792759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=As+BWxwmhTP8TFNtZY1Ykz6cxDPrQsrHZiB+nEzMtOc=;
	b=VWKpqRM9yxsigYFoFfHyJ3mGh2sBjyW3ZWyMQpPj/uOS1OOiALo+93fYveNr6rBOLRmffc
	AvZ1Z9f+DhOWfnDVvpcgRIqAoc+d4Uw8+0laFPpIDwJi/IzOcwho0AP9z3OP+8p9TtJ8s8
	PLzhjY1eY1WP6oqfSVkoFT/ni6zIpjo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ian Kent <raven@themaw.net>
Cc: Christian Brauner <brauner@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	autofs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] autofs: replace manual symlink buffer allocation in autofs_dir_symlink
Date: Wed, 18 Mar 2026 01:12:21 +0100
Message-ID: <20260318001219.2354-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=thorsten.blum@linux.dev; h=from:subject; bh=/wyeoNSc8VJPOIxl4aULutCs+w8XFz29GTMzofX9+V0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk73z4+XXRBZM7eE8pMYc9jPm7ZEnU2rXjLMsGTv52rD xa07Gdo6ihlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJREkzMnxafnmq+e/5fq31 PLzNjGkqh3UzZLTfxs/0nrWsYW9h53xGhqOhe+fO/bHXnF/620mtb7/d/kQumBLscniv6Etp53j XjWwA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-546-lists,autofs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,autofs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[autofs];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,themaw.net:email]
X-Rspamd-Queue-Id: 6CFE02B4915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The symlink name was previously duplicated using an explicit kmalloc()
followed by strcpy(), which is deprecated [1]. Replace this open-coded
string duplication with kstrdup(), which allocates and copies the
symlink name with a single helper function.

Remove the local variable 'size' and set 'i_size' directly using
strlen(cp), which is equivalent to the previous value of 'size'.

This simplifies the code, uses common string-handling helpers, and
removes the deprecated use of strcpy().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Acked-by: Ian Kent <raven@themaw.net>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/autofs/root.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/autofs/root.c b/fs/autofs/root.c
index 2c31002b314a..186e960f1e23 100644
--- a/fs/autofs/root.c
+++ b/fs/autofs/root.c
@@ -7,6 +7,7 @@
 
 #include <linux/capability.h>
 #include <linux/compat.h>
+#include <linux/string.h>
 
 #include "autofs_i.h"
 
@@ -578,7 +579,6 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
 	struct autofs_info *ino = autofs_dentry_ino(dentry);
 	struct autofs_info *p_ino;
 	struct inode *inode;
-	size_t size = strlen(symname);
 	char *cp;
 
 	pr_debug("%s <- %pd\n", symname, dentry);
@@ -589,19 +589,17 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
 
 	autofs_del_active(dentry);
 
-	cp = kmalloc(size + 1, GFP_KERNEL);
+	cp = kstrdup(symname, GFP_KERNEL);
 	if (!cp)
 		return -ENOMEM;
 
-	strcpy(cp, symname);
-
 	inode = autofs_get_inode(dir->i_sb, S_IFLNK | 0555);
 	if (!inode) {
 		kfree(cp);
 		return -ENOMEM;
 	}
 	inode->i_private = cp;
-	inode->i_size = size;
+	inode->i_size = strlen(cp);
 
 	d_make_persistent(dentry, inode);
 	p_ino = autofs_dentry_ino(dentry->d_parent);

