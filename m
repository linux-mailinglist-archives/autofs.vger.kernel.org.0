Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF9D70919E
	for <lists+autofs@lfdr.de>; Fri, 19 May 2023 10:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjESI0H (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 19 May 2023 04:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjESI0G (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 19 May 2023 04:26:06 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC85E4D
        for <autofs@vger.kernel.org>; Fri, 19 May 2023 01:26:01 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so3323015e9.1
        for <autofs@vger.kernel.org>; Fri, 19 May 2023 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684484760; x=1687076760;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=PpHWKYRDg1oNrPI2ju6v8GnyZkpQazQmOx6B792VaJsNe19dncU8jqiPPsUp3ELH+j
         uvfqnqjF8lwX0BBEw0LOvuItBNV8sRFYg9+BxaRzQZ26HFBjjISp9+D3wAD1Sds7IiPe
         RK0a5T0p0xND7LCzl0YfNh64O/xct0E7GsIVkwHp3EKTxLC0KOfSdBmoFgy9uZUfxtc3
         FQpuXdvdFuBogo3hAG0sdOVrwQgoUTRM24NE4czf/LpnQO3+M8xxLv8v/Q+j1lgycDlC
         znZHACfsi13MSOMjpAf5nAD23uKv0WOfWsWTIh+Hbd4LbnPoGys25TUHJqaLOdqwJyss
         fUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684484760; x=1687076760;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=P2Gi28vTtTynusOo4yp8cpqMzgYJhAn+NwOi++S42KuIYE47EXHFaxknfL3abynNgI
         wplGNe76uApqQB4ZgxpMu+mP4SjK4sKalhaxt/FNsJCzt42d91f5Oco/xikwxtzy+Pdu
         yywM47Df7mGAwDDd6Qw4LsPVLujcFW6u/4wHyEis9cDISr+PGXOEISmLBRN6SWyRA3fa
         Y5k4a4/6kS7545e9vxt55na+HCVKPkahffTbvaglqzNSaEoHL/my6WaMELhSXiu6HlqX
         ptgv7fnocWMHRuUOrbRDg55QwSNesV0YKF1YIIMeMzYoUt86ZwheblKKzS9DO+ymQ97O
         Bg/A==
X-Gm-Message-State: AC+VfDyErh4rvKbmMudxhOCw1FXc+lF+WVbouqLXFm8qk6OgpSE9KhNc
        APEOKaRR1PCadrOVwlfVM1bEPeHqRb+nxCHR05Q=
X-Google-Smtp-Source: ACHHUZ50P3yakcpeYcSs5emLsdx03qPJ+rv+ITr+ymUMEv3jz29xg58VnqaYMLEyb//UR9rxTeCXu6k2xQRFTfcl+EY=
X-Received: by 2002:a05:6000:18ca:b0:306:2ff1:5227 with SMTP id
 w10-20020a05600018ca00b003062ff15227mr1149825wrq.23.1684484759559; Fri, 19
 May 2023 01:25:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:fe50:0:b0:307:924f:3fdc with HTTP; Fri, 19 May 2023
 01:25:59 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacou041@gmail.com>
Date:   Fri, 19 May 2023 01:25:59 -0700
Message-ID: <CANnT53_m8yvEBM3XseKfC61J2AjO52XPLEyfayPsyBL+cEqN1Q@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
