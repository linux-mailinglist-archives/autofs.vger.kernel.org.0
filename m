Return-Path: <autofs+bounces-558-lists+autofs=lfdr.de@vger.kernel.org>
Delivered-To: lists+autofs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ytemBErIVWoItAAAu9opvQ
	(envelope-from <autofs+bounces-558-lists+autofs=lfdr.de@vger.kernel.org>)
	for <lists+autofs@lfdr.de>; Tue, 14 Jul 2026 07:25:30 +0200
X-Original-To: lists+autofs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D387511CD
	for <lists+autofs@lfdr.de>; Tue, 14 Jul 2026 07:25:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=suksangroup.co.th header.s=default header.b=bJZlIUNw;
	spf=pass (mail.lfdr.de: domain of "autofs+bounces-558-lists+autofs=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="autofs+bounces-558-lists+autofs=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=inbox.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB06E304892F
	for <lists+autofs@lfdr.de>; Tue, 14 Jul 2026 05:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BAB1AC45D;
	Tue, 14 Jul 2026 05:15:22 +0000 (UTC)
X-Original-To: autofs@vger.kernel.org
Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406830AAB8
	for <autofs@vger.kernel.org>; Tue, 14 Jul 2026 05:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006122; cv=none; b=ZdEr2qpDESwPYSzwTyXj8Yc7ahtx9CZ4/j2RTFO/db140I5mWXYjKToco0RMACiKfzI0Qt3UkjCB+mjx3B9jGrlNBWNJv2x4YKTCVeqgkXNj++iWoHpi2dZPmE5f9eIqCbBNeNJ88sXD2nntrdq2ZUBSQq8iAFs2RfMdkdt5mcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006122; c=relaxed/simple;
	bh=5OJcpnIFmBEUHpJSFfOi2cIqrhpjDJBmioY4TC1OVsY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o8QC74cSiExeEomikX8w0yIP1KrDqvvp1JtWToBD0YgKVTjoWZU5pmRPCTp+uCa1GYQqKtVTuNMf8vHVSGhqr+sITzjAjSBwExIgNj/gytGQV7ZAkz9GOYSTBYT8tX3p5muL+RCI84SSQPDT+Q59ley2DHtWWHOpUqkvL78i1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=bJZlIUNw; arc=none smtp.client-ip=103.13.31.55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5OJcpnIFmBEUHpJSFfOi2cIqrhpjDJBmioY4TC1OVsY=; b=bJZlIUNwL8Egc8o1jj6Jm+dhJd
	3mDR4EWFJjB9RgzdCnnBlj6tmeb1sWgVe8Sx0lmuq0CKe+FKhFFvfuPBfYFgGqnCfNIw8PBB7FXrn
	1o9zW2d+smxEtp6QULAs5dIdG186fuUDxCkPJmq44gFWThauVvYSMTEWqUeoilCQzhmBS981GXvR6
	6mR2A7AxIEMpgAmLgDfuO+6rj95MTRf0hPob1ham99S4VtixwaW8xUXDLX7ThHBEwC4qKX+manbhG
	jhk2Xg5tKrQphUhtwKsxjozEIRisw1y5WBwL/rAECAh8l0hPTMQvdxcAMgkSdNQqhekukiOe01zL9
	cSSA9rGg==;
Received: from [207.189.26.187] (port=60603)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVUE-0000000FqqX-1iP6
	for autofs@vger.kernel.org;
	Tue, 14 Jul 2026 12:15:17 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: autofs@vger.kernel.org
Subject: Dear autofs@vger.kernel.org, 
Date: 14 Jul 2026 00:15:14 -0500
Message-ID: <20260714001514.9694875E7E705CEA@inbox.org>
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.44 / 15.00];
	ABUSE_SURBL(5.00)[lexcapitalgrowth.com:replyto];
	R_DKIM_REJECT(1.00)[suksangroup.co.th:s=default];
	SUBJECT_ENDS_SPACES(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[inbox.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:autofs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-558-lists,autofs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_AS(0.00)[smtp@suksangroup.co.th];
	GREYLIST(0.00)[pass,body];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_GMSV(0.00)[smtp@suksangroup.co.th];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[info@inbox.org,autofs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suksangroup.co.th:-];
	HAS_REPLYTO(0.00)[hanns.schofield@lexcapitalgrowth.com];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@inbox.org,autofs@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[autofs];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lexcapitalgrowth.com:replyto,inbox.org:from_mime,inbox.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56D387511CD
X-Spam: Yes


Re:Good day autofs,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA



