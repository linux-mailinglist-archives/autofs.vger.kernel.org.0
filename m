Return-Path: <autofs+bounces-551-lists+autofs=lfdr.de@vger.kernel.org>
Delivered-To: lists+autofs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMKzFNC4AWoZjAEAu9opvQ
	(envelope-from <autofs+bounces-551-lists+autofs=lfdr.de@vger.kernel.org>)
	for <lists+autofs@lfdr.de>; Mon, 11 May 2026 13:09:04 +0200
X-Original-To: lists+autofs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A354350C7F2
	for <lists+autofs@lfdr.de>; Mon, 11 May 2026 13:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 723E53004F56
	for <lists+autofs@lfdr.de>; Mon, 11 May 2026 11:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C39363C72;
	Mon, 11 May 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0gbYo+Zh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AQ4Imxdf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0gbYo+Zh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AQ4Imxdf"
X-Original-To: autofs@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B2831F9BE
	for <autofs@vger.kernel.org>; Mon, 11 May 2026 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497593; cv=none; b=nm4GlkC7r/O3tZF/Gz3KU7aowo5vCIJyuf5vtv0HVdkP62bbTGvOWRjso5APTAVBfp5a4WJYi81vNO9WYhw0le0jyMh3rXnYIrI5LlIldwYPFsSU+fbCXHQV8AqLW6qTLtytWX+zuNN9p2mK8ngAC0J0JY7C16/tYwbQmipO0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497593; c=relaxed/simple;
	bh=CChw2HGyKeVPA8HlefjSa/VWWhs7XISlz+UQqonMj4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4/32eOcRZLe+ZoVreweGzBYj+CmD2fKAD/v6vpE9xUY/obZDKArbGk0o5Ev4OSax4iaRlTkEJTvjtQ9r17AwyRYtwxdKK1MKbuiJ5yYmBRezSirCgrc2fmEJTV2UOpXeMEyhgU2vVmELZAbfh2lstccjjXmieHbLtDg9zdfJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0gbYo+Zh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AQ4Imxdf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0gbYo+Zh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AQ4Imxdf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 872656818B;
	Mon, 11 May 2026 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778497590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xGH9QWwk2qQDa2QQP3RuKmXZ3f8H50B+kc+dDWynGj4=;
	b=0gbYo+ZhBYUzyWBgZati9X5H7ckvHxmPbgVqTu9tGx9SqAcMyN1bjqYXlIrJZTKLdPXEUk
	gQnLc/swXqn16PqMr+e9WJ0iHD1PyJtyQmBv7h1y7Q/nVQAUlMwVzp4A4w0hrKf2ukw4Fq
	wVjyClFYmRNVvv6c0YOHRkPC9KbZPbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778497590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xGH9QWwk2qQDa2QQP3RuKmXZ3f8H50B+kc+dDWynGj4=;
	b=AQ4ImxdflF/yuiZnXVxyctsNSLA+1duI/elcF+IFw71clJg2RmVuUWZiZn8VKpBnLqOjIv
	NH2k341MH1lWFTBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0gbYo+Zh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AQ4Imxdf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778497590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xGH9QWwk2qQDa2QQP3RuKmXZ3f8H50B+kc+dDWynGj4=;
	b=0gbYo+ZhBYUzyWBgZati9X5H7ckvHxmPbgVqTu9tGx9SqAcMyN1bjqYXlIrJZTKLdPXEUk
	gQnLc/swXqn16PqMr+e9WJ0iHD1PyJtyQmBv7h1y7Q/nVQAUlMwVzp4A4w0hrKf2ukw4Fq
	wVjyClFYmRNVvv6c0YOHRkPC9KbZPbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778497590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xGH9QWwk2qQDa2QQP3RuKmXZ3f8H50B+kc+dDWynGj4=;
	b=AQ4ImxdflF/yuiZnXVxyctsNSLA+1duI/elcF+IFw71clJg2RmVuUWZiZn8VKpBnLqOjIv
	NH2k341MH1lWFTBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0A6E593A3;
	Mon, 11 May 2026 11:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VFXAKDS4AWpsEwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Mon, 11 May 2026 11:06:28 +0000
From: David Disseldorp <ddiss@suse.de>
To: autofs@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>,
	David Disseldorp <ddiss@suse.de>
Subject: [PATCH] Avoid year-2038-problem
Date: Mon, 11 May 2026 21:05:41 +1000
Message-ID: <20260511110541.27522-1-ddiss@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: A354350C7F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-551-lists,autofs=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ddiss@suse.de,autofs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[autofs];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>

This patch was done while reviewing potential year-2038 issues in openSUSE.

Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
Reviewed-by: David Disseldorp <ddiss@suse.de>
---
 daemon/state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/daemon/state.c b/daemon/state.c
index 317b8ca9..e16c0703 100644
--- a/daemon/state.c
+++ b/daemon/state.c
@@ -514,7 +514,7 @@ static unsigned int st_readmap(struct autofs_point *ap)
 	pthread_t thid;
 	struct readmap_args *ra;
 	int status;
-	int now = monotonic_time(NULL);
+	time_t now = monotonic_time(NULL);
 
 	debug(ap->logopt, "state %d path %s", ap->state, ap->path);
 
-- 
2.51.0


