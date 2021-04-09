Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF53735A94E
	for <lists+autofs@lfdr.de>; Sat, 10 Apr 2021 01:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbhDIXm0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 9 Apr 2021 19:42:26 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:1299 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235096AbhDIXmZ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 9 Apr 2021 19:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qualcomm.com; i=@qualcomm.com; q=dns/txt; s=qcdkim;
  t=1618011731; x=1649547731;
  h=x-qcinternal:date:from:to:cc:message-id:references:
   mime-version:content-type:content-disposition:in-reply-to:
   x-operating-system:x-distribution:user-agent:subject;
  bh=cD/xtvswOc4zrZmPBtm6wgfGKSO+/vkKPwmkNcCwcn4=;
  b=cRYQc7dCVWsytOO+Yox10eX3xbstOeM20JOCa+Mjm1goPLlhyGwMi+AR
   JAE0hPj/yi1f6W45vFwulSSVU3LkNOsReaBYEaiK294OpFM/CSvtKdGlv
   Y4kDV8kmyrXjbR5z3dPftDZib3WJBn/Er7yqX9JuQ2WAbXsdLkGWYEPrJ
   Y=;
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Apr 2021 16:42:11 -0700
X-QCInternal: smtphost
Received: from sunapee.qualcomm.com ([10.62.117.90])
  by ironmsg04-sd.qualcomm.com with ESMTP; 09 Apr 2021 16:42:11 -0700
Received: by sunapee.qualcomm.com (Postfix, from userid 32836)
        id 6E4ABA056; Fri,  9 Apr 2021 16:42:11 -0700 (PDT)
Date:   Fri, 9 Apr 2021 16:42:11 -0700
From:   Mike Marion <mmarion@qualcomm.com>
To:     Ian Kent <raven@themaw.net>
Cc:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Message-ID: <20210409234211.GB9279@qualcomm.com>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
 <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
X-Operating-System: Linux 4.12.14-122.54-default x86_64
X-Distribution: SUSE Linux Enterprise Server 12 (x86_64) 12.5
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, Apr 09, 2021 at 08:50:27AM +0800, Ian Kent wrote:

> I haven't looked at this case for a very long time but I'm pretty
> sure nesting isn't allowed in direct mount maps (with any map type
> really). I'm also pretty sure I don't test for nesting in direct
> mount maps (quite difficult to do) and fail the trigger mount.

IME (or "Our" vs "My") I'd reiterate that nesting (as shown) does NOT 
work.  In fact, it's a been a huge pain for us over the years.  We've 
had to put seatbelts in place to avoid them being created in our maps 
because it can mess with the paths when done or changed.  In fact, I 
wrote up a long email once to send here and never did, about a suggest 
changes to the logic to help with what we run into often.

We still have an issue when something happens such as there's a directory
in the map of:
/prj/foo
and it needs to be broken up to multiple paths, such as;
/prj/foo/bar
/prj/foo/baz

The problem that arises for us is the people handling the filers and
maps make that change in one fell swoop.  So what happens on hosts
already running is the next re-read does logic like:
- I see new paths /prj/foo/bar and /prj/foo/baz and mounts them as type
  autofs
- I see that /prj/foo is gone, I need to umount it..
and the umount fails with:
do_umount_autofs_direct: ask umount returned busy for /prj/foo

and usually requires manual intervention to kick loose nested bits.

I'd love to see re-reads parse the map, save the new paths, parse the
removals, then add the new paths after removing/umounting removed paths.

-- 
Mike Marion-Unix SysAdmin/Sr. Staff IT Engineer-http://www.qualcomm.com
