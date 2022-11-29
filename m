Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDAB63C8FC
	for <lists+autofs@lfdr.de>; Tue, 29 Nov 2022 21:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237229AbiK2ULc (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 29 Nov 2022 15:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbiK2ULc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 29 Nov 2022 15:11:32 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCA75917E
        for <autofs@vger.kernel.org>; Tue, 29 Nov 2022 12:11:31 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id gu23so18298425ejb.10
        for <autofs@vger.kernel.org>; Tue, 29 Nov 2022 12:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=DU+1bBPpo90Nd9wWPtGUxO3C2geuZDaAyxhsRDR6wc8yvU2dmurzOyz7f2rZFSxcLw
         Jxb4jky2NXKhAR6LO8hkQwaQN9LpgIePxtUF6vZqFQG/lRxD2w7J8i36y06MXWk0/OP1
         pWgGKUm0ZMz5AMTFFJnViZmDzWY+ovOWC2hndopP0+nyykUgzsyzFb7RRED8sZ1JVvlJ
         Ithu22rotYllfg1XZ9iiqiE2+nIj7sEvOrIVqhI4cYCMFHlUGpDO96Wb9R45oxsoeR+b
         /b7n3TqWV/HJViI8t22PnFNE8l3G4asNdLITQ9MJuX62fSLy9CfZzPG7G4f21axsOOoa
         9qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=X1DUfDN/XGfX1egnIAAOsbU/2vv4kFPAB0bvqxUtxapxHd1dkB5oJMVSktMlc6/HBD
         8rMk9oFumkbZev/EQJwvR46F6qdqIcGwLetdwS+HIUd0BNRnqu2wPayla1oDIhh77fwW
         nam+cKLSEpgh4izV8GFl5jwrOEz7aEdfK6MAaycD2RgR3RIyx8PTPI2FDJHATYAduAw/
         HB7v46FpZ9o1va1Yd/vZzpfF9abPq06lYxPLbiNu6UzKqDu7pfmfywHxwhika6/7J8Bo
         ZE9Ds/GxeagRzhfBEc1aUhgn8q8XVGOHaJArdZdrE6r/hgLcG6waefiGESqsQ6S4ccAt
         uVmA==
X-Gm-Message-State: ANoB5pk/qCtailEyonzb+9DuxzuAnQd6udjCxg6fAau0BmF8p1Eco72L
        nVLUzGOTG39AkXfbuAb2ue7GPFA3dooUKLBR2EY=
X-Google-Smtp-Source: AA0mqf6wc5Tqbcz5gySsZZG3lkzsnMWjWT17VZc2F3MgMaAU3d2ckCPmafwxfgJubg+9zCngRGzvBREFayy9lOsQYxc=
X-Received: by 2002:a17:907:c70c:b0:7c0:7c22:566b with SMTP id
 ty12-20020a170907c70c00b007c07c22566bmr8085780ejc.601.1669752689579; Tue, 29
 Nov 2022 12:11:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:8747:b0:7ae:e68c:886c with HTTP; Tue, 29 Nov 2022
 12:11:28 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <joykekeli3@gmail.com>
Date:   Tue, 29 Nov 2022 20:11:28 +0000
Message-ID: <CAKaeHTe5A4=GO69uCc1bMpCiO_yCQQaYBh_aDbPGxGGFeUzbkg@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
