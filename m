Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF32058F72B
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 07:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbiHKFFn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 11 Aug 2022 01:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbiHKFFk (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 11 Aug 2022 01:05:40 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB5E26AE9
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 22:05:38 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E4B5F5C0161;
        Thu, 11 Aug 2022 01:05:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 11 Aug 2022 01:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660194335; x=
        1660280735; bh=fqFFPDD3dxtayXD15FiZUah/xQC+y/923eNOCfH9TqU=; b=g
        3MdP1qqINP6NpqlvmsonjfZSTxn2YcL+gvsMkAR8C4poQ9lgR5Oa9nFuhgdggIaD
        LMr6yuBliTkC7S7XC+iggbipKY4FQIx3wDJaa0n2e/cyaBZj5pfw5egiuYajn2xo
        Rc5Dw/gpWAgJu5ap2XEZr9oW/pOSrsAXE3EzWsI2OY8DdEzEHOOqgl6L5AxirGUm
        u1gcjrfOG8tplKYattMzIhWqsCHqJg0U/UExTol5hb0g/qr3ngPQjVqHQJ4JWpgH
        2CnTaTiauuh0SY/KFnV6THFW/X4YzpSYWz3owWO8FI/if4kqTK5S/IiITMuXnb4j
        86sPSWjuKq60JU/6Oj0Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660194335; x=1660280735; bh=f
        qFFPDD3dxtayXD15FiZUah/xQC+y/923eNOCfH9TqU=; b=qQ/Os0JyA4wddrmmH
        bJDrC7m87UdVVMPFaK8yPKslcDhfR30Wxuxt/VBIcIFYSBL6GMfo2ji2FyBgW93A
        jlaT7oRXk0JBvesa+HH8m7ukH0R7pCtQ5XgmQkIfZ1gHFlua0t9pISSX3YU4VXrg
        l7e/N07qF3C7DiwOPgcSvTu7Ed6x3DpQqErEMgaPNhflmggwkl8Hq31Va7qjj1uv
        zj3SPPh1TzstSRDpkQYVPvt2sKZGov0MnNAqX8+OdpNWKd4qqU6zLuIK+RuKE3NV
        dP8Bm2So2N2L7fYdTJTH7h+aMZBDu5vCpXvoA7HuARbFcsa5Ey63B6nbUCsxRg5J
        TULTw==
X-ME-Sender: <xms:H470YpBBKxwcxnwmLkudIa9tx0z7EQ4OngZYA5qL-F7QkP7JQCbhSw>
    <xme:H470YnhmCHS2gGc43z2YrbA0FC1_KUW1XzF4TeHa3f3KmoT3zFzHLGdtpOsnIla9V
    HxAL7oaD87f>
X-ME-Received: <xmr:H470YknJo3Fz0jr3_vwfFj-Cb-gj94CtJ8IQB8k90ez32CKAO05vm4DH1VToW7fKhEzMHHXgpPrgr29MpCCQdlGMGkyJXNkle4I9nPFATI1CSuYGkEuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:H470Yjy2w6vVXlndzmdlFUHS7FBDnM_rk1WMTSVPYgoHmWBxWoYd6g>
    <xmx:H470YuRDojvGfVHq-zczCQjSLxKtd_OHs_muATpeE4aYpQPhr7rrUg>
    <xmx:H470YmZcLPzMG8-5hExeBj0co2qcFqST9OTAmqQrgHmDB4MZ57g3oA>
    <xmx:H470YlPw1fOIPxDYFQGFEvRgXED97sSKT4dIlIsHHobFa-HaHfwoMg>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Aug 2022 01:05:34 -0400 (EDT)
Message-ID: <2f214411-3e37-9bc2-7ba9-034af4e25895@themaw.net>
Date:   Thu, 11 Aug 2022 13:05:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Improve SASL and LDAP (Debug) Logging
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115710.108512-1-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115710.108512-1-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 9/8/22 19:57, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> automounter only provides very limited (debug) information when binding
> to LDAP directoiry services using OpenLDAP and Cyrus SASL library. LDAP
> based directory services are currently all improving their communication
> security. This leads to failed authentication binds because of security
> policy violations. Current logging capabilities of automounter make it
> difficult for system administrators to find the root cause of failed
> authentication binds in their networks.
>
> The following patch series is the result of the development and test
> activities to solve issue "Missing Support of SASL Sign or Seal using Data
> Security Layer" (see previous e-mails). Debug option -d of automounter has
> been extended to enable OpenLDAP libldap debugging by specifying a proper
> LDAP debug level (e. g. -d5). In addition, option -d now provides for
> a more comprehensive logging of SASL security settings.
>
> Please review and provide your comments or suggestions.

This looks good.


The use of LOGOPT_NONE might cause a bit too much noise, but that's

fine, we'll need to wait and see. There is a reason (user requests)

the logging leans so heavily toward debugging but it's probably

gone too far now.


Ian

>
> Thomas Reim (4):
>    autofs-5.1.8 - improve debug logging of LDAP binds
>    autofs-5.1.8 - improve debug logging of SASL binds
>    autofs-5.1.8 - internal SASL logging only in debug log mode
>    autofs-5.1.8 - more comprehensive verbose logging for LDAP maps
>
>   daemon/automount.c    | 31 ++++++++++++++++++++++++++-----
>   daemon/lookup.c       | 20 ++++++++++----------
>   include/log.h         |  6 +++++-
>   lib/log.c             | 19 ++++++++++++++++++-
>   man/automount.8       |  9 +++++++--
>   modules/cyrus-sasl.c  | 37 +++++++++++++++++++++++++++++++++++--
>   modules/lookup_ldap.c | 41 +++++++++++++++++++++++++++++++++++++++--
>   7 files changed, 140 insertions(+), 23 deletions(-)
>
