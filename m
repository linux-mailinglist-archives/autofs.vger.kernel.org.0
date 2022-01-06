Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8088486DC3
	for <lists+autofs@lfdr.de>; Fri,  7 Jan 2022 00:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245511AbiAFX1g (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 6 Jan 2022 18:27:36 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:51771 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245481AbiAFX1g (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 6 Jan 2022 18:27:36 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8C676320344D;
        Thu,  6 Jan 2022 18:27:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 06 Jan 2022 18:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        upRW057wa6WPYP51cVYq3y8bffmY4FBR877EJ0kx2+w=; b=OkSraH8RBbodUZBA
        +J3QplRTwNq0cb0Y4zI3yNNw25myVAh0QBms+f27ltTKxo10d3ifii2PYWY/Qk+I
        MQhKP057KimUJDcj7R8Wdf+awifaM2CijRpjR7UBcRbOltSY8YcLTh9tUA2x/W3u
        GJdFz4DyangwLp4+wmuVC9YInqDwOATKomT04N8TJr5CAVuftzWhDnbCOEQi1viL
        jSu9v182lPUrZ485RmRp/TMZ5u2yOwqNTXeiPpAI+5hYL/khj3HagX+Z9EWQsC61
        ZBWGR2mJnGuuVHXhmlRaiGRrma5NKWKCWkLEGBicqE2ZlRTBRZqjmntnkpdkps/X
        Q8O2Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=upRW057wa6WPYP51cVYq3y8bffmY4FBR877EJ0kx2
        +w=; b=iRuC6lkxWcnXQjew36UpYGFmsWg1fAY/E4P8AKLqVgflgXCubv6WWG7VI
        tcnvUDwJO572lJiE8TzQu9a0SKiaV/1FmgCcpZQ10XY7t9/HCwz9l+YMRO6IvWD5
        a9Df+hEZfofnwV8MlpVXIZhQGwH2MbzCuQMYPbqhXk3BDZSWjLHu5GVTgpVOStQH
        kAwnRMms+1wWZYpuecBEFW4myqjisqm6Bv/0UvCK4bDbxghhNtCAlWx64HH6KdxH
        MKi4yEVYlb1gD6GoZzZdFn1ArWT6X0MfGZ4b55FyWx9B6Zsbq8BYX1qFYLVCQRAx
        pVRilvGXMC6wz8P68B8qe5TqjWA7g==
X-ME-Sender: <xms:5nrXYbhnQkYNt38VOLACbGHvZrRfaX7NK6Kh9CW8XazdDRPn2m9rkg>
    <xme:5nrXYYCVCwnxf5FGj2HJ_IAC85OpObaanc_9Fxs0PFe03RGlVIGvc6XiAfpqzVLrr
    Yq8kEret-Of>
X-ME-Received: <xmr:5nrXYbH_nwu4rQ_HKzOP_cGibuzg7qePZPUrGlZCZKHutwEVcJpr2-M65u9TAZxwJA5t-MWFd-Hhfbjlz4NohincBecaqMJcIn1HNRGw8YNUfVVeWMl5SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegtddgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fgleelkeetheelgeehueejueduhfeufffgleehgfevtdehhffhhffhtddugfefheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:5nrXYYRQ6Cx_rXxVDC-CgKe0Sg3qPrVT5A_F77eErVVGdUCkP4O3jQ>
    <xmx:5nrXYYykNMVZVt0EL4J6nkNv__FQ6FYtp7mqei2MeqNmMRFoA7l9Bg>
    <xmx:5nrXYe5zNt3V6jYGPt0NVn_Vx6hwHnw5dfOphwWlcxsC8QL3lTu2OQ>
    <xmx:53rXYVv4nOeQtUAnfH-Pz2x-WuI5kSkoINc1oftPEArKELbJJudfAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Jan 2022 18:27:33 -0500 (EST)
Message-ID: <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Fri, 07 Jan 2022 07:27:28 +0800
In-Reply-To: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2022-01-04 at 09:57 -0300, Andreas Hasenack wrote:
> Hi,
> 
> the autopkgtests for autofs started to fail in Ubuntu in the s390x
> architecture only. The scenario is an authenticated localhost cifs
> mount.
> 
> When I try it, I get:
> root@j-s390x:~# l /cifs/localhost
> ls: cannot access '/cifs/localhost': No such file or directory
> 
> I get this in syslog:
> Jan  4 12:52:48 j-s390x automount[1969]: mount_autofs_offset: failed
> to mount offset trigger  at
> Jan  4 12:52:48 j-s390x automount[1969]: message repeated 2 times: [
> mount_autofs_offset: failed to mount offset trigger  at ]
> Jan  4 12:52:48 j-s390x automount[1969]: mount_subtree: parse(sun):
> failed to mount offset triggers
> Jan  4 12:52:48 j-s390x kernel: [ 1582.465030]
> autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
> cmd(0xc018937e)
> Jan  4 12:52:48 j-s390x kernel: [ 1582.465306]
> autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
> cmd(0xc018937e)
> Jan  4 12:52:48 j-s390x kernel: [ 1582.465358]
> autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
> cmd(0xc018937e)
> Jan  4 12:52:48 j-s390x kernel: [ 1582.465405]
> autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
> cmd(0xc018937e)
> Jan  4 12:52:48 j-s390x kernel: [ 1582.465409]
> autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
> cmd(0xc018937e)
> Jan  4 12:52:48 j-s390x kernel: [ 1582.465412]
> autofs4:pid:1991:validate_dev_ioctl: invalid path supplied for
> cmd(0xc018937e)
> 
> With 5.1.7, it works:
> root@j-s390x:~# l /cifs
> total 4.0K
> drwxr-xr-x  2 root root    0 Jan  4 12:55 .
> drwxr-xr-x 23 root root 4.0K Jan  4 12:55 ..
> root@j-s390x:~# l /cifs/localhost
> total 0
> drwxr-xr-x 5 root root 0 Jan  4 12:55  .
> drwxr-xr-x 3 root root 0 Jan  4 12:55  ..
> drwxr-xr-x 2 root root 0 Dec 27 20:14 'print$'
> drwxr-xr-x 2 root root 0 Dec 27 20:15  private
> drwxr-xr-x 2 root root 0 Dec 27 20:15  pub
> root@j-s390x:~# l /cifs/localhost/private
> total 4.0K
> drwxr-xr-x 2 root root  0 Dec 27 20:15 .
> drwxr-xr-x 5 root root  0 Jan  4 12:55 ..
> -rwxr-xr-x 1 root root 64 Dec 29 17:16 hello-private.txt
> 
> and syslog shows just:
> Jan  4 12:55:54 j-s390x kernel: [ 1768.290258] CIFS: Attempting to
> mount \\localhost\pub
> Jan  4 12:55:54 j-s390x kernel: [ 1768.318174] CIFS: Attempting to
> mount \\localhost\private
> Jan  4 12:55:54 j-s390x kernel: [ 1768.328218] CIFS: Attempting to
> mount \\localhost\print$
> 
> 
> I have this config:
> root@j-s390x:~# cat /etc/auto.master|grep -vE "^($|#)"
> +dir:/etc/auto.master.d
> +auto.master
> /cifs /etc/auto.smb --timeout=180
> 
> The shares:
> [pub]
>   path = /pub
>   read only = no
>   guest ok = yes
> [private]
>   path = /private
>   read only = no
>   guest ok = no
> 
> root@j-s390x:~# cat /etc/creds/localhost
> username=smbtest9614
> password=9614
> domain=WORKGROUP
> 
> I see the 5.1.8 patches directory has a ton of patches, is this a
> known issue already perhaps? Or do you have any other troubleshooting
> tips?

Maybe, can I get a debug log please.

Set "logging = debug" (without the comment marker of course) then
use "journalctl | grep automount" to get the entries or if your
using syslog a similar grep should get the log entries.

I always ask for log output from starting up autofs until after
the problem has occurred.

Ian

