Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20E6F770DF5
	for <lists+autofs@lfdr.de>; Sat,  5 Aug 2023 07:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjHEFy0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 5 Aug 2023 01:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHEFyZ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 5 Aug 2023 01:54:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4959F4ECF
        for <autofs@vger.kernel.org>; Fri,  4 Aug 2023 22:54:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso4765760e87.2
        for <autofs@vger.kernel.org>; Fri, 04 Aug 2023 22:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691214862; x=1691819662;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=UVdH/uVvE/3OtwyRz9eNdJUatq8zqVGzuRpOBq8L0pWm/C1EWjPiC7OAkrX88isKUj
         uMEPoYXkr67DSiAE3FzG2fxWF1N7vQAD64agGGEpveH5y/x+gWa19sCOGBvz2Y4IDxKH
         MKffdAvCJfCPl8LG70Eo0VTYBMDSyAtJJXlvMR9EmdysufGwbXvNltidq3xpb8scnqN5
         BEThuinH8iE3yUJHwx74N6Wb4iVT5Gnw1Nw0sjf3fuqTlIkLU9OnU7DvO1NsFvo9lne/
         K4fE6YaF408wzsEIBw33kLg9Z46JdRUyLrijKZmkdqu1+5mKVm6f8Xz/9bpQfaCgTGC2
         YABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691214862; x=1691819662;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=ENkTLOmcq8eIoRRPEpaNm+gZEWJtx7XVH6bv3GYQ7LB74VoqHWg0iRUZ66GE06VVEG
         iiLTe3qjVA1F72PSfVO3imZ6ZAo0LEDNAIy7irPXwojDQVKNiiV4i++aBu3r1grVoUGk
         EeWj2+k3Ylwa+0MjjY3iRHCAY14EVFLvqQH+QwyGMRDTqh/s2DIDyhpODg3xfcdaXqFI
         TOPvWR81B++JQNaPt16Zm93igKlFT/CVAe3nM5uxZHoLTsva52ByHdtfV0YBRsf8yLB5
         g1l8srDO+7lJ1B0yz4B7JumkqKIccEAb6LGJrB8OaEnFH4K4C8fi2fjYHJtlauQmBnLT
         xLuQ==
X-Gm-Message-State: AOJu0YyvPZ5zUiKhzAtz5nPh2O+J61aYGZ1o9zI7qgYix+XdwdBDlnR7
        Z1fpnrBOA1m0FwQVo/1SF4nOEJlCgwTBWiNIrHU=
X-Google-Smtp-Source: AGHT+IGNLy+88mIf953pbxZ/gP6SNdlMDv6qJAfSx7yoZXd2pKah2ZSWkDOa0RcR9ka0jf2gUBHOwVT+ULQKuZPxd4g=
X-Received: by 2002:ac2:55af:0:b0:4fe:589a:857d with SMTP id
 y15-20020ac255af000000b004fe589a857dmr2337428lfg.34.1691214862365; Fri, 04
 Aug 2023 22:54:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:698b:0:b0:311:10a1:4438 with HTTP; Fri, 4 Aug 2023
 22:54:21 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   BINTU FELICIA <bbimtu@gmail.com>
Date:   Sat, 5 Aug 2023 06:54:21 +0100
Message-ID: <CAJvvqXXwmKPZSa5QEn1wjC=tQmcsUwH=kLZwhS=WxnDDvwx3QQ@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
