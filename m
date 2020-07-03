Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8F22141DF
	for <lists+autofs@lfdr.de>; Sat,  4 Jul 2020 01:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgGCXAy (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 3 Jul 2020 19:00:54 -0400
Received: from outbound2p.ore.mailhop.org ([54.187.218.212]:13630 "EHLO
        outbound2p.ore.mailhop.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726188AbgGCXAy (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 3 Jul 2020 19:00:54 -0400
X-Greylist: delayed 960 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jul 2020 19:00:53 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1593816293; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=m7EAYDdvG2AUqarwd8TK1gNFwNQRRmrekiwHJrSIFpWpGeGUDehfVru6dDRg/nFoyQfwP13EeA5L3
         WLJE8clPws8so8rA3e900Gpziog0X9h63lwdmbOpoWsSVupc40IH1Y/AlOVRF2luaIuAhi2F/uUCrw
         ewJyNg0NTZKmO+pkZwmLjzZEgiEX5PWI83mBVCOrZ/unEFsIyvSKmZVN5SBEGzd8uqi0lhJ+a9SWqx
         lfK+uceqVC38LoHyF70/WPod+GV3Dsn7tVhlRZ3jsTrb27VR73fyKXbZzd+iX1yrbSt0RMO0zW2JYn
         DuIV/DY8UVCaC3qfypRrfEI9+G2k+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:references:in-reply-to:message-id:reply-to:date:
         subject:cc:to:from:dkim-signature:from;
        bh=2eNv9wfT5T2j5lQ7IU0PZm5JS71uOb8RrG5L8m4mAUc=;
        b=YpgILKys0F7PiL7kGBBERn9zo/CuoXN0PJQ2FcxRk12TcEECLYEQAhSC0nJk1iK64g+IcwOFhD2ui
         b1BSXWP/EP51mkzY1bp8fez07jMzoDRJycC7ylOUGdmKpOGglScch1j+x3VPfPC78HEOPFx4y7tfF2
         sY+jEo5sEl0RzI9MVmoMnOBuB0aIN4SnRzwaed8a75MukqI7nNaV//LfQ6XbgKmQW/BFzs+vLJHW3s
         a886nlFOfKYBlQ5Wx6xcUTkJkDFA3dmChbRG3iED7TpxJxBkBWE8JNUTEE/53vsmk+GbqizloUsn29
         XD93EqiP1IsbU1si/f2inSFX28DwJwg==
ARC-Authentication-Results: i=1; outbound4.ore.mailhop.org;
        spf=none smtp.mailfrom=isolar.dyndns.org smtp.remote-ip=198.72.202.23;
        dmarc=none header.from=isolar.dyndns.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:references:in-reply-to:message-id:reply-to:date:
         subject:cc:to:from:from;
        bh=2eNv9wfT5T2j5lQ7IU0PZm5JS71uOb8RrG5L8m4mAUc=;
        b=cLFVtmXHkm5wRsc++w5shI994Og2u7oDB+vWlTWMX8+fXMs4CKKm846fD4v0/DZhNwZ6SYIog0+D3
         TjAzN3cPUzAhZ0YTb6CrYjggTD4zUVW4287yEKxNOIfETnTdoP6QJ2LK94kE5qKwGAztplRx5rs0xO
         v+JB2dQAndJTa/p1RIPzA6MSYyT4zuhZMPZpWW299GbWJlmen9iYl4xdHw25X28OLV2dahbTzm2J+2
         lQoM7ajpI+f4d0aXLieHWHEfhGv+4Bp0OVMrQXML8YJFsL0RJ0FKtGIhNb9D2XVvsqDbE/G0XR1lcv
         SxQFd32jj1ZotzbE0yqs3EwdexnZrMQ==
X-MHO-RoutePath: ZWFybGU=
X-MHO-User: cdb49ee1-bd7e-11ea-b630-6b8aa7872eb8
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Originating-IP: 198.72.202.23
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from [192.168.1.3] (cpe-198-72-202-23.socal.res.rr.com [198.72.202.23])
        by outbound4.ore.mailhop.org (Halon) with ESMTPSA
        id cdb49ee1-bd7e-11ea-b630-6b8aa7872eb8;
        Fri, 03 Jul 2020 22:44:52 +0000 (UTC)
From:   "Greg Earle" <earle@isolar.DynDNS.ORG>
To:     "Randy Dunlap" <rdunlap@infradead.org>
Cc:     autofs@vger.kernel.org
Subject: Re: [PATCH 00/10] Documentation: filesystems: eliminate duplicated
 words
Date:   Fri, 03 Jul 2020 15:44:49 -0700
Reply-To: autofs@vger.kernel.org
X-Mailer: MailMate (1.13.1r5672)
Message-ID: <3E4FEBC7-35F5-4BA2-A996-F17E38BB0382@isolar.DynDNS.ORG>
In-Reply-To: <20200703214325.31036-1-rdunlap@infradead.org>
References: <20200703214325.31036-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 3 Jul 2020, at 14:43, Randy Dunlap wrote:

> Fix doubled words in filesystems files.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Ian Kent <raven@themaw.net>
> Cc: autofs@vger.kernel.org
> Cc: David Howells <dhowells@redhat.com>
> Cc: linux-cachefs@redhat.com
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Theodore Y. Ts'o <tytso@mit.edu>
> Cc: linux-fscrypt@vger.kernel.org
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: linux-unionfs@vger.kernel.org
>
>  Documentation/filesystems/autofs-mount-control.rst |    6 +++---
>  Documentation/filesystems/caching/operations.rst   |    2 +-
>  Documentation/filesystems/configfs.rst             |    2 +-
>  Documentation/filesystems/directory-locking.rst    |    4 ++--
>  Documentation/filesystems/fsverity.rst             |    2 +-
>  Documentation/filesystems/mount_api.rst            |    4 ++--
>  Documentation/filesystems/overlayfs.rst            |    2 +-
>  Documentation/filesystems/path-lookup.rst          |    2 +-
>  Documentation/filesystems/sysfs-tagging.rst        |    2 +-
>  Documentation/filesystems/vfs.rst                  |    4 ++--
>  10 files changed, 15 insertions(+), 15 deletions(-)

How 'the the' heck does this even happen?  Once I could understand, but 
... multiple times?!?

		- Greg
