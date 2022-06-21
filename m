Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBEB552EF1
	for <lists+autofs@lfdr.de>; Tue, 21 Jun 2022 11:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349339AbiFUJlb (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 21 Jun 2022 05:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349607AbiFUJlJ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 21 Jun 2022 05:41:09 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1200227FFF
        for <autofs@vger.kernel.org>; Tue, 21 Jun 2022 02:40:58 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3178acf2a92so90792597b3.6
        for <autofs@vger.kernel.org>; Tue, 21 Jun 2022 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=QwUyPxhbEU6II68hxeIaRojgq7k3A/l7auGv4FfQ9wLNCvrv+YpgivGDD0PP51qTzF
         JB8R9tZNrwN9DSbbK2oJ4SIl0pzAhfeljBfR64YgNI4wEmJM/jLyWe5BbbqLk47WhjGU
         PceiawafnIdQEXjg7eE3m6vB2/WhC/WV62ZUZkoakh5Lt5xF1ExB/eWbEuUyMmB7Q+Y6
         26MgNAAdr0VWrUJs5zooRIBafHCIOLMJS8CX/f0wrQ5WmUCjPqNP75bm7kxzYMilvPt2
         oPLYqGNVQUMOA821VPmkrz88QGbVQE0U2mWu65Bu3sTOYaxzqetwHhyJ6M+qbfxtXZzS
         ltrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=yJItGNmrvJ46NVJ1kPzd7E2HvCbPeqzcBfRtAG8snaeBE/E/y9X3be/qtTGGyV1CGh
         M4FP27EiE71skpSTTnbvG4kN7fXB8Gq0nZlY+aCdE7HTohB6LsmWlv3W6Esx8gnZOYu/
         kscJG0s8OkwM8pG7fyEgDuRJt3KhtbZNo0J78BpGK6JscHrvgfEo4+2HpQLWm9Rb5RLM
         bhSZpuZqXxpspJ6VfFpewV9wxP9qkW/jw4lpprFxMPI7olXRlfWWErMf6KadeyP2nOXs
         lBvH6RZX6+WBbZRvIFZPtwAfPcHzxDUXd0+Q1GI4UCz1I1+fLJ4CSvuv7A3m2AOH4jU9
         4wQg==
X-Gm-Message-State: AJIora9P+PsbmXA0EGtfk1z9mHehjrbduufVqkS/Vb1NPjXlsVGLJBNM
        XTlPL6MyO/BPMbZk4Ytt5hcY3VvmEYpp0vJ6fw8=
X-Google-Smtp-Source: AGRyM1sQzR2hAubfAxsuz+T8Pd7vJDS1bK5CAli72e85Qch7nG7KURnuwq1VhX28ijBgXGP3jWUhx/dO4CDMx6PaD+Y=
X-Received: by 2002:a81:5bd6:0:b0:313:319f:4f0f with SMTP id
 p205-20020a815bd6000000b00313319f4f0fmr32917577ywb.70.1655804456966; Tue, 21
 Jun 2022 02:40:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:e10a:b0:2d9:e631:94d0 with HTTP; Tue, 21 Jun 2022
 02:40:56 -0700 (PDT)
Reply-To: dimitryedik@gmail.com
From:   Dimitry Edik <lsbthdwrds@gmail.com>
Date:   Tue, 21 Jun 2022 02:40:56 -0700
Message-ID: <CAGrL05bzSrsRjWD1yM3tdHJB_CsAWftiPPV1GJ-OZ6GCgvYpag@mail.gmail.com>
Subject: Dear Partner,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1129 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lsbthdwrds[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello Dear,

My Name is Dimitry Edik from Russia A special assistance to my Russia
boss who deals in oil import and export He was killed by the Ukraine
soldiers at the border side. He supplied
oil to the Philippines company and he was paid over 90 per cent of the
transaction and the remaining $18.6 Million dollars have been paid into a
Taiwan bank in the Philippines..i want a partner that will assist me
with the claims. Is a (DEAL ) 40% for you and 60% for me
I have all information for the claims.
Kindly read and reply to me back is 100 per cent risk-free

Yours Sincerely
Dimitry Edik
