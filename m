Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5F552C5C6
	for <lists+autofs@lfdr.de>; Wed, 18 May 2022 23:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiERVyW (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 18 May 2022 17:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiERVxo (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 18 May 2022 17:53:44 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C52414D7A8
        for <autofs@vger.kernel.org>; Wed, 18 May 2022 14:42:27 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id bs17so2990736qkb.0
        for <autofs@vger.kernel.org>; Wed, 18 May 2022 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=675CvuSp++zNLeIUZybBsP51nvc83dY+2bSGb3FYErQ=;
        b=MOE2dILgXlm6fxH3rfX0PKAPdcjpPmHUH7pDJsP/5pWBbKzAeiBR8DZbYeC+TsfEXX
         njnvPixclCGVLUcr1vU7zYTc7Ursxc9ZIU+jMGo1yVCZ3vGBKvg7e2ahPgARrTPOkH68
         +Il1eKSyLzYWRuzp88EbcxsAS3MiPLQvSNvGhr21Z8q2Cf6taXna/Ho4quKwySXKDF71
         TPaobkwaMGme4olMzpxO3ik36TP6dB/jA8rRzZ0hvY12H7GLs1wgCQYb1OmamZsZGhIR
         PiTB84JBBidJ4JuQgi4udNJ6rja5F3zDvYBFtUc4jAgDowViB8tZE7JmHA/85DxLQxe3
         xcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=675CvuSp++zNLeIUZybBsP51nvc83dY+2bSGb3FYErQ=;
        b=6N4HyIrZvTojVGxE8d/d8AKWIa1MjLxfV/a89w3b8vaahuClKZhzWElCam/F/iU8aT
         cciMOuGu4cmTp0DW0qGsHVtAa2uexSdowsI5/MU5CR+8ENKydy8tY0RC/v4o+B9/P19l
         kUp/b6V9Jh9T+vwRNp4KNYeIdbiyYM5IkBiBCh64/pfFLc9cJntQ+zIu2DDFr5dJ3Q5g
         0r+h+mBfIf1Sl2Z8auN2VL04VHyEEMTd3LjsGz6YOOdvX3BjfsEDzYf94k0gTbmVvx1Z
         FsIoLkuwaimLiCGJKDjQOnIwAAN3OGnGuXP0mrCOJhHPIlU7HU/Zwtd2I6sEQ/GpksUD
         cy0Q==
X-Gm-Message-State: AOAM5326K84rXcGNdOQ0b9UUAGHLr7AJth2uSkYYzgZUibcyqvXZyKVs
        ZVKTXk/YzaRM0vPfPENODyF4VQzBLv2/TA67AxU=
X-Google-Smtp-Source: ABdhPJxt4k/iP7w8GRXgT24WmvPH5p9VmkV6+06YWLgP/P+4e2zzhXd22crK7PHpA+arWJogtySWA62ydQMYHDcPW8c=
X-Received: by 2002:a05:620a:f0d:b0:67e:1961:b061 with SMTP id
 v13-20020a05620a0f0d00b0067e1961b061mr1168808qkl.82.1652910146689; Wed, 18
 May 2022 14:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ad4:5cc1:0:0:0:0:0 with HTTP; Wed, 18 May 2022 14:42:26
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <thompsonmiller942@gmail.com>
Date:   Wed, 18 May 2022 17:42:26 -0400
Message-ID: <CAN7gJ1QN=Y6tfLmC--X3Vg4yOgFe9sLCzn39e8qjG22QHL33Vg@mail.gmail.com>
Subject: work
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:731 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [thompsonmiller942[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [thompsonmiller942[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Can you work with me?
