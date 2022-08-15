Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F6959519C
	for <lists+autofs@lfdr.de>; Tue, 16 Aug 2022 07:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbiHPFD4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 16 Aug 2022 01:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbiHPFD3 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 16 Aug 2022 01:03:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C667E643D
        for <autofs@vger.kernel.org>; Mon, 15 Aug 2022 14:01:24 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id g16so4322516qkl.11
        for <autofs@vger.kernel.org>; Mon, 15 Aug 2022 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=oKGo1aormwrl52kqb/T88nYa3hW5xfjYVgz929Sg3jNJxTFnalPzcWVsrAyDxrT5A/
         EZzndfC+ThXGoF2LQUGR+hRRuBhLj0/eQk5OE2G2Zi+9BAg2vkLJceBm07XEFDQGUSiw
         hwXFbLiocx2+/1Pm57yicxWrApgSdUBzFixig3dMLelpFMaRNcpktnFSnJ1KIGJ9uKea
         ncMzyM0PpAhbUl4YZa1icJoT9yiYqs4Akm9zuBXJA29Kj5VO3ay2EQtFfMwnA6ylYywZ
         bAnUPuzo85juf/3tYwgQ25QKiEMyM5kvSgeyG+Nkar6xCyZfiE52s+qYHzGltzBgcWO2
         34/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=Za/uMhGdxCSCGzUlNWEPdb/G/cqTMGwwGe12yRr8/i7nhcSkM0c/5gpIIKwH4tSOmW
         QFIgsuu3jDQbmY6MTV5IybVxh0B8h4SGbhuKdrgKhfye69hqL5NOPzgFXOu8HfT1zPlJ
         3brtcpwWCZk6ATEX8MUmGa+p/ICY3QQROMjxjFiwERoKEhn9fnoZkNF8G80+dQOWGEcQ
         8rsTQe6K92uWymOjUVFXWW2+VXuGlU8FRmN0ok4s7Jg15w8f1a9h3qr0qdOytvEnMFsx
         /v4ixT8Yb8BkiEJpehqJEv9KiiLkireyp+Mm0rFqIbnqmhkefN1fVEZ7fL9edz70i21T
         AaBg==
X-Gm-Message-State: ACgBeo3fQbLUcQPmPoq0LYrizAcCSsEhem7oH/U7bWPMW8HHp3nmdiug
        q2mzETi247mzd7g+pGL/87gG2meBwj0Qoc/hJCs=
X-Google-Smtp-Source: AA6agR7fUEJY4B4c/c/6X3O6IpuqSH0ua0Va3ndkhkqgac2RrB8m7IjNz4Jvg7jbkl9hU24dS03BOyTJNKWA4Y0B8fU=
X-Received: by 2002:a05:620a:4310:b0:6ac:f9df:178d with SMTP id
 u16-20020a05620a431000b006acf9df178dmr12964716qko.773.1660597283607; Mon, 15
 Aug 2022 14:01:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:ef88:0:b0:46d:3a61:256e with HTTP; Mon, 15 Aug 2022
 14:01:22 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Prof. Chin Guang" <dmitrybogdanv07@gmail.com>
Date:   Mon, 15 Aug 2022 14:01:22 -0700
Message-ID: <CAPi14yLyTqVBX6Y_8Bd34DR0YaARA_PfCmLOuFfC9dQjcRzmvw@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:72d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dmitrybogdanv07[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [dmitrybogdanv07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

Sincerely,
Prof. Chin Guang
