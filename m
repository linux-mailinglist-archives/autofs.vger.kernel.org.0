Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A1189527
	for <lists+autofs@lfdr.de>; Mon, 12 Aug 2019 03:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfHLBVZ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 11 Aug 2019 21:21:25 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43707 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725870AbfHLBVZ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 11 Aug 2019 21:21:25 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 2066320BA1;
        Sun, 11 Aug 2019 21:21:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 11 Aug 2019 21:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        nD9GX+or8UWSME75PkrblEt/LSLzEC4djtTJHFxGPBw=; b=SWRWL3kvjX8Dgc5y
        UFnDBQnnU52zpRVfuHch0kTHDXGh7fA1gBFUn9IwZP3D2vYL3cwbc8+yuKIfs5Q8
        UkejxEKZNPo8Vbihbfu0O+Isn/Qw5HOUnu/+nnuGCU3yAkts3Hg6D+hNLwr7st2Y
        Cs52aff/PTiVf+UJ4bae1wJ/zReP2QrX9JcVyFlOBDGACKTOlGzkw+wjRyI5gbZW
        7CUGHE3Kt95COxJgWWRm212RzjZxVRAe7ty4k8l13U6bwNWUINFaXTe6Yzc2sTYN
        w4g7eI2lG30pmOuYJ9SOw4RLH3ZFBbQPaBdT85i5Efcei1o/a1A/LovEld178b5e
        u2TcUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=nD9GX+or8UWSME75PkrblEt/LSLzEC4djtTJHFxGP
        Bw=; b=0/Q7uh7aw6acZh9nT3CJsbRVeKVJX01rHZrrLzvlQ/w8rommqVBNbqPw0
        AEJCeo6i9EYwNVqciaQQmlRn6xMPk0plMXkKXbBW+O6N0U8c68gYYQnkOWQyQV5H
        KYGQxnAoM/+uAo0QF0ApdNZXYLcRZ4mrP37ZTZ+io9iWn6/eFwzoZQyt5nw4YELU
        tWy7HfCxg+wFD7ULW93u/OjRhP7h0ABXfbeJvmGkFPCLzyUZTPbzJzPm6UkbtjZW
        BHCiQHx3Kc/CIpO4rKFhjLnabyiuOaiABTAvyTDdIO0Jh3BZesv4h9Qv8+8rQ4k+
        IBeZa90k4pKya8nJV1dhKBZeAir0w==
X-ME-Sender: <xms:E79QXUQmS8g_kWXnIBfU0QztGHQfl0IKlyzjTCwS3YK1X1ZDR-kCAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvfedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtke
    drudejkedrudejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgr
    fidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:E79QXVBbctidVS67rH26VFFTaNsKR1AwDM5zNv3Ukv6yvIIQPUWNFw>
    <xmx:E79QXZWdnfjM6aCfx_KTJIftu8AxoEFPy49hZIsF2nJR4LhevWgQ0g>
    <xmx:E79QXVoJIfReGgB8YJCcEhAqKfWHaEu0vFold3M65jRaCgk29n-npg>
    <xmx:FL9QXX1kz7ZJ4xBTMkK47hCwi5wkRPtqnfqvvjurtOSuv8cuFTxZPg>
Received: from donald.themaw.net (unknown [118.208.178.17])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1DB8C380084;
        Sun, 11 Aug 2019 21:21:21 -0400 (EDT)
Message-ID: <6d6e904c52d75e6d7153fc42d90024bde56b04a5.camel@themaw.net>
Subject: Re: [PATCH] Do not lockup the kernel in case of deadlock
From:   Ian Kent <raven@themaw.net>
To:     Goldwyn Rodrigues <rgoldwyn@suse.com>, autofs@vger.kernel.org
Date:   Mon, 12 Aug 2019 09:21:18 +0800
In-Reply-To: <20190809233139.qurn5zciauyhjozl@fiona>
References: <20190809233139.qurn5zciauyhjozl@fiona>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2019-08-09 at 18:31 -0500, Goldwyn Rodrigues wrote:
> We should not deadlock the kernel, or wait infinitely in case the
> user users incorrect mount options. One example is when
> indirect mount and mount offsets are bind mounts which are not
> private, and automount waits to complete a mount propagation.
> Use the expire timeout as the limit to wait for automount
> to complete, or return -EWOULDBLOCK/-EAGAIN.

I like the idea of using a timeout.

But I'm wondering if there could be adverse side effects.
Can you talk a little about cases that lead to this please.

One purpose of this blocking is to prevent path walkers from
walking into an under construction mount point directory. I
guess this will end up returning an error to user space so
it won't allow this to happen ... and if the user space caller
ignores the error return and continues ... the app could get
very sick, very quick ...

At least when a process blocks on this it's a clear sign of
some other problem that really needs to be fixed and crash
dumps allow inspecting the blocked processes to work out
(hopefully, but not always) where it started.

Hence a little more discussion about expected behaviour is in
order even if it's decided to accept a bit less information
in order to prevent processes from blocking for a "long" time.

> 
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
> index b04c528b19d3..da1f01a73ffb 100644
> --- a/fs/autofs/waitq.c
> +++ b/fs/autofs/waitq.c
> @@ -476,8 +476,11 @@ int autofs_wait(struct autofs_sb_info *sbi,
>  	 * wq->name.name is NULL iff the lock is already released
>  	 * or the mount has been made catatonic.
>  	 */
> -	wait_event_killable(wq->queue, wq->name.name == NULL);
> -	status = wq->status;
> +	status = wait_event_killable_timeout(wq->queue, wq->name.name
> == NULL, sbi->exp_timeout);
> +	if (status > 0)
> +		status = wq->status;
> +	else if (status == 0)
> +		status = -EAGAIN;
>  
>  	/*
>  	 * For direct and offset mounts we need to track the
> requester's
> 

