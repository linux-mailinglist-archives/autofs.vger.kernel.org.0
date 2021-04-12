Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940CE35D183
	for <lists+autofs@lfdr.de>; Mon, 12 Apr 2021 21:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245374AbhDLTyE (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 12 Apr 2021 15:54:04 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:40299 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245360AbhDLTyE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 12 Apr 2021 15:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qualcomm.com; i=@qualcomm.com; q=dns/txt; s=qcdkim;
  t=1618257226; x=1649793226;
  h=x-qcinternal:date:from:to:cc:message-id:references:
   mime-version:content-type:content-disposition:in-reply-to:
   x-operating-system:x-distribution:user-agent:subject;
  bh=AsOo2gql5Xh97+s2xSIUOotggV1c17uOdjqlnrRpOe4=;
  b=WqRmv91sM8V8Qndu7R5POjroS5vi+iYZ07BRD14S9P8P0g9PxbBe8enI
   kkniMMCZ82Rtf5DAkhdkoVzy6mktSG71Zspx0eLDIedzSpE0Sqb+g4yPl
   4iMeq+oFqpnCiBTaPx6ILiQ6UJt85uYA7Gp3OWEAqXM9JqRY1G+oE5vLn
   8=;
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Apr 2021 12:53:46 -0700
X-QCInternal: smtphost
Received: from sunapee.qualcomm.com ([10.62.117.90])
  by ironmsg05-sd.qualcomm.com with ESMTP; 12 Apr 2021 12:53:45 -0700
Received: by sunapee.qualcomm.com (Postfix, from userid 32836)
        id E82D3A056; Mon, 12 Apr 2021 12:53:45 -0700 (PDT)
Date:   Mon, 12 Apr 2021 12:53:45 -0700
From:   Mike Marion <mmarion@qualcomm.com>
To:     Ian Kent <raven@themaw.net>
Cc:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Message-ID: <20210412195345.GE10235@qualcomm.com>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
 <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
 <20210409234211.GB9279@qualcomm.com>
 <0602c18ab85c99a98fe6c4f5e189f2f1c06508d0.camel@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0602c18ab85c99a98fe6c4f5e189f2f1c06508d0.camel@themaw.net>
X-Operating-System: Linux 4.12.14-122.54-default x86_64
X-Distribution: SUSE Linux Enterprise Server 12 (x86_64) 12.5
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, Apr 10, 2021 at 09:46:47AM +0800, Ian Kent wrote:

> > I'd love to see re-reads parse the map, save the new paths, parse the
> > removals, then add the new paths after removing/umounting removed
> > paths.
> 
> It sounds simple to do but I think you would be surprised with the
> sort of difficulties I would encounter.

Yeah, that's pretty much why I never sent the email I wrote up before, I
started to realize it was far more complicated as you say.

> But, if that was done, what would be the policy if /prj/foo was in
> use, lazy umount /prj/foo mounts, ignore all changes at or below
> /prj/foo until it's no longer in use, or something else?

Yep, that's one of the issues I thought of too.  It's already an issue
we have with the current logic as well.  Usually we end up just tagging
the hosts for a reboot once any compute jobs on them are done, it's just
easier than fixing them by hand.

> I would be tempted to lazy umount things at or below /prj/foo, after
> all they would be using stale paths and will eventually end up in
> tears anyway, particularly if processes have open file handles on
> paths within the mount.
> 
> Don't get me wrong, this does sound sensible and is something that
> needs to be fixed, there's just those cases that cause me pain time
> and time again that get in the road.
> 
> The other problem is I might use features that are as yet unreleased
> (but in the current source tree) so that would complicate matters,
> OTOH I might not need the new features and, other than the in use
> policy, it might straight froward ...

It'd be great if it could be implemented at some point.

-- 
Mike Marion-Unix SysAdmin/Sr. Staff IT Engineer-http://www.qualcomm.com
