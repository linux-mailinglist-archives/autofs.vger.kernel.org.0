Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05AE075BBCC
	for <lists+autofs@lfdr.de>; Fri, 21 Jul 2023 03:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjGUB3X (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 20 Jul 2023 21:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGUB3X (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 20 Jul 2023 21:29:23 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEC91998
        for <autofs@vger.kernel.org>; Thu, 20 Jul 2023 18:29:22 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 8A0035C00F3;
        Thu, 20 Jul 2023 21:29:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 20 Jul 2023 21:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:content-type:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1689902961; x=1689989361; bh=43pm96cPkD0Wf7u2pntolJmQLRX6KPsw2xP
        myvbKTQc=; b=Ba7gsTIFZUHes9wTEBKI6H3xQs85JTW4VRvY1tqseK75HTcsnaf
        5MKYGHmJm8gdTH3RF9LbwPxwwJgvKR/1mpgqNaqBf/Pgamaj5XdP5IZCv7KDdSWh
        rMoYVNMqkZ/RqX+aQMlweQ69TS97slY59COpUMgJK184P2k5BQPSdjE8sioAxFby
        NjwKPeDBXefBXgvDfylPFSnJmDAULtITAbfl6OaEJ7J7Ajz7yFdUH3ThwFCkpRxX
        tSbFh5R5U7FMi3zEZEypBA8Q8Aqyc3rVpJsWGadnsPIKabHDVVPViwKWiTWyE9wh
        DI63a6M1q6zSYQwsVSNyBZJPuWdS7SY7X3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1689902961; x=
        1689989361; bh=43pm96cPkD0Wf7u2pntolJmQLRX6KPsw2xPmyvbKTQc=; b=a
        jearRfmJ1+5X8NFHbXMmv35VY9Y4EDfx9Lv8vihzwXOsaPgQe2/gFssycbKoR7jG
        b+G4qR80XpMa7v9fjJXGsH+Z0zK1YsuKPzSZoowIjvpemsrUHhlG2PGMKlKeNPMN
        38uE1UIaynpKnH7VXnEImEFJ46e0UnFquzG9N9IkIhLNnyr+P23DTsGJTRM6KyMo
        Xg2WRzxpV1Z1SCf27Rz15b3FgQTFDb+oT/wjpYLTdWZGo5oNElvtIBUIL/3bW8VU
        su8m1YZV9tI7QHer4kHhcl4IkyWHUKXjyxYXoCh9NkMhm8hgfmAwo96eVeOYoE/T
        USgYPiWpLYKjq09s6tjVA==
X-ME-Sender: <xms:cd-5ZCcbWAQlucCkcuax3NlOtTueAvvJkXL-IZMUAkv8S0mCa2VXkA>
    <xme:cd-5ZMO10iOS6vOXPUGKnvcK6zPazQGWmK1rMQTE4ft77pKcBb6k-EiNWRdVc86_U
    iIZxsIWwEXW>
X-ME-Received: <xmr:cd-5ZDjuKDFp672dOKxHzjHBh_7qsl6A7gp7BV4b81BobRcjVv9LrIT3QVXz794jszhvENEu80t6-wxbBi2RsZcIyqRVv-_IBH4CGuX1KolvzgTNgjU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepgf
    egkedtvddtgeeilefhteffffeukeeggeehvdduleegvdeiieeihfetudehjeelnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:cd-5ZP8p9ySZdvQkzWXnkoyLC_DMrR3mNXugyNAssKxFdD9lrXLsqA>
    <xmx:cd-5ZOu_T-JNHeyKOVqp4mcGsmtGnUu8jKDkzwWo9XkWK3RPa6OX9w>
    <xmx:cd-5ZGF17DlLA_EoEJUSz40S0bKGrvc1zjdIzNFlVumVD_iY0mjutw>
    <xmx:cd-5ZP69AE_hp5XhFdVNFC-2NYX_v7B_7nLyGe47fx8yJAMctOaxrw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jul 2023 21:29:19 -0400 (EDT)
Message-ID: <a91e187c-c3a3-2a94-487a-22ef2d83fe63@themaw.net>
Date:   Fri, 21 Jul 2023 09:29:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: stat shows stale info on autofs-managed mounts
Content-Language: en-US
To:     Robert Vasek <rvasek01@gmail.com>, autofs@vger.kernel.org
References: <CADVsYmjJcyK4NZTiaPmvsLa0K_qEXGsF8cAqT_T5DLYn_r0RqA@mail.gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <CADVsYmjJcyK4NZTiaPmvsLa0K_qEXGsF8cAqT_T5DLYn_r0RqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 20/7/23 00:19, Robert Vasek wrote:
> Dear autofs mailing list,
>
> When stat()-ing mountpoints under autofs, the info it returns is
> stale, and takes about 3min to for it to reflect up-to-date data after
> it's changed. I suspect this is related to some caching and timeout
> settings, but I'm having trouble finding the right config options to
> set the refresh interval to something shorter. Is there a way to
> configure this?
>
> What I mean by stale info: in my setup, the mounts under autofs are
> backed by a FUSE-based driver. If the driver process goes down (for
> any reason; crashing, exiting without first unmounting, being
> killed...), stat()-ing the mountpoint should normally fail with
> ENOTCONN. I need to detect these situations and reconcile. When the
> mounts are managed by autofs however, once the FUSE process is down,
> it takes around 3min for it to go from returning the old stat info
> until it gives me ENOTCONN.

It's necessary to understand what's happening to work out if there's

anything that can be done.


Without information about what's going on once the mount is mounted

by autofs then there's very little autofs can do other than check if

the mount should be expired and attempt to umount it if it thinks it

has timed out.


It sounds to me like the case you are describing is similar to the

mount becoming unresponsive such as like when an NFS server stops

responding. Mostly autofs doesn't know about situations like this

and if it tries to umount the mount it will often take a long time

to timeout when the mount isn't responsive. A lot of time has been

put into dealing with NFS mounts that become unresponsive and they

are still a problem at times.


To implement a server monitoring system is problematic too, for

example, how does autofs know how to check the fuse mounts here,

even that's not straight forward and could be different for

different file system types.


Ian

>
> # automount --version
>
> Linux automount version 5.1.7-36.el9
>
> Directories:
> config dir: /etc/sysconfig
> maps dir: /etc
> modules dir: /usr/lib64/autofs
>
> Compile options:
>    DISABLE_MOUNT_LOCKING ENABLE_FORCED_SHUTDOWN ENABLE_IGNORE_BUSY_MOUNTS
>    WITH_SYSTEMD WITH_LDAP WITH_SASL LIBXML2_WORKAROUND WITH_LIBTIRPC
>
> # uname -srvmpio
> Linux 5.19.9-200.fc36.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 15
> 09:49:52 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
>
> Contents of /etc/auto.master.d/eos.autofs map:
> /eos /etc/auto.eos
>
> Contents of /etc/auto.eos:
> ams -fstype=eosx,fsname=ams  :eosxd
> atlas -fstype=eosx,fsname=atlas  :eosxd
> cms -fstype=eosx,fsname=cms  :eosxd
> experiment -fstype=eosx,fsname=experiment  :eosxd
> geant4 -fstype=eosx,fsname=geant4  :eosxd
> lhcb -fstype=eosx,fsname=lhcb  :eosxd
> ...
>
> The automount daemon is set to run with a timeout of 300 seconds.
>
> # stat /eos/atlas
>    File: /eos/atlas
>    Size: 4096       Blocks: 8          IO Block: 4096   directory
> Device: 100033h/1048627d Inode: 26193792    Links: 2
> Access: (0700/drwx------)  Uid: (110701/ UNKNOWN)   Gid: ( 2763/ UNKNOWN)
> Access: 2023-07-11 15:29:03.528901692 +0200
> Modify: 2023-07-11 15:29:03.528901692 +0200
> Change: 2023-07-11 15:29:03.528901692 +0200
>   Birth: -
>
> # kill <PID>
>
> (stat keeps showing the same output)
> (... ~3 minutes later ...)
>
> # stat /eos/atlas
> stat: cannot statx '/eos/atlas': Transport endpoint is not connected
>
> Thanks!
>
> Cheers,
> Robert
