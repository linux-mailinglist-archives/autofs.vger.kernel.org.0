Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFEC70FDF0
	for <lists+autofs@lfdr.de>; Wed, 24 May 2023 20:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbjEXSio (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 24 May 2023 14:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbjEXSin (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 24 May 2023 14:38:43 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11D198
        for <autofs@vger.kernel.org>; Wed, 24 May 2023 11:38:41 -0700 (PDT)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 00E1541870
        for <autofs@vger.kernel.org>; Wed, 24 May 2023 18:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1684953520;
        bh=H+EROekLJf59naUzwZoeLwjVZhh0WgfqVPefJGaStqs=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Content-Type;
        b=ZbMikeVOF8C4TMUIseGTXpm9TQw2bxD2GhJMu4axD775+h8wOyKmodDs6kuAnTTJq
         oGMG6XfZbjYIp7PFNyoG48WjTUPVJNV8ENoQtDxOxKzYWE1pwc6ltH1+LNTEb5xGz1
         ExiXBcF287UxyNYYto2Irx26cZEnU7yqqc5nVmV3FJVyLpKVC8GlRZdRuhzyL7F/xN
         zuSt3sKJYIcOlTWoJv3F/c23la+Xl8GBdtauPo+BS64IXSq02oRkqzRJMKG+7jqR89
         1Tg6elIUnkhFXyOTRL6lVTeIWmJpr1KF3MT6Z/1NOBAhPsyGdwJJbc+OUz7oBYkDyR
         /oyW8ZhkdyxiQ==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-56511755145so25196957b3.0
        for <autofs@vger.kernel.org>; Wed, 24 May 2023 11:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684953519; x=1687545519;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+EROekLJf59naUzwZoeLwjVZhh0WgfqVPefJGaStqs=;
        b=RmsRps4itjJkkHAKMnqCefMG25ML81p7DJaQ75IR1lSLhGyukyg2Z6FKDleh5/QwbQ
         +fLSPL1C2h7qq+Fo9w9jcP2R231I8FavDMBrL/0rCAA70R3+N716QeBOrkRDglOXMIqB
         V6OMt5z6eCVQUSvDVYpHzczTXjS9CRLmVnT9T06DrneQPTBD4hAXef5LhFNK468DhQwg
         Gh6IQVAaHKxCjqGJfp9X1PyKuQm6VC2DNkBKjQT1dzGXYtAqvgSdJzaPTWvLiwNJrVKe
         GEUhjQhv3coR3mRSfdkvwQVlQv/rCvGdyYjAxpbVvTZgqTW3T5GSO5MytiH+fC+Z9/Lm
         kG6w==
X-Gm-Message-State: AC+VfDze6C5QNAAI7mBkyoX2+gJE0Eyo0yIiKGwTa0mXxA5ewxkr/yK/
        faGoHMdKTlogAHs5bk7U07A+hZKfA3C+Hz8F6iTW6M2BL9LnUh9x3af6iA/DvhlnRyY1vhC2C4z
        qi1zTpRyVtk4rgPpQFcjcvPpwsfWLJ3hjfgcck3HrOTNugym/U+YmhW0LExpH
X-Received: by 2002:a0d:cacd:0:b0:560:eadc:3bc9 with SMTP id m196-20020a0dcacd000000b00560eadc3bc9mr21805281ywd.7.1684953519017;
        Wed, 24 May 2023 11:38:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Y7rWb2myci4+wYQIsseY3+b1MVnc/gUJQY7VZSjdffqMV6ckFp0ZgCikEwSMhoc1SmP7Qr5agpuUdoEKn2SQ=
X-Received: by 2002:a0d:cacd:0:b0:560:eadc:3bc9 with SMTP id
 m196-20020a0dcacd000000b00560eadc3bc9mr21805264ywd.7.1684953518697; Wed, 24
 May 2023 11:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net> <166150377330.37723.7093874206401696231.stgit@donald.themaw.net>
In-Reply-To: <166150377330.37723.7093874206401696231.stgit@donald.themaw.net>
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Wed, 24 May 2023 15:38:27 -0300
Message-ID: <CANYNYEEL3rv73o+ezPRXfeigacn5vN9O9PGXU6Fysgthfd5BYA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] autofs-5.1.8 - let OpenLDAP handle SASL binding
To:     autofs mailing list <autofs@vger.kernel.org>
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

Hi all,

resending as my previous email was in html, sorry

On Fri, Aug 26, 2022 at 5:49=E2=80=AFAM Ian Kent <raven@themaw.net> wrote:
>
> From: Thomas Reim <reimth@gmail.com>
>
> From: Thomas Reim <reimth@gmail.com>
>
> Cyrus SASL supports data encryption in GSSAPI (with Kerberos V) mode usin=
g an
> SASL data security layer according to IETF RFC 2078. This security layer
> provides for traffic encryption during authentication and authorization t=
owards
> an OpenLDAP based server and for subsequent encryption of data traffic fo=
r the
> LDAP session. Current automounter does not implement SASL security layer
> encryption and only relies on TLS to protect LDAP communication.

I was writing a test for this, since we plan to release an autofs
update with this fix, and noticed that a particular config stopped
working: `credentialcache` in /etc/autofs_ldap_auth.conf.

For the test I was grabbing a TGT instead of using a keytab, an
configuring autofs to use that to authenticate against an openldap
server:
<autofs_ldap_sasl_conf
        usetls=3D"no"
        tlsrequired=3D"no"
    authrequired=3D"yes"
    authtype=3D"GSSAPI"
    clientprinc=3D"ubuntu@LXD"
    credentialcache=3D"/tmp/krb5cc_0"
/>

Initially openldap was configured to accept connections authenticated
via sasl and any ssf (including 0, which is the case with autofs).
Later I would configure the openldap server to reject connections
authenticated with SASL and an ssf=3D0, in order to trigger the bug and
verify the fix (where autofs would be using ssf=3D256).

Anyway, the above was working with an unpatched autofs:

(...)
parse_ldap_config: lookup(ldap): user: (null), secret: unspecified,
client principal: ubuntu@LXD credential cache: /tmp/krb5cc_0
do_init: parse(sun): init gathered global options: (null)
do_bind: lookup(ldap): auth_required: 2, sasl_mech GSSAPI
sasl_do_kinit_ext_cc: using external credential cache for auth: client
principal ubuntu@LXD
sasl_do_kinit_ext_cc: external credential cache default principal ubuntu@LX=
D
sasl_do_kinit_ext_cc: Kerberos authentication was successful!
sasl_bind_mech: Attempting sasl bind with mechanism GSSAPI
sasl_log_func: GSSAPI client step 1
getuser_func: called with context (nil), id 16385.
sasl_log_func: GSSAPI client step 1
getuser_func: called with context (nil), id 16385.
sasl_log_func: GSSAPI client step 2
sasl_bind_mech: sasl bind with mechanism GSSAPI succeeded

But not in the patched one:
(...)
parse_ldap_config: lookup(ldap): user: (null), secret: unspecified,
client principal: ubuntu@LXD credential cache: /tmp/krb5cc_0
do_init: parse(sun): init gathered global options: (null)
do_bind: lookup(ldap): auth_required: 2, sasl_mech GSSAPI
sasl_do_kinit: initializing kerberos ticket: client principal ubuntu@LXD
sasl_do_kinit: calling krb5_parse_name on client principal ubuntu@LXD
sasl_do_kinit: Using tgs name krbtgt/LXD@LXD
sasl_do_kinit: krb5_get_init_creds_keytab failed with error -1765328174
do_bind: lookup(ldap): auth_required: 2, sasl_mech GSSAPI
sasl_do_kinit: initializing kerberos ticket: client principal ubuntu@LXD
sasl_do_kinit: calling krb5_parse_name on client principal ubuntu@LXD
sasl_do_kinit: Using tgs name krbtgt/LXD@LXD
sasl_do_kinit: krb5_get_init_creds_keytab failed with error -1765328174

The patched version is only trying sasl_do_kinit(), instead of
sasl_do_kinit_ext_cc():

> --- a/modules/lookup_ldap.c
> +++ b/modules/lookup_ldap.c
(...)
>
> @@ -574,15 +576,146 @@ static int do_bind(unsigned logopt, struct ldap_co=
nn *conn,
>                    const char *uri, struct lookup_context *ctxt)
>  {
>         char *host =3D NULL, *nhost;
> -       int rv;
> +       int rv, result;
(...)
>
>         if (ctxt->auth_required & LDAP_NEED_AUTH) {
> +#ifndef WITH_LDAP_CYRUS_SASL
>                 rv =3D autofs_sasl_bind(logopt, conn, ctxt);
>                 debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", r=
v);
> +#else
> +               if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI"=
, 6)) {
> +                       rv =3D sasl_do_kinit(logopt, ctxt);
> +                       if (rv !=3D 0)
> +                               return 0;
> +                       sasl_flags =3D LDAP_SASL_QUIET;


Should the above check for ctct->client_cc and then conditionally call
sasl_do_kinit_ext_cc() instead of sasl_do_kinit(), like the code in
autofs_sasl_bind()/sasl_bind_mech() does? I checked later patches from
https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.1.9/,
and while there are further sasl tweaks, I didn't see anything that
would change this behavior.

I quickly tried this:
--- a/modules/lookup_ldap.c 2023-05-16 21:02:41.263345786 +0000
+++ b/modules/lookup_ldap.c 2023-05-16 21:02:47.807520735 +0000
@@ -601,7 +601,10 @@
        debug(logopt, MODPREFIX "autofs_sasl_bind returned %d", rv);
 #else
        if (ctxt->sasl_mech && !strncmp(ctxt->sasl_mech, "GSSAPI", 6)) {
-           rv =3D sasl_do_kinit(logopt, ctxt);
+            if (ctxt->client_cc)
+                rv =3D sasl_do_kinit_ext_cc(logopt, ctxt);
+            else
+               rv =3D sasl_do_kinit(logopt, ctxt);
            if (rv !=3D 0)
                return 0;
            sasl_flags =3D LDAP_SASL_QUIET;

And then my test case worked again. But maybe there is another way to
do it "the openldap way"?
