Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B44AAF43
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388302AbfIEXuI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:08 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50040
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfIEXuI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:08 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AHHQAKnHFd/1230XZlghkCghYtQFI?=
 =?us-ascii?q?hEiqEIY8MNwIBGAEGBYEMIReJXIVEi2IJAQEBAQEBAQEBGwwNAQIBAYZ3Izc?=
 =?us-ascii?q?GDgIMAQEBBAEBAQEBBgMBbYRrISIMQgEQAYUgfg0CGA4CSRaDNoF2ExCbaY5?=
 =?us-ascii?q?/gTIaAoo1gQwoAYt3GHiBB4FEh0uDIYJYBIxUKII2hiNClhmCKYZ3jXEbgjR?=
 =?us-ascii?q?vilkDinePMpk1IoFYTS4KgycJgg4BAQGGcIgKNjABgQUBAYQ8iggBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AHHQAKnHFd/1230XZlghkCghYtQFIhEiqEIY8MNwIBG?=
 =?us-ascii?q?AEGBYEMIReJXIVEi2IJAQEBAQEBAQEBGwwNAQIBAYZ3IzcGDgIMAQEBBAEBA?=
 =?us-ascii?q?QEBBgMBbYRrISIMQgEQAYUgfg0CGA4CSRaDNoF2ExCbaY5/gTIaAoo1gQwoA?=
 =?us-ascii?q?Yt3GHiBB4FEh0uDIYJYBIxUKII2hiNClhmCKYZ3jXEbgjRvilkDinePMpk1I?=
 =?us-ascii?q?oFYTS4KgycJgg4BAQGGcIgKNjABgQUBAYQ8iggBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582353"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:40:47 +0800
Subject: [PATCH 00/32] Current patch queue
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:40:47 +0800
Message-ID: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Here are the patches I currently have in my queue for review
before I commit them.

I hope to commit them early next week if possible and I'm
hoping to release 5.1.6 soon after.

---

Andreas P (3):
      autofs-5.1.5 - fix typing errors
      autofs-5.1.5 - Update README
      autofs-5.1.5 - fix additional typing errors

Ian Kent (28):
      autofs-5.1.5 - make expire remaining log level debug
      autofs-5.1.5 - allow period following macro in selector value
      autofs-5.1.5 - fix macro expansion in selector values
      autofs-5.1.5 - Explain /etc/auto.master.d usage
      autofs-5.0.5 - plus map includes are only allowed in file sources
      autofs-5.1.5 - update autofs(8) offset map entry update description
      autofs-5.1.5 - also use strictexpire for offsets
      autofs-5.1.5 - remove unused function has_fstab_option()
      autofs-5.1.5 - remove unused function reverse_mnt_list()
      autofs-5.1.5 - remove a couple of old debug messages
      autofs-5.1.5 - fix amd entry memory leak
      autofs-5.1.5 - fix unlink_mount_tree() not umounting mounts
      autofs-5.1.5 - use ignore option for offset mounts as well
      autofs-5.1.5 - add config option for "ignore" mount option
      autofs-5.1.5 - use bit flags for autofs mount types in mnt_list
      autofs-5.1.5 - use mp instead of path in mnt_list entries
      autofs-5.1.5 - always use PROC_MOUNTS to make mount lists
      autofs-5.1.5 - add glibc getmntent_r()
      autofs-5.1.5 - use local getmntent_r in table_is_mounted()
      autofs-5.1.5 - refactor unlink_active_mounts() in direct_c
      autofs-5.1.5 - don't use tree_is_mounted() for mounted checks
      autofs-5.1.5 - use single unlink_umount_tree() for both direct and indirect mounts
      autofs-5.1.5 - move unlink_mount_tree() to lib/mounts.c
      autofs-5.1.5 - use local_getmntent_r() for unlink_mount_tree()
      autofs-5.1.5 - use local getmntent_r() in get_mnt_list()
      autofs-5.1.5 - use local getmntent_r() in tree_make_mnt_list()
      autofs-5.1.5 - fix missing initialization of autofs_point flags
      autofs-5.1.5 - build without hesiod support

Joel Ebel (1):
      autofs-5.1.5 - Increase group buffer size geometrically


 CHANGELOG                      |   31 +++
 INSTALL                        |    2 
 Makefile.conf.in               |    2 
 README                         |   38 +--
 README.amd-maps                |    4 
 README.replicated-server       |    2 
 autofs.spec                    |    5 
 daemon/automount.c             |    6 -
 daemon/direct.c                |  200 ++++++-----------
 daemon/indirect.c              |   94 ++------
 daemon/lookup.c                |    9 -
 daemon/spawn.c                 |    2 
 daemon/state.c                 |   21 --
 include/automount.h            |    4 
 include/defaults.h             |    2 
 include/mounts.h               |   20 +-
 lib/defaults.c                 |   17 +
 lib/master.c                   |    7 -
 lib/mounts.c                   |  480 +++++++++++++++++++---------------------
 man/auto.master.5.in           |   33 ++-
 man/autofs.5                   |   21 +-
 man/autofs.8.in                |    5 
 man/autofs.conf.5.in           |   36 ++-
 man/autofs_ldap_auth.conf.5.in |    2 
 man/automount.8                |    2 
 modules/amd_tok.l              |    2 
 modules/lookup_ldap.c          |    4 
 modules/parse_amd.c            |  290 ++++++++++++++++--------
 modules/replicated.c           |    4 
 redhat/autofs.conf.default.in  |   65 +++--
 redhat/autofs.sysconfig        |    2 
 samples/auto.master            |    6 -
 samples/autofs.conf.default.in |   39 ++-
 samples/autofs.init.conf       |    2 
 34 files changed, 756 insertions(+), 703 deletions(-)

--
Ian
