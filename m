Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40F56B286E
	for <lists+autofs@lfdr.de>; Thu,  9 Mar 2023 16:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjCIPKe (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 9 Mar 2023 10:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjCIPJ1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 9 Mar 2023 10:09:27 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AF0FA099
        for <autofs@vger.kernel.org>; Thu,  9 Mar 2023 07:06:56 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j11so2646143lfg.13
        for <autofs@vger.kernel.org>; Thu, 09 Mar 2023 07:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678374415;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3tQa/xAjjFjMbYTIPvabJVdNLC/DkLFMMTZCH3qWNU=;
        b=lCOcTalBP7Q1jpEscFwnscaDMH07D8GAFyxnyJ5cQc1cfL8GkYziNk4QtdJCO+00f+
         +KeGiX8OjsYOe0QtOw6mNrTCCaSF3rNT1gSLDPsTj8ZVU5pA4xv1JIXffrWJkBGmDUbt
         0ApXg4+a5Ca8WzU5XkAqq3NJN1qi1M8qqSvvCUryRhleg1q4aIuHNY0wfHeWnvZQhKyQ
         GOwe+ZxWf34if47/YWJPeoHgyk+2/+MX3ycMjqAfNKQ+ml8DCsfZB/H53A/FZ2ZVnOpv
         jZihxqBd1leTarKKthIQFRo6J3g+rMsD/oFgJmqcICVo5b2OeyISdUbSSRW/ntj0jgYn
         bq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678374415;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3tQa/xAjjFjMbYTIPvabJVdNLC/DkLFMMTZCH3qWNU=;
        b=1BKu6UKEILixdra8iOQLtiUysQ1NX3q4/JlHUkcUAaw2Dqt1SVghukceLBXy7p3Gep
         xTBTSdvRJh7uwiONafRbqCPzGNjw7YmQoaWe2K4mYhWCeTw6s+pI9a/zWuh9skA+SAso
         jgAMFrZEDd438DyctxTUVPgnGwN3R6rXpxlAWARyY9GBaPYGDq/FlXEs+Wg2gAVIHdMM
         agLiKewSyQg6VbBR34qAqw3Cc6BgLR2hAYurlg2kiX4lVqK8Ig4D6DFWfnMXAjKjqDMe
         ah3KlRUNFh3W31t+3v3qw05Nm/Afnrh/xQltl6u/veEoapYJngrG380aXDDAAHPgHXBB
         wKvQ==
X-Gm-Message-State: AO0yUKVKRxy4cJEONnvCfU2DkmkXM2XxozMPP6b3ugX0eqyqu+UWg2WY
        51Svtogs6kW/3esLrLSg2ftGW1Guo9qAhqe2sak=
X-Google-Smtp-Source: AK7set+h5msdSeSNWQy099kLraAr1VadZYcuzK6hHVaFOjmtK3ytkvvFW9b/YSJnj/FO8iSlZh44NZgW5PTAyY599XU=
X-Received: by 2002:ac2:5934:0:b0:4db:3873:fac1 with SMTP id
 v20-20020ac25934000000b004db3873fac1mr6932667lfi.9.1678374414545; Thu, 09 Mar
 2023 07:06:54 -0800 (PST)
MIME-Version: 1.0
Sender: nicolemarios1978@gmail.com
Received: by 2002:a2e:9883:0:b0:295:cb7c:231e with HTTP; Thu, 9 Mar 2023
 07:06:53 -0800 (PST)
From:   Elena Tudorie <elenatudorie987@gmail.com>
Date:   Thu, 9 Mar 2023 20:36:53 +0530
X-Google-Sender-Auth: MIuUZQvse7ZEKouipJjbzPrMq5E
Message-ID: <CAAAK_q7zdE9SH8fZ8fambinkSbpETX2BQ9aQYi11Bq3pTGj-cw@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I am Ms Elena Tudorie, I have a important  business  to discuss with you,
Thanks for your time and  Attention.
Regards.
Mrs.Elena Tudorie
