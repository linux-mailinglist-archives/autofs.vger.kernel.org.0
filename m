Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313C2267725
	for <lists+autofs@lfdr.de>; Sat, 12 Sep 2020 04:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgILCC2 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 11 Sep 2020 22:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgILCC1 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 11 Sep 2020 22:02:27 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1281EC061573
        for <autofs@vger.kernel.org>; Fri, 11 Sep 2020 19:02:27 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id o68so8720045pfg.2
        for <autofs@vger.kernel.org>; Fri, 11 Sep 2020 19:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZyPbJ98acrPi8bjygepoF2Hx3ahZSbyGCDcoTqLPljE=;
        b=V6WjOzJM6lgc1E13+RJj2N2o6PM20FlPyEHFyVb7/klad9PquoR2X5vgzK+NuBYqEf
         EkCCJfQ5GkjmA5TZsT5CiatMowH6zQ4HLjxi3zDywpwDLRlwE/ph1gcP1Zb5g5HR875d
         UdPsUJWhaH3fFbJQ4lV+/Z71JyV8zlpHfiqab8jsgSH6aS676cyO1WEkvS5HjXwlWdxE
         DOG2xAKPYHS1YMZ8lPihuHFiUEDGZoy2mh9czF47k7851jXKn6CUo3KfysJU4iMfj+aX
         TwlyTNQ6YyVOEcdCAKwHiphXFWTlwbagkp4KoqhdBHAjELM1Fq5r3fi/6+PUYn7ybtW6
         CFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZyPbJ98acrPi8bjygepoF2Hx3ahZSbyGCDcoTqLPljE=;
        b=QfO5Vwu6lCp+QcvzsMte87v/mXRsHmjrZar6yKCLo7XyBy4+pTPDmBAMHMF2SiFp/U
         i7M6WBF1KfMtlzonBd/aPBw603jszfTrzHsf6Jf7UHOsdEBsyQwQeYXON2YlvMQRYNm0
         nPmxbyYHWxBW0TgDp1TbVsZpyZe0IqFDTCTGebpeCiG3p3BBG3o6804YFN67hkYflAnj
         6Yy6JcuXJoHbM2YB5bQO2NkuzQybxcBORby9Ub4CFVAj5Ife8fUN/0MmqhUEMJY/nPV9
         049YMbNLRCHCXpVtstmKs5ON83mLwpHxSrn4hIsmNQFjuPA3bbbwqPYiBlquln1exZR6
         w0Rw==
X-Gm-Message-State: AOAM532TcP1Lwf9qD9kLNY7Gu6G/yeTxte/WRkZdbw0XkEHhnAULCRla
        o+PXz4tsrQG4S2VAz85QtK56Eqj8jjk=
X-Google-Smtp-Source: ABdhPJy2pN0V6ayL15j5g26CEhUfSAMo4No3H7tj4/b91BWVQr4m6JjQ5ASihWtqvZ7QEYK9pEPsAw==
X-Received: by 2002:a62:178d:0:b029:13e:d13d:a0f8 with SMTP id 135-20020a62178d0000b029013ed13da0f8mr4645509pfx.20.1599876146201;
        Fri, 11 Sep 2020 19:02:26 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id w203sm3732805pff.0.2020.09.11.19.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 19:02:25 -0700 (PDT)
Reply-To: pgnet.dev@gmail.com
Subject: Re: sshfs mount option, 'nonempty', causing mount/connection fails:
 "No such file or directory". still a valid option?
From:   PGNet Dev <pgnet.dev@gmail.com>
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
 <97d2b7ab490288a8d45c7463ef8a5609842a136d.camel@themaw.net>
 <c7af3932-6de6-a0a5-285a-e20ee92ffd95@gmail.com>
Message-ID: <60786168-f6dc-60f1-90e7-c37e65f4ec8e@gmail.com>
Date:   Fri, 11 Sep 2020 19:02:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c7af3932-6de6-a0a5-285a-e20ee92ffd95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

fyi,

here, on Fedora32

	rpm -qa | grep ^fuse | sort
		fuse-2.9.9-9.fc32.x86_64
		fuse3-3.9.1-1.fc32.x86_64
		fuse3-libs-3.9.1-1.fc32.x86_64
		fuse-common-3.9.1-1.fc32.x86_64
		fuse-libs-2.9.9-9.fc32.x86_64
		fuse-sshfs-3.7.0-3.fc32.x86_64

		
man mount.fuse
	...
	nonempty
	      Allows mounts over a non-empty file or directory. By default these  mounts are rejected to prevent accidental covering up of data, which could for example prevent automatic backup.
	...

reading

	[SOLVED] cannot mount sshfs with "nonempty" option
		https://bbs.archlinux.org/viewtopic.php?id=228225

		"The "nonempty" option has been removed from libfuse since version 3.0.0 to bring fuse "in-line with the behavior of the regular mount command".

		In version 2.9-1 the sshfs binary links against libfuse 2.9.7, the new version links against libfuse 3.1.0."

		...

		"TL;DR: You can just remove the nonempty mount option, it is the default behaviour now."


iiuc, looks like

 (1) the Fedora man needs updating
 (2) the 'nonempty' option is deprecated, and is functionally the default

perhaps a more informative error is called for?  may be too far gone ...
