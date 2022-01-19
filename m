Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199664932D8
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350894AbiASCUO (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:14 -0500
Received: from smtp01.aussiebb.com.au ([121.200.0.92]:48576 "EHLO
        smtp01.aussiebb.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350893AbiASCUI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:08 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 1D52F100FCE
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:12:51 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Iw4pt99tfZLf for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:12:51 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 17221100FCB; Wed, 19 Jan 2022 13:12:51 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 9F692100FCB;
        Wed, 19 Jan 2022 13:12:50 +1100 (AEDT)
Subject: [PATCH 09/19] autofs-5.1.8 - bailout on rpc systemerror
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:12:50 +0800
Message-ID: <164255837031.27570.5044338928256650644.stgit@mickey.themaw.net>
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

If there's a system error (eg. oversize packet reveived) just give up
since redoing the call would likely end up with the same error.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 lib/rpc_subs.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
index 7b8162b4..ee7f94b9 100644
--- a/lib/rpc_subs.c
+++ b/lib/rpc_subs.c
@@ -1195,6 +1195,8 @@ static int rpc_get_exports_proto(struct conn_info *info, struct exportinfo **exp
 				 info->timeout);
 		if (status == RPC_SUCCESS)
 			break;
+		if (status == RPC_SYSTEMERROR)
+			break;
 		if (++vers_entry > 2)
 			break;
 		CLNT_CONTROL(client, CLSET_VERS,


