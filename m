Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E9D6ABC3B
	for <lists+autofs@lfdr.de>; Mon,  6 Mar 2023 11:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjCFK0W (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 6 Mar 2023 05:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjCFKZ6 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 6 Mar 2023 05:25:58 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECB825E11
        for <autofs@vger.kernel.org>; Mon,  6 Mar 2023 02:25:31 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id d7so8644334vsj.2
        for <autofs@vger.kernel.org>; Mon, 06 Mar 2023 02:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678098330;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=FXYH3Khb7TkHebhMUbM1Yu51tZ26ORw6PyaaQMrcCbhZfocTv/iiJJu7orekMprgZ5
         GbPhkYyx0iHwA+UdNkhvP7cfrft0oAnvgn1BhUGKNupLoYtvIgYo/mwaF14UGiW1AkeL
         NXYQTiXUDre0qbbgSFVIQOJ0FfRUi6ZKhk5nKd3Ql+i75kOy8yx72KhCkpox9AS0XIZq
         6HWdJF/DrVNMafM0HI1HkNKD2SdFYwhaG3+lwX6e9cX/3sfs50wTnyeu4iKXz011MKhG
         nYiLFhB99jCZuJb3IuA+SUqU4mh6cL75rrQNmMW7LqTkegWbkNoGu3wTMgb0BPPX0vv/
         +3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098330;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=EfUEnuBjSNoXvdqVTxLOtJldG7GmJyqILVdkbBsgwaFKLhFswmSVGpOILZ4KBuGk/7
         mG0q8H59mPolqlishXpdnHEfDubRZ4WMPpua4UiCVSe5CDwcPAVa6JxpeVoLfRpJqxa8
         cEAmXMHvW9g4+TPBzKLpjJABz1RJZxfGqcnP2mD3bVfWLHwkwzpDJyoWMtJ9vWyoXgLR
         UmCvmhEMgy4fVyqpMqdTmAgsDmtsOYEgsI+GTiGmGhma4LNnvAOKEOPcmMTwvjfACkil
         RXcQd0dEUd4sY9I+TKUQ92UzZiqdvIrig+9VKsj1WoxZz+qlW5e3nre6O18kFI/R3jM3
         Q0Vg==
X-Gm-Message-State: AO0yUKWFd0rjjIL7GISDXyBa8FaN4VNjvH+g2nd7jrxk2ms2hZRSR0QD
        0yX6/VpEQoQrdADuP2CY0RcA2neijoehctFbtfw=
X-Google-Smtp-Source: AK7set9YqazPiOkBuGm+YrFZOLe51O90+qKBrIr6WBjXtnVrmZ9RIOYyWRLBWcHI+/rsVoNhMQhwnCpcR6G8n2Z6mzE=
X-Received: by 2002:a05:6102:e44:b0:402:999f:44d3 with SMTP id
 p4-20020a0561020e4400b00402999f44d3mr6975472vst.1.1678098330725; Mon, 06 Mar
 2023 02:25:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:ce6f:0:b0:3ae:930b:3e70 with HTTP; Mon, 6 Mar 2023
 02:25:30 -0800 (PST)
Reply-To: madis.scarl@terlera.it
From:   "Ms Eve from U.N" <denisagotou@gmail.com>
Date:   Mon, 6 Mar 2023 11:25:30 +0100
Message-ID: <CAD6bNBi6bPCYboaF4-xBgmeUTFn6JMXqU6TNepQig=NRMqhdUg@mail.gmail.com>
Subject: Re: Claim of Fund:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello Good Morning,
This is to bring to your notice that all our efforts to contact you
through this your email ID failed Please Kindly contact Barrister.
Steven Mike { mbarrsteven@gmail.com } on his private email for the
claim of your compensation entitlement

Note: You have to pay for the delivery fee.
Yours Sincerely
Mrs EVE LEWIS
