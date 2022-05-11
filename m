Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9E4522AC5
	for <lists+autofs@lfdr.de>; Wed, 11 May 2022 06:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiEKEVo (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 11 May 2022 00:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbiEKEVn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 11 May 2022 00:21:43 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DE23B3D5
        for <autofs@vger.kernel.org>; Tue, 10 May 2022 21:21:41 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id i17so696759pla.10
        for <autofs@vger.kernel.org>; Tue, 10 May 2022 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=J2rrgRRhoe7BtMHtMsz8OIVuvAs+xbcVeavz0dIZBuJtnurVh03/s5pLn+5HTDA7KY
         F9DF4GXOp7xs5A4F+2hZxuPrGXTs8f235RTpvzd7uwgKlJwc5nheppQJ+OURD6kDojYx
         2o4uqDqp2WZhDY2C6uJtjouCaaLX4yWOCQ2abpRFTWwKJCcbl2uQOCONaxUiadLhu96f
         J3/OafSve9BnfPwDlaD4IKei+sj+g1aoXBG4tfe338tOWsBmBv7d3LfAIHYK9FbNOPQe
         AEm6rMCCDiKiLXwy9LBcvooArBujgHlBiHbTeKXLEAuKKl0ub7MLTe98k7X8OXcL362t
         HSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=EMRx0kYeDkb+TmVN5wYNkfeV0chN2/YUyC8V0uZaXkjmTv4j8yXzMaz9ti+jXnHdeB
         uHKKb/Qv8bt7agJ0VEm+WGG1zcKjNU3QGxNXEmXLeb+C04rjoC/Kmg0qA++9oKX+JgGT
         mKJzF7F8VJLdc8YY5Naw7wTcDrqLY7ol/uVYPS4RYPgQ7eCNxDMQZadjv/6UDx3S98zi
         PKCyAxuiKOR5VYD8mrbMBo1sBEU/KWu+3JIl1BwnTSpuaOxo9hnMx2LmHgS4pjQ4nQ8p
         YjhnXkL437LQtS8rkr8wxifTSrtydJCVMuHI7E5q13KCxN4SBEfMy1H1hFV1ko041mny
         eCDQ==
X-Gm-Message-State: AOAM53364IGTw6h/YfLT0Nxko1hCyg73Z8OSIYiQUo600+ZJ+nWLMiTR
        fV5GgPMypNCxshM8YkNzEboisKhPnCX3RFqo1B8=
X-Google-Smtp-Source: ABdhPJxDrU14/NQVjLqufayTNKPd6GQSk6gQPlOOZPpEEsZmz0bk4Lo/AnRYPAUC64KTj5v/JbfWrFvqnQ52WJkAErM=
X-Received: by 2002:a17:90b:1e4e:b0:1dc:583c:398 with SMTP id
 pi14-20020a17090b1e4e00b001dc583c0398mr3293193pjb.232.1652242901439; Tue, 10
 May 2022 21:21:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:319:0:0:0:0 with HTTP; Tue, 10 May 2022 21:21:40
 -0700 (PDT)
From:   Private Mail <privatemail1961@gmail.com>
Date:   Tue, 10 May 2022 21:21:40 -0700
Message-ID: <CANjAOAjNAatpcvhS5FYTA3yqdjXDutWCOgCOsVXXLYtapv3koA@mail.gmail.com>
Subject: Have you had this? It is for your Benefit
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DEAR_BENEFICIARY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Our Ref: BG/WA0151/2022

Dear Beneficiary

Subject: An Estate of US$15.8 Million

Blount and Griffin Genealogical Investigators specializes in probate
research to locate missing heirs and beneficiaries to estates in the
United Kingdom and Europe.

We can also help you find wills, obtain copies of certificates, help
you to administer an estate, as well as calculating how an estate,
intestacy or trust should be distributed.

You may be entitled to a large pay out for an inheritance in Europe
worth US$15.8 million. We have discovered an estate belonging to the
late Depositor has remained unclaimed since he died in 2011 and we
have strong reasons to believe you are the closest living relative to
the deceased we can find.

You may unknowingly be the heir of this person who died without
leaving a will (intestate). We will conduct a probate research to
prove your entitlement, and can submit a claim on your behalf all at
no risk to yourselves.

Our service fee of 10% will be paid to us after you have received the estate.

The estate transfer process should take just a matter of days as we
have the mechanism and expertise to get this done very quickly. This
message may come to you as a shock, however we hope to work with you
to transfer the estate to you as quickly as possible.

Feel free to email our senior case worker Mr. Malcolm Casey on email:
malcolmcasey68@yahoo.com for further discussions.

With warm regards,

Mr. Blount W. Gort, CEO.
Blount and Griffin Associates Inc
