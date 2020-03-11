Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26395180D08
	for <lists+autofs@lfdr.de>; Wed, 11 Mar 2020 01:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbgCKA40 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 10 Mar 2020 20:56:26 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52739 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726380AbgCKA40 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 10 Mar 2020 20:56:26 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id E5532220CF;
        Tue, 10 Mar 2020 20:56:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 10 Mar 2020 20:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        ztMyEeHWVTh/3NTxXZVvyV6IxRO/cI8WgTC3PhuJ2gk=; b=FACbEUARnftzFRwM
        lum+aH1Lf7yAqbc9FSZ6QLoV59ocAWJGM78I3LLanVBlw4cqsFaZ77y+Y4quEQeM
        6xAJUwb22mz3+gcI3tSBKp6PF+HsOyQOavh0m+FlvMSfEap0Cw1+CN1bBmsxuv6O
        sHrgj0aoxVykvLV6FIoXaWnH4DELK05Vqh+lnyTLVZsAG2ZNHEZig2xKdnYZUGBt
        ukEpCAF+h39k/9oANbYWcEAZHT84unn6lTUIe+kAvuyutBCFYyQhksHsBeUVry7x
        3dlPeGkOn5hsM2yGTeE7+HdMo1ZnFIoDzGq2/42Yj/qu0qRG9NdU2Bz5PPiDe+HG
        2iYsrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=ztMyEeHWVTh/3NTxXZVvyV6IxRO/cI8WgTC3PhuJ2
        gk=; b=ZTwrhATVAf56mHDv854uu4n177bkmcL037FQDY3rZJKtc0tPiv1vOFdtT
        90dxquxMIPbBxW+wC5YFjuhGgXIb/0sA3CSekJsY8+ItWHVmhu0wS6khC76YU1E/
        IIPcQeZIccTQF6Gq40QTbX7ewhT0YqF3wNELtQD8dS8QASx4Fr3+mbmPeGAXs6JC
        0V60Ng69mJGnSOqOy1koedmOLicF9hMdiYPxMhgwydYtM697PIScFiTurGjkg/qE
        fpL7Mvi/fbfgApTunWlaGucBuy2fGE9NbZvDPkyLc1pZAiF1mXnUXQz+cV0rC5k4
        Y7yJZmAeG50II11i+1p/rN1R+ChVA==
X-ME-Sender: <xms:ODdoXqBNZLObNX4Z-9Q5Dx-hye44J6u9DmYeO2SPB2D85BHu0OqUhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddvuddgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtke
    drudekuddrieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:ODdoXozCF3CHQf1WSsqhk7m0G5MeXCqEyiP_dP2BdNkOTuLL7pZU4Q>
    <xmx:ODdoXomKopXfKPWuScxp71Uc_6dexddb-A1rtIO9b6pLBDDNmQU1ew>
    <xmx:ODdoXtEb91FIChrpwNproCklbN8w7SNK2YFgUDdvmM_gwYEZDYmHTQ>
    <xmx:ODdoXl7Y7RjPUkQmjM-FIccBMq2saApRlpNgRY2S4jfpDIsPRp_Yew>
Received: from mickey.themaw.net (unknown [118.208.181.63])
        by mail.messagingengine.com (Postfix) with ESMTPA id 59FC030612AF;
        Tue, 10 Mar 2020 20:56:23 -0400 (EDT)
Message-ID: <abf255f4682a974eac02ce94b7006d9dc0413856.camel@themaw.net>
Subject: Re: [PATCH] samples: fix Makefile targets' directory dependencies
From:   Ian Kent <raven@themaw.net>
To:     Kyle Russell <bkylerussell@gmail.com>, autofs@vger.kernel.org
Date:   Wed, 11 Mar 2020 08:56:19 +0800
In-Reply-To: <20200309155100.21961-1-bkylerussell@gmail.com>
References: <20200309155100.21961-1-bkylerussell@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-03-09 at 11:51 -0400, Kyle Russell wrote:
> Introduce an order-only prerequisite on dirs for targets that
> actually
> use these directories to guarantee they exist at install time;
> otherwise,
> the sample install commands can result in ENOENT in a parallelized
> make
> invocation.

I've added the patch to my patch queue, I'll have closer look at it
as time permits.

Thanks
Ian

