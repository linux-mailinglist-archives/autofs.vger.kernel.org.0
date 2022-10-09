Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0575F8DA0
	for <lists+autofs@lfdr.de>; Sun,  9 Oct 2022 21:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiJITCG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 9 Oct 2022 15:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJITCF (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 9 Oct 2022 15:02:05 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329B763A1
        for <autofs@vger.kernel.org>; Sun,  9 Oct 2022 12:02:04 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u10so14222451wrq.2
        for <autofs@vger.kernel.org>; Sun, 09 Oct 2022 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uA/nVEvQMDIy/plSu+cuS/B7r6SWRNOkQFLFkwSYY6E=;
        b=jssLhb+JTXr8y3e03flcKOtdephZf8hTNhwIeyt+lYeG4TzsYWjh3/yZBhetooCiSj
         YfSfXE9gNV5iJbWoQlrELX8fQyU/D6UacUqqopW7duKVBMYG32F02cH23pXLvfVyRtTi
         F0IRGZ+y3qbCq02fmOVIyrRxOgGqGr9+ltqW1DsqvNJYbiIc4P86nYadq7O0EOj+ZgXj
         73p8F/l7ZdUOu6lIZwf4blrirknO5gznc2wXv2elwToP/wkVxla9T0sLdiCZofZZOSs9
         hPJDYU8T40FIBMf/wUS2NK6DqAHpS/MuP2PPY5xzLepSYUGWC7YpLYNp/RhZGrRyWrKl
         LGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uA/nVEvQMDIy/plSu+cuS/B7r6SWRNOkQFLFkwSYY6E=;
        b=VuJbzJWwGgVw0J0Es5I2fvKcznVfPr3YnNuXMMHt+KHyIchVyP176krGLHGR6a21uA
         qdy5talWxn53z0JEBnNXRiOZgBjlo7rPJAMbaU349lfhSXhMfXQS4mc9B6EocTzV6cbO
         1D3rsM4JSEY7aLH+NHHohg7wkd0fNKEIwsyt4qVT++Wy7EaDn9/biDeId75eIRRTVje0
         SZvJQKcExJri3SpsEVqrktGSpsXwRpfS3TEsnvICuW6bt3HNDXhzY5Tx7v7LDvHssVYv
         EhOIswIGB71htfsm7jN9ek5pswM8Nr7mDNSxx72ybQXn/E3v9RxeSwz9PIn356b+0GLO
         0NzQ==
X-Gm-Message-State: ACrzQf23CEcoiPO3k8HaVsy2f4IyFFNQLsKpi+s03zvQ5hZXRolOjgaj
        ya8G3SHjkGozBtP6f/nMbM/V1drlfjhpqaHeDz7Ct+LWIfE=
X-Google-Smtp-Source: AMsMyM77vyqbEgY2EGpc624D7PumAgXugpBN0rZZbzKEw+XXxiW/n6wyzflPW3s4KjJPUicLnvgywT8k62BJBOsgpBM=
X-Received: by 2002:a5d:5a0c:0:b0:22f:608:48b with SMTP id bq12-20020a5d5a0c000000b0022f0608048bmr6928191wrb.84.1665342122642;
 Sun, 09 Oct 2022 12:02:02 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas A <nurgrak@gmail.com>
Date:   Sun, 9 Oct 2022 21:01:51 +0200
Message-ID: <CABPfrkxMARePgNA=g4uVwJQV9p2Xx=e6Ey2vtDASs9H+XG6C5A@mail.gmail.com>
Subject: [PATCH] Fix minor typo errors in man pages
To:     Ian Kent <raven@themaw.net>,
        "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>,
        autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Fixes minor typo's present in man pages.

Cheers

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
---
iff --git a/man/autofs.5 b/man/autofs.5
index 569a268..2fd7750 100644
--- a/man/autofs.5
+++ b/man/autofs.5
@@ -15,7 +15,7 @@ is specified (e.g. \fBhesiod\fP),
 this documentation does not apply.

 Indirect maps, except for the internal hosts map, can be changed on the fly
-and the automouter will recognize those changes on the next operation it
+and the automounter will recognize those changes on the next operation it
 performs on that map. Direct maps require a HUP signal be sent to the
 daemon to refresh their contents as does the master map.
 .SH "SUN FORMAT"
diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
index 8827e76..26fdd2e 100644
--- a/man/autofs.conf.5.in
+++ b/man/autofs.conf.5.in
@@ -31,7 +31,7 @@ overrides this and sets the timeout to 5 minutes to
be consistent
 with earlier autofs releases.
 .TP
 .B master_wait
-Sets the default maximum number of retries (actaul iterations is half
+Sets the default maximum number of retries (actual iterations is half
 this, each is delayed by 2 seconds before retrying) waiting for the
 master map to become available if it cannot be read at program start
 (program default 10, then continue). This can be longer if the map
@@ -211,7 +211,7 @@ whichever is less.
 The base dn to use when searching for amap base dn. This entry may be
 given multiple times and each will be checked for a map base dn in
 the order they occur in the configuration. The search base list is read
-at startup and whenever the daemon recieves a HUP signal.
+at startup and whenever the daemon receives a HUP signal.
 .TP
 .B map_object_class
 .br
@@ -511,12 +511,13 @@ parser implementation.

 There's no simple way to determine what the system default filesystem
 is and am-utils needs to be continually updated to do this and can
-easily get it wrong ayway. So allow it to be set in the configuration.
+easily get it wrong anyway. So allow it to be set in the configuration.
 .SH EXAMPLE
 .sp
 .RS +.2i
 .ta 1.0i
 .nf
+
 [ autofs ]
 timeout = 300
 browse_mode = no
@@ -526,7 +527,7 @@ dismount_interval = 300
 map_type = nis
autofs_use_lofs = no

-[ /expamle/mount ]
+[ /example/mount ]
 dismount_interval = 60
 map_type = file
 .fi
diff --git a/man/automount.8 b/man/automount.8
index 1061c9d..539dbd6 100644
--- a/man/automount.8
+++ b/man/automount.8
@@ -1,7 +1,7 @@
 .\" Linux man page by B. James Phillippe, 1997 <bryan@Terran.ORG>
 .\"
 .\" This page was written to contribute to the Linux kernel autofs
-.\" implementation by H. Peter Anvin (1997).  It is loosly based on
+.\" implementation by H. Peter Anvin (1997).  It is loosely based on
 .\" the documentation for mount(8) and amd(8) Linux manpages.
 .\"
 .\" This is free documentation.
