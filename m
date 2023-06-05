Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F595722DE4
	for <lists+autofs@lfdr.de>; Mon,  5 Jun 2023 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjFERu4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 5 Jun 2023 13:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjFERuz (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 5 Jun 2023 13:50:55 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43111A7
        for <autofs@vger.kernel.org>; Mon,  5 Jun 2023 10:50:54 -0700 (PDT)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 251A33F199
        for <autofs@vger.kernel.org>; Mon,  5 Jun 2023 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1685987452;
        bh=BMwQWYlnaLFtqQZIIL0hac2AOWMRlmoHYbE/zDEeiSs=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=cc9oPTLVsb2wGrZCadGpQnkj/3VBu6H+KmJOomPQ3NwQHtEiffKlgkE7OC93hQlEQ
         HzQ9ODefRIe+7/lkdo6fkYn5y8tJnRMiGfwDK8/3wJlHX2QUu0DvmJQeSVW1eFzA8q
         xA0+UrrzzBTW/+f26SKdeaJwha+i5mnsvFc4KYS3eqmpF4rzgOV4LCvw17w1Rti4Rg
         XSl8VYECgGBHty9XcbQkXwHjAcM6htA9J7NQP37ZcHXqYwsTcx5zz+mVeJi2X2AJQm
         eNqA/7rNyl9BqLV/Qc4vGShMZnB3eg+8kMQNBGn+VsG8LfDbJfweiyacbwPRaTdpeq
         Qkj99eTA4pU6w==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-39a98be77dcso780669b6e.1
        for <autofs@vger.kernel.org>; Mon, 05 Jun 2023 10:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685987451; x=1688579451;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMwQWYlnaLFtqQZIIL0hac2AOWMRlmoHYbE/zDEeiSs=;
        b=P0SrJdw+KbfYCWckpmthy0wnj0fVnfL+jwEWRHtZRpHjjclVkpE9RG1fW3JYqqmBaC
         7vG1ZjlgxPLFO/MvfCNmx4zaUyvEQFbX8EOgkcNgrsayYsCspWYCH6Iv/lLl1Y4gqi89
         5EelneUNca8jcSs6FqWiqKJOcsLKjd3pF8C0N/c9t+bg+nOj1jEPnHhShuqg0HrWXzot
         QJdqlJsmTCcyRu+tyhbKATBm3w5mvLdOj971qyYiTchXb9x9H+QGCYYBfUqrVZDcfJSo
         vE64lu3Sb4fDe/oY9ATX+KAPw92n21WR/U/QzEZ6aFLj0EIqAcRiIOK81Lk+TYiW9Dlc
         LQhA==
X-Gm-Message-State: AC+VfDz9mD/MjZz91V/efpRhBjvhaS/FWkUA+tAjk2LPUJjGgzMeELjs
        mIlggN9BrSJROwkX7BDSqN2KhxFfru1Spxe0GcgRZ8KTUTbyBz58rI/GViXgMxcpv4CWzQAPc1W
        zzFs1lmB+0KhY6u5dkK/+txjYeho4qtpoSHaHIzWQVGbAJdX9I8aO9vATugTn
X-Received: by 2002:aca:1715:0:b0:39a:519c:2a6a with SMTP id j21-20020aca1715000000b0039a519c2a6amr5162654oii.43.1685987450897;
        Mon, 05 Jun 2023 10:50:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vKRqhMvcpEYSLJmoRvygEe1AfnThbYKwQJEfGibHMPxM1XuY7sz1YnuiqLQVNZX/AfIvnxF+pfuiodHMqvG8=
X-Received: by 2002:aca:1715:0:b0:39a:519c:2a6a with SMTP id
 j21-20020aca1715000000b0039a519c2a6amr5162643oii.43.1685987450638; Mon, 05
 Jun 2023 10:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220912005822.3947426-1-reimth@gmail.com> <20220912005822.3947426-2-reimth@gmail.com>
In-Reply-To: <20220912005822.3947426-2-reimth@gmail.com>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Mon, 5 Jun 2023 14:50:39 -0300
Message-ID: <CANYNYEGQs7+F8-U9YXHCnRmw25fNYBxgK3OnXyRDAw=YgWOsYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] autofs-5.1.8 - support SCRAM for SASL binding
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Sun, Sep 11, 2022 at 9:58=E2=80=AFPM ThomasReim <reimth@gmail.com> wrote=
:
> This patch enables SCRAM-SHA-1 and other SCRAM-SHA mechanisms
> (if supported by SASL library).
> @@ -1241,6 +1241,7 @@ int authtype_requires_creds(const char *authtype)
>  #ifdef WITH_SASL
>         if (!strncmp(authtype, "PLAIN", strlen("PLAIN")) ||
>             !strncmp(authtype, "DIGEST-MD5", strlen("DIGEST-MD5")) ||
> +           !strncmp(authtype, "SCRAM-SHA-", strlen("SCRAM-SHA-")) ||
>             !strncmp(authtype, "LOGIN", strlen("LOGIN")))
>                 return 1;
>  #endif

While writing a test for this, I decided to include NTLM and CRAM-MD5,
and noticed something interesting. NTLM in autofs-5.1.8 would "work".
automount was able to fetch the map from openldap using NTLM SASL
authentication. Even though it's not handled by
authtype_requires_creds().

