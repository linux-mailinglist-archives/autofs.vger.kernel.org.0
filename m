Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E70C1FEEA2
	for <lists+autofs@lfdr.de>; Thu, 18 Jun 2020 11:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgFRJ2r (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 18 Jun 2020 05:28:47 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:37265 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729146AbgFRJ2q (ORCPT <rfc822;autofs@vger.kernel.org>);
        Thu, 18 Jun 2020 05:28:46 -0400
Received: from [192.168.0.3] (ip5f5af28f.dynamic.kabel-deutschland.de [95.90.242.143])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 571E9206462AB;
        Thu, 18 Jun 2020 11:28:43 +0200 (CEST)
Subject: Re: The automounter hangs on attempts to mount non-existent
 directories unless the option vers=4.2 is specified?
To:     Patrick Goetz <pgoetz@math.utexas.edu>
References: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
Cc:     autofs@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <3d88cf0d-2e0b-6a92-79ce-edc68c60066d@molgen.mpg.de>
Date:   Thu, 18 Jun 2020 11:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Dear Patrick,


Am 17.06.20 um 15:34 schrieb Patrick Goetz:

> We've been having strange performance problems for over a year on high 
> powered workstations with fast (10Gb) networking.  Programs that run 
> instantly on user's laptops would take 5-10 minutes to even launch on 
> these dual Xeon workstations with 128GB of RAM. The OS is Ubuntu 18.04
> 
> Last week I finally tracked this down to a comedy of errors, the first 
> involving autofs.  We only use NFS v.4.x, and thanks to a tip from Ian 
> Kent, I had added:
> 
>    mount_nfs_default_protocol = 4
> 
> to /etc/autofs.conf.  However, using this setting in /etc/auto.home:
> 
>    * octopus.biosci.utexas.edu:/home/&
> 
> any attempt to access a non-existent directory in /home (e.g. 
> /home/syslog) would result in the automounter hanging while various 
> attempts to mount were executed.  Changing the auto.home line to
> 
>    * -tcp,vers=4.2 octopus.biosci.utexas.edu:/home/&
> 
> resolved this issue.  I can understand the tcp option, but what doesn't 
> make sense to me is the necessity to also specify vers=4.2
> If I remove vers=4.2 from the options list, the automounter starts 
> hanging again when asked to mount a non-existent directory.
> 
> Maybe this is just an issue with mount.nfs?

Please try the latest versions first. We also had problems in the past, 
which already had been solved in newer release [1]..
> This isn't relevant to autofs, but to satisfy the curious, the next 
> obvious question is why on earth were people attempting to mount 
> non-existent directories in /home, and the answer is (in part) some 
> negligent Debian package management.  After sifting through strace 
> output I noticed entries like this in /etc/passwd:
> 
>    syslog:x:102:106::/home/syslog:/usr/sbin/nologin
> 
> I guess they were thinking that since no one can log in as syslog, it 
> doesn't matter what the home directory is set to; likely someone who 
> doesn't use or perhaps even know about autofs.  On my Arch systems these 
> entries would look like this:
> 
>    syslog:x:102:106::/:/usr/sbin/nologin

Did you submit a bug report?

> The final piece of the puzzle is why on earth do misconfigured entries 
> in /etc/passwd come in to play, and the answer is anaconda/miniconda.  A 
> lot of computational biology tools are embedded in conda environments, 
> and for some frankly inexplicable reason conda likes to troll through 
> /etc/passwd searching for environments. This seems like an anachronism 
> from the days when all real users were documented in /etc/passwd rather 
> than via some LDAP, AD, NIS, or Kerberos directory server.

Yes, unfortunately these new “package managers” re-introduce problems, 
long solved by others before. In our environment, `/home/rdonnelly` up 
in our logs [2].


Kind regards,

Paul


[1]: https://bugs.launchpad.net/ubuntu/+source/autofs/+bug/1818121
[2]: https://github.com/conda/conda-build/issues/3241
      "Hardcoded path from RDonnelly's machine in when using 
x86_64-conda_cos6-linux-gnu-c++"
