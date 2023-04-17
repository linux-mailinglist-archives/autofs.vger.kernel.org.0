Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2272A6E536F
	for <lists+autofs@lfdr.de>; Mon, 17 Apr 2023 22:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjDQU6z (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 17 Apr 2023 16:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjDQU6h (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 17 Apr 2023 16:58:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C11FA24D
        for <autofs@vger.kernel.org>; Mon, 17 Apr 2023 13:56:29 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fw30so14921339ejc.5
        for <autofs@vger.kernel.org>; Mon, 17 Apr 2023 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764986; x=1684356986;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYlqmqzmZQIzuckqyml+D+cUQfB/LAmhyfGQVjeCZAE=;
        b=Itppe3dBaIIudv0RnkMcZVkFwkPFk7ftOad3CZj4YfUTlOiZW4JLSoi61rCXLSp2xp
         EdYm4QpXU0fUNK6XA8sbH/3JjzTXCJTzulynDtVDw5dNMVtv/SiHfcpiNdDH88k2xVT6
         du4+S2O8UTLej47lfyYaa3+EWZhW+otk5aAWJL/ZOzycRzbK2oD2G9is/zqj/fzV9tlC
         3i2VE7XdsdPU77JM8f8lNpkI++Um19jII3LXE/4OxV3ZQfCzoPbznm0O23jHAd7ZvYHL
         kMqzGA8UUXRYrINVBgR6vpZLnue1XISngCTfDzJ03Lbhl3XxdhP9zaxgFbWVH2lfqLOl
         svkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764986; x=1684356986;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYlqmqzmZQIzuckqyml+D+cUQfB/LAmhyfGQVjeCZAE=;
        b=DFRHliGSOiUy0wCOLSKgAjQ1lOjUpwOxvLCBofzF19LoyJjerB0d7cOlfwDv6cfpD3
         v1bsRVysZDchjnebLN/EvSsw25MLfZJEm0IfhrRwrRTFlv1DqpFQtIBzrggZmM610D/B
         xJVVuKiP/WF25P6Gyzp86N6BgbiWBSAFYFNg9Lee4CHkFrtgS4TPot1XbRenKsp9p8fU
         QKG0lCo2fZxDGVVrahbpvBtu8OGyYG7vyxDuRtU7rvR7Pggmq3nw830uWoZDr7iTzPbj
         5kye8dozTXTAeSP8ao5cJcIn3NAPnn9AaeCnKWe2ivHkbOEPPPiXhKWwgkan9Sv+wu3y
         VrzQ==
X-Gm-Message-State: AAQBX9fPr4Fv688E7xdorGmNIcQqgNajA+t6sEmxsnU3gj/F1Sc3Hufe
        weZXk+m4JgMddWLYhvIIB3ODQl+EFjbFYVcmEcU=
X-Google-Smtp-Source: AKy350ZZvSHn4XIDN3Nu/HGbBsNKj0TGlXryL9t6G1SdlO9cP6cDa4jE9XYVwiKIvUFGUgWJkPVKNOTaAtjWxs6ZS0M=
X-Received: by 2002:a17:907:6d0f:b0:94f:910e:cca5 with SMTP id
 sa15-20020a1709076d0f00b0094f910ecca5mr1502231ejc.4.1681764986216; Mon, 17
 Apr 2023 13:56:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:4013:b0:67:49d6:b979 with HTTP; Mon, 17 Apr 2023
 13:56:25 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly79.info@gmail.com>
Date:   Mon, 17 Apr 2023 13:56:25 -0700
Message-ID: <CAA+U+NJvX6LXNERy=fJxLUX6NTUBOc=qgC5efzQP59Sb3jio1w@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
