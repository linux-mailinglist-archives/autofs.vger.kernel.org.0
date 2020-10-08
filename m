Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FE6286C1B
	for <lists+autofs@lfdr.de>; Thu,  8 Oct 2020 02:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgJHAis (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 7 Oct 2020 20:38:48 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39495 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgJHAis (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 7 Oct 2020 20:38:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id EE8255C0135;
        Wed,  7 Oct 2020 20:38:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 07 Oct 2020 20:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        07/ccbqLqCepMMq17REHm+eOzlH00H0eD2+eHn6qIfM=; b=EKUe2r6aP2ob/BpH
        fP1ZrNaKDzLAtvfQPiMvy+f3gh3CP3lhkLhWFqoL7db/Z0kSPnF1x5ipKToY8k8J
        nvu90ptvyo+uNk5VT08UWKI7nzxCgGbxxGV6XpKfIWn9LQdY/iohjsgwg5m1YbMh
        R83GKKzBiTjN4QDld6Iug0PHjdAVObnOl5SBWbetW8z2lDNqxKWAA54x+7iCh9gN
        f6nNTJwkZqFqWBmP34++LWeHeIWd05CFfNV+w6dKT+QH9pA1+xPzYlAqpaMquj2c
        UXsTYF3YiVE2nfRPMAF+sc1w0srY0jbjWADlReQ0ddYixDkS1JnrDu46TJWSI455
        z3Cfzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=07/ccbqLqCepMMq17REHm+eOzlH00H0eD2+eHn6qI
        fM=; b=FQ+c25VEUG1M1+5vTxunvSfBOZ1xS3YJ91nEGT6pV7+MBj5TWwIdqx5cw
        GnAJQYnnJHxjQWsWFuFlEGtohQsJXnCEg0+DDuZsbcnAK4LRzoyxFF3K0LzJr8Kf
        11ObjtiQQxI8CO1ZTKI2KphEe1QuD6wM2B3zP6TE67w29ySbuiFcIZg48CRq0nJm
        lxX/NmcDe2uNU08M1dF9lm+UeDZbIhHYah+7AvCeTf8mZVycViTd2uK6sh5C4Cga
        dYG0orgOxYeDHlVeovDHjygopypKTGhUQeWuNokwfenGuThJCSFPTcowMpDMoptt
        MuSrbYAFre2FdsniDI8+2utMCb8RQ==
X-ME-Sender: <xms:ll9-XySkUVnBWOAHkxWdNgSiNsAM6rAWpOxI3_l9z86W5oHt9sUaiw>
    <xme:ll9-X3xXYTKRpPwM0xJfoU_ynwpdaNAM2-Vr8_dvRvfBxYuh8d_sVs50tqWh7Ev9i
    UskciQAplOx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeejgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepvd
    eigfeiiedvtdetkedvvdelkeevudekvedtkefgvdehgeejveeujeehvdduhedtnecuffho
    mhgrihhnpehuthgvgigrshdrvgguuhenucfkphepuddtiedrieelrddvvdehrddufeekne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgv
    nhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:ll9-X_3_uw0GvUYzNkdy0SbjTm-4K5pyWKZfz4Mb6BytxrBM0LLYWA>
    <xmx:ll9-X-C4KGljGbqUNcI-0W1afBXB8O0WCvV53fE3gEokv1titPUFsg>
    <xmx:ll9-X7i7M0eBlQVKlbbAI_--rVxbgIywlO3d0qqPPWmMqjKRqiGeRA>
    <xmx:ll9-X2vv_NmMCm0RtrxLplF9Qo-tGuhB5_W8MQ0n3QdrvC0cf-RMXQ>
Received: from mickey.themaw.net (106-69-225-138.dyn.iinet.net.au [106.69.225.138])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6EA34328005D;
        Wed,  7 Oct 2020 20:38:45 -0400 (EDT)
Message-ID: <6c3517990e67642f3bd81c1e51e96ab0d9c7d078.camel@themaw.net>
Subject: Re: A puzzling timing issue with automounted home directories
From:   Ian Kent <raven@themaw.net>
To:     Patrick Goetz <pgoetz@math.utexas.edu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Thu, 08 Oct 2020 08:38:40 +0800
In-Reply-To: <61ce4c86-caee-6c91-6e04-09e6939d48f1@math.utexas.edu>
References: <61ce4c86-caee-6c91-6e04-09e6939d48f1@math.utexas.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2020-10-07 at 18:39 -0500, Patrick Goetz wrote:
> I have a rather puzzling timing issue which I hope someone can shed
> some 
> light on. We are using a centralized authentication service
> (Microsoft 
> AD) with authorization restricted to members of a particular
> security 
> group.  Home directories are housed on an NFS server (Ubuntu 20.04)
> and 
> automounted to a collection of compute workstations (currently a
> mixture 
> of Ubuntu 18.04 and 20.04 systems).
> 
> Because there is a reasonably high level of turnover (grad students
> and 
> postdocs) and because I don't want people to login directly to the
> NFS 
> server any more (hence can't use pam_mkhomedir without compromising 
> security by setting no_root_squash on the NFS server) I decided to
> try 
> and automate the creation of home directories a different way. To
> wit, I 
> run a pam_exec script in the session configuration:
> 
> /etc/pam.d/common-session:
> -------------------------
> session	optional  pam_exec.so log=/tmp/pam_exec.log 
> /usr/local/sbin/make-nfs_homedir.sh
> 
> Which runs this script:
> 
> -----------------------------------------------
> #!/bin/bash
> 
> if [ $PAM_TYPE = "open_session" ]; then
> 
>     UTEID="$(cut -d'@' -f1 <<<"$PAM_USER")"
>     USERGID=$(id -g $UTEID)
>     PROC=$$
>     TEMPDIR=$UTEID$PROC
> 
>     if (($USERGID > 100000)); then
> 
>        mkdir /tmp/$TEMPDIR
>        mount helios:/home /tmp/$TEMPDIR
> 
> 
>        if [ ! -d /tmp/$TEMPDIR/$UTEID ]; then
>           mkdir /tmp/$TEMPDIR/temp/$UTEID
>           sleep 70
>        fi
> 
>        cd /
>        umount /tmp/$TEMPDIR
>        rmdir  /tmp/$TEMPDIR
>     fi
> fi
> -----------------------------------------------
> 
> A brief explanation is in order.  nfs_server:/home is mounted to 
> /tmp/$uid$pid on the client workstation and the script checks to see
> if 
> the user's home directory already exists.  If so do nothing.  If
> not, 
> create it in /home/temp.  On the NFS server, the /home/temp
> directory 
> has 1777 permissions, so anyone can write to it, including the
> nobody 
> user from the workstations.
> 
> Now for some systemd black magic.  On the NFS server there is a
> systemd 
> path unit file and accompanying service file.  Whenever a directory
> is 
> created in /home/temp, there's an NFS server script which moves it
> to 
> /home and sets the appropriate user permissions.  This process is
> nearly 
> instantaneous; i.e. if I type `mkdir stuff` in /home/temp on the NFS 
> server, I don't have time to type `ls` before the directory is moved
> to 
> /home with appropriate user permissions set.
> 
> One last detail:  /etc/auto.home on the workstation:
> 
>    * -tcp,vers=4.2 helios.biosci.utexas.edu:/home/&
> 
> 
> OK, now for the puzzling part.  Notice the
> 
>    sleep 70
> 
> directive in the client side pam_exec script.  I've fiddled around
> with 
> this quite a bit and anything less results in a message of
> 
>    Could not chdir to home directory /home/pgoetz: No such file or
> directory
> 
> on first log in. I've checked, and indeed the directory is not
> mounted. 
> If you hang around in / long enough (roughly 70 seconds) you can 
> eventually cd to your automounted home directory.
> 
> So, Question: Why the delay?  The home directory on the NFS server
> is 
> created nearly instantly, so it can't be that.  And as mentioned, if
> I 
> sleep for say, 60 seconds, the home directory isn't immediately 
> accessible on login, although one can cd to it a few seconds
> later.  I 
> can't fathom why the required delay.

It sounds like the NFS client isn't seeing the attribute change of
the server directory /home.

IIUC basically there are two things to worry about, first that the
VFS path walk on the client actually results calls into the NFS
client code (it might not for various reasons, like the VFS doesn't
think the directory dentry needs revalidation), and second, the
attributes used by the NFS client to detect staleness aren't being
changed by the server operations being done so revalidation isn't
done by the NFS client.

Not sure what to do about it short of diving into the NFS client
kernel code.

Ian



