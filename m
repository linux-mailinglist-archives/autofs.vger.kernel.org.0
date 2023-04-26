Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0926EFC54
	for <lists+autofs@lfdr.de>; Wed, 26 Apr 2023 23:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjDZVTS (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Apr 2023 17:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjDZVTS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Apr 2023 17:19:18 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF630DE
        for <autofs@vger.kernel.org>; Wed, 26 Apr 2023 14:19:16 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8c51ba511so72605201fa.1
        for <autofs@vger.kernel.org>; Wed, 26 Apr 2023 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682543955; x=1685135955;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=s1USHPtPYZSQbBLUmaRkw0vTSL242AnA4pxJfMhnxnQC3AKChLhw35Z/Dm1KVlBxg+
         sT0qpUJnamG1F5nuoqfno3JQc5y/7hUXMSNqPD3HoisdFsdxEjPjSnHf1z9dRxwbx+Fi
         OGZQe0BOiFpYRfCj9hbut4TwijjB6VcR4p7LZYN+N+bA2OZQ8Y7APNxT6OfFLldVQ9DL
         ysxFykPO3g9KUbP9piKyoMCL6UGtPDXIdxKLTDzZT2DkZUYufL5DCuBVHpIRN3XcHzt0
         EhpZJlBJvQFeHOufwwm3p2VdamUFyA24/JSPPDKGjLA+qlPDEv2C1n/Lb6I09Lhmt7jw
         QIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543955; x=1685135955;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=Y68Bpiqs9+nfb9TLpD4H8T/WR8gogrq/hahbjWiEBXhbyzhNdTwFGADkHd4b97TF0I
         aweLsw+QwZxv8khIuDAa50YTkYqB5f9SJCagv4gUc9YFM3DeThYbD2j56SeRteD0lXHt
         6lcM3Qw/3dwNY+SNDiYGSFGbvU3fPkoqNBZ7C988QJbL3ANxhvY5Y8jetI3ASZ2SDFPq
         PXQ/w2oXDGWISDU6d3igzWxrWF+NaafiLY7Wsliq8x4VeAdbemEXfiG+fogh0IbICMJe
         880VJLMdLA9FbebO9QwJXG3gTRPsdTG91XXm5cUPgeub6ZfewWsKxJAKySbxHIx4I2uy
         ddxA==
X-Gm-Message-State: AAQBX9eiotv6mpXtZ/NCsWnr7PHeeiNaBU7O9rwPl5+MYzo8DKIG8SWg
        ZJBR6xui51jOv+1OoK5peBDPrL0c7r1J4e3ktGo=
X-Google-Smtp-Source: AKy350bQ4daigQGNSea9MxftWN6GxmFmvL+Ab4RiKhRjDNe7i6Jng6g0uMZyWQQJGwt+GeXtbwGKnvTQW/z/0EQV6Aw=
X-Received: by 2002:a2e:b0d3:0:b0:2a7:80f6:e503 with SMTP id
 g19-20020a2eb0d3000000b002a780f6e503mr5126458ljl.1.1682543955057; Wed, 26 Apr
 2023 14:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab2:638b:0:b0:1b8:330:92a1 with HTTP; Wed, 26 Apr 2023
 14:19:14 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <charleslucasmake@gmail.com>
Date:   Wed, 26 Apr 2023 21:19:14 +0000
Message-ID: <CAPKQk4X9hnJa8gdaF5pLgNnuxi_b_cKnEjtREJv1U+rY4Hg=sQ@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
