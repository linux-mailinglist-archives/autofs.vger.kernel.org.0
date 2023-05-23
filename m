Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 511FB70E2F3
	for <lists+autofs@lfdr.de>; Tue, 23 May 2023 19:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237950AbjEWRGS (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 23 May 2023 13:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237951AbjEWRGR (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 23 May 2023 13:06:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365C4C2
        for <autofs@vger.kernel.org>; Tue, 23 May 2023 10:06:15 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d2467d640so2519b3a.1
        for <autofs@vger.kernel.org>; Tue, 23 May 2023 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684861574; x=1687453574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D4jJBdsw8v5z1Hj7e4NkWHnBQGpeGcsx2kEbP6mIWQ=;
        b=ln4dCoJzG69l0bBJ66KX8uAKPONQc33WsyrsJD2qkfoU+XgCrb4Ky7e2c7ejfR3RfW
         OF/9Ad54Mh6U0/dlwSmvD15AmN5ad11ggoJYfdYnbUxhiAh6J+yB8V92GYw9uJsD9CJT
         GZ8P1zrI7yzwZfchnshDFmU/ZUIQplyuqIV/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684861574; x=1687453574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D4jJBdsw8v5z1Hj7e4NkWHnBQGpeGcsx2kEbP6mIWQ=;
        b=gaDgw9x0PV6d0Kde+XEPeGPSRQGeqtjRBaw/CL4tqo+xkHjkkUD/1xAMsOMu10iODN
         muG/WqDzV+6gji1hueNym2YZ3h5Ue4IF1lddVF28J3Q5d9924g+5yB0IjGQ2ETvDuqTD
         G0wtw1JrwiUz9BM/WLLdg8WL8r1iATsdvzoLduQNoTXe8ss390ERqO+voyTMB5VVoTIW
         H0Zmr4ejAzWB46mZrWLw+ZbyDqD7O2b6KBTZlaQzUWpXP413gyZFYNGAOoPnd1I72WzO
         WbDxJsjabolX4MfSB0TZgETIaVvTf5fDs0L4BFtRNB9Xo7jhG3/QHyS165geDOPvHNY1
         i39A==
X-Gm-Message-State: AC+VfDy72++NSJEcejL2/tPUtq+Es+vxbjAWaw3T6cKkyHUSsO6h1ODy
        TB176zMuZWgTp8uLRMd4Nd7WfA==
X-Google-Smtp-Source: ACHHUZ6Iu7uTc8qj06melcElk4wG/mkYt9xsoFCNr5WU4few+n4Wb1U5B20HKwwiuBR+NHUrnMzvlg==
X-Received: by 2002:a05:6a00:14c4:b0:647:e45f:1a49 with SMTP id w4-20020a056a0014c400b00647e45f1a49mr19188735pfu.4.1684861574564;
        Tue, 23 May 2023 10:06:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0064559b58eb8sm6035544pfa.154.2023.05.23.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:06:14 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     raven@themaw.net, arnd@kernel.org
Cc:     Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
        autofs@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] autofs: use flexible array in ioctl structure
Date:   Tue, 23 May 2023 10:06:10 -0700
Message-Id: <168486156843.2168554.9330529184813281577.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523081944.581710-1-arnd@kernel.org>
References: <20230523081944.581710-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 23 May 2023 10:19:35 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") introduced a warning
> for the autofs_dev_ioctl structure:
> 
> In function 'check_name',
>     inlined from 'validate_dev_ioctl' at fs/autofs/dev-ioctl.c:131:9,
>     inlined from '_autofs_dev_ioctl' at fs/autofs/dev-ioctl.c:624:8:
> fs/autofs/dev-ioctl.c:33:14: error: 'strchr' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
>    33 |         if (!strchr(name, '/'))
>       |              ^~~~~~~~~~~~~~~~~
> In file included from include/linux/auto_dev-ioctl.h:10,
>                  from fs/autofs/autofs_i.h:10,
>                  from fs/autofs/dev-ioctl.c:14:
> include/uapi/linux/auto_dev-ioctl.h: In function '_autofs_dev_ioctl':
> include/uapi/linux/auto_dev-ioctl.h:112:14: note: source object 'path' of size 0
>   112 |         char path[0];
>       |              ^~~~
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] autofs: use flexible array in ioctl structure
      https://git.kernel.org/kees/c/e6d6886d469f

-- 
Kees Cook

