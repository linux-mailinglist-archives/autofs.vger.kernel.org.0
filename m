Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1177158E76A
	for <lists+autofs@lfdr.de>; Wed, 10 Aug 2022 08:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiHJGwG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 10 Aug 2022 02:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiHJGwG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 10 Aug 2022 02:52:06 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8B471BDC
        for <autofs@vger.kernel.org>; Tue,  9 Aug 2022 23:52:03 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id j7so16678368wrh.3
        for <autofs@vger.kernel.org>; Tue, 09 Aug 2022 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8QayKTsNQeu3HgZNFQXkRsc/kefj5O1cv3NLzcgb36I=;
        b=fjcaCzl71s3ZfUIVFWtiocKAB2IGELwBPBVdhIVSHomezhcYOL3qtJiJ4H98mftrT/
         yb2mDNIzkpW3eKkTeFkPrktljTPygOZQhYzBFXcUbYhfV5Az4x/MiXhJjl9g2egNdMb7
         7ipm5LMpDHBYYUt7uFnkkmDZWt03WGk4DRNNQaqZpRo0EPqv3yeDj0JZlZRjs7uyGcnq
         2+N4XMWSSPoGyboeCX3b4nze4f9Y28P/+nXFFJkit13yg9+YhPe3h0EO0nqVtb5t8Ji7
         v1GLHZskMjytNqsPjY2HoBG2HaGYyR4zQi/DQoPZoCQHIn7gWAGE56QPQUVCZcPFaqG0
         uSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8QayKTsNQeu3HgZNFQXkRsc/kefj5O1cv3NLzcgb36I=;
        b=fJ9HqWK/sosLvqKUdnctSzzeFyv+MA88o5CFRmuoNE3B97dxkniX7xs0eO3fSaXYQS
         L/Hk4gc7273FUKg4dx1nRtkPsbsykLJ1hxSsm3v8x6vAKJ5zZW7rNAhlApEZ2IU7OPkb
         gwVSelWx336Jm6CrqElMTSRTz0bjovOCMjoW4Q+sMEjzG58kYWTV2Ix2lvDTivJx+mBn
         cVrGcxWVdnirN/D8pYyx49bqT1MU/5Mxy5P9A/Ok46dZ5GgmcrNj9bCtPYwu6Wg64tPk
         EWfEl3WvBUfmVGPM3r77zyATVmbOEuMtILmO7b75kAaOy1CmryuskreVBly7wrZj8Qvs
         J0eg==
X-Gm-Message-State: ACgBeo0Z17q8OkxtqEzk3nyX+d0Oks5zoE1TRgrGL6waxKVlv1N+zSTw
        sj9g+rvxFeS+r/pTQ3ccsGYaqHQdeOfs
X-Google-Smtp-Source: AA6agR7DMVK/N82sUhZDIZn1DwRdC/zamkalZLzHPX4O6m5aDFNsCYyV0xwQCI77ImJVxCIf5ffUZA==
X-Received: by 2002:adf:dd88:0:b0:21e:f3c1:eea with SMTP id x8-20020adfdd88000000b0021ef3c10eeamr15859006wrl.23.1660114322260;
        Tue, 09 Aug 2022 23:52:02 -0700 (PDT)
Received: from [192.168.254.199] (dynamic-077-179-130-061.77.179.pool.telefonica.de. [77.179.130.61])
        by smtp.gmail.com with ESMTPSA id t17-20020adff051000000b002217e3f41f1sm11297297wro.106.2022.08.09.23.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 23:52:01 -0700 (PDT)
Message-ID: <c5551f78-7f5e-5051-0b6a-9ecc4d5ed1a1@gmail.com>
Date:   Wed, 10 Aug 2022 08:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Missing Support of SASL Sign or Seal using Data
 Security Layer
Content-Language: en-GB
To:     autofs@vger.kernel.org
References: <20220809115608.107767-1-reimth@gmail.com>
 <75d2e158-631c-5785-d0be-3328056db540@themaw.net>
From:   Thomas Reim <reimth@gmail.com>
Cc:     Ian Kent <raven@themaw.net>
In-Reply-To: <75d2e158-631c-5785-d0be-3328056db540@themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 10.08.22 03:04, Ian Kent wrote:
>
> Thanks Thomas, this functionality sounds useful and the code looks good.
>
>
> Mostly the comments I'll make later (once I've looked at it a few times)
>
> are about my coding style preferences but there was one place where I
>
> had questions about some function call behaviors. I'm tempted to make
>
> the style changes myself but it's your code and I'd probably make a
>
> mistake or two, ;)
>
>
> Ian
>
Dear Ian,

thank you for your feedback. Looking forward to your comments. I tried 
to align

the style to yours but of course it's just a guess. Either way is fine 
for me. Most

important is a working SASL data security layer. So if you like I can 
also perform

style updates, once I have an idea :-), test all updates and send the 
reworked patches

to the list.

Thomas

