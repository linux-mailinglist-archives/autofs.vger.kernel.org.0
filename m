Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF86A5A13AF
	for <lists+autofs@lfdr.de>; Thu, 25 Aug 2022 16:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240474AbiHYOeY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 25 Aug 2022 10:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236250AbiHYOeY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 25 Aug 2022 10:34:24 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E298C440
        for <autofs@vger.kernel.org>; Thu, 25 Aug 2022 07:34:22 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b5so20597205wrr.5
        for <autofs@vger.kernel.org>; Thu, 25 Aug 2022 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ixRctHjN4LRd4KqP+ueEx7pqU7M7Rf/T92ktXLeKMBI=;
        b=hKqm9A3S3yL9mR01JY+GJQXiw2BieSxXUgaQmx+YGDi0Jgc8zgehR4rYhP2tvOh7/b
         BCwtZXx+59HZWuiZyvz7Weas5TtPEZIF9eWSbIH6Wd9cP4wMrz+S594S2ymAEu9mrQIV
         sj6dyAz2JScWl5KyjC/J7TtgbXEEe5p4D55/7azQycdNrTW4jGCD22wlXNgfvmcoWNAQ
         YGerQiV6CTpYEbEPRm3x2S/h8eoVwMdPysLRA4qWEQ/dG/qcs3CJP6r23cESlzRv40t2
         Q03jWKQKWK6Qu/KQRkmP12Gzb2l2S7h1th1tXV4ZyHgq7vYDa4/A8omGZxEDBfzEcYWM
         /m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ixRctHjN4LRd4KqP+ueEx7pqU7M7Rf/T92ktXLeKMBI=;
        b=ZpgEx2HgfUBYnpbLw7Bjz7WrGkIkn53S9odQ4VMzFZFJD3MGOigVUrjV4NVQHPqwbl
         Ng9vshv6ef1pD5p3wohxCVudEPv7BL2wyGwRSVEC4UbRn/f5VqWP0JDM6hT9bY8wI7Uk
         lzPb2U60v5VEP95O/hWeJe+U0JyioozafPv8oB+V0gRdDgf0kJa+RRbL1SFORgOi1drO
         keBkTXPYAA/pd4LFPprAFvHZ88vLRNPBn+3NT2gaG6tioGaWrADSG1EoIc3vwnIMRxGH
         aylKk+XkoYqkGjYpVqiBlvEU+dgVpEJrGAigIa6sl+1kqN+BT3ryDn8XLJ5DughZY+1J
         sEiw==
X-Gm-Message-State: ACgBeo1ePWtFI8rGHmkswFeTqoKtpLHbJfTw+KqzaPoWd9XSIc3tF6LV
        faz5vvFHQrDHO5XgOVA+KDg/OOc/kFqk
X-Google-Smtp-Source: AA6agR7/dyNM9I2hLomvLMnvGcNtovEfuv5bfD5JLYFDtIu9bPHmti1AXlDCJpCzS7X3+3eYxuRGqA==
X-Received: by 2002:adf:ee4c:0:b0:222:c3bb:560c with SMTP id w12-20020adfee4c000000b00222c3bb560cmr2510690wro.584.1661438061428;
        Thu, 25 Aug 2022 07:34:21 -0700 (PDT)
Received: from [192.168.254.199] ([77.189.178.192])
        by smtp.gmail.com with ESMTPSA id bo20-20020a056000069400b0022585f6679dsm994589wrb.106.2022.08.25.07.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:34:20 -0700 (PDT)
Message-ID: <d8e86a74-49b4-046b-5a09-872ebd6e17c9@gmail.com>
Date:   Thu, 25 Aug 2022 16:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] Updated LDAP SASL bind series
Content-Language: en-US
From:   Thomas Reim <reimth@gmail.com>
To:     autofs mailing list <autofs@vger.kernel.org>
Cc:     Ian Kent <raven@themaw.net>
References: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
 <0a94a48b-48db-f4d7-fd46-280e6943f066@gmail.com>
In-Reply-To: <0a94a48b-48db-f4d7-fd46-280e6943f066@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian,

final testing of the patch series let to a core dump on libldap. For 
more information and a correction proposal please refer to my reply to 
patch 3/4.

With the chnages proposed there, everything works fine.

Kind regards

Thomas

On 25/08/2022 01:08, Thomas Reim wrote:
> Dear Ian,
>
> thank you very much for review and correction of the patches. Your 
> updates are fine for me. Four eyes are always better tan two. :-)
>
> Your updates with regard to ldap_res are fine and should work. For 
> your convenience I've added the guideline of OpenLDAP with regard of 
> handling this parameter:
>
>        The
>        message obtained from ldap_result() must be passed in the result
>        parameter.  This parameter must be NULL when initiating a new
>        Bind. The caller must free the result message after each call
>        using ldap_msgfree().  The ldap_sasl_interactive_bind() function
>        returns an LDAP result code. If the code is 
> LDAP_SASL_BIND_IN_PROGRESS
>        then the Bind is not complete yet, and this function must be 
> called
>        again with the next result from the server.
>
> Our changes follow this principle and should be fine. Calling 
> ldap_msg_free() after successful bind is somehow redundant, as calling 
> ldap_parse_result() with last parameter (freeit) set to 1 already 
> frees memory, but does not harm, either.
>
> I will perform a final testing of all patches on Ubuntu Jammy and come 
> back to you.
>
> Kind regards
>
> Thomas
>
> On 22/08/2022 04:55, Ian Kent wrote:
>> I've made a few changes, mostly to the do_bind() interact area.
>>
>> I'm still a little unclear of what's going on there with ldap_res.
>>
>> For example, ldap_sasl_interactive_bind() is called with ldap_res
>> as a parameter but it's passed by value so the caller can't see any
>> changes to it. Further down the call to ldap_result() is where it
>> imight get a value. So the question is, is ldap_res used in the call
>> to ldap_sasl_interactive_bind() on subsequent iterations?
>>
>> I did some more white space changes, added some initializations, and
>> added a CHANGELOG entry.
>>
>> Can you have a look and let me know if the changes I've made are ok
>> with you and that I haven't made any mistakes.
>>
>> ---
>>
>> Thomas Reim (4):
>>        autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
>>        autofs-5.1.8 - prepare for OpenLDAP SASL binding
>>        autofs-5.1.8 - let OpenLDAP handle SASL binding
>>        autofs-5.1.8 - configure: LDAP function checks ignore implicit 
>> declarations
>>
>>
>>   CHANGELOG             |   4 ++
>>   aclocal.m4            |  52 +++++++++++++++
>>   configure             |  55 +++++++++++++++-
>>   configure.in          |   5 +-
>>   include/config.h.in   |   3 +
>>   include/lookup_ldap.h |   6 ++
>>   modules/cyrus-sasl.c  | 150 +++++++++++++++++++++++++++++++++++++++++-
>>   modules/lookup_ldap.c | 137 +++++++++++++++++++++++++++++++++++++-
>>   8 files changed, 408 insertions(+), 4 deletions(-)
>>
>> -- 
>> Ian
>>
