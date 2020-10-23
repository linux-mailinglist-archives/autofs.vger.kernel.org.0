Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A21F297107
	for <lists+autofs@lfdr.de>; Fri, 23 Oct 2020 15:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373869AbgJWN7q (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 23 Oct 2020 09:59:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:45466 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S368404AbgJWN7p (ORCPT <rfc822;autofs@vger.kernel.org>);
        Fri, 23 Oct 2020 09:59:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B2CC0AEC1;
        Fri, 23 Oct 2020 13:59:44 +0000 (UTC)
Date:   Fri, 23 Oct 2020 08:59:41 -0500
From:   Goldwyn Rodrigues <rgoldwyn@suse.de>
To:     autofs@vger.kernel.org
Cc:     raven@themaw.net
Subject: [PATCH] Fix option for master read wait
Message-ID: <20201023135941.ednsszxsvgwv65k2@fiona>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

master wait expects a value, and if provided automount crashes with the
following trace:

#0  __GI_____strtoul_l_internal (nptr=0x0, endptr=0x7fffffffe120, base=0, group=<optimized out>,
    loc=0x7ffff77a63a0 <_nl_global_locale>) at ../stdlib/strtol_l.c:292
#1  0x0000555555562c52 in getnumopt ()
#2  0x0000555555564ec0 in main ()

This is because the options string is not correct and does not expect
an argument for master wait (M), which sets optarg to NULL

Fixes: e68f07f ("autofs-5.1.2 - add master read wait option")
Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>

diff --git a/daemon/automount.c b/daemon/automount.c
index 0391bfb..c2a0f58 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -2219,7 +2219,7 @@ int main(int argc, char *argv[])
 	time_t timeout;
 	time_t age = monotonic_time(NULL);
 	struct rlimit rlim;
-	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFM";
+	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFM:";
 	static const struct option long_options[] = {
 		{"help", 0, 0, 'h'},
 		{"pid-file", 1, 0, 'p'},

-- 
Goldwyn
