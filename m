Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0851F16E8
	for <lists+autofs@lfdr.de>; Mon,  8 Jun 2020 12:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgFHKpY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 8 Jun 2020 06:45:24 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49319 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729307AbgFHKpX (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 8 Jun 2020 06:45:23 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 1AA8C5C010E;
        Mon,  8 Jun 2020 06:45:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 08 Jun 2020 06:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        ene6U5ZwgvY3qXtnkZKiRxbdzRKRJ/MDnE9RRZkmPiE=; b=nHpMhG7R+ODhlzvS
        jMLConWgW8M4d8P6L8vK8rt78lUvtAr/U8DsU5OIvSjtOCPIMBJcRZPONfXEDf16
        BfTErgPPyGx5KpPB7yrk9+I+5BIQ7qIpLCtgmaWS2Hyy87hRC6cxWdkifjxYylG6
        GIdY2rjmYRm5oKTw6/HfWvqm27TRGXkEPvjINN0afsqDUGn6NLMlFx5ycyMPthAg
        FH86QCBFpTSkCq3kTKHg6jFgo60kCjtW20DxgbjoMpSCXVhKtfRTSqKtkO+bCL0r
        H6s6KJeVE3QKWjHEc9X5eKovb8CGGoUM9RPf0pVeszRmaWBtCGJ+BNRltxmfHUjn
        iPC74g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ene6U5ZwgvY3qXtnkZKiRxbdzRKRJ/MDnE9RRZkmP
        iE=; b=TSUKgRfkAMi3uU6cQgtOcwifGpvuIf8L30DCaVwfJxSNAD+dkpjWBP/uU
        JSbjOh3j0P02yhC5KfacAjMF5nA0/usjAW6VOclvlkGrkwlNg48lR0QGVloF6Rcq
        5NP0cVr+RTTw9JV/Uak28z0r7P5KE+RV9L2AdtaLQPo94PiSdqGFd/GbtPhkYqbI
        V+XaF4dVGYwKd1ARmH6cz4dTzfxUnr4EILaNFudksLGlH93xsmn/qaX14kh+Q2qe
        jJkq5AskjBPfS0iqMqMhrB/enelNBCW8I7c/Lpuf3oMM+BEtceQoRbFmBRRxMc/p
        IkdBR9YU+qbMlsC+yAcubcbQK+VKA==
X-ME-Sender: <xms:wRbeXuIWs382-PzFq1zZaUpojawfUKRiS2OznCGem5beq7zdQ3CDWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehuddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucfk
    phepheekrdejrddvvddtrdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:wRbeXmLmHaLsnXgZrJo-6xl5YRuEEI2qBLFscRLAeRw0OBlN4nguVw>
    <xmx:wRbeXut7bzlRL0y8Gh22z9f5tIkGNvjR85UBigvMvDSZaI3dYQGH4g>
    <xmx:wRbeXjZRVOnWGV_9gr2CERqC21zL-TrNCJXQc5yyYpTb0QIU1OSXWw>
    <xmx:whbeXloZMeMaDnsHOkpuYYdCoCo1a0T0j5Q-cCXhKTfeU5gmENScAQ>
Received: from mickey.themaw.net (58-7-220-47.dyn.iinet.net.au [58.7.220.47])
        by mail.messagingengine.com (Postfix) with ESMTPA id AC5423060FE7;
        Mon,  8 Jun 2020 06:45:20 -0400 (EDT)
Message-ID: <d0d07250855eb778231bbdae98105d45dda8f7e7.camel@themaw.net>
Subject: Re: [PATCH] autofs: add pid/comm to debug on autofs_notify_daemon
From:   Ian Kent <raven@themaw.net>
To:     Roberto Bergantinos Corpas <rbergant@redhat.com>
Cc:     autofs@vger.kernel.org
Date:   Mon, 08 Jun 2020 18:45:16 +0800
In-Reply-To: <20200608101038.20426-1-rbergant@redhat.com>
References: <20200608101038.20426-1-rbergant@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-06-08 at 12:10 +0200, Roberto Bergantinos Corpas wrote:
>   This can be useful for troubleshooting purposes and this
> information
>   is not directly avalaible to userland
> 
> Signed-off-by: Roberto Bergantinos Corpas <rbergant@redhat.com>
> ---
>  fs/autofs/waitq.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
> index b04c528b19d3..1a151a3b7d8b 100644
> --- a/fs/autofs/waitq.c
> +++ b/fs/autofs/waitq.c
> @@ -88,9 +88,10 @@ static void autofs_notify_daemon(struct
> autofs_sb_info *sbi,
>  	size_t pktsz;
>  	int ret;
>  
> -	pr_debug("wait id = 0x%08lx, name = %.*s, type=%d\n",
> +	pr_debug("wait id = 0x%08lx, name = %.*s, type=%d, requested by
> (%d/%s)\n",
>  		 (unsigned long) wq->wait_queue_token,
> -		 wq->name.len, wq->name.name, type);
> +		 wq->name.len, wq->name.name, type,
> +		 wq->pid, current->comm);

That wq->pid is a bit of a problem.

It could be a pid in a different pid name space.

It's a problem for the daemon too since it will log the pid from the
request packet it gets. The pid value used in the request packet is
already wrong if the request came from a container, not sure what
to do about that.

What will current->comm contain, just the process name or full path?
That would be useful and the daemon doesn't get this from the request.

Ian

