Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A506D707AC3
	for <lists+autofs@lfdr.de>; Thu, 18 May 2023 09:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjERHV6 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 18 May 2023 03:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjERHV5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 18 May 2023 03:21:57 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D456BF2
        for <autofs@vger.kernel.org>; Thu, 18 May 2023 00:21:52 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-456f19307f6so22898e0c.2
        for <autofs@vger.kernel.org>; Thu, 18 May 2023 00:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684394512; x=1686986512;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4kWzn6pxkecn7JMiXg/VymW/f2W9szhFxBJtG2FdMw=;
        b=I6zqNb6DGffFr5HIcM5LGRYZjWQ6kilBL1y44ol46AgwUw7F0lWVCpiSGa0eoFVa2a
         X3W03xajP/qyH/pl4QLZnjg25zb8mVtZhBZ44n4wAhzGc/14H6HlhMJ5s7f3qPZ5zIel
         cN0mFNfE3ogC+geduU6ntlpv3zcFfLDOnIarMzl+mYIAB/eAjTx/r7deV2JdGD0dN7kK
         MVNeEOl1DyymK4WFIkytEGwMNWIh2E0e3E0S8jJHhgezpJ3WddHtM+0BaMIu5EArrN7J
         FX/z+pqvVbJvJUSh3+pVew7eiHWtyd/cfmbz7wgYM1cLURUJ7lUVza8mMfAAD6IJBXxd
         719w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394512; x=1686986512;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4kWzn6pxkecn7JMiXg/VymW/f2W9szhFxBJtG2FdMw=;
        b=kQYrnhbcpXX8nm+4x6pcIAByTeS6x1KiBWomvzma4xJ4moYhor2DrT//EVTlUXXzIo
         XoA1MuXRxMBQwHndD6/lYsuhHBKjkUXtl5onRfd8WavkqjoHqX9TIcjJEXfqgHwuu5OD
         /hbuRurDMb9zsBt8L98MVmx/CdskYtA2bPAxHwY1ugm72YvyUcqze+8oQ44XbqV21PAu
         htLjMOfDD5+4fBWju2qAEzJC2TnlFpMNtDZknddPJtNPeXCQJ/umUZ9HSri2P9UFttEf
         lMQPJ73Ictt7kdkEBMw8UKI97yVxG4bkML0ptwY8zIROzv3UiEvIQsX1evrEND67kPTi
         LHvQ==
X-Gm-Message-State: AC+VfDy/paCpBJZuk3jVtEuVLqWK3nquT6IWjvkAghTvJzxm/0cSw6ax
        k99RMtDhAbY5ZoenzKZ6sUp6Y3T8fD4jkIJDhKY=
X-Google-Smtp-Source: ACHHUZ4/hwHsdRI7+rg4EpnH1634yORBMcrGYYuzhq0/aIhHScdwjN2q+aIgHi2wQrVzj7WSxjV+Dxj7pO+bQH3SB8w=
X-Received: by 2002:a67:ef84:0:b0:42f:cfdc:4803 with SMTP id
 r4-20020a67ef84000000b0042fcfdc4803mr197108vsp.33.1684394511904; Thu, 18 May
 2023 00:21:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2b8b:0:b0:784:1fc:99db with HTTP; Thu, 18 May 2023
 00:21:51 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly81.info@gmail.com>
Date:   Thu, 18 May 2023 00:21:51 -0700
Message-ID: <CAJws7ACgfQ01HB_dtvju3sDF39C3N6c+RBzRbZPQFCgJGDp1Vw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear ,

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly
