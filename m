Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0025358C22
	for <lists+autofs@lfdr.de>; Thu,  8 Apr 2021 20:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhDHSZj (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 8 Apr 2021 14:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbhDHSZi (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 8 Apr 2021 14:25:38 -0400
X-Greylist: delayed 2091 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Apr 2021 11:25:26 PDT
Received: from wp110.webpack.hosteurope.de (wp110.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8475::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A704C061760
        for <autofs@vger.kernel.org>; Thu,  8 Apr 2021 11:25:26 -0700 (PDT)
Received: from hsi-kbw-109-192-201-039.hsi6.kabel-badenwuerttemberg.de ([109.192.201.39] helo=drosera.fritz.box); authenticated
        by wp110.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lUYnY-0005l4-2I; Thu, 08 Apr 2021 19:50:32 +0200
To:     autofs@vger.kernel.org
From:   Frank Thommen <autofs@lists.drosera.ch>
Subject: do_mount_autofs_direct: failed to create mount directory ...
Message-ID: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
Date:   Thu, 8 Apr 2021 19:50:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;autofs@lists.drosera.ch;1617906326;7615a784;
X-HE-SMSGID: 1lUYnY-0005l4-2I
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear all,

I have problems "submounting" a share when using direct mounts. Given 
the following automounter tables:

/etc/auto.master:
-----------------------------------
/-  /etc/auto.groups


/etc/auto.groups
-----------------------------------
/groups/group1/int        server:/export/group1
/groups/group1/int/svc/a  server2:/export/service_a
/groups/group2/int        server2:/export/group2
/groups/group3/int        server:/export/group3
[... ca. 100 entries here ...]


/groups/group1/int/svc/a is not mounted and I get the error message 
"do_mount_autofs_direct: failed to create mount directory 
/groups/group1/int/svc/a" on any host which doesn not have root 
permissions (no_root_squash) on server:/export/group1 (which is on 99% 
of all clients).

The directory "svc/a" has been created on server:/export/group1, so 
there is no need to recreate it.

There are additional subdirectories in /groups/group1/int/svc/ which 
directly reside on server:/export/group1.  Only "a" need to be mounted 
from a second location.


Can this be solved with direct mounts?  How?  We would prefer to use 
direct mounts, as this has shown to create the least problems when 
dynamically changing the mount tables (no automounter restart is 
required).  However I would not have a problem to use some indirect 
mount mechanism for /groups/group1/int/svc/a as long as the main 
/groups/groupN/int can stay in a direct mount table.

Any help or hint is appreciated.

Cheers, Frank
