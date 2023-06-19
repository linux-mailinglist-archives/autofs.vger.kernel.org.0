Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D164734D3D
	for <lists+autofs@lfdr.de>; Mon, 19 Jun 2023 10:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjFSILv (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 19 Jun 2023 04:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjFSILu (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 19 Jun 2023 04:11:50 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7869B9
        for <autofs@vger.kernel.org>; Mon, 19 Jun 2023 01:11:43 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-55e42149cf2so856399eaf.2
        for <autofs@vger.kernel.org>; Mon, 19 Jun 2023 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687162303; x=1689754303;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rJ/7Kbo9gs7zs3QTF5nFKkJrBjocKGAtdax9LA/wsFg=;
        b=HIa7ebvEK4HYGqcXt28uaCdQRULgDAf3zN7+B3ohPY8n4WAFlNlWZkQPBIlQf1njJc
         gRZPFzUU4OIN1DVHKNaKXHVCfSmZWMssHRzNBlyOHkgbwwPcQ5a9BHW9Z4N6DlaaPsK9
         9VqyVm/bkcG8dHGNeG2kE7HnPtwC2TKgUCmW1p35gEiIH/cX4RqlFLprPp5K8753uqTk
         sf2uR5pqVo+sydp90gkUYTc13LGo5LokZb2ksSdv610TEc/5S4m1lJaYgEqMelusSwn0
         Lbcsf7JB/tm6Autaj+84k8W3UCqauEJi9kIYbIKyxGATT+u6AhZ4t+mT262zFyIkF3cU
         lqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162303; x=1689754303;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJ/7Kbo9gs7zs3QTF5nFKkJrBjocKGAtdax9LA/wsFg=;
        b=ZkUYO/8/krLyFjPWuVffBaRZZjec95AYtqz7kHLyoVGOOZLy9Tf4Z5ZLIc7mvEv7s0
         Cig11QhIHXa/xDsHD5SYy+Fqcd4SOTTFiRwyKQld20KtF9+xoS+gvpDLa2xkb3qWm8Yf
         2ilc+GX5ZPYm8AlzFmDpuXHFetP0JGqPD/UyUn4Z5O8mjFHX53732v7ZfO1JlOh9O5C0
         xgxQ9ka80t69T80XmwhHx5E0TIFiJbQTMTmv64jmLvusMCZrYb0o9JUkXJLdsFO24iwj
         Qi0C1OAMGAUe9FvNfkZ7jBT1MHe7ydedKAE0UHLKPLbKAVFockI7c2rRVktS5BaZ88gk
         ZICw==
X-Gm-Message-State: AC+VfDxo1Px0V4XU3hxq7WQS0ibtF5dH9e3ztaygDyxwazYk8NMhL5H0
        +rhNia+m9mQgMWBFxRtKeeL2pSJBWDR3588OO7g=
X-Google-Smtp-Source: ACHHUZ4BE+KzjTRXBEbDF+HJpeDBrxs0YzNH+DR20LaX5B3cHEV9XXwWWJr2+ABOsqebvzyOxejYCX/a0n3DEUf0sgA=
X-Received: by 2002:a05:6808:13c6:b0:39a:b1e4:ef28 with SMTP id
 d6-20020a05680813c600b0039ab1e4ef28mr12779831oiw.47.1687162302862; Mon, 19
 Jun 2023 01:11:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6359:6e83:b0:127:8127:f692 with HTTP; Mon, 19 Jun 2023
 01:11:42 -0700 (PDT)
From:   OFFER <diazanna810@gmail.com>
Date:   Sun, 18 Jun 2023 20:11:42 -1200
Message-ID: <CAO6W-YKuPrPw1xEt+cBfSuQafkrBhFJvH3GnDupY+T60ApsR0Q@mail.gmail.com>
Subject: Greetings From Saudi Arabia
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Sir,

Need funding for your project or your business ? We are looking for
foreign direct investment partners in any of the sectors stated below and we are
willing to provide financing for up to US$ ten Billion to corporate
bodies, companies, industries and entrepreneurs with profitable
business ideas and investment projects that can generate the required
ROI, so you can draw from this opportunity. We are currently providing
funds in any of the sectors stated below. Energy & Power,
construction, Agriculture, Acquisitions, Healthcare or Hospital, Real
Estate, Oil & Gas, IT, technology, transport, mining,marine
transportation and manufacturing, Education, hotels, etc. We are
willing to finance your projects. We have developed a new funding
method that does not take longer to receive funding from our
customers. If you are seriously pursuing Foreign Direct Investment or
Joint Venture for your projects in any of the sectors above or are you
seeking a Loan to expand your Business or seeking funds to finance
your business or project ? We are willing to fund your business and we
would like you to provide us with your comprehensive business plan for
our team of investment experts to review. Kindly contact me with below
email: yousefahmedalgosaibi@consultant.com

Regards
Mr. Yousef Ahmed
