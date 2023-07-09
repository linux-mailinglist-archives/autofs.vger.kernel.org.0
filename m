Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B52D74C11B
	for <lists+autofs@lfdr.de>; Sun,  9 Jul 2023 07:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjGIFgN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 9 Jul 2023 01:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjGIFgL (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 9 Jul 2023 01:36:11 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8169E48
        for <autofs@vger.kernel.org>; Sat,  8 Jul 2023 22:36:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b8a8154f9cso21575995ad.1
        for <autofs@vger.kernel.org>; Sat, 08 Jul 2023 22:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688880970; x=1691472970;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=iCEi1mQaXTU5pptPp97qG3NbTL1qwkHreeQeP/v3tYHUH2iDhhWUWinzDs9LtS57HI
         O8ujQiyR83XJSY0gXbRLDU4wRdOnIjGrJjPnPN3k+nCZRj5pp90uca6tKlvW/1jz3FP7
         rRgBO/uKk03k2YbRnLTFw8c20r7iO7jjROXKN4CfLiqmpR9wHzU2MIPHECCxnaCxwUmm
         1gwbbQnkPJDYUF/3QBy/X18MegVQzQP4K8reIA4eyNurKQY86jVav6NYBE02x6kMGFUA
         44sdpnKa8dmRhFC7GvmeRoXrl3qJmT0Q80xa8XsLPcUFj2fuP4dSXzaNidfH9iTzZvFS
         IXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688880970; x=1691472970;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=bRrlb0PZG90yeiJIP86cdzp9xb4Te8rgmHFA46OEWiuKPK2rEINo3WpgNhYi6TBvK0
         BSM+iGXQNTL4LsQT5D6YWxRGKDy+IeazJrvZol9ap6MDwIqDYBSwE8ZD6bpUquv4+G9G
         UtpK9tYxqhEDCTLQHAqmNipIGtKpisW5bi4AezwPR4Pfvh5GEMyBWq+TlDLd06pGe7A1
         myNdaAmqIxlQPyO9LdWChjFSL7XASLabXxIshvQVV0rB9FYN1ubHAOCJBYaiuOTPH1ts
         +UtDyqI6aNpgJxgB5xF9ettLI+OOqUfognTc1BSeUNHkzpB9ZTWY928IQ0t5GXkkZfpU
         OUnA==
X-Gm-Message-State: ABy/qLbUlZErVhdCZxP1sqICU0nWyoKnyE/x9KRH/leUejejArkzdA0g
        W53GrrluEsoAmVUPDactt4ecHRbJCWhjrW9SVm0=
X-Google-Smtp-Source: APBJJlH+0ZHz796ajOpyiou8mqamdHVbkjCtdsS7Vh1lgQIIsmMeU61t+OTdwq6rel0jOia1P4RoY8FYJZ+m7cz5uqE=
X-Received: by 2002:a17:903:1c9:b0:1b8:6984:f5e5 with SMTP id
 e9-20020a17090301c900b001b86984f5e5mr18778481plh.12.1688880970185; Sat, 08
 Jul 2023 22:36:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2595:b0:1b8:1687:b3a with HTTP; Sat, 8 Jul 2023
 22:36:09 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly004@gmail.com>
Date:   Sun, 9 Jul 2023 05:36:09 +0000
Message-ID: <CANcht-Rdvqg1EnfwR7h0DLfnqKzZDJDJhaXn7-Td3NS98rE0Mw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
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
