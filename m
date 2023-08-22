Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9894B784ADF
	for <lists+autofs@lfdr.de>; Tue, 22 Aug 2023 21:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjHVTw4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 22 Aug 2023 15:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjHVTwz (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 22 Aug 2023 15:52:55 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 12:52:46 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9DECCB
        for <autofs@vger.kernel.org>; Tue, 22 Aug 2023 12:52:45 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-2c-64e4f990e94c
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 6E.F9.10987.099F4E46; Tue, 22 Aug 2023 23:08:16 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=XIpc1EP5W99w6b0hX3hJflmAIGDwdLxxOJ6zwljv18xjYCDm5KQaM0FQemydO9l7D
          aoirP8Uy8Sx6d5RUl7c7/O1K+ySJ0m7f1VALsQtEU4pZh7+Rk4VkgjE85U5zT3UDu
          pphhQya6Q6vatKyIykU/EE6tNmA88+MZe6YxiN72Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=f0HkXaSEAZ1P6mkiQCNLYTwIRBDQRTLZ0I5tJbRptZTJOnmYPDiDokzYNdebyzsAO
          Q/AZLTXWkxTHBfXmD1y3QvCNpz58hfm5/G7l92luMaYJvBPcN9r0TDuU1Rb410Jzs
          dtNOONdPdmsyCbEKMCkLDbyFSO6ZFkkdWgi3tzMF8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Tue, 22 Aug 2023 23:52:52 +0500
Message-ID: <6E.F9.10987.099F4E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     autofs@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 11:53:06 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW3fCzycpBrse2VhsPX2a2YHR4/Mm
        uQDGKC6blNSczLLUIn27BK6MJesusBTsZq5o61/E0sD4mKmLkZNDQsBEYs6kPSxdjFwcQgJ7
        mCS2nWkHc1gEVjNL7O/pYIVwHjJLXDu1hB2irJlRYsPPHiCHg4NXwFqi4bgyyChmAT2JG1On
        sIHYvAKCEidnPmGBiGtLLFv4mhmknFlATeJrVwlIWFhATOLTtGXsILaIgJTE9aOzGUFsNgF9
        iRVfm8FsFgFVie7nd8FGCgHVbLyynm0CI/8sJNtmIdk2C8m2WQjbFjCyrGKUKK7MTQSGWrKJ
        XnJ+bnFiSbFeXmqJXkH2JkZgGJ6u0ZTbwbj0UuIhRgEORiUe3p/rnqQIsSaWAXUdYpTgYFYS
        4ZX+/jBFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+t0LNkIYH0xJLU7NTUgtQimCwTB6dUA2Np
        defFoq96L7J3rH4TWbYzyO3A9pTO/Beev784f/q4S1np/MPd5WJ79nJ/ru0Ptfk9dVpZatiV
        s5vDJR9P/yLUE80aNEvxafeL6u4mk7jPUp/XplstPVl36oeL79MbpR8+Buu9/VQh4VDQf2O+
        V/gtja3cSx/Gf7Xd/zr26kJjr93JN2K7HK4rsRRnJBpqMRcVJwIAVzt1gT8CAAA=
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [203.124.41.30 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

