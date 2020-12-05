Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B102CFC61
	for <lists+autofs@lfdr.de>; Sat,  5 Dec 2020 19:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgLERxN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 5 Dec 2020 12:53:13 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44408 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727449AbgLERvu (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 5 Dec 2020 12:51:50 -0500
Received: from mail-pg1-f199.google.com ([209.85.215.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1klZdx-0001Y6-K1
        for autofs@vger.kernel.org; Sat, 05 Dec 2020 15:38:41 +0000
Received: by mail-pg1-f199.google.com with SMTP id v17so5438268pgl.3
        for <autofs@vger.kernel.org>; Sat, 05 Dec 2020 07:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hz9arW9lX3TNdqFVvilPhTKojWIWwKI5kGCGMsx9t8Y=;
        b=YxgesCvf44k9k86RSMRiyQqxcXj14kZrAn+yy8589V3kJ/HeBRLGvTfPuwWT3lwfKE
         ykiGTpRYKy1FATl0e6h2+7orlMTf6hqLHswUR2oWnRqgew/Ap6LB3dvqOdDJyanX+xd4
         ZA85DskhUIfneXCvVca4PgEsElqRfdetp5ju+khdRXr+Qca+v12KnXyVsCayqcKIj7/T
         tG+6WpbRdvW6NmDCYQJhl9XGkH1/3vFL9jLbNFnFs5fo5F4z08jC4cpYtpq71QoZxs3/
         L3FQenNPTm7N70HC77JIWlc3QCfu9SWvNkkXnLyTLfHYvj6F+P5JUZDEQX1vGyuId0JN
         SlGA==
X-Gm-Message-State: AOAM532oWBpNQTcD31xyaPeXXY5d7aq9e/LxKELZ5lniczRTyidC6onK
        jjiRBdxjca9rLPplVn07vSfWbsWMeIc+FA05ppaQpr9v1TGZFwSmP0NLnK3r8vSmn9o6g9Wn54F
        lPiDp6gLtNkRgxfBxPWf79x0BIfBhsvzY6JY7ImpqUk22IIUBwA==
X-Received: by 2002:a17:902:b116:b029:d8:f5d7:5fe5 with SMTP id q22-20020a170902b116b02900d8f5d75fe5mr8660836plr.48.1607182719857;
        Sat, 05 Dec 2020 07:38:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykWz/uvV9JDdTEpIDUXK7S2+K9EDIRLuL49ItNkRkPUYvn4DlUNMPTu6ywlfSFAaTdbn5vm2m3GDkrPNGIUXQ=
X-Received: by 2002:a17:902:b116:b029:d8:f5d7:5fe5 with SMTP id
 q22-20020a170902b116b02900d8f5d75fe5mr8660821plr.48.1607182719599; Sat, 05
 Dec 2020 07:38:39 -0800 (PST)
MIME-Version: 1.0
References: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
 <a09e4be066dd64a3bd20ef297e24703b0d5e51f3.camel@themaw.net>
 <68b002d98debfbda12855a2568ea4ae990a620e9.camel@themaw.net> <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
In-Reply-To: <21bb329775922377aea2e5b365c4c7136adf1e79.camel@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Sat, 5 Dec 2020 12:38:28 -0300
Message-ID: <CANYNYEEerCVV4Gv4Ty3WyT2njYhoO16ioMBg2uPK-OQzs_OWbA@mail.gmail.com>
Subject: Re: autofs 5.1.6 : segfault at startup
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Sat, Dec 5, 2020 at 6:32 AM Ian Kent <raven@themaw.net> wrote:

> Removing the LDFLAGS option -Wl,-Bsymbolic-functions makes the
> problem go away.

Related:
https://www.spinics.net/lists/autofs/msg01903.html

In Ubuntu, -Wl,-Bsymbolic-functions is a system-wide default and we
remove it from the flags when building autofs in d/rules:

# Taken from #1636781 as it's the same problem here. Also see
# https://lists.ubuntu.com/archives/ubuntu-devel/2018-June/040369.html
ifeq ($(shell dpkg-vendor --derives-from Ubuntu && echo yes),yes)
  export DEB_LDFLAGS_MAINT_STRIP = -Wl,-Bsymbolic-functions
endif


> I'm not sure why this happens, the best I could find is this:
> https://stackoverflow.com/questions/7216973/is-there-a-downside-to-using-bsymbolic-functions/20729291
>
> Ian
>
