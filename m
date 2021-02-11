Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4F63192E9
	for <lists+autofs@lfdr.de>; Thu, 11 Feb 2021 20:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhBKTQX (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 11 Feb 2021 14:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhBKTQO (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 11 Feb 2021 14:16:14 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DA0C061756
        for <autofs@vger.kernel.org>; Thu, 11 Feb 2021 11:15:33 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d24so9700991lfs.8
        for <autofs@vger.kernel.org>; Thu, 11 Feb 2021 11:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=GvC+3M37rlt/T+LC4bZ2s6xnCv4UqFk7vHZpDNNQjfY=;
        b=XHyMyu62h8KXxZdr+ayOOJoaV63rx3ItLqzaiQ7ZsG0jmcniND6qsAwR9anQ8zXqcU
         etVECMmjO7FKwJS7ZYE++7cVelWvF9KdDrbs7P9Mk77XplaQlgqp7/fEsBAJF79aKbdV
         /mk5xFJH+z40ytGfqmbvMvY4X0O4lgU+9camKQMbO1iL0k71K3OuLphUEn4ek+B9wZkQ
         niwhZAkqHqGSLItWIR8RuonXVQGQbZf51R8HEo6qGrsnOt86jzt1OUA1RPEZ0jMxgJe8
         1QTjdlY271FwA5jJ1eebAG0PNKkR4YG0sG7x2Pu4oHmgZFJDpxahuWFWtInKqj03jDgv
         9yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=GvC+3M37rlt/T+LC4bZ2s6xnCv4UqFk7vHZpDNNQjfY=;
        b=tnCFE5wANyLrDroLHiO8wFvYgtHmV3jYNEE0/8Oo+zx97BLgfwKuPoFPhOxhFPgsQP
         utHhiyO+gEEvzNq/KoTJWcAozlHXgkSwp65bgUde3haVOMmlAtl0zRlOxa+wW/vM5gSH
         grX187mnPrGXW8krysuI4J2DbTjr6p03SjM7Tu5pDyJvJGBXFUG+iaOsqK5lBTLzz2wu
         lJ6g/qIdTHeBcV8LOXhRVS2YIh/I/iKPppwl2wZpdd+EYpWm39bxH3Tu/0yz+1xb+ixb
         8OlHfSa7VJJM2Ww49/8irBsA3JVo3hpSGhZFjVjmR0bJBWo/z8CZmlRVL4oXxzQU6Iyq
         INbw==
X-Gm-Message-State: AOAM532S3X9XeB5Sck7C++1HFr/Bad/K/IXkbGExtBT0Ky9iFnr6nYTn
        g8ZeclSxdoA5MVDIv8bm9pN9OQW0ZR8SJQ3FEKjfQMAX148=
X-Google-Smtp-Source: ABdhPJwnzvzAsCZGXYUW1Avb6JDn9Vb3tFZRwQly8HVECfrJ1s+usv3G0IqB6bleg+PtBzoiEBdcqZe8PXSulNAS1Ww=
X-Received: by 2002:ac2:4ecc:: with SMTP id p12mr4876228lfr.373.1613070931792;
 Thu, 11 Feb 2021 11:15:31 -0800 (PST)
MIME-Version: 1.0
From:   Andreas P <nurgrak@gmail.com>
Date:   Thu, 11 Feb 2021 20:15:20 +0100
Message-ID: <CABPfrkx=3ro7JCxr=dELjPi6SyXFKh__n6UnPT1S8Df7T1NWGw@mail.gmail.com>
Subject: [Patch] Fix various typing errors [P1]
To:     autofs@vger.kernel.org, Ian Kent <raven@themaw.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I have gone through the code tree to fix various typing errors in the code.
I have five patches ready with similar content as this one below.

While a small improvement to the codebase overall, I do not want to
overflow you guys with patches similar to these.

Question moving forward: Do you want me to send one increment at the
time and we go through each before we proceed with the other, or
should I send all of them in a series of mail at once?

Signed of Andreas Poln=C3=A4s: <nurgkrak@gmail.com>
_________________
commit d90a8689cfb5cfd70a825272b27b234d2217ba2c
Author: Andreas Poln=C3=A4s <nurgkrak@gmail.com>
Date:   Thu Feb 11 19:25:24 2021 +0100

    Fix typing errors p.1

diff --git a/README.autofs-schema b/README.autofs-schema
index 54676e9..c35ba26 100644
--- a/README.autofs-schema
+++ b/README.autofs-schema
@@ -4,7 +4,7 @@ autofs schema
 The distribution file samples/autofs.schema is very old and is
 incorrect.

-This schema was added to the discribution long ago when it was
+This schema was added to the distribution long ago when it was
 not clear what schema to use for Linux autofs information.

 The schema was corrected somewhere along the line but the autofs
diff --git a/daemon/automount.c b/daemon/automount.c
index e476f6b..2d0f4cb 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -1833,7 +1833,7 @@ int handle_mounts_exit(struct autofs_point *ap)
     else {
         /*
          * If a mount request arrives before the locks are
-         * aquired just return to ready state.
+         * acquired just return to ready state.
          */
         ret =3D submount_source_writelock_nested(ap);
         if (ret) {
diff --git a/daemon/direct.c b/daemon/direct.c
index 9fe4903..8adbad1 100644
--- a/daemon/direct.c
+++ b/daemon/direct.c
@@ -370,7 +370,7 @@ int do_mount_autofs_direct(struct autofs_point *ap,
                  "failed to create mount directory %s", me->key);
             return -1;
         }
-        /* If we recieve an error, and it's EEXIST or EROFS we know
+        /* If we receive an error, and it's EEXIST or EROFS we know
            the directory was not created. */
         me->flags &=3D ~MOUNT_FLAG_DIR_CREATED;
     } else {
@@ -698,7 +698,7 @@ int mount_autofs_offset(struct autofs_point *ap,
struct mapent *me, const char *
                 return MOUNT_OFFSET_IGNORE;

             /*
-             * If we recieve an error, and it's EEXIST
+             * If we receive an error, and it's EEXIST
              * we know the directory was not created.
              */
             me->flags &=3D ~MOUNT_FLAG_DIR_CREATED;
@@ -862,7 +862,7 @@ void *expire_proc_direct(void *arg)

             /*
              * Maybe a manual umount, repair.
-             * It will take ap->exp_timeout/4 for us to relaize
+             * It will take ap->exp_timeout/4 for us to realize
              * this so user must still use USR1 signal to close
              * the open file handle for mounts atop multi-mount
              * triggers. There is no way that I'm aware of to
diff --git a/daemon/lookup.c b/daemon/lookup.c
index 2fea0c0..6dba392 100644
--- a/daemon/lookup.c
+++ b/daemon/lookup.c
@@ -1414,7 +1414,7 @@ void lookup_prune_one_cache(struct autofs_point
*ap, struct mapent_cache *mc, ti
         }
         if (!valid &&
             is_mounted(path, MNTS_REAL)) {
-            debug(ap->logopt, "prune posponed, %s mounted", path);
+            debug(ap->logopt, "prune postponed, %s mounted", path);
             free(key);
             free(path);
             continue;
diff --git a/daemon/master.c b/daemon/master.c
index da527a6..7fd8b4e 100644
--- a/daemon/master.c
+++ b/daemon/master.c
@@ -1476,7 +1476,7 @@ static void list_source_instances(struct
map_source *source, struct map_source *
         list_source_instances(source, instance->next);

     /*
-     * For convienience we map nss instance type "files" to "file".
+     * For convenience we map nss instance type "files" to "file".
      * Check for that and report corrected instance type.
      */
     if (strcmp(instance->type, "file"))
diff --git a/daemon/state.c b/daemon/state.c
index 091210a..9fa41f9 100644
--- a/daemon/state.c
+++ b/daemon/state.c
@@ -357,7 +357,7 @@ static void do_readmap_mount(struct autofs_point *ap,
          * TODO: how do we recognise these orphaned map instances. We
          * can't just delete these instances when the cache becomes
          * empty because that is a valid state for a master map entry.
-         * This is becuase of the requirement to continue running with
+         * This is because of the requirement to continue running with
          * an empty cache awaiting a map re-load.
          */
         valid =3D lookup_source_valid_mapent(ap, me->key, LKP_DISTINCT);
diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
index f3f2712..5506125 100644
--- a/redhat/autofs.conf.default.in
+++ b/redhat/autofs.conf.default.in
@@ -387,7 +387,7 @@ mount_nfs_default_protocol =3D 4
 # ldap_hostports - has no default value set. It must be set to
 #    the URI of the LDAP server to be used for lookups when
 #    ldap is used a map source. It may contain a comma or
-#    space seperated list of LDAP URIs.
+#    space separated list of LDAP URIs.
 #
 # hesiod_base - the base name used for hesiod map sources.
 #
