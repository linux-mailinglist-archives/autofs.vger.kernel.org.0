Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB39B47F0C7
	for <lists+autofs@lfdr.de>; Fri, 24 Dec 2021 20:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344302AbhLXTvr (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 24 Dec 2021 14:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239476AbhLXTvr (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 24 Dec 2021 14:51:47 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252ADC061401
        for <autofs@vger.kernel.org>; Fri, 24 Dec 2021 11:51:47 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d9so19231831wrb.0
        for <autofs@vger.kernel.org>; Fri, 24 Dec 2021 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=opHJ9ckdxu3g6Drcxqs+A1CxDN9j/2aabeYBcdMXH80rlmPXlYgYYIlEVsXpO8VwWE
         j2e4F3y67K09XjMmvRdJCbtzGirRr7RfaYg4s/7hcu/9yAVFb74eKTtzTxrqYUnXEgLA
         hcT49VbL5DLRdUWJ6e87KMldrNYjDAhZW/QtzumMrEeCdeond4hhtOYfNdiGIqFTNXBg
         kbPr8+HQybIj220PO5AQkA3nb1TQ8YpMgX/mkQEpHCG38BIkX/4Cadia7ogfVTjDNpiG
         sVmM/WsVgIudQuGhegQGrU3l6ss9h9CMFRSVaIJfIHpv87sLXbNMaBjoGj6yhLJN5aV0
         iNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=2BaB+2+HOmKnD481qTLp5W/ndG/+3aLRdyc42yJipZSOcwAnhfXHZw09OMYO7xRWu2
         OjU+2lbqchbuD2b77pGxj7WA9NWEJ4fwq8bbK4dS4/JZff3taaQ2xlGXpIzUHh5q+aiC
         u+snbzqr/XkxDTf0YT2VYIdVwlRnceEhrhJoiMp/3jnpptDIQbe+dh3z83V1SZvum3wI
         HSO3BASaqZAx1JC2posA0XNFKFCenGQzVtxpw1t0BE1TKl0x1uI7giab3vDpiN0RkMPR
         25O5GymvmFjvK6OpnwGICaUHkr0h5CaV7b8Qa+vX0yR0w+wWhyXCqNJQ0jsvjEJDgoqa
         QQKA==
X-Gm-Message-State: AOAM531VQOPYcsirPtoTnqE9VnFnOWxFZ+rEGbTJE6iT4YyW8MN/FLxt
        xRHdG0F45r6Wezrhmmba4DQ=
X-Google-Smtp-Source: ABdhPJyusmdFY+d2jAYlMXbWLFObdd9b/mgetKrdxpdjDYsTwr1tcysHUoRC6K9vQoEmjxEmB5HAVw==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr5552924wrp.212.1640375505731;
        Fri, 24 Dec 2021 11:51:45 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.108])
        by smtp.gmail.com with ESMTPSA id q13sm8161631wrr.64.2021.12.24.11.51.42
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Dec 2021 11:51:45 -0800 (PST)
Message-ID: <61c624d1.1c69fb81.97d61.4b0c@mx.google.com>
From:   Margaret Leung KO May-yee <kshirsha16@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Fri, 24 Dec 2021 20:51:38 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Bin Frau Margaret Leung Ich habe einen Gesch=E4ftsvorschlag f=FCr Sie, erre=
ichen Sie mich unter: la67737777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
