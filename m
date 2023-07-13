Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BE075167A
	for <lists+autofs@lfdr.de>; Thu, 13 Jul 2023 04:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjGMCuF (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 12 Jul 2023 22:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjGMCuE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 12 Jul 2023 22:50:04 -0400
X-Greylist: delayed 318 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Jul 2023 19:50:03 PDT
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [121.200.0.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEE619A3
        for <autofs@vger.kernel.org>; Wed, 12 Jul 2023 19:50:03 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6587910031F
        for <autofs@vger.kernel.org>; Thu, 13 Jul 2023 12:44:42 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pHoo8N6iBjoA for <autofs@vger.kernel.org>;
        Thu, 13 Jul 2023 12:44:42 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 45888100265; Thu, 13 Jul 2023 12:44:41 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (2403-580e-4b40-0-7968-2232-4db8-a45e.ip6.aussiebb.net [IPv6:2403:580e:4b40:0:7968:2232:4db8:a45e])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 185C7100265;
        Thu, 13 Jul 2023 12:44:38 +1000 (AEST)
Subject: [PATCH 0/2] Interface probe delay fix series
From:   Ian Kent <raven@themaw.net>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>,
        Mike Gabriel <sunweaver@debian.org>,
        autofs mailing list <autofs@vger.kernel.org>
Date:   Thu, 13 Jul 2023 10:44:37 +0800
Message-ID: <168921521309.13982.11820120661485368005.stgit@donald.themaw.net>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Here is a patch to resolve the availability probe delay we've
seen. There's another patch that adjusts a parameter passed to
one of the IN6 macros but that's purely for consistency, there's
no actual behaviour change.

Another thing iyou may notivce is that strickly speaking it should
be possible to use the link-local address but trying to do so always
returns an error so excluding it seemed like the best thing to do.

Also you may notice the probe results in a list of hosts (if there
are mulitple hosts or one of the hosts has multiple addreses) that
match the fastest response for highest available NFS version only.
In other words it's only working out the list of hosts that are
available to try the mount rather than forcing those hosts to use
the specific NFS version, the mount we get is left to mount(8) (ie.
mount.nfs).
---

Ian Kent (2):
      autofs-5.1.8 - use correct reference for IN6 macro call
      autofs-5.1.8 - dont probe interface that cant send packet


 CHANGELOG            |  2 ++
 lib/parse_subs.c     | 36 +++++++++++++++++++++++++++++++++++-
 modules/replicated.c | 21 +++++++++++++--------
 3 files changed, 50 insertions(+), 9 deletions(-)

--
Ian

