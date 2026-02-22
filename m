Return-Path: <autofs+bounces-231-lists+autofs=lfdr.de@vger.kernel.org>
Delivered-To: lists+autofs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C4kLYZzm2kizwMAu9opvQ
	(envelope-from <autofs+bounces-231-lists+autofs=lfdr.de@vger.kernel.org>)
	for <lists+autofs@lfdr.de>; Sun, 22 Feb 2026 22:22:14 +0100
X-Original-To: lists+autofs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E404170689
	for <lists+autofs@lfdr.de>; Sun, 22 Feb 2026 22:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA9EC3006B57
	for <lists+autofs@lfdr.de>; Sun, 22 Feb 2026 21:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12641B983F;
	Sun, 22 Feb 2026 21:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SQOcAM6T"
X-Original-To: autofs@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4BF1A2C04
	for <autofs@vger.kernel.org>; Sun, 22 Feb 2026 21:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771795332; cv=none; b=nnAD5jyEcmDmWb07cH3Dr6+tigDdEoLPJw5rGsCRm0aebut09hJ4xb2GQou+P4s4LOKX+k1rWqG97n3NK1RMtZJ2JhAprTGY2kyZ+vug7cc2JsZtTzQ81PCyGriOodzHTbMpOZlesL9jPhWnkLZuf1yLE4Nib2Zg9FanlqKobws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771795332; c=relaxed/simple;
	bh=5AjNnwv6JgftztwD+UfHFm1F19G5RTGLl61SgoBEr0I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fVWavlRBIHFAfQTknTmOagPx93qy7X+bHoSelBtmfNV7Yy2eapJP1MWrPVKVuVUCYRJUeepPWclkS+PCAFXIHeX0GNqxQzIhw8N7YFodDatzKr/9aurmDY/PCoLY5XwkM+wzwZMMrZprJrleqpZztlo+RzOSNmIyg6+IrH7Ualk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SQOcAM6T; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771795328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1VMmlfM/yqpVE8XtgrCgqPWCKU8Fcqlc9rHbF4ULYw=;
	b=SQOcAM6TcFcCtLGA2Wuho23hy9K2kvZoUvc0TNrCCJx0vSPfa72iFAs62hP8fOVGIA+Qcf
	w6E7JmbNGsi7fOgVpSJEsP5hZsV8XgoLYt9nSRhn6OK+ejrC78fB1kHNsUhqpXPwHfOt2n
	KsmDsBOo4YVR9Dn4hUteq/LGHUJVpzk=
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH RESEND] autofs: replace manual symlink buffer allocation
 in autofs_dir_symlink
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <6b4c95df-1005-4f8d-a350-c4bf3769228c@themaw.net>
Date: Sun, 22 Feb 2026 22:22:01 +0100
Cc: autofs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F120295-FC54-49A8-8B92-870EAEB0A319@linux.dev>
References: <20260127013639.433302-1-thorsten.blum@linux.dev>
 <6b4c95df-1005-4f8d-a350-c4bf3769228c@themaw.net>
To: Ian Kent <raven@themaw.net>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-231-lists,autofs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,autofs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[autofs];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E404170689
X-Rspamd-Action: no action

On 27. Jan 2026, at 03:14, Ian Kent wrote:
> On 27/1/26 09:36, Thorsten Blum wrote:
>> The symlink name was previously duplicated using an explicit =
kmalloc()
>> followed by strcpy(), which is deprecated [1]. Replace this =
open-coded
>> string duplication with kstrdup(), which allocates and copies the
>> symlink name with a single helper function.
>>=20
>> Remove the local variable 'size' and set 'i_size' directly using
>> strlen(cp), which is equivalent to the previous value of 'size'.
>>=20
>> This simplifies the code, uses common string-handling helpers, and
>> removes the deprecated use of strcpy().
>>=20
>> Link: =
https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy =
[1]
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>>  fs/autofs/root.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>=20
>> [...]
>=20
> Looks fine to me.
>=20
> Acked by: Ian Kent <raven@themaw.net>

Your tag is missing a hyphen and tools like b4 don't recognize it like
this. Correct would be:

	Acked-by: Ian Kent <raven@themaw.net>

> Christian, is there anything else I need to do for this?

Thanks,
Thorsten


