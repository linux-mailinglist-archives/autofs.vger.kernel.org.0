Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65867780C48
	for <lists+autofs@lfdr.de>; Fri, 18 Aug 2023 15:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240900AbjHRNI5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 18 Aug 2023 09:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377029AbjHRNIc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 18 Aug 2023 09:08:32 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56FE2D4A
        for <autofs@vger.kernel.org>; Fri, 18 Aug 2023 06:08:31 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68896d7eb1eso743413b3a.3
        for <autofs@vger.kernel.org>; Fri, 18 Aug 2023 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692364111; x=1692968911;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t5SFEzHA7UMaN7JCcAac+3FeaRCdvcn/YsILS93/wJ0=;
        b=fn2V0TJMSr3cqkJDLLxyTbZZuQv5Z49ZLJMrBpgmKCxyDyWss9rN3IOtTcJbla7ONB
         OCxJD39brNRpW7iMe5QghQy3qQk0reB1pLl3aosrpd2HQkyaRvMoIpzG6JscjXTTfwP5
         HgI1+J+efY1c7zjdt3WnairjctU/OrBEP8Yguh04h/gA9fvks3AvCXfuhszVasrKDYet
         +xxltzpIdmZXab0n9/pa5/B4vemYrC+pECSoCS/S9R1uMEZqhhgORN5vTKtPe9d3JLUO
         BMc6NqmtPkjpbdKRQNcgb8vL7R2GFhH4KKiUD36u9PAqAHjkg+M0uREqkCMsmFi4pxU2
         42JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692364111; x=1692968911;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5SFEzHA7UMaN7JCcAac+3FeaRCdvcn/YsILS93/wJ0=;
        b=Ch8CkV5qCcUhcPu5A3p64Ag0jjEtmQvARJD+IFPi58xdBVjTiqGQDHOO2Mjoh+Pt6E
         GiLncyZrMji1Tm8QVN0iENfifRdmwNGqSwtDgw6hgE3+qhv1hmeBe7xSjasJ50jXH86S
         uv4CSfIPbCzL98A/Wrgk4dxncYEe4k571mBMhYRU+p3nTiK8mvEmFYBsqolugNqsfvxl
         Af7TLY+xAkdz/U29iYAIfOyau//IJcKFcu6XRkDWz0PnnOvbtBQjizdEQUpWiCC+qeRt
         GVjFS81p4l+1GU368pAlMr5AA9C/d5MNB7MlOK8o/2pruvnZOIahAMdkF/qUuc0nyoE9
         Ac9g==
X-Gm-Message-State: AOJu0YwTIDrkMdXqTxF2IijU9xpiahUJTmWnTy4hy4nwAnmPJ8aA/0s5
        RoLcbX18HplVp5wswM3Z9lSRJGuS2x6tsP/jduNKSIhD8rZgcg==
X-Google-Smtp-Source: AGHT+IGb/pjvH+D9I5LlFO+g3/Slyqmf6Ri0KaKhotUEVX7z4H04Y6VkiDnMQHmApYdNrnS+e+Pg0dZPQ1/CgE25BkA=
X-Received: by 2002:a05:6a00:850:b0:66a:365c:a0e6 with SMTP id
 q16-20020a056a00085000b0066a365ca0e6mr2685232pfk.13.1692364111245; Fri, 18
 Aug 2023 06:08:31 -0700 (PDT)
MIME-Version: 1.0
From:   Robert Vasek <rvasek01@gmail.com>
Date:   Fri, 18 Aug 2023 15:08:19 +0200
Message-ID: <CADVsYmhgT=E+o3r9fEhQT2Wg04MJqeYr_xt0pDV9TTtFQjFrzA@mail.gmail.com>
Subject: Sharing a direct map
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear autofs community,

is it possible to bind-mount a direct map without triggering the
underlying mount? Or is this considered simply "beyond stat" and
cannot be done?

I'm trying to share the autofs mount into a container. While indirect
maps work as expected (in the container I can see the autofs mount and
then trigger mounts inside), sharing and bindmounting direct maps
triggers the volume mount immediately, and the container sees only the
volume.

Thanks!

Cheers,
Robert
