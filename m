Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6206E7681F1
	for <lists+autofs@lfdr.de>; Sat, 29 Jul 2023 23:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjG2VIH (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 29 Jul 2023 17:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjG2VIG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 29 Jul 2023 17:08:06 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB9B1BFC
        for <autofs@vger.kernel.org>; Sat, 29 Jul 2023 14:08:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c0cb7285fso6025566b.0
        for <autofs@vger.kernel.org>; Sat, 29 Jul 2023 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690664879; x=1691269679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=df0j41X3vQ99yevuaGGsVtpCGhFPoGbQqptBVGUtLL0=;
        b=JVqw/E6vJ+zeQv2pJYYhFUIjN6uVQiFzEzWWuPj1ht/efyZTykgi0B5qWANXflXubc
         rYuFLs9cRGQ2UUEvRpVI/UJ4DsVy6weySii/nzsOBxh6QVfSVCUBToxR/B4e5C7RD6+1
         VDMi01EcOD+BijeWsjd6meXj/zrosAnsmPhvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690664879; x=1691269679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=df0j41X3vQ99yevuaGGsVtpCGhFPoGbQqptBVGUtLL0=;
        b=UMxUpJDnc0GaFSC2rKTXrsppKZywT69wNyWMUrj99dsmU6Uydob1Ku+zj3VPzU6R9h
         4EHDBMyIlkDJ/W08rkisXCYzsr1FMams8ioTGpcUwT/lI7SLFs1fOo7MQq03BQ7rrG2G
         wJaMcx0v6wcemzoeEsNz1jsPbHxaRrKZs6sBr9e80P1l0ZWHZ6TgQudvSUR2NXGolRsW
         lykwvSsz1zlIzrcnP++Aac9diJaW6xXm3a/xfmVSXZLmJP8EkpZeexIWn/nQgul+XNOD
         mZuM5De598V2hE5v6AbbfXmq9jROE8z/4M02HK1xYyrqLozl7y/CXtdtKchv+mQIt4L7
         D3aw==
X-Gm-Message-State: ABy/qLYr0okoT6WOUaCqtyDr2UQeGm9KAeUxh1ux4fl2Z1o1fSiUw91j
        zqwgND4qQ/I4keX5D9X/0nCBXaj20jXtVpg1sXovxg==
X-Google-Smtp-Source: APBJJlEs7srhVJlMJn49ZLb43H0DJCO+1SbOdyJRS3JZ0RPoVZbtUk4cmOo51lOdvjNgPbrvjVCPlA==
X-Received: by 2002:a17:906:3058:b0:993:f349:c98c with SMTP id d24-20020a170906305800b00993f349c98cmr2863459ejd.4.1690664879320;
        Sat, 29 Jul 2023 14:07:59 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709067e0600b0099315454e76sm3684037ejr.211.2023.07.29.14.07.58
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 14:07:58 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-522ab557632so1576129a12.0
        for <autofs@vger.kernel.org>; Sat, 29 Jul 2023 14:07:58 -0700 (PDT)
X-Received: by 2002:aa7:c393:0:b0:51e:1a51:d414 with SMTP id
 k19-20020aa7c393000000b0051e1a51d414mr4358469edq.32.1690664878368; Sat, 29
 Jul 2023 14:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230727200041.21404-1-svenjoac@gmx.de>
In-Reply-To: <20230727200041.21404-1-svenjoac@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 29 Jul 2023 14:07:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgK9-Tx4BxYMrc0pg==mcaz3cjWF6-CBwVpM_BZAmf4JQ@mail.gmail.com>
Message-ID: <CAHk-=wgK9-Tx4BxYMrc0pg==mcaz3cjWF6-CBwVpM_BZAmf4JQ@mail.gmail.com>
Subject: Re: [PATCH] arch/*/configs/*defconfig: Replace AUTOFS4_FS by AUTOFS_FS
To:     Sven Joachim <svenjoac@gmx.de>
Cc:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 27 Jul 2023 at 13:01, Sven Joachim <svenjoac@gmx.de> wrote:
>
> Commit a2225d931f75 ("autofs: remove left-over autofs4 stubs")
> promised the removal of the fs/autofs/Kconfig fragment for AUTOFS4_FS
> within a couple of releases, but five years later this still has not
> happened yet, and AUTOFS4_FS is still enabled in 63 defconfigs.

Ok, I ran the script, and also decided that we might as well remove
the AUTOFS4 legacy naming stub entry by now.

It has been five years, and people will have either picked up the new
name with 'make oldconfig', or they just don't use 'make oldconfig' at
all.

         Linus
