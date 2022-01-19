Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6132E493254
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 02:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350588AbiASB1f (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 20:27:35 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60451 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344934AbiASB1e (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 20:27:34 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 270015C02E7;
        Tue, 18 Jan 2022 20:27:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 18 Jan 2022 20:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        OdOfS9YuHQdrF9ipA5HXdd/JC1LB8DEgKsU5N6LvurU=; b=AJP8e055dGe8AW04
        WKIcaUj8aeUQ6WW6te/1EyD0CO3RPy6SZTGV4G9DqTVX+J+8MsDy1qXqJRpWcHyX
        ElsbVgwFdeu6djtza7GAhUx4GAcO6Og4x/G9JSgA/kBdDCxG+8+wCSNDvm5ppwbL
        AVE3ncP9WfMpV9cFY318Vo+wHfMVFKaUbhMjYMOe0CK/0urdCEOZPisaECYubfFJ
        3ERZe1o6Nj/O/DdKytGVDt2NQENKIO4/bqDGNM95oA2kV6CHCG4j0gkqcXTQXf0l
        bzx+HRY1cCSNcjOizuoeZ/SXI/ExQbx6eDtH1B6dR2lN1t97avh+CWHvIkloVUNp
        VvrNag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=OdOfS9YuHQdrF9ipA5HXdd/JC1LB8DEgKsU5N6Lvu
        rU=; b=UpIbcinHD47LMVCesq8pB7AA4PAIxpPdV0Rw4bkZibKSyUlayXW2/oQPn
        MHdjJWHReHDHcNKTUeJQLDAZ/3O7PFUJfS0ThZSS+vMULitG1JByga65uFThXoLY
        DwTPL1V7XgGL9BYcJOr2o9Nd/zfgWXVPwXO4zc8MvAocySDkkp/qCveN3byxv60D
        QVdOqGRL26uHAYDHZK2T5VNGfMBeJNUCj0DEfL29tlqFw2Vn9AKgzBXIBaj1yKk0
        fvUh+7iMQOafgypTSk6BJSdGldmdwyrIybbh1ripbD6r09ee8N9qEzAJaHcceWBG
        CuUu1SKscslAesuNZGTSXEPu8Xkiw==
X-ME-Sender: <xms:BmnnYaLlTDfpZ-jcE-Ppiqsf1vzwHHuJIoIZUxzOJisa3j_vzhXdTw>
    <xme:BmnnYSJuWxdzrsci8qGti4X0Y2bftGSj06wXz3j5BpASz0gliz_PQtXD_yCk_Vqci
    236bl2UQhKg>
X-ME-Received: <xmr:BmnnYavImBF4hQ7E2fERXDCdmN5HIrM1GVuhZRuaaqt9Ia7e8uQl_PzZMrZeGtjpgL4v5_raqcgs9UgTYN-bNi1czNEpk3zMYzxwYx4_-ebk5xrhcbpQ-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
    dttderudenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpeffteefteeifeevvdfgffeiffejfeegkeekhfdtge
    dufeeukefgieekffekgeeufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:BmnnYfZ-3k7tL8CqFWgcX2QhfUjU31bOksZHSpK7Guoy3nGkW1JUog>
    <xmx:BmnnYRbX2BVel8p_qFtZEActz3aZUbrvPM8npP0mwZbqK7fwWrSC1Q>
    <xmx:BmnnYbD0v_uvi6pxhQ573NLMzgioVDMsqrsn7tWw8zh41DpfQ1cfMw>
    <xmx:BmnnYSAwWIenLWxIhuyFmnbP7-QL0ijAGI0VART8d_S6X5AC8tx7cQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jan 2022 20:27:32 -0500 (EST)
Message-ID: <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Fabian Groffen <grobian@gentoo.org>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Date:   Wed, 19 Jan 2022 09:27:26 +0800
In-Reply-To: <YeaWIKm/9szaWHIA@gentoo.org>
References: <YeZ51EWg85akR6Ig@ofant>
         <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
         <YeaBtjNlovM5gez4@ofant>
         <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
         <YeaWIKm/9szaWHIA@gentoo.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2022-01-18 at 11:27 +0100, Fabian Groffen wrote:
> On 18-01-2022 18:24:11 +0800, Ian Kent wrote:
> > A debug log is almost always what I ask for.
> > 
> > Setting "logging = debug" in /etc/autofs.conf will do it.
> > You need to get a log from start of automount to after the problem
> > occurs.
> 
> Let me try this and come back to you.

You might need to take some care doing this.

If your using systemd then a simple "journalctl | grep automount"
usually gets what we need.

But if your relying on syslog often the log level setting won't
record debug logging so it needs to be changed. Otherwise we don't
get a full log.

Ian

