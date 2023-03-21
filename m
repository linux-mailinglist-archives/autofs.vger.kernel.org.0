Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4413B6C2792
	for <lists+autofs@lfdr.de>; Tue, 21 Mar 2023 02:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCUBom (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Mar 2023 21:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjCUBol (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Mar 2023 21:44:41 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95864144AB
        for <autofs@vger.kernel.org>; Mon, 20 Mar 2023 18:44:38 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3358921A7C;
        Tue, 21 Mar 2023 01:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1679363077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=I2FSIMhji8yk4Jxjk+BqesCKk9FxmD1SuuIvfORhc2Y=;
        b=BYskkubZkiRAD63MogSOaDpS+8oKoNVEnrU89bc8x5Vozo+IXZuJJH6mQVG5d/mMfWG6O6
        ACpJA61/gxWo22jTDYXicQXE3tOlZTRrWPOswTyQAwDQL1RjnmDn/2nBUtFniUEQHVh9VD
        PAODJvLW49hy8JGtuexu3sKPeHTXllM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1679363077;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=I2FSIMhji8yk4Jxjk+BqesCKk9FxmD1SuuIvfORhc2Y=;
        b=CCtUu+bs1CZ6WYsRSI7hscM+9cm1bd83yZ8QI1Hb6dQRvSE0NenSKYVK01nil4AykNGn78
        WLxTDuWldRcY+6BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E4E213416;
        Tue, 21 Mar 2023 01:44:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id DxodAgQMGWTLaAAAMHmgww
        (envelope-from <neilb@suse.de>); Tue, 21 Mar 2023 01:44:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Bug in try_remount()
Date:   Tue, 21 Mar 2023 12:44:33 +1100
Message-id: <167936307307.8008.4763527658279935147@noble.neil.brown.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org



Hi,
 I've been playing with automount and recently tried "kill -1" to get it
 to re-read the config file.  It crashed.

 Crash happens in try_remount().

	if (MM_PARENT(me)->key[0] =3D=3D '/') {

MM_PARENT() is NULL.
My guess is that MM_PARENT() is only non-NULL for offset mounts and the
breakage was introduced in=20
 Commit ba9fe0a (\"autofs-5.1.8 - fix incorrect path for is_mounted() in try_=
remount()\")

The very latest patch.
Prior to this patch it would only try MM_PARENT when type =3D=3D t_offset.
Now it always accesses it.

NeilBrown
