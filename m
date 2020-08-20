Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C2124AE2E
	for <lists+autofs@lfdr.de>; Thu, 20 Aug 2020 07:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgHTFCC (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Aug 2020 01:02:02 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38451 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgHTFCC (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Aug 2020 01:02:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id DF8465C0138;
        Thu, 20 Aug 2020 01:02:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 20 Aug 2020 01:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        KbH55fn8s5Tw0HqsIqv22Aay3hkvZqxhFaXye+Y3Pwk=; b=R6Vei19T+5/jxYaL
        s/thGABC+icSO4e3UOYmRVFWNFAyIgXXX5nK69FypJA0j6j1uRDNG3FPVSRAF4kG
        GPvciIYs2hrrtIPcsnzcoIPlt6V8GZN174klIy48jI0L77hQD2/9lJxngfz3rNS/
        wXU7I5g+15z8ejcn57AU8W0+cLFCUsdc55w0QHDQBkgUWB+2fhRfJYYq1kEe26jq
        xu+gQhTSU+pjKRzpFh/7CGAsCSFDZlw3uaOLpYQTkXdJuEvl+jWNP8lM4OnaHVed
        3Q8X+IGB0vCUKyD7zRmD6fPvBL4RuUB+68EzDwJaHqPyOWe9UelD1skAJj134u+5
        3g1Ltg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=KbH55fn8s5Tw0HqsIqv22Aay3hkvZqxhFaXye+Y3P
        wk=; b=pUEhWFTa+zqN7F9QGyYfDaXSVhe6FPgboZ8ZiSFOT11+hThbAAeQ+EOLJ
        6zZwxVk7e76WWsoxAA5A1HUtTR9/K8gdseGqsofdyJwNAmRTo0HtIHyf5IDu90g1
        3HgbsY/5qOekMw7AYSyDf8+kOJ8FkuApqCHjCw1IWMKabguO6rIQQC4zZL/ZeMyQ
        oal4qNqXJk/5Ckn8QwmrSjgbw397K4KVgMGm2o4Dji9o4Q8TVXraIpaMRhxJJpYI
        faaGnmzNz9XAZ5GmQyuKxBxIP1MD9AvMb6miFROmUlOwm5NG227ybxCdQEaMYr/4
        5+e/XoZg6vERbONCWsrLYnE8cEzNQ==
X-ME-Sender: <xms:yAM-X3GEEXKfeXktCn6C3w279SW110EOS0RSvtxSNiX5wuDkMQzEiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtledgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucfk
    phepheekrdejrddvfeehrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:yAM-X0UGlaz1sNBEgMd2Hf_vgm9iIssKq71e5xMq4rb3FYXLfyuKlw>
    <xmx:yAM-X5IBEvQIfgA4ezdyVFG2fHi0TgGVsfGPaYO_pIZJCWak1_dkwQ>
    <xmx:yAM-X1FDj2xbXHVqvxc2MTmslPD3sO5mmyCqRlwl27NWqCEjs-dYzA>
    <xmx:yAM-XyUyl6OSIZjv3K0r8tzY4mpLF0j7Y7bW9LRSiH3HMio_-X7_AQ>
Received: from mickey.themaw.net (58-7-235-22.dyn.iinet.net.au [58.7.235.22])
        by mail.messagingengine.com (Postfix) with ESMTPA id 269133060067;
        Thu, 20 Aug 2020 01:01:58 -0400 (EDT)
Message-ID: <713c2362e70e4024b5965bfd2995a855b510f549.camel@themaw.net>
Subject: Re: Bug in samples/autofs.schema file
From:   Ian Kent <raven@themaw.net>
To:     Michael Peek <peek@nimbios.org>, autofs@vger.kernel.org
Date:   Thu, 20 Aug 2020 13:01:54 +0800
In-Reply-To: <7eea934d8fb01ffdef05fb61880cfd6dc767b36e.camel@nimbios.org>
References: <7eea934d8fb01ffdef05fb61880cfd6dc767b36e.camel@nimbios.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2020-08-19 at 14:18 -0400, Michael Peek wrote:
> This bug starts with version 5.1.3, and continues up to and including
> the latest 5.1.6.  Version 5.1.2 was fine.
> 
> When slapd is invoked while including the sample LDAP schema file
> autofs.schema, slapd will crash with the following error:
> 
> 5f359370 /<path-to>/autofs.schema: line 14 attributetype: 
> AttributeType inappropriate matching rule: "caseExactMatch"
> 
> The problem is on line 13, which reads:
> 
>   EQUALITY caseExactMatch
> 
> It should read:
> 
>   EQUALITY caseExactIA5Match
> 
> Attached is a patch that will make the necessary change to
> samples/autofs.schema that works for all versions 5.1.3 to 5.1.6.

I've added this to my patch queue so it will get pushed to the upstream
repo. the next time I do a commit and push.

Do you mind that I have set you as the author and added a
Signed-off-by: Michael Peek <peek@nimbios.org> line as well?

Ian

