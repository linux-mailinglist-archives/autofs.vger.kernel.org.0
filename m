Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB6326770A
	for <lists+autofs@lfdr.de>; Sat, 12 Sep 2020 03:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgILBVZ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 11 Sep 2020 21:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgILBVY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 11 Sep 2020 21:21:24 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D654CC061573
        for <autofs@vger.kernel.org>; Fri, 11 Sep 2020 18:21:23 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s65so6645869pgb.0
        for <autofs@vger.kernel.org>; Fri, 11 Sep 2020 18:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R+XHBOTxnDUS9I6VRmYinyS3/kA5iXkPsxjMuG2JdUM=;
        b=qN43fjVy4x1R2LPYVwC9e66fBuOL/7/JMNAWwYrETUCVq7tbQMlLbCI5FK8C6wlZdZ
         RUByGGCwVHA2j9O5h2EaWWcsS3314tZPLDNxBy3N3lEfz5jp2V28DjTWQt94vKQXHfT1
         nk2AAiE1QTXrZLXegjhP4rKOG9cNGVywlhx11RrgktZEzArWnQ/6BbbAeo0kjNr8AYr0
         GGsljF4dR+eNhFPgFB6fumX24mxvDBKAjDXcc6gaWPiZEGbWi+ZTQStbLBzEmrfIXuZx
         36EDv05ndJ2EyvPH1emLZ/wLnoyuUG6Ul90Vs+yWQf53Y8+56mwVsE7zQeBXA1BGhC20
         9oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R+XHBOTxnDUS9I6VRmYinyS3/kA5iXkPsxjMuG2JdUM=;
        b=PSygCGvX/pjDnD3IxmRep42TW0x93ZMPi5uUGXx+oPED8T3WH6mTtaRolbMnv37GMl
         KGbJ2nkxf1d8CtKKlDiuGIGwGg1LOpCRZSBEdGRgb3xV+F2M8i86FHjATRjB3JsFrLDS
         WOmnIGEt8Ct1TpJJVTCRolT6iBRh0fDPtUv4geDlmwCi6Lr4vnTKDHAMBKhck2M1fsOb
         ZUA97DPrLvYs9ib59WvMrwEk8hUTiGEbPmdCMOunosKhVIRaI+bADItxZ4uwiXDfsu8F
         Pigm+xqmpCK5YDuS35HbLc2F9KVlfdm2n1zm08m/awmNzNt5ZNlfIv8jTa99wXNQH9Ax
         4W3A==
X-Gm-Message-State: AOAM532Ir66+paiIilmDecY3O59tZlGOYszOzjSGlGMJ4YMTpyJncGgO
        OYAMQ/1Di48nm/G+nMW0a8F+XOeaMzM=
X-Google-Smtp-Source: ABdhPJzzwt7yQv6hrWO/RLdhTsRk/RKuIUAb/YE0bvu71OFNpZz0XOezG6c72EyXIQ2GPUbS2QJn8A==
X-Received: by 2002:a63:f546:: with SMTP id e6mr3451772pgk.7.1599873681845;
        Fri, 11 Sep 2020 18:21:21 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id j26sm3370876pfa.160.2020.09.11.18.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 18:21:21 -0700 (PDT)
Reply-To: pgnet.dev@gmail.com
Subject: Re: sshfs mount option, 'nonempty', causing mount/connection fails:
 "No such file or directory". still a valid option?
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <c1464d92-34ed-256e-aa67-09f93df0571f@gmail.com>
 <97d2b7ab490288a8d45c7463ef8a5609842a136d.camel@themaw.net>
From:   PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <c7af3932-6de6-a0a5-285a-e20ee92ffd95@gmail.com>
Date:   Fri, 11 Sep 2020 18:21:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <97d2b7ab490288a8d45c7463ef8a5609842a136d.camel@themaw.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

hi

On 9/11/20 5:20 PM, Ian Kent wrote:
> How about you get a debug log so we can check.
> 
> Set "logging = debug" in /etc/autofs.conf and use journalctl to
> collect the log output, like "journalctl -f | tee autofs.log".
> 
> Obviously you can grep for automount and perhaps edit the log a
> little to get rid of anything that might not be appropriate for
> a public mailing list or send it to me privately.

adding back the 'nonempty' opt, debug logs report

	">> fuse: unknown option(s): `-o nonempty'"



systemctl stop autofs

/etc/autofs.conf
	-	# logging = none
	+	logging = debug

/etc/auto.sshfs
	-	example       -fstype=fuse,rw,nodev,allow_other,...
	+	example       -fstype=fuse,rw,nodev,nonempty,allow_other,...

systemctl start autofs

