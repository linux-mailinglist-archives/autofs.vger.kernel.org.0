Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0824932D0
	for <lists+autofs@lfdr.de>; Wed, 19 Jan 2022 03:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbiASCUI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 21:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350887AbiASCUG (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 21:20:06 -0500
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DD9C06161C
        for <autofs@vger.kernel.org>; Tue, 18 Jan 2022 18:20:03 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id DB3D410005E
        for <autofs@vger.kernel.org>; Wed, 19 Jan 2022 13:11:57 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LFgV3bUa4zuJ for <autofs@vger.kernel.org>;
        Wed, 19 Jan 2022 13:11:57 +1100 (AEDT)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id D4ACB100059; Wed, 19 Jan 2022 13:11:57 +1100 (AEDT)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        smtp01.aussiebb.com.au
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=10.0 tests=KHOP_HELO_FCRDNS,RDNS_DYNAMIC,
        SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.4
Received: from mickey.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 4D781100059;
        Wed, 19 Jan 2022 13:11:55 +1100 (AEDT)
Subject: [PATCH 00/19] My current patch queue
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, Fabian Groffen <grobian@gentoo.org>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Wed, 19 Jan 2022 10:11:52 +0800
Message-ID: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

Here is my current patch queue.

There have been a few problems I didn't catch in testing with the
map entry offset handling (the internal hosts map and things like
auto.net, auto.smb and map entries that have offsets use) rewrite.

So it's worth trying some or all of these patches to see if they help
with the problem your seeing.
---

Frank Sorenson (1):
      autofs-5.1.8 - fix loop under run in cache_get_offset_parent()

Ian Kent (11):
      autofs-5.1.8 - fix kernel mount status notification
      autofs-5.1.8 - fix fedfs build flags
      autofs-5.1.8 - fix set open file limit
      autofs-5.1.8 - improve descriptor open error reporting
      autofs-5.1.8 - fix root offset error handling
      autofs-5.1.8 - fix nonstrict fail handling of last offset mount
      autofs-5.1.8 - dont fail on duplicate host export entry
      autofs-5.1.8 - bailout on rpc systemerror
      autofs-5.1.8 - fix nfsv4 only mounts should not use rpcbind
      autofs-5.1.8 - simplify cache_add() a little
      autofs-5.1.8 - fix use after free in tree_mapent_delete_offset_tree()

Sam James (7):
      autofs-5.1.8 - fix bashism in configure
      autofs-5.1.8 - fix missing include in hash.h
      autofs-5.1.8 - define fallback dummy NSS config path
      autofs-5.1.8 - avoid internal stat.h definitions
      autofs-5.1.8 - add missing include to hash.h for _WORDSIZE
      autofs-5.1.8 - add missing include to log.h for pid_t
      autofs-5.1.8 - define _SWORD_TYPE for musl


 CHANGELOG                | 17 +++++++++++++++++
 configure.in             |  6 +++---
 daemon/automount.c       | 20 ++++++++++++++------
 daemon/direct.c          | 10 +++++++++-
 daemon/lookup.c          |  6 +++---
 daemon/spawn.c           | 29 +++++++++++++++++++++++++++++
 fedfs/Makefile           |  4 ++--
 include/hash.h           |  6 ++++++
 include/log.h            |  2 ++
 include/nsswitch.h       |  4 ++++
 include/replicated.h     |  2 ++
 lib/cache.c              |  4 ++--
 lib/mounts.c             | 34 ++++++++++++++++++++--------------
 lib/rpc_subs.c           |  2 ++
 modules/lookup_multi.c   |  4 ++--
 modules/lookup_program.c |  5 +----
 modules/mount_nfs.c      | 13 +++++++------
 modules/parse_sun.c      |  6 ++++++
 modules/replicated.c     |  4 ++--
 19 files changed, 133 insertions(+), 45 deletions(-)

--
Ian

