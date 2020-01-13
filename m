Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5C5139BE8
	for <lists+autofs@lfdr.de>; Mon, 13 Jan 2020 22:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgAMVxf (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 13 Jan 2020 16:53:35 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:42923 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgAMVxf (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 13 Jan 2020 16:53:35 -0500
Received: by mail-lf1-f44.google.com with SMTP id y19so8092485lfl.9
        for <autofs@vger.kernel.org>; Mon, 13 Jan 2020 13:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Cno4U0YXW34tx+vMu5Kd9sYXTka16V9HC+MNZhjy8Hw=;
        b=nVuHVwFGixXlXXlKZ0rkhK4EU9UN8WA08D58+wWDbpE1fmnOYajG7Pcx+mCx0VyzO4
         bID20XSmyrZfXiPZUZ3s7ixVX66o/fHnOhqETuRIhM3YVt5rk1ocDnGH46bQSUPwereG
         m960rb2k9tMktcQ4AKBXkU9jRyS1zwbLAP6iT7nwOR5cUZlebsVD1z5DAaKcpaWtVaC+
         QCPIRBT3xaBVq/BY9wNp1dNPoS0w4eaBCfMCvoBwRYvnwAACRFLuJPuoInXWyv1JNbmM
         t9DrpQr0/CiJFZoi76nEE/GjA9P4ZGBdilwLLt+afS1cLHc2/hCMDo2r6S7A3AJsIiS8
         SzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Cno4U0YXW34tx+vMu5Kd9sYXTka16V9HC+MNZhjy8Hw=;
        b=J1yGnHxmfH1VEt6PHHRljhpRmYz/6d3WXzzAcC3mWYhHlAQxd1e8bppCBKwoyzlCCX
         PBbSU0SOrhMvi/SFT7YpY5REJBtjri/EzMJMBTjxD0HzzEoJ05SJUV5xO6FVuFO4RWBL
         lzqsMFw1oYUsOBpsLkKs6FwY6app3pNQ3xp5QugyN5oBG1N7y1OCyRmHsq3oXM9bEcYk
         peJTdK5ixyf6oeGGlsis2rkrl6u9lHUWXO0wF5cYdqfjElKOAa+CHjgRzOIE+W+ujHna
         7wR7r8TceQqUkniD7b+LsUeEiNhWYrCK+CKzC72sCnc77G49n4n7q5L9uqGbjqMbL4Am
         vQdQ==
X-Gm-Message-State: APjAAAXkweOw8l3ymfnkVB9YiKi03jJfOpSK5in9ow6QSJkyNSBBQFRO
        lcpM4Mg5zIYxrdjHwCBOI68qP05nMQKH9pFLZLKcV0GJYOA=
X-Google-Smtp-Source: APXvYqxLwLJgF7gvT0yEsraGDtr6u6VyHxX6o/+USX/PculO/8XbTHOvFYg6bfEunILRq3r1ekH5JyZagsdL+stlOsw=
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr11042850lfp.106.1578952413449;
 Mon, 13 Jan 2020 13:53:33 -0800 (PST)
MIME-Version: 1.0
From:   "aliveTerraN ." <nurgrak@gmail.com>
Date:   Mon, 13 Jan 2020 22:53:22 +0100
Message-ID: <CABPfrkx8afzQeb_DssZX9c8k2tzU-K7XX_qHvzq4zHqzhfnX+Q@mail.gmail.com>
Subject: [PATCH] Update browse_mode documentation
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

After listening to your feedback Ian, I have added installed
configuration default information to the browse_mode parameter to
better distinguish it from program default. How does this look?

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
---
diff --git a/man/autofs.conf.5.in b/man/autofs.conf.5.in
index 39239d4..bbee5be 100644
--- a/man/autofs.conf.5.in
+++ b/man/autofs.conf.5.in
@@ -63,7 +63,8 @@ but it is the best we can do.
 .TP
 .B browse_mode
 .br
-Maps are browsable by default (program default "yes").
+Maps are browsable by default (program default "yes", installed
+configuration default "no").
 .TP
 .B mount_nfs_default_protocol
 .br
diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
index 09bb5dd..f456579 100644
--- a/redhat/autofs.conf.default.in
+++ b/redhat/autofs.conf.default.in
@@ -46,7 +46,8 @@ timeout = 300
 #
 #umount_wait = 12
 #
-# browse_mode - maps are browsable by default.
+# browse_mode - Maps are browsable by default. Internal program
+#           default yes, installed configuration default no.
 #
 browse_mode = no
 #
diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
index 4a18f6f..f132413 100644
--- a/samples/autofs.conf.default.in
+++ b/samples/autofs.conf.default.in
@@ -46,7 +46,8 @@ timeout = 300
 #
 #umount_wait = 12
 #
-# browse_mode - maps are browsable by default.
+# browse_mode - Maps are browsable by default. Internal program
+#           default yes, installed configuration default no.
 #
 browse_mode = no
 #
