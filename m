Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D87492525
	for <lists+autofs@lfdr.de>; Tue, 18 Jan 2022 12:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbiARLp4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 06:45:56 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47058
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240991AbiARLpy (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 06:45:54 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E8F703F211
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642506352;
        bh=DhUoF4775HIS0s2ajEPggKLHzhs6IflJ/uyhdhMLkL4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=llSriyCClnr2tqG3ToidEIVAa+o8dy/6yK7aXs51exEdBvgE3G7Usbhtvsb1aUJz6
         +5SDlls67xooirW5umvpqgbMErHbk12u9IoZKbaWMhMtH0ot84h2oeDKkUNHZCMkva
         18mt+7PgnHqDYssJVc9cIxL6KYZG/aFvKmhJ+b4DiKQ0Dxz+D6xpelxqhj6njOZbnI
         wk6aYSGNyWH6xUjuOOrqkXdeSfoUnWn2nns4fUHNCsjLXu0QYKfVA3otRf2qv4I1Xf
         qkTW3RncbvRYBSUhVjiyPRVj/ANx3kJCHj3MDpOIxPrtHSrjF6HwUu0SxdrK3cEZCk
         Ncmzr7ySXFjjQ==
Received: by mail-ed1-f72.google.com with SMTP id ej6-20020a056402368600b00402b6f12c3fso5330779edb.8
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 03:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=DhUoF4775HIS0s2ajEPggKLHzhs6IflJ/uyhdhMLkL4=;
        b=zcWJC41E/CJfTs//iQFsV2zI5pwIYNFchu5vFgEjIHfL+jS9qwrztQhQ3+eJnTVB9h
         Tlm+slWMdWaIPJ5DJjConbT2vD5xIGEZifh3QeKMhhrIK3hYxprlkJz5Fn+ccdmyyLnk
         2fietXkLCYCoIFwuz4SHPx98MqqDBeMRnpNrGEdCEc03XECF5TcpNJzCZzKT8+U0hGTp
         tGmTbFrQL7arVaLdyYgsQw1hiTU2yhfDF3IpWtRkN68vamc2mElMo+hKqJHSKQ0UZHW7
         bu1L3R7sT8b9EtCZVoXjEyEizpZLqQZRpLQWXjO3aw5Iz3XMSu4vi/OEHYtq0b1jDi2G
         JtBQ==
X-Gm-Message-State: AOAM531/jyypn9Kq+v8moZuPIxgBxCF4QxC8UG/h8DkSdyH4XtmWflcV
        f4Wi5wb0a3pCW1Jkm0tRzKmMuzb8vF1k3pqqVAlWZSOFDG4L6Pu3cTUd1kHgO4jCCkxwgxll1uf
        U45ssJ0cufDU9twU/45mV70hd/YdlynBSDAG1dpZUkSOBXSybYg==
X-Received: by 2002:a17:906:3894:: with SMTP id q20mr18354170ejd.768.1642506352668;
        Tue, 18 Jan 2022 03:45:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1DuBmGYJeOLN7+ZIYrxkpgGVoQPfhib4HIGgh6C911eo9fOlFcrws1bKfjlVYujly/OKal8kv8wSwIzwJBuk=
X-Received: by 2002:a17:906:3894:: with SMTP id q20mr18354165ejd.768.1642506352494;
 Tue, 18 Jan 2022 03:45:52 -0800 (PST)
MIME-Version: 1.0
References: <YeZ51EWg85akR6Ig@ofant>
In-Reply-To: <YeZ51EWg85akR6Ig@ofant>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Tue, 18 Jan 2022 08:45:41 -0300
Message-ID: <CANYNYEHsGO-e8TbBVykQSL8no1voNAK8arEwtv_37f5D5DJPgw@mail.gmail.com>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Tue, Jan 18, 2022 at 5:27 AM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Ian Kent:
>
> Fabian reported a bug about failing to mount /net with autofs-5.1.8,
> but have no problem with previous 5.1.6
>
> I'm not able to reproduce this error (need more info about the settings)
> So write to the mailinglist to see if you can shed some light on this..
>
>
> The most verbose error messages like this:
>
> Jan 11 13:53:09 khnum automount[3614]: mount_autofs_offset: failed to
> mount offset trigger  at

I get this error too with 5.1.8

> Jan 11 13:56:24 khnum automount[3614]: set_tsd_user_vars: failed to get
> buffer size for getpwuid_r
> Jan 11 14:56:52 khnum kernel: autofs4:pid:10191:validate_dev_ioctl:
> invalid path supplied for cmd(0xc018937e)

And this "invalid path" one too. Also with 5.1.8, not with 5.1.7. I
sent an email with debug logs a few days ago (and I can't find the
mailing list archive now to verify it got through, ugh).
