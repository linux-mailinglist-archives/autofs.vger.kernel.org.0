Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F490F33E2
	for <lists+autofs@lfdr.de>; Thu,  7 Nov 2019 16:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbfKGPzK (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 7 Nov 2019 10:55:10 -0500
Received: from hr2.samba.org ([144.76.82.148]:43820 "EHLO hr2.samba.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727606AbfKGPzK (ORCPT <rfc822;autofs@vger.kernel.org>);
        Thu, 7 Nov 2019 10:55:10 -0500
X-Greylist: delayed 1779 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 10:55:09 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
         s=42; h=Date:Message-ID:From:To:CC;
        bh=d507e7CyiblM5RrM8QYh5VA3PHFKWE5eqRnf7zsgQYU=; b=oVzqIKJxOABu1bg9ksJ8eNsYOq
        MQUQcRBw1xlaU4WQK8ib/2ucThonoCtSTOaT9pBTFAKk+G4gB+b3Ixi0sZUcTL4b6v65/MjC4Km+G
        B/uJyqdm4NSR+8VwykpSygzzOvwQIFqd3FsiSHMtYKKcHKmQ4kh2psohnR3ngUASNrzQZw68Kr/RG
        XrtWhLIxvZwrOVqHpWR6+F13rd/CYoTmMqS7VCykCvp5x3M8jJivbvT0c/Isj+a3ThDt4vCVTnPuS
        REi41yzBFpQX8zUHJauA1NdMqGUiYqjIC7j2R4KTn5HsSPOk4BRFBz0ONzXR7OrMluHUymzQlcc6E
        aX3kWMKqtP1/wbp6wde+nBSpjoHatFpkBzhXplMdqWlK4JFySs5+aMqaVvPBMeEoICPcK5xep1PMS
        qq2uXLH7/MU5R5MbIyMmZfz06oslJFLi7aF5ij1YZw5ZRkuhu6eD6TpFiKZPVND+Ps92FEi7hsPXY
        4BQuxp+QjPe/vvmTVNusCeTd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
        by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
        (Exim)
        id 1iSjf7-0001sP-Ck
        for autofs@vger.kernel.org; Thu, 07 Nov 2019 15:25:29 +0000
Subject: Re: [RHEL 5.11][5.0.1] autofs hangs up
To:     autofs@vger.kernel.org
References: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
From:   Rowland penny <rpenny@samba.org>
Message-ID: <dfdf4145-7f03-5223-9adb-b0b3c332d894@samba.org>
Date:   Thu, 7 Nov 2019 15:25:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 07/11/2019 14:57, Simon ELBAZ wrote:
> Hi,
>
> I am working on an autofs issue.
>
> Linux kernel: 2.6.18-398.el5
> autofs: autofs-5.0.1-0.rc2.184.el5
>
> There are 2 RHEL 5.11 servers accessing an NFS server.
> They are rebooted every morning.


RHEL 5 is in Extended Life-cycle Support which ends in just over 12 
months, and this support must be purchased and only really gives 
security fixes. So never mind updating the kernel, you should update the 
entire OS, this will also give a newer version of autofs and the other 
packages it depends on.

Rowland


