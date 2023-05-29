Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE08A7149B5
	for <lists+autofs@lfdr.de>; Mon, 29 May 2023 14:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjE2Mwn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 29 May 2023 08:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjE2Mwn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 29 May 2023 08:52:43 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A32B5
        for <autofs@vger.kernel.org>; Mon, 29 May 2023 05:52:41 -0700 (PDT)
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3CA5D3F452
        for <autofs@vger.kernel.org>; Mon, 29 May 2023 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1685364758;
        bh=FaO7huKZqQ1AF2p29Aynp2BOk7vRXz3SQkSLUIz0oP4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=ZZz35rZWWIU4FppOQVxQ3XlGg/Yk/Rl9apokNMYkl5Dv3osUhEp+EtkzIgUoZg3cn
         hPA5dSxDPq9NImadroIDlV1abA7r6kSgPRJuSLW+qXUyDcmBsQb4tcpDkbD545n0N+
         PIEUQfukh0wQkuoPEhIMabwGm9suDahHBK9PFlk++gSzLcR7CdUzYcxPGXYQaz4KDb
         GbYEIrDYoJfzY5ZEfcJM1UoyGtO+4XYBAoQDIaxSZmk7zwxMcc/z8248CujNpmduby
         ryxDLIJANl09Yi58yYqPzMlvHuAy/waweb0PrU9QniR7RyaJHTVJ+s0lqz0Syk8lor
         rPikg3oh8wLxQ==
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-565de4b5be5so22776837b3.1
        for <autofs@vger.kernel.org>; Mon, 29 May 2023 05:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685364757; x=1687956757;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaO7huKZqQ1AF2p29Aynp2BOk7vRXz3SQkSLUIz0oP4=;
        b=gGRZeAvvDOjSfDBUrQhoorpXfknbaf9E4+F/LJLOTFFvKkN2M8Di81/fib1O9b2nc/
         7JG1BLkIQ4xg17+S614Qi5mdeXdHIiClBTuXtC6DzQwQZYI7VAIsloqqzh8ZuRFrD2th
         cDHDhSi+B+D+abNpSr4Q1JTxhthKNMFmEnajMi7+FFEt03pMg+q4baQA3VYcNFcjEynS
         DqxJw99WbXUCAYB0lodAkCrwZycdTHh7WTtPj/Fqeu50ltOlhO7NSVElCFwYFQBITeJb
         2cMlKdOzvK99jS2pPwvtZPgG6Jnhn5Q0ksnciDDoS4XbmBYvZjuoYDdCZnChFYYkAwFr
         2Fyg==
X-Gm-Message-State: AC+VfDxpAOW81HCakeyGHx2BkQtlXMDTwPvsTmNhxuY40gia4SXSxOk6
        JUpLo98MN7ZzPA1KaRUzZwmFhPiHW8Rxx3qlcQLYqAD42eV6jI8UdoDuqoZKT/3szQkxH4FGrNg
        wQoH/L35LWkqOVAZCA9vYAwUU+bts12w4OfBCdM4heldM64NQc8IT0PQ3IQ==
X-Received: by 2002:a0d:eb10:0:b0:565:de9d:be6b with SMTP id u16-20020a0deb10000000b00565de9dbe6bmr7744095ywe.21.1685364757173;
        Mon, 29 May 2023 05:52:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6kP5I2Un9jv9A1PHYWqIhhSsKH+YMVM3hGnsm4QWkLeXc+g9BF4sI6VYmQxkruvVPVReUqkREq9bK3TaY993g=
X-Received: by 2002:a0d:eb10:0:b0:565:de9d:be6b with SMTP id
 u16-20020a0deb10000000b00565de9dbe6bmr7744081ywe.21.1685364756900; Mon, 29
 May 2023 05:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
 <166150377330.37723.7093874206401696231.stgit@donald.themaw.net>
 <CANYNYEEL3rv73o+ezPRXfeigacn5vN9O9PGXU6Fysgthfd5BYA@mail.gmail.com> <d496f4d8-b71f-a959-06e2-740916bb2a4b@themaw.net>
In-Reply-To: <d496f4d8-b71f-a959-06e2-740916bb2a4b@themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Mon, 29 May 2023 09:52:26 -0300
Message-ID: <CANYNYEHB_+pjSftSEp-Q1SYKfxP=+0ie-D9X-3Xn84o=i1aEnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
To:     autofs mailing list <autofs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

On Mon, May 29, 2023 at 12:13=E2=80=AFAM Ian Kent <raven@themaw.net> wrote:
>
> On 25/5/23 02:38, Andreas Hasenack wrote:
> > I quickly tried this:
> > --- a/modules/lookup_ldap.c 2023-05-16 21:02:41.263345786 +0000
> > +++ b/modules/lookup_ldap.c 2023-05-16 21:02:47.807520735 +0000
> > @@ -601,7 +601,10 @@
> >          debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
> >   #else
> >          if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 6))=
 {
> > -           rv =3D sasl_do_kinit(logopt, ctxt);
> > +            if (ctxt->client_cc)
> > +                rv =3D sasl_do_kinit_ext_cc(logopt, ctxt);
> > +            else
> > +               rv =3D sasl_do_kinit(logopt, ctxt);
> >              if (rv !=3D 0)
> >                  return 0;
> >              sasl_flags =3D LDAP_SASL_QUIET;
> >
> > And then my test case worked again. But maybe there is another way to
> > do it "the openldap way"?
>
>
> On the face of it this looks like a mistake.
>
>
> I'll have a look at the code as a whole later but I expect I'll just appl=
y
>
> this as it is, ;)


\o/

Thanks! :)
