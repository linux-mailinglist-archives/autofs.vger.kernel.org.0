Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAD72E2F1F
	for <lists+autofs@lfdr.de>; Sat, 26 Dec 2020 22:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgLZVBN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 26 Dec 2020 16:01:13 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47367 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725989AbgLZVBN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 26 Dec 2020 16:01:13 -0500
X-Greylist: delayed 381 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Dec 2020 16:01:12 EST
Received: from yessica.powercraft.nl ([80.127.158.83])
        by smtp-cloud8.xs4all.net with ESMTP
        id tGZlktGR3WmLptGZmkoitN; Sat, 26 Dec 2020 21:54:10 +0100
Received: from [192.168.24.154] (ebony.powercraft.nl [80.127.158.83])
        by yessica.powercraft.nl (Postfix) with ESMTPSA id 38A1220628
        for <autofs@vger.kernel.org>; Sat, 26 Dec 2020 21:54:09 +0100 (CET)
To:     autofs@vger.kernel.org
From:   Jelle de Jong <jelledejong@powercraft.nl>
Subject: how to auto map cifs to a username mount without & for the share path
Message-ID: <066f707f-82dc-98c8-b9b9-28f294541a04@powercraft.nl>
Date:   Sat, 26 Dec 2020 21:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFlxLYLxOxSJ6DPyxH8W39gPwKHevjrBgpeFfuEqVWU1kpWBo+eCbrX1yZQXtfflPAyBQmkRJ7qi1b6jWsoEgrvJ5ONAFHRELU5k/uU2mE5GFld3gGZg
 7gmdFhydYkBNhO6RC1Qb/OCj6orgwVfEQonv6eL3ZJoG/GCjsST8U8gHUkaq2sjf3Eh4L7jmK13nkxWrZkhb7m0d8sjxHDzPp5A=
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hello everbody,

I got the following autofs mapping example:

/mnt/org/home       /etc/auto.home --timeout=0

* 
-fstype=cifs,sec=krb5,uid=${UID},gid=${UID},cruid=${UID},file_mode=0660,dir_mode=0770,echo_interval=12 
://samba.example.lan/users/&

//samba.example.lan/users/<username> is on the server so 
//samba.example.lan/users/& works fine, however I got other shares that 
I want to mount and only accessable per user basis (securiy permissions)

/mnt/org/documents  /etc/auto.documents --timeout=0
* 
-fstype=cifs,sec=krb5,uid=${UID},gid=${UID},cruid=${UID},file_mode=0660,dir_mode=0770,echo_interval=12 
://samba01.bothends.lan/documents

This mapping does works and it mounts the document share as 
/mnt/org/documents/<username> however it also mount 
/mnt/org/documents/.hidden and tries to mount as root and all the other 
lookups in /mnt/org/documents will get a mount because the catchall * 
and no matching & limit in the shrae path. It becomes a mess.

I have searched the manuals and I can not find a mapping system without 
& in the file path I want the * to match the user name so only that 
lookup with the username will be mounted.

& -fstype=cifs ://samba01.bothends.lan/documents
$USER -fstype=cifs ://samba01.bothends.lan/documents

Something like this. How can I do this witout hardcoding the usernames 
mount points? If this functionality is not supported would it be 
possible to have * be replaced with a variable or some more dynamic 
feature? Tips?

Thank you in advance,

Kind regards,

Jelle de Jong
