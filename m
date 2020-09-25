Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3020277EB2
	for <lists+autofs@lfdr.de>; Fri, 25 Sep 2020 05:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgIYDuV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 24 Sep 2020 23:50:21 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:51433 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgIYDuV (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 24 Sep 2020 23:50:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 98FEB9F6;
        Thu, 24 Sep 2020 23:50:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 24 Sep 2020 23:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        aJdz8cNjk6OJI3CXhTbZIUiGJ70PzIMxQUuPM7awKqg=; b=TTiTS17Qt/KzGDuq
        MpXCtSor+ZhuLT3OvCr+wSOYY3S14/ruIMwt+OqfiXQAaZdMDYTeiKZSPMfhQGOn
        rBlJY0sdebL/3ISPlRO4aM7UlFyqgDig0cszQ8AuuMU7/6C/Fkqwr+jRZglL73ce
        H3i44vlwW/qSPLtIUFMZEbdds8Zqc+Jk0IAKrs7EoU3YGTMNyoRIaz9s961eKt2I
        WAejCDnI3i751lNFRM7K6+TVKBsmD/ky2T0F76yN0k24FTY2gDsfBtLIymU+U+3j
        I9fF8fBMOerbA7OdFewtIGBXKRXmALy2a8l4NVIqF6HMkMU1j1Jy1Q3ChkYqoH7N
        V8JnXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=aJdz8cNjk6OJI3CXhTbZIUiGJ70PzIMxQUuPM7awK
        qg=; b=DVZH3QKghR7NcE+JAPy4kVo5MAhf1lfd1NM9FK7HMc7PO3vAupEN39kYe
        Z6mmeO22qCffUD4I8F3hF6lha2MN0ZGhzuGQlHAFO0jLkmvKb2SWKqBEBJO1nOOl
        Xa63r6Je3UPzJy815yC/fXpbIhLZGAU/zIRrJuvxrM2SNSrP9ChC0UeCA+07eSK+
        1flUpxbjzlpq/kE/SSxRmYpSfhoomCPJFx9GcRqAdSXAgjxuz4aQ+sFZuOeKMcft
        HKsZwTk3QZhsvX0gypvpLVVj3VBxurN1BQSmhSM2KNuf/GTxZEHGZ/EKSE3mZGDY
        V9TyDgpwLR9gZBA0NpX9rsszGX9tA==
X-ME-Sender: <xms:_GhtX0B9d5fKv_Sn7VBMZ8ntBTue6vW9KuAGMqBrMAGNIM-HZcqwCg>
    <xme:_GhtX2jwXRe9NowNLgsO2FhZRVwK9wx2xd8KRYiOfzG_lOXrjozWaPCFJCzMmZhzm
    McgvR-mPm6u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
    dttderjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucggtffrrghtthgvrhhnpeeffeettedvgeduvdevfeevfeettdffudduheeuie
    fhueevgfevheffledugefgjeenucfkphepuddtiedrieelrddvheegrdduhedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:_GhtX3kkPSByV4Q452FEkWeP7u3tzm4_c-2IBFNcnACc8sjzqUEFfg>
    <xmx:_GhtX6ypPHuvW7nxR-7GLnYbQ3Zm1WVQzmJY7UVUrpVl5jFVxShUhw>
    <xmx:_GhtX5SKGMiklPxKIspmo4RcUPfjAOTFhcxyPZ85ojgUO6m0ArCnXQ>
    <xmx:_GhtXwdQwiPRA2-N4wGYFBKUO5AN7IVSTFAkv7Zjep-1IP2Sxluslw>
Received: from mickey.themaw.net (106-69-254-150.dyn.iinet.net.au [106.69.254.150])
        by mail.messagingengine.com (Postfix) with ESMTPA id CEE473064674;
        Thu, 24 Sep 2020 23:50:18 -0400 (EDT)
Message-ID: <efc1aca31eb9f857860ee112ac527c5aa28ad175.camel@themaw.net>
Subject: Re: [PATCH] fix typo in daemon/automount.c
From:   Ian Kent <raven@themaw.net>
To:     Julia Suvorova <jusual@redhat.com>, autofs@vger.kernel.org
Date:   Fri, 25 Sep 2020 11:50:15 +0800
In-Reply-To: <20200924163607.283012-1-jusual@redhat.com>
References: <20200924163607.283012-1-jusual@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2020-09-24 at 18:36 +0200, Julia Suvorova wrote:
> 'Random' is spelled like 'ramdom' in the automount help option.

Indeed it is, thanks for the patch, I'll add it to my patch queue
ready for the next commit and push.

> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  daemon/automount.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/daemon/automount.c b/daemon/automount.c
> index 0391bfb..b7d2a04 100644
> --- a/daemon/automount.c
> +++ b/daemon/automount.c
> @@ -1956,7 +1956,7 @@ static void usage(void)
>  		"			run automounter as a systemd
> service\n"
>  		"	-f --foreground do not fork into background\n"
>  		"	-r --random-multimount-selection\n"
> -		"			use ramdom replicated server
> selection\n"
> +		"			use random replicated server
> selection\n"
>  		"	-m --dumpmaps [<map type> <map name>]\n"
>  		"			dump automounter maps and exit\n"
>  		"	-n --negative-timeout n\n"

