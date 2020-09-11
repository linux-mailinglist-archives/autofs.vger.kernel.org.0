Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CFC267697
	for <lists+autofs@lfdr.de>; Sat, 12 Sep 2020 01:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgIKXrf (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 11 Sep 2020 19:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgIKXrd (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 11 Sep 2020 19:47:33 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADAAC061573
        for <autofs@vger.kernel.org>; Fri, 11 Sep 2020 16:47:32 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d16so1605055pll.13
        for <autofs@vger.kernel.org>; Fri, 11 Sep 2020 16:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=K44Beo+77I1YD5zfrahk24Lzhx9NXShCVePRdgWDP2U=;
        b=Ht+PSeh1nebx2lrKA0b9Xe4W51e/JknFMOBuiu7UpMtfFKbi9o1A/7HiSfMCQN/NbE
         j3JIAgFPultexyFJk8sStvt68GHeJUWNkFD8ZW2LNeqYLES3jIPtjHHaAo9dNx2m/ciz
         q2dOFceB1ezMaXHuNSSH5ryj/0Jpo60hZUDesZXhfnvGWeo+MZPKmmQ6hjzM22Bh0kOh
         X1fR0cpR83oO9lb6em6MG9HDhBpFQPLVBKy7RlorT6jP67+ecOw/fvnACBR+X3eBSYtI
         WskrhNhmFomKS2xAa3ZdwEgtAGkvO1NYYZ2W3tJFuViVbJwcSxJ6W2seQVO5tec0JpVo
         2EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=K44Beo+77I1YD5zfrahk24Lzhx9NXShCVePRdgWDP2U=;
        b=mzX1u+WX791jW8fyj6MPrHorfRo5/mOPrezydrwwlIZ+ifccn9b6W1jzAvIuHLcAcr
         Kohdb+2jJQzdf5FoK14oVZml2ORWOcPbAcxnyc7YjOMM/Ih+tkj36mB1ubxaKj8BgfJd
         jPObcMbNV6gDqygwJSET+1WAOqN7dLd8RTi0mEBwp06Hzn39iOawyhS8KsC8UI23OYrc
         mGTSjpZ+BL3STzYlfb3RsAWOOq2c0KLWPv2qJT85BFwwe2q6uF7bWjIpimWeF4UWtcPU
         4GF0VKJhqT4pf5mvzIq9ssWvc/kqYyFNlxDRpkrXS2vd+LSNGIwYF+IrGW8C7NTQRHXd
         YiVA==
X-Gm-Message-State: AOAM5338d7NjxURzrhwmpkNHLxkho7s5JLE2y5dyyhPqX5p0zZwdnG8e
        N+qrCqGutVvSF01KwhETJQek102xZS8=
X-Google-Smtp-Source: ABdhPJymttNGr1SiAaxcU+ZgqUIdvElutc/srzd0zCBUmn1gXAYjUdqgxggkZsDhHRDw6gaMQAUIUQ==
X-Received: by 2002:a17:90a:ebd7:: with SMTP id cf23mr4260015pjb.126.1599868051551;
        Fri, 11 Sep 2020 16:47:31 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id n2sm2953503pja.41.2020.09.11.16.47.31
        for <autofs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 16:47:31 -0700 (PDT)
Reply-To: pgnet.dev@gmail.com
To:     autofs@vger.kernel.org
From:   PGNet Dev <pgnet.dev@gmail.com>
Subject: sshfs mount option, 'nonempty', causing mount/connection fails: "No
 such file or directory". still a valid option?
Message-ID: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
Date:   Fri, 11 Sep 2020 16:47:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

i'm setting up auto.sshfs, provided by

	rpm -qa | grep ^autofs
		autofs-5.1.6-7.fc32.x86_64

on a new server

	grep PRETTY /etc/os-release
		PRETTY_NAME="Fedora 32 (Server Edition)"
		

my (usual) config, in-place on all my prior/other-OS boxes, includes

	cat /etc/auto.master
		/mnt/nfs4  /etc/auto.nfs4  --timeout=10,--ghost
		/mnt/sshfs /etc/auto.sshfs --timeout=30,--ghost

where mounts are typically,

	cat /etc/auto.sshfs
		
		example  -fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command="/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config"  :sshfs\#root@test.example.com\:/

with that^,

	cd /mnt/sshfs/example

works exactly as expected -- on all _except_ these new Fedora installs

here,

	cd /mnt/sshfs/example

returns

	ls: cannot access 'sshfs/example/': No such file or directory

simply removing 'nonemmpty'

-	example  -fstype=fuse,rw,nodev,nonempty,allow_other,...
+	example  -fstype=fuse,rw,nodev,allow_other,...

cures the problem.

is 'nonempty' still valid usage with  autofs sshfs mounts?
is additional/difference config req'd on Fedora, or perhaps more recent autofs?
