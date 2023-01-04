Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C27E65CDC0
	for <lists+autofs@lfdr.de>; Wed,  4 Jan 2023 08:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbjADHlk (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 4 Jan 2023 02:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjADHli (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 4 Jan 2023 02:41:38 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B7064D6
        for <autofs@vger.kernel.org>; Tue,  3 Jan 2023 23:41:38 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id d127so27555723oif.12
        for <autofs@vger.kernel.org>; Tue, 03 Jan 2023 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgsU3TKYj1ea+xyRd1YeQ6QbaDveXYDp3sPPYkvfdzA=;
        b=G0MQ8wTFzEzzMJYuMoZKUdeVBfIN3vqvnQLbVUCy0LwE3NH1nwnbaIoyErDh4bdQkk
         cxMoIkg8pX1heTauUvbCEA4LxBCKxsThDkJ2cSWtLQNnY4gsOnC/W2/EiG3Ke+wGQBLb
         FOWQL3nB68jlWxb7Yw2DumkRGhVeCFJyth3AefuadOe+gcE7oiqJknaMfXLzwQWLQglq
         w4705lCzemkJ8bSinz7wquuH4mcd22N9XQcmq+PW1uwUSspJnhnV3vmlkwcYh7Xld2jd
         Tezi4UJVtb3A0dA4zzN+6CQBpmMox0X1XHDyQOHuxnGkrsIkTcRtyBkYYfO8vv5jqMG3
         thCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgsU3TKYj1ea+xyRd1YeQ6QbaDveXYDp3sPPYkvfdzA=;
        b=Gp+a/DPTaCQtFypZJanHblMsLReRQNxzKvcHRguQDVIQAHjgqSMu261eF6/5JO1Bxg
         cmMWTraMVeOhT4dHx2NdjojauIoPKBNcObRmOhpFAq+ZDHrv0G9pLr6pxCqYkSzb2q/g
         W2LPaz8/j1eIF0QAbHHMGTJTNm3y8JksbljKDZIwHtc5lbZEBPU72nAGww5Qj98QPP9H
         D3RVXPvtXHAP7GiT92+4eoTJJJxNGOHBgGYEIUOX9eSqKhqTLQz270SZA6ojoGBru4fD
         dD4BQYskNZ7qlnt6a0xrNd0C0xJD4+fY8qFY0jE9L8OOiUOpIfFmS+EK906lAzpg/gz6
         hI/Q==
X-Gm-Message-State: AFqh2koUk3MWAiiYmgIMm+HFBikWO6YHgPbqRTqNniYLGP1lDLo+tFSm
        Qr0W4kZztW/OPD1c0+dfHuam9mmdW8A56eT71xA=
X-Google-Smtp-Source: AMrXdXvJgZM1avLl+Ilult/yegaE5Rt8HH2yrwy4l5OcU1TQxEctknPzno04pRTy485IhjGyDSz/iGevZ3y7RtrVnl8=
X-Received: by 2002:aca:5a55:0:b0:363:a9b1:54b8 with SMTP id
 o82-20020aca5a55000000b00363a9b154b8mr876252oib.120.1672818097153; Tue, 03
 Jan 2023 23:41:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:3223:b0:e0:6f83:b69c with HTTP; Tue, 3 Jan 2023
 23:41:36 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <denzellg069@gmail.com>
Date:   Wed, 4 Jan 2023 07:41:36 +0000
Message-ID: <CAMa8vs_fWF+7thDQxKkvkDX6_rGQyxs2tM46_8sKoT0HBJhLvw@mail.gmail.com>
Subject: Happy new year,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:22b listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7597]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [denzellg069[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gregdenzell9[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [denzellg069[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Happy new year,


This will remind you again that I have not yet received your reply to
my last message to you.
