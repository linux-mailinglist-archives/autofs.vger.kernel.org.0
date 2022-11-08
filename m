Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D97621167
	for <lists+autofs@lfdr.de>; Tue,  8 Nov 2022 13:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbiKHMuq (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 8 Nov 2022 07:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbiKHMup (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 8 Nov 2022 07:50:45 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C01DBEE
        for <autofs@vger.kernel.org>; Tue,  8 Nov 2022 04:50:44 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id o4so20841143wrq.6
        for <autofs@vger.kernel.org>; Tue, 08 Nov 2022 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=n2ml3RXihaF2pybyw5DwA5kJDUvx5PqSwFGiH/paxDyD2/HJdVUWhyGr55VALaCzvI
         fRTiumJTzkQgwJyyMV0e4rCkyyVoaINUQiDTs2xSi8ojJUbgZgUlCbTNH2gFwEDzwqIB
         BYwHLN+CgjxYzCCiQUHlaAexpNzqt4XRi+Y2YbZgPUmXbbMeajON5btbl5e9NtS9BUC5
         0J8CX1CVJdKczQ4pvWMczoickbwHw/khzsrDs0GFMwBSU7gQF7uFfaejwoIisFFYxgc6
         yDE6x1bPvWA2GcjTQAJbwIYi5vzc+0WDYFVbe6hVTcyfz1ccOkNWHBZ5ZeCY1JQqX+fB
         maKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=QqsC3M0k+TEVEgXXtjSXwxs878XNf7fKIQhzOzJWuE6dCya6N1RLDZQHNxsx9w3Mja
         x8ula0YNNM8Nux5zxmnJO2LbZitjyye/J3ziKgcG2z9cyOP9vhiKJRXl1ECzAS92xeTC
         bark71Es3G1HYFkqvRC/zNWIhooHTwZRXVoZN/hUYES6vaMU7ndySfToSLPOwKm6/Pxj
         fl+JGmXQhcmMPsh4dE3we3xiDhEUYpA0HjGKL/zZhQN75BhlhSj+rFtCJS4hJpz0ipvS
         MhXBmHP0LpWEocoHgBxSgOf+znmiujjuCsjqbdKB9elWqowES7RHCl2wsP30Z3jqAeAU
         gCpA==
X-Gm-Message-State: ACrzQf0wjD5uI518NoafpQE8gpdYMdn5a6ilKfKRwldr0oQUjekpWSH5
        kxLSL54Anei+CfgfWfkBGISGFy/w1Y6Ce5itLos=
X-Google-Smtp-Source: AMsMyM443mCVLg6MssejyaKCmBW4tOD7QhFRitNflduGVmZIEy9KGlk68zXMk86KSqAONcgV0+HLCh6GFYsMTBPIlrU=
X-Received: by 2002:a05:6000:118d:b0:236:f075:dccd with SMTP id
 g13-20020a056000118d00b00236f075dccdmr22552056wrx.37.1667911842892; Tue, 08
 Nov 2022 04:50:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6021:f08:b0:22b:1bef:1706 with HTTP; Tue, 8 Nov 2022
 04:50:41 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <fofoneabraham@gmail.com>
Date:   Tue, 8 Nov 2022 12:50:41 +0000
Message-ID: <CACQYsd83h4cHNZL9svSmnK4tbhoZjDqGAYwBpMFgCdOSQA=PzA@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
