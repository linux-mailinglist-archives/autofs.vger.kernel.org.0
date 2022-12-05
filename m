Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D282642C9E
	for <lists+autofs@lfdr.de>; Mon,  5 Dec 2022 17:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiLEQMx (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 5 Dec 2022 11:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbiLEQMv (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 5 Dec 2022 11:12:51 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD22D4B
        for <autofs@vger.kernel.org>; Mon,  5 Dec 2022 08:12:46 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id g1so3785522pfk.2
        for <autofs@vger.kernel.org>; Mon, 05 Dec 2022 08:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=N6uyxg4I806368LflAvb16MeLs4lWLtJvOSI41emS0Zst4+sJXlmawS1cnDQRqtCVn
         XfkyemKtqKT+9o3sZ7iP70hXOogzVec7VlAglUOka1QCICTj0V2Ra5NCMzwF/8hF8Bd2
         5Idlo8/1/6NVJXytg37N5h3KbWgqb/2z5G7+4PUZwQxGvCAMkOE8MAR6qK4MPmfP4bsN
         2RinLwygz+sYp9irRaenZswFKgMv34wShb62goJp4upPDRdarDUkU1Cve94Q5zAE0E59
         AzhOLUUNaSHzDX0VLwQ9WiBcfTIoTc3qGaY3xKcwaUU23v76+sRE2xesxJsSHmAui1zk
         gGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=Mys+7BL9KqSl1vOPuu5ihaL2remNLnOsp8piiKaJX8+18oJvE/la28e4DwP4QHjJQr
         NR0V7zEtLjUqOXZ8nB0aPHtAfMEBa/86DR8CY7A2bF1E6ZjIWgYYzHS/X6xq9X+hrJVQ
         jfXSFGOhSzaYIoTjoN1i8A1f9ITCJMhoBPi3NFSieIl201GqphmaLu3uu1go2CmtTuJl
         pukWWoNIr5EitamfNW4M94bLQWb6BDMYbt9xBtYM5yGHEcpAX8QCuajMi+b2gVhKxQpx
         mabcCHTsfJyyvmbZ2wgSCmPYXFgsqXY8LylTtSzwyP+fJzdioh4S+y9LTTgka55I4UKS
         dWkw==
X-Gm-Message-State: ANoB5pnfr6YqeKvTfWg0cYbKzMl5mep30gvCbdn7WOIRIHpWXW0Zgrll
        mUBvfetD8hNW9V9Xa2UdpxMcNnrDeUTLyHpRSRA=
X-Google-Smtp-Source: AA0mqf5dj6cgnOirT53uW3WrGkQWw/LCLpodUMslLjooOwpqlDn+V6xE862NWxuV4pLcW36qT/tkZODX9OPTE4bk8NI=
X-Received: by 2002:aa7:8d8f:0:b0:56b:b112:4a16 with SMTP id
 i15-20020aa78d8f000000b0056bb1124a16mr88754226pfr.66.1670256766221; Mon, 05
 Dec 2022 08:12:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac4:d550:0:b0:586:b7c0:c1cd with HTTP; Mon, 5 Dec 2022
 08:12:44 -0800 (PST)
Reply-To: phmanu14@hotmail.com
From:   Philip Manul <dorula741@gmail.com>
Date:   Mon, 5 Dec 2022 08:12:44 -0800
Message-ID: <CABrs-X=a4jCaim+3xfzpgsWZdDvb6mudOgCsW7LQXQ8LcRtF1g@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
