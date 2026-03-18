Return-Path: <autofs+bounces-548-lists+autofs=lfdr.de@vger.kernel.org>
Delivered-To: lists+autofs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIJXIKx3ummTWwIAu9opvQ
	(envelope-from <autofs+bounces-548-lists+autofs=lfdr.de@vger.kernel.org>)
	for <lists+autofs@lfdr.de>; Wed, 18 Mar 2026 11:00:12 +0100
X-Original-To: lists+autofs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FA2B9935
	for <lists+autofs@lfdr.de>; Wed, 18 Mar 2026 11:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C82C2304A5AF
	for <lists+autofs@lfdr.de>; Wed, 18 Mar 2026 09:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3109A3B2FFF;
	Wed, 18 Mar 2026 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcQc+/fu"
X-Original-To: autofs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E883AA19B;
	Wed, 18 Mar 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827798; cv=none; b=kVDnY6heei9/aisML3zQnqo0j+IsY5Ry5VY/bxovQU0cib2lkbsrVIIqu6QsHH0euXMy9Bk/cJEJZQ+5yh0enHqtMzb0GT+MIY70NEWm1vffRYV/4BLwDa/8q34NcQ3w0NOvSTHqf4VBouT22C6aUqBACnNJH0k4svab1NtyyQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827798; c=relaxed/simple;
	bh=CdLczPEFM3Wpj6bmfu23yvO0+cuVpywGkdjwwIJtxcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyepfsXO1Mj77KpMRtikkN8qGs6osyj0+3u6x+dHnQMK4YaLtuvRr2Bas3Eo4SrHaszWSTf+G+4Cnyg+qNRKoJh+2VCuwjCbKNR7qYED3+sNW97ICDtjwdhk5l4eciDTHzHJ8watQtkoyq2g2vZPDpIqvRdnvo7lzXZLIqXKYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcQc+/fu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5E7C19421;
	Wed, 18 Mar 2026 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773827798;
	bh=CdLczPEFM3Wpj6bmfu23yvO0+cuVpywGkdjwwIJtxcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcQc+/fulpM99YfPuxikXu5CDc4ryCXmThY9T6E7DefJNvTKyo5nv6RE9XrZcXE/d
	 dZ1XTgNAWLxwPwNyDR8gvX4C5Sls/MiwDu1l4Smxja9pt9vaMfkbxxkliF7NQ8EXO/
	 wzINX5zr7vIH71zTyvYUzrLx65EQFdo43ehHQVP9BVbaHJ23o8qBcKD4v1ZduvAAcy
	 gSN3Fqaqxm8mSWuvvSkseyU7WH4tiKKqPEbLae1doNc2DnSApkv92aCAOrGkFIqoUj
	 Q5cYU05zQwQab1J+n59OkcK1KKQF9ZURGUAtgEl8IkJJak1DgWlphXw92xzesMXlxw
	 gNSMai+mttNyA==
Date: Wed, 18 Mar 2026 10:56:34 +0100
From: Christian Brauner <brauner@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ian Kent <raven@themaw.net>, autofs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] autofs: replace manual symlink buffer allocation
 in autofs_dir_symlink
Message-ID: <20260318-abheben-outen-81fc6549c319@brauner>
References: <20260318001219.2354-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318001219.2354-3-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-548-lists,autofs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,autofs@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[autofs];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,themaw.net:email]
X-Rspamd-Queue-Id: E73FA2B9935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 01:12:21AM +0100, Thorsten Blum wrote:
> The symlink name was previously duplicated using an explicit kmalloc()
> followed by strcpy(), which is deprecated [1]. Replace this open-coded
> string duplication with kstrdup(), which allocates and copies the
> symlink name with a single helper function.
> 
> Remove the local variable 'size' and set 'i_size' directly using
> strlen(cp), which is equivalent to the previous value of 'size'.
> 
> This simplifies the code, uses common string-handling helpers, and
> removes the deprecated use of strcpy().
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Acked-by: Ian Kent <raven@themaw.net>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Ideally always Cc fsdevel. This way the tooling sees it right away.

