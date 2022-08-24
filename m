Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F545A0464
	for <lists+autofs@lfdr.de>; Thu, 25 Aug 2022 01:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiHXXIr (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 24 Aug 2022 19:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiHXXIq (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 24 Aug 2022 19:08:46 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052987645A
        for <autofs@vger.kernel.org>; Wed, 24 Aug 2022 16:08:46 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b16so23957372edd.4
        for <autofs@vger.kernel.org>; Wed, 24 Aug 2022 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UVWq30+MzDMLnZVO9f+6bvDReV4+fGkSENoTvs3SDIs=;
        b=nJKYYccFwPcDbLQ9TZpmpEyXT81blgPK40HM0rAt7wi4dIuO3Mvmu5ZNbQIrZ2kzW2
         zC/BTvD0cYWOEDu/BLWnRxjnJQjnjODXiE+QWqZ4aMJzwbKqqj3nZhEEwJTB6nF8g4N0
         Fr+fI0YIn1ScCxr9d2NOvebli2eRxTK+0FBWwNgCn7UOFRmCPgfL1CAxW7OtLWNr/CSK
         7tXsU/Mors76Hdu0H9JFB72c4RxqmPORvY5Ifrs7/CTV58jAgV4fde+5pxNYAjbBt2P8
         h2uuFaaNhiZMA6t3vrDFXoEYWFyqUAj3u3vHfZKBs3ttOL1V+YsP7j0SVx0nICoTGRbK
         cipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UVWq30+MzDMLnZVO9f+6bvDReV4+fGkSENoTvs3SDIs=;
        b=AmKnxZAaF7IqR8R0XEJVte+8GQmQ6+v9V2+ITlecrMOpY2v+/1Pwr+VFsUGVosAOn4
         bwjqeCwGXe4qnSMCHGXBl5aQtky8LRVTfjwHEuvU9fWc1A8u1CSRTAOQymnDRSnA2Nwy
         yqPDDCHUEJijweVvLQipPG2SMUxe73Vut8EjV+btDOGBWp5vzAwqpCXF5Xmx6hFlkMvh
         pVaY1TLRknY2xswqcgqlQ2u23jSxIoOQtMllSigHvPBaMbI82UWCnkgLGRc6RT1lFETO
         e7mkCnoWXalBdi4lSXLx862/4uPQj+wzZGxh7WfHT7qbOk0qmkCS+NJTQ0RNT7CyF56a
         py3g==
X-Gm-Message-State: ACgBeo1C6axwv0VbRYqn6bbVjwGhtbmer9ZK08un40r9yg3PxQGpySVR
        9gwyEbDge4Dl/UC7XlbySSbGP3wTTL6w2QX9DQ==
X-Google-Smtp-Source: AA6agR5htPt5UyESpTf8sbtBd6VANBKZZcdr3aTiTBCih61eVhx88jO+hr3X/cbXMdwMkgJ3oS1bxQ==
X-Received: by 2002:a05:6402:4382:b0:43d:6fce:3f1b with SMTP id o2-20020a056402438200b0043d6fce3f1bmr958993edc.361.1661382524499;
        Wed, 24 Aug 2022 16:08:44 -0700 (PDT)
Received: from [192.168.254.199] ([77.182.140.23])
        by smtp.gmail.com with ESMTPSA id g21-20020a50ec15000000b0043ba7df7a42sm3715498edr.26.2022.08.24.16.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 16:08:44 -0700 (PDT)
Message-ID: <0a94a48b-48db-f4d7-fd46-280e6943f066@gmail.com>
Date:   Thu, 25 Aug 2022 01:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] Updated LDAP SASL bind series
Content-Language: en-US
To:     autofs mailing list <autofs@vger.kernel.org>
Cc:     Ian Kent <raven@themaw.net>
References: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
From:   Thomas Reim <reimth@gmail.com>
In-Reply-To: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Ian,

thank you very much for review and correction of the patches. Your 
updates are fine for me. Four eyes are always better tan two. :-)

Your updates with regard to ldap_res are fine and should work. For your 
convenience I've added the guideline of OpenLDAP with regard of handling 
this parameter:

        The
        message obtained from ldap_result() must be passed in the result
        parameter.  This parameter must be NULL when initiating a new
        Bind. The caller must free the result message after each call
        using ldap_msgfree().  The ldap_sasl_interactive_bind() function
        returns an LDAP result code. If the code is 
LDAP_SASL_BIND_IN_PROGRESS
        then the Bind is not complete yet, and this function must be called
        again with the next result from the server.

Our changes follow this principle and should be fine. Calling 
ldap_msg_free() after successful bind is somehow redundant, as calling 
ldap_parse_result() with last parameter (freeit) set to 1 already frees 
memory, but does not harm, either.

I will perform a final testing of all patches on Ubuntu Jammy and come 
back to you.

Kind regards

Thomas

On 22/08/2022 04:55, Ian Kent wrote:
> I've made a few changes, mostly to the do_bind() interact area.
>
> I'm still a little unclear of what's going on there with ldap_res.
>
> For example, ldap_sasl_interactive_bind() is called with ldap_res
> as a parameter but it's passed by value so the caller can't see any
> changes to it. Further down the call to ldap_result() is where it
> imight get a value. So the question is, is ldap_res used in the call
> to ldap_sasl_interactive_bind() on subsequent iterations?
>
> I did some more white space changes, added some initializations, and
> added a CHANGELOG entry.
>
> Can you have a look and let me know if the changes I've made are ok
> with you and that I haven't made any mistakes.
>
> ---
>
> Thomas Reim (4):
>        autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
>        autofs-5.1.8 - prepare for OpenLDAP SASL binding
>        autofs-5.1.8 - let OpenLDAP handle SASL binding
>        autofs-5.1.8 - configure: LDAP function checks ignore implicit declarations
>
>
>   CHANGELOG             |   4 ++
>   aclocal.m4            |  52 +++++++++++++++
>   configure             |  55 +++++++++++++++-
>   configure.in          |   5 +-
>   include/config.h.in   |   3 +
>   include/lookup_ldap.h |   6 ++
>   modules/cyrus-sasl.c  | 150 +++++++++++++++++++++++++++++++++++++++++-
>   modules/lookup_ldap.c | 137 +++++++++++++++++++++++++++++++++++++-
>   8 files changed, 408 insertions(+), 4 deletions(-)
>
> --
> Ian
>
