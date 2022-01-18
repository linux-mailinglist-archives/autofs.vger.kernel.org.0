Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AE449212C
	for <lists+autofs@lfdr.de>; Tue, 18 Jan 2022 09:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbiARI1J (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 03:27:09 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:43602 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbiARI1I (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 03:27:08 -0500
Date:   Tue, 18 Jan 2022 16:27:00 +0800
From:   Yixun Lan <dlan@gentoo.org>
To:     autofs@vger.kernel.org
Cc:     Fabian Groffen <grobian@gentoo.org>, Ian Kent <raven@themaw.net>
Subject: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YeZ51EWg85akR6Ig@ofant>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian Kent:

Fabian reported a bug about failing to mount /net with autofs-5.1.8,
but have no problem with previous 5.1.6

I'm not able to reproduce this error (need more info about the settings)
So write to the mailinglist to see if you can shed some light on this..


The most verbose error messages like this:

Jan 11 13:53:09 khnum automount[3614]: mount_autofs_offset: failed to
mount offset trigger  at 
Jan 11 13:56:24 khnum automount[3614]: set_tsd_user_vars: failed to get
buffer size for getpwuid_r
Jan 11 14:56:52 khnum kernel: autofs4:pid:10191:validate_dev_ioctl:
invalid path supplied for cmd(0xc018937e)


detail of the bug report:
 https://bugs.gentoo.org/831014


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
