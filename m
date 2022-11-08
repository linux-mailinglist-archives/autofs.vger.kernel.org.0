Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFBDE62165D
	for <lists+autofs@lfdr.de>; Tue,  8 Nov 2022 15:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbiKHO1K (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 8 Nov 2022 09:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbiKHO0Z (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 8 Nov 2022 09:26:25 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0D325DE
        for <autofs@vger.kernel.org>; Tue,  8 Nov 2022 06:25:13 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id b11so13947864pjp.2
        for <autofs@vger.kernel.org>; Tue, 08 Nov 2022 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=qJPWO9SMfKs9CV4DzOtfpg0tG5L2kEZQtV/LBBChMrnKplvig/HcfOA36QzOFbaour
         tgINSm9CFH0IH0weUkbi8oL7C5P0uFU99A+FANpQrOPV/x2at1b6HjUUAphEgu/Nt2rO
         YdZzEeguInvIt6hR0YTDbuGc0g6QmBH3JOdUVEiMakuZ8pUv0rSqDGDPPz36WP9L+M70
         Yi8Qvn61/fVJa/s6+O6bNGj9Vrx81J7VmEWQcrrTipgg1zMWjvYHOXsRX3Tp8F7t1isZ
         URWNY0E6DDGhkUjSdRf6tRRt6Dm01iRomcQNGIBkoA7vu4q8ZFmcmXCe9DgPR3TaW/OT
         odpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=GHtHTpMlsHJnhA9SvEznmQoODnLZuulLTOKhYeLlVUbbw2ebSi8lxJ4MZ0pS98+Wys
         1XRaMmtUOq++N5St/tCU87zTFHzt0QQvxxHORCfpab04RntFWgjE2ELX5WVPigjgX/ce
         QSaTPCkoiLvIBi58SaIsNL3HN4JqWAimhbVsH00ZDVUubpilFGbUWpc/L6cyA1I06toj
         MVZertkmi3EFbukoe1hNaSD3oPQn4u0rJs5b+Ekeb4NBklcRnnmJl8oCDn2wujTCPkk0
         nEuAQtaeq8YIGYl20kuQ4ZYC4y1+0Rtj8368bJTqj8SpzyVJIGE5xA6Gx/dhjfJfyMs7
         5gkg==
X-Gm-Message-State: ACrzQf3oMe7OGCrvYM3ddRIetE++G7eRQ6vS06VIPdyl0dzbpDSggMIO
        17YS1PkG4IKx5kEEsQKbLqsIr7Eigfuy21gbHbo=
X-Google-Smtp-Source: AMsMyM7xjnW3BCIcPmRXceI8CMPrgJsNpwknP0oXmxg9pb3hPM8UnVyASTbWsNqLc31U8nSLRepoWwOH4L/DHUye4LA=
X-Received: by 2002:a17:90b:1d90:b0:213:c798:86f6 with SMTP id
 pf16-20020a17090b1d9000b00213c79886f6mr52558648pjb.84.1667917512394; Tue, 08
 Nov 2022 06:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:5388:b0:85:81c6:896c with HTTP; Tue, 8 Nov 2022
 06:25:11 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli11@gmail.com>
Date:   Tue, 8 Nov 2022 14:25:11 +0000
Message-ID: <CAPBO+FJ3Nhd2ncX9Z_fDUqYStiGQU821nC6EEFSDx5iCTdXkaQ@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:102d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli11[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli11[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