When switching to openldap for the sasl authentication, then automount
would fail if configured to use NTLM. So initially I thought it was a
regression, but turns out automount 5.1.8 was just ignoring the SASL
NTLM error and continuing. openldap allowed that, but treated it as an
anonymous bind I suppose, and since the ACLs didn't prevent that, in
the end it all worked.

Attempting to mount entry /mnt/storage, notice how sasl fails, but is
then declared as having worked:

lookup_mount: lookup(ldap): looking up storage
do_bind: lookup(ldap): auth_required: 2, sasl_mech NTLM
sasl_bind_mech: Attempting sasl bind with mechanism NTLM
getuser_func: called with context (nil), id 16386.
sasl_log_func:128: Parameter Error in ../../common/plugin_common.c near lin=
e 364
sasl_bind_mech: sasl bind with mechanism NTLM succeeded
do_bind: lookup(ldap): autofs_sasl_bind returned 0
get_query_dn: lookup(ldap): query succeeded, no matches for (objectclass=3D=
nisMap)
get_query_dn: lookup(ldap): found query dn ou=3Dauto.indirect,dc=3Dexample,=
dc=3Dfake
lookup_one: lookup(ldap): searching for
"(&(objectclass=3Dautomount)(|(cn=3Dstorage)(cn=3D/)(cn=3D\2A)))" under
"ou=3Dauto.indirect,dc=3Dexample,dc=3Dfake"
lookup_one: lookup(ldap): getting first entry for cn=3D"storage"
lookup_one: lookup(ldap): examining first entry
lookup_mount: lookup(ldap): storage -> -fstype=3Dnfs4 server.example.fake:/=
&

corresponding openldap logs:
slapd[5499]: conn=3D1012 op=3D0 BIND dn=3D"" method=3D163
slapd[5499]: NTLM server step 1
slapd[5499]: client flags: 207
slapd[5499]: conn=3D1012 op=3D0 RESULT tag=3D97 err=3D14 qtime=3D0.000021
etime=3D0.000118 text=3DSASL(0): successful result:
slapd[5499]: conn=3D1012 op=3D1 BIND dn=3D"" method=3D163
slapd[5499]: NTLM server step 2
slapd[5499]: SASL [conn=3D1012] Failure: client didn't issue valid NTLM res=
ponse
slapd[5499]: conn=3D1012 op=3D1 RESULT tag=3D97 err=3D80 qtime=3D0.000018
etime=3D0.000070 text=3DSASL(-5): bad protocol / cancel: client didn't
issue valid NTLM response
slapd[5499]: conn=3D1012 op=3D2 SRCH
base=3D"ou=3Dauto.indirect,dc=3Dexample,dc=3Dfake" scope=3D2 deref=3D0
filter=3D"(objectClass=3DnisMap)"
slapd[5499]: conn=3D1012 op=3D2 SRCH attr=3DnisMapName
slapd[5499]: conn=3D1012 op=3D2 SEARCH RESULT tag=3D101 err=3D0 qtime=3D0.0=
00016
etime=3D0.000166 nentries=3D0 text=3D
slapd[5499]: conn=3D1012 op=3D3 SRCH
base=3D"ou=3Dauto.indirect,dc=3Dexample,dc=3Dfake" scope=3D2 deref=3D0
filter=3D"(objectClass=3DautomountMap)"
slapd[5499]: conn=3D1012 op=3D3 SRCH attr=3Dou
slapd[5499]: conn=3D1012 op=3D3 SEARCH RESULT tag=3D101 err=3D0 qtime=3D0.0=
00016
etime=3D0.000112 nentries=3D1 text=3D
slapd[5499]: conn=3D1012 op=3D4 SRCH
base=3D"ou=3Dauto.indirect,dc=3Dexample,dc=3Dfake" scope=3D2 deref=3D0
filter=3D"(&(objectClass=3Dautomount)(|(cn=3Dstorage)(cn=3D/)(cn=3D\2A)))"
slapd[5499]: conn=3D1012 op=3D4 SRCH attr=3Dcn automountInformation
slapd[5499]: conn=3D1012 op=3D4 SEARCH RESULT tag=3D101 err=3D0 qtime=3D0.0=
00018
etime=3D0.000123 nentries=3D1 text=3D

Now, NTLM and CRAM-MD5 are deprecated nowadays (specially CRAM-MD5,
see https://datatracker.ietf.org/doc/html/draft-ietf-sasl-crammd5-to-histor=
ic-00.html).
Is there still interest in supporting those?

If yes, the trivial change should be just this:
--- a/modules/lookup_ldap.c
+++ b/modules/lookup_ldap.c
@@ -1208,6 +1208,8 @@
    if (!strncmp(authtype, "PLAIN", strlen("PLAIN")) ||
        !strncmp(authtype, "DIGEST-MD5", strlen("DIGEST-MD5")) ||
        !strncmp(authtype, "SCRAM-SHA-", strlen("SCRAM-SHA-")) ||
+       !strncmp(authtype, "NTLM", strlen("NTLM")) ||
+       !strncmp(authtype, "CRAM-MD5", strlen("CRAM-MD5")) ||
        !strncmp(authtype, "LOGIN", strlen("LOGIN")))
        return 1;
 #endif
