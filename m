Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC426394EE
	for <lists+autofs@lfdr.de>; Sat, 26 Nov 2022 10:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiKZJnN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 26 Nov 2022 04:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiKZJnN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 26 Nov 2022 04:43:13 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBC8165A5
        for <autofs@vger.kernel.org>; Sat, 26 Nov 2022 01:43:11 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so10146717lfb.13
        for <autofs@vger.kernel.org>; Sat, 26 Nov 2022 01:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oi/F08hZ8Jbn5bR0OpWZMCQPxutfniWGDRl/ffn2c4=;
        b=TtWh/IVTxKtqpmEPZ89mjPpbCvdPloX9SPmy0GAIM0Iy32GT5O9wlOLldAJGweAWyz
         LtNrSW8EjG72OAlZh7DheH+yCdQ3w1kk5gIeQiBCjiYAOcxIyGjwfHDRrVhWt2ZNNfdM
         Hp6wfz5mEGSYtE8yJEiWpi1zRu9//O5ClsOklqotrQ1RAsqPNOmvfpurEJ5LST0mm+y0
         9J/rQuZnwKNZuiJYqM8j8YaluMLNoORr2E4M343luQoE+d112JsfHceQmBDiKrT8vjm+
         vYaUMGLVWzIHUmxCZn8RSTaFMQLCNRKXfj1zogy6GKBCM3JVW9hfePjA0rlfBpOm+lgI
         2RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oi/F08hZ8Jbn5bR0OpWZMCQPxutfniWGDRl/ffn2c4=;
        b=ldvjQqgvxef9rpmSpQgP+cbpWFkOR3+SwjOxyKl5Mmq1mKs58e4fN7YUi9S1R1Unc+
         PIT7zLDquN17ruNiroDIRrm6BQRhA6XqfX+cj2I7SIVyLUDADKEz9MGk+/+o3xCCXt2v
         CqQBArU2jumzPYzxEGxjbi7uZOYy8N/KUGToIWHbm256+43vf4V381TPU0hO2Kg+isxW
         K4XOEOmBXn3UtNYb3AGiiV7PxVfgmt6uZ3PqBmOVeT8UWyu+dk9+K9Qt1B/G4APlwQGR
         axz4a8WWC9DJiPkFDZ01qEc+bHDmDhwum95r+LHHTnCULhqKytItSreElbqJ02JoqxzK
         Oj6A==
X-Gm-Message-State: ANoB5pm+rFv/nrYpbYIZtwlyJ9mCZuMFlTjeVLrZNdNsNPgN8zKF6kSf
        Y2u+8DEvwdpRVOZzi4EU9St0Tg6g6r13iRHFucA=
X-Google-Smtp-Source: AA0mqf5rzFc3+VsbBmkeGgs8gMicApx+gvIz4SCq+UQ9kBJD2YrPt43ORsjqESbD6Fqvr3+C2UzWOwkfzofTvvERDB4=
X-Received: by 2002:ac2:538c:0:b0:4a0:5393:3749 with SMTP id
 g12-20020ac2538c000000b004a053933749mr14296885lfh.494.1669455789826; Sat, 26
 Nov 2022 01:43:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:b554:0:0:0:0:0 with HTTP; Sat, 26 Nov 2022 01:43:09
 -0800 (PST)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly021@gmail.com>
Date:   Sat, 26 Nov 2022 09:43:09 +0000
Message-ID: <CAJaQ5HtH1LfgJYwhvEJ7hQC7ERY-xC5uEQQqwgYxEWswoiuZLA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

-- 
Dear,

Please grant me the permission to share important discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Best Regards.

Mrs Nina Coulibaly
