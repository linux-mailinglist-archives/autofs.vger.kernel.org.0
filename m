Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A9B5B576F
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 11:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiILJtf (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Sep 2022 05:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiILJte (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Sep 2022 05:49:34 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D42263D
        for <autofs@vger.kernel.org>; Mon, 12 Sep 2022 02:49:30 -0700 (PDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6D9A761EA1932;
        Mon, 12 Sep 2022 11:49:27 +0200 (CEST)
Message-ID: <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
Date:   Mon, 12 Sep 2022 11:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/2] autofs-5.1.8 - ldap_sasl_interactive_bind() needs
 credentials for auto-detection
Content-Language: en-US
To:     Thomas Reim <reimth@gmail.com>
References: <20220912005822.3947426-1-reimth@gmail.com>
 <20220912005822.3947426-3-reimth@gmail.com>
 <b20bff58-a7f5-47c7-47eb-8b44f1e2e6a5@molgen.mpg.de>
 <147a772c-c180-09d6-729e-46b731821241@gmail.com>
Cc:     autofs@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <147a772c-c180-09d6-729e-46b731821241@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Thomas,


Am 12.09.22 um 10:40 schrieb Thomas Reim:

> thank you for reviewing the patch. My understanding of your comment is 
> to align the notation and use authentication "type" or "method". Is this 
> correct?

Yes, I thought it’s the same, and suggested it for consistency.

> In general, IANA and IETF define SASL authentication mechanisms. For 
> LDAP people talk about different types LDAP authentication calls: simple 
> bind, SASL bind, mixed bind type.
> In autofs LDAP configuration users can specify the SASL mechanism using 
> attribute authtype and the authentication bind call type using parameter 
> authrequired.
> 
> I'm not sure how to proceed. Maybe we should use:
> - "Simple authentication requires ..."
> - "%s authentication requires ..." (e. g. SCRAM-SHA-256 authentication 
> requires ...)
> - "SASL authentication mechanism auto-selection requires ..."
> 
> What do you think?

Good idea to avoid it altogether.


Kind regards,

Paul
