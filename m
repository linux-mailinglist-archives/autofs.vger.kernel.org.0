Return-Path: <autofs+bounces-229-lists+autofs=lfdr.de@vger.kernel.org>
Delivered-To: lists+autofs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOrSGdUWeGkynwEAu9opvQ
	(envelope-from <autofs+bounces-229-lists+autofs=lfdr.de@vger.kernel.org>)
	for <lists+autofs@lfdr.de>; Tue, 27 Jan 2026 02:37:25 +0100
X-Original-To: lists+autofs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E474F8EC31
	for <lists+autofs@lfdr.de>; Tue, 27 Jan 2026 02:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF283014659
	for <lists+autofs@lfdr.de>; Tue, 27 Jan 2026 01:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F065221F1C;
	Tue, 27 Jan 2026 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dUOoVfk7"
X-Original-To: autofs@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB427CB0A
	for <autofs@vger.kernel.org>; Tue, 27 Jan 2026 01:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769477820; cv=none; b=jboOyXrl7ZzWHlIEP5epOdS6AGPWaJsGlwCEavnBnvdCaggRxED+TMF17V05Dj8iRA8V/2WisJq/55nSwB/99+zL7g73j5jIWoyIhEUA/zELVKdZCwLGbp+uh6L8ELaP95En9jmovNX+u38DehXQ4Nry8LqlnxZeJ7wecauMC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769477820; c=relaxed/simple;
	bh=UMJCE6iSW/dRQ3fvl9Ybma+K+XCp1B0WhTqUNL29pAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzzGm3DQDlfKD9x/Gxa3qCCqnAwLA0cPY3JOhpFe/G5lfFQx22RWgk/MD7SGtmTI+xwO9/7WN3X0mbzVArJ4iKJEKNZkD96YYUFbVRjEs9tQBP9TGxq29WIvFiGNCpOkklPudO3zDKVZqjHJuwohleA2bfEP2GDLhrQunEJEl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dUOoVfk7; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769477807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BwlX6c30syMIP8ryRAXS74QIl1BLDPSxh7Npj0XYOak=;
	b=dUOoVfk7LvgUG/N45t7HPDribBF3tav9NSedUzZAwL7eRh/apCX3MlY38MHYH6D7lOHakN
	656Pn48Fw+jR1PeMICDBmzjFzgDlpYRTP0klOKYqUm03jzXtLjyvy9emesP0vV/YR1GyHa
	ri6+fHPO4ML9b4v6FyUSa13uDZZvA+M=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ian Kent <raven@themaw.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	autofs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] autofs: replace manual symlink buffer allocation in autofs_dir_symlink
Date: Tue, 27 Jan 2026 02:36:39 +0100
Message-ID: <20260127013639.433302-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-229-lists,autofs=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,autofs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[autofs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: E474F8EC31
X-Rspamd-Action: no action

The symlink name was previously duplicated using an explicit kmalloc()
followed by strcpy(), which is deprecated [1]. Replace this open-coded
string duplication with kstrdup(), which allocates and copies the
symlink name with a single helper function.

Remove the local variable 'size' and set 'i_size' directly using
strlen(cp), which is equivalent to the previous value of 'size'.

This simplifies the code, uses common string-handling helpers, and
removes the deprecated use of strcpy().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
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
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


