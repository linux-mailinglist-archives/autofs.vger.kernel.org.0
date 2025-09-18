Return-Path: <autofs+bounces-155-lists+autofs=lfdr.de@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56214B2BBAB
	for <lists+autofs@lfdr.de>; Tue, 19 Aug 2025 10:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF4AB5270C3
	for <lists+autofs@lfdr.de>; Tue, 19 Aug 2025 08:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345F126D4E9;
	Tue, 19 Aug 2025 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFwQGaOl"
X-Original-To: autofs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A41DF75B;
	Tue, 19 Aug 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591699; cv=none; b=Juwa41U2MqOtbe6vcyRZa7bm80Ngnjcfg40Cb06S730OjSK5jAi9bif8kxun5dREoUlGMTkjjT60yfrG8ia3WAZXWMXMXeTdnfnwL+GnT11gJssK9k5AFJQxg/tYuTLgaiXMdt03IkbrMR96gscjw0uo+yaalzeKpiyj+tHEtI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591699; c=relaxed/simple;
	bh=1AqYxFw9YNhOVd5rohljfcXYRqZ5rqJ/niJ0Cw6cvLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/r/MScyTe6XHDS5CoTxOx4YX+lAG//uC5tgQL90ZK0BuHbjTxUWnRpsyQezi7gYfQvhZSYKCfP2Lqvh3JtHeyVa+g4R6aU7VmLDaaogUqYTWyKhbZSgSzhKzsC0znEw7QKUSu4mO5Ia4DMzB2/zgD6RXzfAFR5sdG76Xoc3+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFwQGaOl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4270C4CEF1;
	Tue, 19 Aug 2025 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755591698;
	bh=1AqYxFw9YNhOVd5rohljfcXYRqZ5rqJ/niJ0Cw6cvLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFwQGaOl7DICDDZHktsb4boMX8GP5uC9XXr7IcgcMCGnq8oADQf2ZdFYgAqNNZdsh
	 fc9MsqBwKB4dvgXK5zPPxCGg/R593mhKfWpZYnJcYckZ2MXQQsz3Av8sntxAp3XZQ3
	 48SQyI3GlCJ4Da8bZ/kAgzG0Sma4+RN6jKzV9hjI0DJOSVW8DSiPId/dTyj7clynr7
	 vpyTUXUTaHf0VlrXP7QDVu8uovVZOAM+vaZ+Q8poK8vFWyJ8YwSj7gw6pgdBxN9msx
	 NZntt9fVrVVYMJAkcFvGzEMYInt7JA3tOeUHIjAoInz5ugahec2v49rOPSPL3Be6LY
	 3AKLtejYc2uiQ==
Date: Tue, 19 Aug 2025 10:21:33 +0200
From: Christian Brauner <brauner@kernel.org>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Askar Safin <safinaskar@zohomail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Ian Kent <raven@themaw.net>, 
	linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	autofs mailing list <autofs@vger.kernel.org>, patches@lists.linux.dev
Subject: Re: [PATCH 0/4] vfs: if RESOLVE_NO_XDEV passed to openat2, don't
 *trigger* automounts
Message-ID: <20250819-direkt-unsympathisch-27ffa5cefb4e@brauner>
References: <20250817171513.259291-1-safinaskar@zohomail.com>
 <2025-08-18.1755494302-front-sloped-tweet-dancers-cO03JX@cyphar.com>
Precedence: bulk
X-Mailing-List: autofs@vger.kernel.org
List-Id: <autofs.vger.kernel.org>
List-Subscribe: <mailto:autofs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:autofs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025-08-18.1755494302-front-sloped-tweet-dancers-cO03JX@cyphar.com>

On Mon, Aug 18, 2025 at 03:31:27PM +1000, Aleksa Sarai wrote:
> On 2025-08-17, Askar Safin <safinaskar@zohomail.com> wrote:
> > openat2 had a bug: if we pass RESOLVE_NO_XDEV, then openat2
> > doesn't traverse through automounts, but may still trigger them.
> > See this link for full bug report with reproducer:
> > https://lore.kernel.org/linux-fsdevel/20250817075252.4137628-1-safinaskar@zohomail.com/
> > 
> > This patchset fixes the bug.
> > 
> > RESOLVE_NO_XDEV logic hopefully becomes more clear:
> > now we immediately fail when we cross mountpoints.
> > 
> > I think this patchset should get to -fixes and stable trees.
> 
> You need to add
> 
>   Cc: <stable@vger.kernel.org> # v5.2+
> 
> (along with a Fixes: ... tag) for each commit you would like to be
> backported.
> 
> > I split everything to very small commits to make
> > everything as bisectable as possible.
> 
> I would merge the first three patches -- adding and removing code like

Agreed.

