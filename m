Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8EB495F10
	for <lists+autofs@lfdr.de>; Fri, 21 Jan 2022 13:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350464AbiAUMfb (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 21 Jan 2022 07:35:31 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41734
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350502AbiAUMfb (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 21 Jan 2022 07:35:31 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F9A83F1C9
        for <autofs@vger.kernel.org>; Fri, 21 Jan 2022 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642768530;
        bh=ge4fc+rCbW57IEBtcy4ecz/BQRgS5JeiDYpuI8ol0ho=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=nQ/558gmzvTdOcnnU3Ct1HdZjFPyWNplvxyoXm1TfZ2/eNlihDKivrQs/Kf34JRpB
         Ecw+aPbiAXIZYhNNIvD2C0SSuqeAtEyYlRDqk2ucP/jb63kosCreA7YzG+ij5YxH6u
         1wMUK6q/SoECW2bGSrqsSmWaO9Tlty6Q/itkuISpBGjd7qWGHu8CmS+6fm8fvrngZX
         UgHuWnYBELFtRh+OWV9QAWZBKMUWjPh2rP66iv03yUgWBB26wkw87Ns9IHnCOBqNiM
         3K6TTsM4yGqL4lTb883ZYPxBx4nhOlIVt5qm67osoHC+KIsj0W2y5RhzJ9e0Sh3rkj
         DESTEhz+9QmXg==
Received: by mail-ed1-f70.google.com with SMTP id i9-20020a05640242c900b003fe97faab62so8923174edc.9
        for <autofs@vger.kernel.org>; Fri, 21 Jan 2022 04:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ge4fc+rCbW57IEBtcy4ecz/BQRgS5JeiDYpuI8ol0ho=;
        b=IKn59aSVH3/SiBKYo781RX7TgFq21YfjBaFrDchek9T2wLpM9URmBBoatuve1Goveo
         Mh25xxi3Y24GtSBnjN/yvdoE0sIUQOpcy9/zmca0SRBRbDh2hgGDPfqxhZpqYudbcUP1
         Ep00UoWOBhKZcksD6z7AJuEJnDOuPez1LlkeBZ0/UWm5W5gNmg8zD6wSpv+UjvnEh+Q5
         waAyBDNm6JxtnWpZSUczlzFSgfsyrXNH5zjb8q4QA/qd8Vs7k5tLxARiQvmsJksKNDHU
         yeJ5aSbedCEdDm4xwPyZoNrXRqMU0ll7yx6F2kWbvd4DhhBOs4Z2vuxPx2ca9MKaAac+
         6vlg==
X-Gm-Message-State: AOAM531XCiV7JsFYz4oGJto/n1ZffFAZzJ/YXgpNG90DxC+DNshcbmbe
        8zrCYFiXUfUSZjnognQ4p5C7eAJYx9GUjtUhC+YOguvoF7APRoSDOIZdITIzRGilCOZNIFbMDkY
        FL0FtOMl3eb24rh9DVLtw0MBUbyfssazc2OgACH1uwFbXxh+T3Q==
X-Received: by 2002:a17:907:2d10:: with SMTP id gs16mr3202652ejc.100.1642768529868;
        Fri, 21 Jan 2022 04:35:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9ydMaKv6kVF97IQOjWdP4Miw97ziBnTbvqvHk/eNPuHFQjCG7C88X3ujsYXq/TtSkgTEw11Enopd8B6hh5Jc=
X-Received: by 2002:a17:907:2d10:: with SMTP id gs16mr3202643ejc.100.1642768529688;
 Fri, 21 Jan 2022 04:35:29 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
 <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
 <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
 <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
 <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
 <25f3fdb0fff76a6d347c5e6e1f12d6c6dac40916.camel@themaw.net> <7967061ccfa8de983f7a0c0320547011228cd1f8.camel@themaw.net>
In-Reply-To: <7967061ccfa8de983f7a0c0320547011228cd1f8.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Fri, 21 Jan 2022 09:35:18 -0300
Message-ID: <CANYNYEG4uA8Tp5+W3=XHkXzaBWv1f9Sq5Re+oahGB4jNwYa6BQ@mail.gmail.com>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello,

On Fri, Jan 21, 2022 at 5:08 AM Ian Kent <raven@themaw.net> wrote:

> I think this patch might help with that hang.
> I may merge that into the original patch but it's separate for now
> to facilitate testing.
>
> autofs-5.1.8 - fix fix root offset error handling


This indeed fixes the hang after patch 5, thanks! \o/
