Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947F3573DB5
	for <lists+autofs@lfdr.de>; Wed, 13 Jul 2022 22:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236883AbiGMUVu (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 13 Jul 2022 16:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbiGMUVt (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 13 Jul 2022 16:21:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4562F2E6B8
        for <autofs@vger.kernel.org>; Wed, 13 Jul 2022 13:21:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id j22so21855154ejs.2
        for <autofs@vger.kernel.org>; Wed, 13 Jul 2022 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=GVEHNPUTatn0/EgzlBwlVA2F0VIGfiUlBht1WQ5TzFtez/RkqOOu4CjUlsQY2qFzlL
         z8lYr+do0YCJyHkSkgklUDQxd7Xotmj/SUo+lctn7dTxxrSuoS+qSp8MZ6SQBSjAcQgd
         8RsoqAUYTIkc7pBBUNlhWAEjjCd7HX2/V5o8wvm3eP8lGSpiAHkFIoTrqDn2Y47JTkUy
         Gn+eyvAsVYhs6QwKm/2+JUttIrJ6kCdUK9OIh4xHPa7Lw6KI0XViVk1kQB76AZAuJmi9
         x5FJ9Ug7V4uE6i83FAs0kn3GYAlrvD2gMRzQm+Rve4otHbsiEMICeiMWPcZ3V8yjXFm1
         ge6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=QPeHbYVFYOOLmzCQceYBubKb9c/aNw2kKSjEnvW9HH7ArjhVrnt64ct/MslEb2D8NR
         LWlyb1lQtHElTuWqW4tj74BLHoQQrL8PNqplSqVxBoaqNKj6eirZBRfFyMPBUh1Mnk4U
         p5DCiX+iRM7uBq5cpBWMLamKBA0R1hj7CnSVdL5cDnQ1sdh67OS+KoFX9nJnat1nwa6P
         ZTP9SNqSx303oFoTTkf1EUt2FbZcpsIIVAGAjCaKWsE8y39KvxjU8sKtS8o1tmopE7hw
         CbJvKRgY+KKkVBb2x1MRFD5rcxpJHag5AxZrm02UspOgFDhJe7ywosDapSWAHKGgodV0
         Is8A==
X-Gm-Message-State: AJIora++untZdLSd0rAZGUDPNsjsToE2fLv90+XKkxMR9Uq9x1M40OWg
        fYf9/2+EdrEkeqWqFzU0L26xtBGFukuDFRtnZ/U=
X-Google-Smtp-Source: AGRyM1tEPpa5XvmokZx1gcBC1sfZyma2N8RLhk4uCBaUSOGoL5kW1NT+WDNheftsKAnFhM8QC9QjIg9JSoQ/wlfTDgs=
X-Received: by 2002:a17:906:8a4f:b0:72b:615c:5af1 with SMTP id
 gx15-20020a1709068a4f00b0072b615c5af1mr5231409ejc.461.1657743706616; Wed, 13
 Jul 2022 13:21:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3907:0:0:0:0:0 with HTTP; Wed, 13 Jul 2022 13:21:46
 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <g87110731@gmail.com>
Date:   Wed, 13 Jul 2022 12:21:46 -0800
Message-ID: <CA+AJNSYLM_0am-5de=JXyt+MEymq+3x5nc-A1RN+9_z4eWm2xQ@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [g87110731[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [g87110731[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
