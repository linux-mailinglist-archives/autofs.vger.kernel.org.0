Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F93C1F816
	for <lists+autofs@lfdr.de>; Wed, 15 May 2019 18:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfEOQBD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 15 May 2019 12:01:03 -0400
Received: from mhos01.weblink.ch ([91.193.20.22]:55923 "EHLO MHOS01.weblink.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfEOQBD (ORCPT <rfc822;autofs@vger.kernel.org>);
        Wed, 15 May 2019 12:01:03 -0400
Received: from MH04.weblink.ch (mh04.weblink.ch [91.193.20.62]) by MHOS01.weblink.ch with SMTP
        (version=TLS\Tls12
        cipher=Aes256 bits=256);
   Wed, 15 May 2019 18:01:34 +0200
Received: from [193.174.51.189] (w610-pc05.inet.dkfz-heidelberg.de [193.174.51.189]) by MH04.weblink.ch with SMTP
        (version=Tls12
        cipher=Aes256 bits=256);
   Wed, 15 May 2019 18:00:53 +0200
To:     autofs@vger.kernel.org
From:   Frank Thommen <list.autofs@drosera.ch>
Subject: Changes in indirect multi-maps don't become effective w/o autofs
 restart
Message-ID: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
Date:   Wed, 15 May 2019 18:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Exim-Id: 1f7715b4-5f95-c79e-a80c-9d70755a7a5d
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear all,

the autofs manpages says:

"If  an  indirect  map  is modified then the change will become 
effective immediately.  If an indirect map uses the browse option, the 
master map contains direct mount maps or the auto.master map is modified 
then the autofs service control reload action must be rerun to activate 
the changes."

However this doesn't seem true when using multi-maps:

In /etc/auto.master:

     /base/data /etc/auto.data


In /etc/auto.data:

    # section 1
    #
    p1  -fstype=nfs,vers=3,sec=sys  srv:/export/p1
    p2  -fstype=nfs,vers=3,sec=sys  srv:/export/p2

    # section 2
    #
    others   -fstype=nfs,vers=3,sec=sys \
       /p3   srv:/export/p2 \
       /p4   srv:/export/p4

When adding an entry

    p5  -fstype=nfs,vers=3,sec=sys  srv:/export/p5

in section 1, I can immediately change into /base/data/p2 and it is 
mounted.  All well.  But when I add an entry

    /p5 srv:/export/p5

to section 2, then this new entry is not accessible as 
/base/data/others/p5 even after a `systemctl reload autofs`.  autofs has 
to be completely restarted.  Unfortunately we've had many issues 
(crashes) with clusterjobs accessing NFS shares during autofs restarts. 
That's why we'd like to avoid complete autofs restart whenever possible.

Can you confirm that multi-maps are not updated by autofs reloads and/or 
is there a way to achieve this?


We are running autofs-5.0.7-70.el7_4.1.x86_64 on CentOS 7.4.1708 and we 
cannot update to newer CentOS releases due to other restrictions 
(special hardware/drivers).


Cheers
frank


