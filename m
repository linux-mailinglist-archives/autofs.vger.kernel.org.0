Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31D449C5F8
	for <lists+autofs@lfdr.de>; Wed, 26 Jan 2022 10:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238870AbiAZJOq (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 26 Jan 2022 04:14:46 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:49796 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbiAZJOq (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 26 Jan 2022 04:14:46 -0500
Date:   Wed, 26 Jan 2022 17:14:44 +0800
From:   Yixun Lan <dlan@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Fabian Groffen <grobian@gentoo.org>,
        autofs mailing list <autofs@vger.kernel.org>
Subject: Re: [PATCH 00/19] My current patch queue
Message-ID: <YfERBDDV3lYqPg85@ofant>
References: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164255793534.27570.512543721628420491.stgit@mickey.themaw.net>
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian
On 10:11 Wed 19 Jan     , Ian Kent wrote:
> Hi,
> 
> Here is my current patch queue.
> 
> There have been a few problems I didn't catch in testing with the
> map entry offset handling (the internal hosts map and things like
> auto.net, auto.smb and map entries that have offsets use) rewrite.
> 
> So it's worth trying some or all of these patches to see if they help
> with the problem your seeing.
> ---
> 
> Frank Sorenson (1):
>       autofs-5.1.8 - fix loop under run in cache_get_offset_parent()
> 
> Ian Kent (11):
>       autofs-5.1.8 - fix kernel mount status notification
>       autofs-5.1.8 - fix fedfs build flags
>       autofs-5.1.8 - fix set open file limit
>       autofs-5.1.8 - improve descriptor open error reporting
>       autofs-5.1.8 - fix root offset error handling
>       autofs-5.1.8 - fix nonstrict fail handling of last offset mount
>       autofs-5.1.8 - dont fail on duplicate host export entry
>       autofs-5.1.8 - bailout on rpc systemerror
>       autofs-5.1.8 - fix nfsv4 only mounts should not use rpcbind
>       autofs-5.1.8 - simplify cache_add() a little
>       autofs-5.1.8 - fix use after free in tree_mapent_delete_offset_tree()
> 
> Sam James (7):
>       autofs-5.1.8 - fix bashism in configure
>       autofs-5.1.8 - fix missing include in hash.h
>       autofs-5.1.8 - define fallback dummy NSS config path
>       autofs-5.1.8 - avoid internal stat.h definitions
>       autofs-5.1.8 - add missing include to hash.h for _WORDSIZE
>       autofs-5.1.8 - add missing include to log.h for pid_t
>       autofs-5.1.8 - define _SWORD_TYPE for musl
> 
> 
>  CHANGELOG                | 17 +++++++++++++++++
>  configure.in             |  6 +++---
>  daemon/automount.c       | 20 ++++++++++++++------
>  daemon/direct.c          | 10 +++++++++-
>  daemon/lookup.c          |  6 +++---
>  daemon/spawn.c           | 29 +++++++++++++++++++++++++++++
>  fedfs/Makefile           |  4 ++--
>  include/hash.h           |  6 ++++++
>  include/log.h            |  2 ++
>  include/nsswitch.h       |  4 ++++
>  include/replicated.h     |  2 ++
>  lib/cache.c              |  4 ++--
>  lib/mounts.c             | 34 ++++++++++++++++++++--------------
>  lib/rpc_subs.c           |  2 ++
>  modules/lookup_multi.c   |  4 ++--
>  modules/lookup_program.c |  5 +----
>  modules/mount_nfs.c      | 13 +++++++------
>  modules/parse_sun.c      |  6 ++++++
>  modules/replicated.c     |  4 ++--
>  19 files changed, 133 insertions(+), 45 deletions(-)
> 
> --
> Ian
can you also take a look of the dmalloc build error?
which I reported here :
  https://www.spinics.net/lists/autofs/msg02394.html

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
