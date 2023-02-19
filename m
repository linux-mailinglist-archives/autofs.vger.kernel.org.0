Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1677569C2F8
	for <lists+autofs@lfdr.de>; Sun, 19 Feb 2023 23:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjBSWkg (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 19 Feb 2023 17:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjBSWkf (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 19 Feb 2023 17:40:35 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BBF14EB1
        for <autofs@vger.kernel.org>; Sun, 19 Feb 2023 14:40:34 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3A91633B22;
        Sun, 19 Feb 2023 22:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676846432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=T+Rm6iimhJ2WQNquQXGVuOHu50hVUea2T/mEHF7ugBo=;
        b=L04gABMPVzlXEzHdN6x1A2htDDBh6e/iSXk/Qa0xwYPp/v9jUDfRCUV/o2NkdTnqMFfnDX
        wbXcuIvT+/+riGa8V9B+5232LuBrJ5S1DoKWG7ZMHJKffELQ7uwmckZujTnKV1hqBeA/92
        YgBC2r/oFQaLfHY/8hUGqLsaSrLF2HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676846432;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=T+Rm6iimhJ2WQNquQXGVuOHu50hVUea2T/mEHF7ugBo=;
        b=miEbSn30+iL4lNQ+EMZCMJJ6W4rYl/AlW6UZQqZvUreJGyx83Nh32Jld5zk7W+PfGIufry
        b0+EUOMgCrkXQCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44379131FD;
        Sun, 19 Feb 2023 22:40:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id VC+UOV6l8mOjBAAAMHmgww
        (envelope-from <neilb@suse.de>); Sun, 19 Feb 2023 22:40:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Help with autofs hang
Date:   Mon, 20 Feb 2023 09:40:27 +1100
Message-id: <167684642746.11359.12533584244594425604@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


Hi,
 I have a customer who is experiencing problems with automountd.  I
 think I know what is happening, but I'm not sure if what I imagine is
 possible, or what the best solution is.

 The kernel is 4.12 and automountd is 5.1.3 - so not the newest, but not
 ancient.  I cannot see any changes since that look like they might be
 relevant.

 The problem is that after a while automountd stops expiring direct
 mounts, and doesn't mount any new direct mounts that are added to the
 map.
 
 When this happens an automountd thread has sent an
 AUTOFS_IOC_EXPIRE_MULTI ioctl to the kernel, the kernel has sent a
 NFY_EXPIRE back up to automountd.  automountd reported

   handle_packet_expire_direct: can't find map entry for ....

 and the kernel never gets an ACK for the message and things hang.

 When I look, the mount point that the kernel is asking automountd to
 expire has already been unmounted.

 The mount map uses LDAP and changes quite often.  My guess is that
 automountd notices that some directory has been removed from the map,
 and so removes the map entry.  This presumably races with the expiry
 process.  The mount gets unmounted because it is removed from the map
 at the same time that expiry wants to remove it, and confusion results.
 
 My current thought for a solution is to change the way the kernel waits
 for NFY_EXPIRE replies.  Instead of waiting indefinitely it waits with
 a timeout.  If the wait times out and the filesystem is still mounted,
 it just loops around and waits again.  If after the timeout the
 filesystem has been unmounted it waits one more time (just in case
 automountd is about to reply) and then aborts the wait with -EAGAIN.
 I've provided the customer with a patch to do this using a 5 second
 wait.  I don't have test results yet.

 So my questions are:
  - is this race really possible? Can removal-from-map race with expiry?
  - is my timeout fix reasonable?  Might it cause other problems?  Is
    there a better way to fix this inside automountd?

Thanks,
NeilBrown