journalctl -f -u autofs
	...
	Sep 11 18:14:09 desk0013 automount[16234]: Starting automounter version 5.1.6-7.fc32, master map auto.master
	Sep 11 18:14:09 desk0013 automount[16234]: using kernel protocol version 5.05
	Sep 11 18:14:09 desk0013 automount[16234]: lookup_nss_read_master: reading master files auto.master
	Sep 11 18:14:09 desk0013 automount[16234]: do_init: parse(sun): init gathered global options: (null)
	Sep 11 18:14:09 desk0013 automount[16234]: lookup_read_master: lookup(file): read entry /mnt/sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: do_init: parse(sun): init gathered global options: (null)
	Sep 11 18:14:09 desk0013 automount[16234]: ghosting enabled
	Sep 11 18:14:09 desk0013 automount[16234]: master_do_mount: mounting /mnt/sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: automount_path_to_fifo: fifo name /run/autofs.fifo-mnt-sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: lookup_nss_read_map: reading map file /etc/auto.sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: do_init: parse(sun): init gathered global options: (null)
	Sep 11 18:14:09 desk0013 automount[16234]: remount_active_mount: trying to re-connect to mount /mnt/sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: mounted indirect on /mnt/sshfs with timeout 30, freq 8 seconds
	Sep 11 18:14:09 desk0013 automount[16234]: remount_active_mount: re-connected to mount /mnt/sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: st_ready: st_ready(): state = 0 path /mnt/sshfs
	Sep 11 18:14:09 desk0013 automount[16234]: ghosting enabled
	Sep 11 18:14:13 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1
	Sep 11 18:14:16 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1
	Sep 11 18:14:19 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1
	Sep 11 18:14:21 desk0013 automount[16234]: st_expire: state 1 path /mnt/sshfs
	Sep 11 18:14:21 desk0013 automount[16234]: expire_proc: exp_proc = 139805915625216 path /mnt/sshfs
	Sep 11 18:14:21 desk0013 automount[16234]: expire_cleanup: got thid 139805915625216 path /mnt/sshfs stat 1
	Sep 11 18:14:21 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1
	Sep 11 18:14:21 desk0013 automount[16234]: st_ready: st_ready(): state = 2 path /mnt/sshfs
	Sep 11 18:14:22 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1
	Sep 11 18:14:25 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1
	...

cd /mnt/sshfs/example/
	bash: cd: /mnt/sshfs/example/: No such file or directory

journalctl -f -u autofs

	Sep 11 18:15:20 desk0013 automount[16234]: handle_packet: type = 3
	Sep 11 18:15:20 desk0013 automount[16234]: handle_packet_missing_indirect: token 102, name example, request pid 6657
	Sep 11 18:15:20 desk0013 automount[16234]: attempting to mount entry /mnt/sshfs/example
	Sep 11 18:15:20 desk0013 automount[16234]: lookup_mount: lookup(file): looking up example
	Sep 11 18:15:20 desk0013 automount[16234]: lookup_mount: lookup(file): example -> -fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command="/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config"  :sshfs\#root@target.example.com\:/
	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount: parse(sun): expanded entry: -fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command="/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config"  :sshfs\#root@target.example.com\:/
	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount: parse(sun): gathered options: fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config
	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount: parse(sun): dequote(":sshfs\#root@target.example.com\:/") -> :sshfs#root@target.example.com:/
	Sep 11 18:15:20 desk0013 automount[16234]: parse_mount: parse(sun): core of entry: options=fstype=fuse,rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config, loc=:sshfs#root@target.example.com:/
	Sep 11 18:15:20 desk0013 automount[16234]: sun_mount: parse(sun): mounting root /mnt/sshfs, mountpoint example, what sshfs#root@target.example.com:/, fstype fuse, options rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config
	Sep 11 18:15:20 desk0013 automount[16234]: do_mount: sshfs#root@target.example.com:/ /mnt/sshfs/example type fuse options rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config using module generic
	Sep 11 18:15:20 desk0013 automount[16234]: mount_mount: mount(generic): calling mkdir_path /mnt/sshfs/example
	Sep 11 18:15:20 desk0013 automount[16234]: mount(generic): calling mount -t fuse -o rw,nodev,nonempty,allow_other,reconnect,uid=0,gid=0,max_read=65536,compression=yes,auto_cache,no_check_root,kernel_cache,workaround=rename,ssh_command=/usr/bin/ssh -F /usr/local/etc/ssh/ssh_config sshfs#root@target.example.com:/ /mnt/sshfs/example
!!	Sep 11 18:15:20 desk0013 automount[16234]: >> fuse: unknown option(s): `-o nonempty'
	Sep 11 18:15:20 desk0013 automount[16234]: mount(generic): failed to mount sshfs#root@target.example.com:/ (type fuse) on /mnt/sshfs/example
	Sep 11 18:15:20 desk0013 automount[16234]: dev_ioctl_send_fail: token = 102
	Sep 11 18:15:20 desk0013 automount[16234]: failed to mount /mnt/sshfs/example
	Sep 11 18:15:20 desk0013 automount[16234]: handle_packet: type = 3
	Sep 11 18:15:20 desk0013 automount[16234]: handle_packet_missing_indirect: token 103, name example, request pid 6657
	Sep 11 18:15:20 desk0013 automount[16234]: dev_ioctl_send_fail: token = 103
	Sep 11 18:15:22 desk0013 automount[16234]: expire_cleanup: sigchld: exp 139805915625216 finished, switching from 2 to 1


let me know if there's more/other info that'd be helpful
