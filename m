Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA0F4921C1
	for <lists+autofs@lfdr.de>; Tue, 18 Jan 2022 10:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbiARJAl (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 04:00:41 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:50148 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiARJAk (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 04:00:40 -0500
Date:   Tue, 18 Jan 2022 17:00:38 +0800
From:   Yixun Lan <dlan@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org, Fabian Groffen <grobian@gentoo.org>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YeaBtjNlovM5gez4@ofant>
References: <YeZ51EWg85akR6Ig@ofant>
 <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian Kent:

thanks for your quick reply

On 16:44 Tue 18 Jan     , Ian Kent wrote:
> On Tue, 2022-01-18 at 16:27 +0800, Yixun Lan wrote:
> > Hi Ian Kent:
> > 
> > Fabian reported a bug about failing to mount /net with autofs-5.1.8,
> > but have no problem with previous 5.1.6
> > 
> > I'm not able to reproduce this error (need more info about the
> > settings)
> > So write to the mailinglist to see if you can shed some light on
> > this..
> > 
> > 
> > The most verbose error messages like this:
> > 
> > Jan 11 13:53:09 khnum automount[3614]: mount_autofs_offset: failed to
> > mount offset trigger  at 
> > Jan 11 13:56:24 khnum automount[3614]: set_tsd_user_vars: failed to
> > get
> > buffer size for getpwuid_r
> > Jan 11 14:56:52 khnum kernel: autofs4:pid:10191:validate_dev_ioctl:
> > invalid path supplied for cmd(0xc018937e)
> 
> I've had several bug reports which have been mostly fixed now but these
> log entries don't look like anything I have seen so far.
> 
> I haven't yet pushed those changes to the repository either.
> How would you like to proceed?
> I could post a patch series to you or the list to try if you wish.
either way work for me, but I need to be able to reproduce this first
I will leave Fabian for comments..

> 
> That user vars log entry is in code that hasn't changed for quite a
> long time, that's odd.
> 
> 
> > 
> > 
> > detail of the bug report:
> >  https://bugs.gentoo.org/831014
> > 
> > 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
