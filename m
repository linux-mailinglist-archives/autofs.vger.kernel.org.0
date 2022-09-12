Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823095B57D5
	for <lists+autofs@lfdr.de>; Mon, 12 Sep 2022 12:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiILKGa (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Sep 2022 06:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiILKG1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Sep 2022 06:06:27 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3C01BEAA
        for <autofs@vger.kernel.org>; Mon, 12 Sep 2022 03:06:25 -0700 (PDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6246C61EA1932;
        Mon, 12 Sep 2022 12:06:24 +0200 (CEST)
Message-ID: <0c9be97e-1294-eef2-7850-bc039298bea8@molgen.mpg.de>
Date:   Mon, 12 Sep 2022 12:06:24 +0200
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
 <4aece4c3-129c-998e-5a2d-2f3ee5bb7c9a@molgen.mpg.de>
 <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
Cc:     autofs@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <862ca431-e10c-3b84-b13f-b4028640f376@gmail.com>
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


Am 12.09.22 um 12:04 schrieb Thomas Reim:
> Perfect.

Thank you very much for your recent contributions. Much appreciated.

> Shall I provide an updated v3 series or should I wait for further comments?

I’d wait for further comments.


Kind regards,

Paul
