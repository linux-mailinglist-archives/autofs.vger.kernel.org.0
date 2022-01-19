Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DAE4932D3
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350885AbiASCUL (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350879AbiASCUH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:07 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F16C061574
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:20:03 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 2C598100457
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:08 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V4yURXDzvIst for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:08 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 25061100059; Wed, 19 Jan 2022 13:12:08 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id C0C48100059;
        Wed, 19 Jan 2022 13:12:07 +1100 (AEDT)
Subject: [PATCH 02/19] autofs-5.1.8 - fix fedfs build flags
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:07 +0800
Message-ID: <164255832738.27570.15840340622619390917.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dynamic executables should be compiled with -fPIE and linked with -pie.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG      |    1 +
 fedfs/Makefile |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 18a2f29c..61090a99 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,4 +1,5 @@
 - fix kernel mount status notification.
+- fix fedfs build flags.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/fedfs/Makefile b/fedfs/Makefile
index dff749e4..65b2a2f5 100644
--- a/fedfs/Makefile
+++ b/fedfs/Makefile
@@ -23,12 +23,12 @@ LDFLAGS += -rdynamic
 all: mount.fedfs fedfs-map-nfs4
 
 mount.fedfs: $(mount_fedfs_OBJ) $(fedfs-getsrvinfo_OBJ) $(HDRS)
-	$(CC) -o mount.fedfs \
+	$(CC) $(DAEMON_LDFLAGS) -o mount.fedfs \
 	       $(mount_fedfs_OBJ) $(fedfs-getsrvinfo_OBJ) \
 	       $(LDFLAGS) $(LIBRESOLV) $(LIBS)
 
 fedfs-map-nfs4: $(fedfs-map-nfs4_OBJ) $(fedfs-getsrvinfo_OBJ) $(HDRS)
-	$(CC) -o fedfs-map-nfs4 \
+	$(CC) $(DAEMON_LDFLAGS) -o fedfs-map-nfs4 \
 	       $(fedfs-map-nfs4_OBJ) $(fedfs-getsrvinfo_OBJ) \
 	       $(LDFLAGS) $(LIBRESOLV) $(LIBS)
 


