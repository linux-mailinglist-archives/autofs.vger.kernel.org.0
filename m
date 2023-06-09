Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFC5729A65
	for <lists+autofs@lfdr.de>; Fri,  9 Jun 2023 14:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238697AbjFIMuh (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 9 Jun 2023 08:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240758AbjFIMua (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 9 Jun 2023 08:50:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1446E272A;
        Fri,  9 Jun 2023 05:50:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A053B65489;
        Fri,  9 Jun 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CB9C433EF;
        Fri,  9 Jun 2023 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686315028;
        bh=gIZwlLvY4sTdkvZELuapNhoOFzzZExwAnWiPWsxbXHo=;
        h=From:To:Subject:Date:From;
        b=dcwqOrVfEIufAkx9HYctn0bCPuNyn/IoA3qeRLEf0QBZaM2ZxNK4fITHocjWjP+BS
         ArXA2HvHcNMCbQoCJLgk3YNktWjq5smDP0btfPqHdZkDkaNlMvMKacJZXz5oGbyybS
         Seh3kB1aYVkF1EaQIzj0KMYE2IM8/UE/RnW4K8gKxJc+5U/2OtM1xACvDi/T8P0Pdc
         Xkm13/IgUo3Vr5PsmuoEohjK9wBWC2RLrPIKKbIGloomJhioPPXWTe43kEqN5X837K
         nGxIOrekLqpwpPCILVczWkex/Sm2OoMe1QXBZj99WR32Ho0RhbyqroHBCWw41oCA3r
         Vj6GOBo2c2fNw==
From:   Jeff Layton <jlayton@kernel.org>
To:     Christian Brauner <brauner@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Brad Warrum <bwarrum@linux.ibm.com>,
        Ritu Agarwal <rituagar@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ian Kent <raven@themaw.net>,
        "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Steve French <sfrench@samba.org>,
        Paulo Alcantara <pc@manguebit.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Shyam Prasad N <sprasad@microsoft.com>,
        Tom Talpey <tom@talpey.com>,
        John Johansen <john.johansen@canonical.com>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Ruihan Li <lrh2000@pku.edu.cn>,
        Suren Baghdasaryan <surenb@google.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        autofs@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org
Subject: [PATCH 0/9] fs: add some missing ctime updates
Date:   Fri,  9 Jun 2023 08:50:14 -0400
Message-Id: <20230609125023.399942-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

While working on a patch series to change how we handle the ctime, I
found a number of places that update the mtime without a corresponding
ctime update. POSIX requires that when the mtime is updated that the
ctime also be updated.

Note that these are largely untested other than for compilation, so
please review carefully. These are a preliminary set for the upcoming
rework of how we handle the ctime.

None of these seem to be very crucial, but it would be nice if
various maintainers could pick these up for v6.5. Please let me know if
you do.

Jeff Layton (9):
  ibmvmc: update ctime in conjunction with mtime on write
  usb: update the ctime as well when updating mtime after an ioctl
  autofs: set ctime as well when mtime changes on a dir
  bfs: update ctime in addition to mtime when adding entries
  efivarfs: update ctime when mtime changes on a write
  exfat: ensure that ctime is updated whenever the mtime is
  gfs2: update ctime when quota is updated
  apparmor: update ctime whenever the mtime changes on an inode
  cifs: update the ctime on a partial page write

 drivers/misc/ibmvmc.c             |  2 +-
 drivers/usb/core/devio.c          | 16 ++++++++--------
 fs/autofs/root.c                  |  6 +++---
 fs/bfs/dir.c                      |  2 +-
 fs/efivarfs/file.c                |  2 +-
 fs/exfat/namei.c                  |  8 ++++----
 fs/gfs2/quota.c                   |  2 +-
 fs/smb/client/file.c              |  2 +-
 security/apparmor/apparmorfs.c    |  7 +++++--
 security/apparmor/policy_unpack.c | 11 +++++++----
 10 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.40.1

