Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054B8287613
	for <lists+autofs@lfdr.de>; Thu,  8 Oct 2020 16:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbgJHObD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 8 Oct 2020 10:31:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42525 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730587AbgJHObD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 8 Oct 2020 10:31:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0D45DD31;
        Thu,  8 Oct 2020 10:31:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Oct 2020 10:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        K+Zw5xcE3llciQR16nNsQiMFVGbmmyqmaumMtNP/QLo=; b=cdKdnxB11p56cKo6
        ADrY1WwgfCo1hyzXSNhvUdBSF1+9ky3edgocqKVrfSuvbmm9H5gEHojk6MIhOIrG
        bWiSoESQ5ptvkBsqGAwbMuNfBNVxYA0SvxKkJKyaENv7XqvG9SJz4T5dRCnaD/fg
        a/vage/Bu/s+wmaBDdg+jTfyuHRJbIsDMPK2gh+HB2BvsYvDxLN3GaEmgCbFgR4W
        QqIJ8Chse9kwRudfJxzkPG8OR8nzZrcmBqdVXg7q7nNHyKloF+KLJ0tYGZ/sGwea
        PU90jrVJK3M373Raep6AWf2F2L3cM6/qX256+Iac+L9mrd5/+GnHVz0LQdAGsEGk
        rSe+EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=K+Zw5xcE3llciQR16nNsQiMFVGbmmyqmaumMtNP/Q
        Lo=; b=PRKQUqFx98V14VAM7/jTwNtJfWSr4wOiZigRncP1OZFCI9RS42g9IeT9C
        MXUVyyl38bzgk6Lx0Qe0BL0yb6BJwhQtdoufm6we3zeZ/Ofzr2Cc2Vnmw55AsONZ
        AetRXXoH2F7ajOWkjXyYc67DgeJpTfM7AmgqBbybK95vh8sWNo1trlEJ87L9unwl
        AryaoQwiqYsktvDt6Stx1Odn1qsRP4T7KlORVP2WGGV6lQg0hY88oTvepSiBDixL
        0tnUuekzPRTyZEBmFwMCF/590UyJmpcfe/Xxf9d6Wn5z/Ap1pcGxSkaTgqnHDa+q
        ZcJK6ukJZwaZ+BI18Cc02i8PwrvrQ==
X-ME-Sender: <xms:pSJ_X0qGN3jbrLH5auZ_V6z21e2JUdEgooE34FI_LTi94Gdq7hPYKQ>
    <xme:pSJ_X6rFeFLhjmiXqBmmTj6pEcT5QFyiXHACqEyVZlgfUYYIZ-DSYncx53Scj1aJw
    lgGEUEbuIcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepvd
    eigfeiiedvtdetkedvvdelkeevudekvedtkefgvdehgeejveeujeehvdduhedtnecuffho
    mhgrihhnpehuthgvgigrshdrvgguuhenucfkphepuddtiedrieelrddvvdehrddufeekne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgv
    nhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:pSJ_X5M9GzvB9Od8tEDGjmvz3jKNsF7nT-5ZT96XZ6IqkH7lpuNsiw>
    <xmx:pSJ_X761UiZT3j9UYH3u5KLRtirxkMFwXn2dF8j1eAobYo88hhQUOQ>
    <xmx:pSJ_Xz7a6yuE5YhYqJb2EHwaG_yZ0v3CLpCnbo_dHmUn2J1dgnKy8A>
    <xmx:pSJ_X1Gwkua_5ltGj6AFfdsG32c4r40N9n45iiIlVbyvRcXpaHmK0g>
Received: from mickey.themaw.net (106-69-225-138.dyn.iinet.net.au [106.69.225.138])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3CBE0306467D;
        Thu,  8 Oct 2020 10:30:59 -0400 (EDT)
Message-ID: <550c65be307dd9f200551f6d84e94069c89a6448.camel@themaw.net>
Subject: Re: A puzzling timing issue with automounted home directories
From:   Ian Kent <raven@themaw.net>
To:     Patrick Goetz <pgoetz@math.utexas.edu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Thu, 08 Oct 2020 22:30:55 +0800
In-Reply-To: <73e0d2e4-aa58-44df-da49-8c7faafe3272@math.utexas.edu>
References: <61ce4c86-caee-6c91-6e04-09e6939d48f1@math.utexas.edu>
         <6c3517990e67642f3bd81c1e51e96ab0d9c7d078.camel@themaw.net>
         <73e0d2e4-aa58-44df-da49-8c7faafe3272@math.utexas.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2020-10-08 at 08:00 -0500, Patrick Goetz wrote:
> 
> On 10/7/20 7:38 PM, Ian Kent wrote:
> > On Wed, 2020-10-07 at 18:39 -0500, Patrick Goetz wrote:
> > > I have a rather puzzling timing issue which I hope someone can
> > > shed
> > > some
> > > light on. We are using a centralized authentication service
> > > (Microsoft
> > > AD) with authorization restricted to members of a particular
> > > security
> > > group.  Home directories are housed on an NFS server (Ubuntu
> > > 20.04)
> > > and
> > > automounted to a collection of compute workstations (currently a
> > > mixture
> > > of Ubuntu 18.04 and 20.04 systems).
> > > 
> > > Because there is a reasonably high level of turnover (grad
> > > students
> > > and
> > > postdocs) and because I don't want people to login directly to
> > > the
> > > NFS
> > > server any more (hence can't use pam_mkhomedir without
> > > compromising
> > > security by setting no_root_squash on the NFS server) I decided
> > > to
> > > try
> > > and automate the creation of home directories a different way. To
> > > wit, I
> > > run a pam_exec script in the session configuration:
> > > 
> > > /etc/pam.d/common-session:
> > > -------------------------
> > > session	optional  pam_exec.so log=/tmp/pam_exec.log
> > > /usr/local/sbin/make-nfs_homedir.sh
> > > 
> > > Which runs this script:
> > > 
> > > -----------------------------------------------
> > > #!/bin/bash
> > > 
> > > if [ $PAM_TYPE = "open_session" ]; then
> > > 
> > >      UTEID="$(cut -d'@' -f1 <<<"$PAM_USER")"
> > >      USERGID=$(id -g $UTEID)
> > >      PROC=$$
> > >      TEMPDIR=$UTEID$PROC
> > > 
> > >      if (($USERGID > 100000)); then
> > > 
> > >         mkdir /tmp/$TEMPDIR
> > >         mount helios:/home /tmp/$TEMPDIR
> > > 
> > > 
> > >         if [ ! -d /tmp/$TEMPDIR/$UTEID ]; then
> > >            mkdir /tmp/$TEMPDIR/temp/$UTEID
> > >            sleep 70
> > >         fi
> > > 
> > >         cd /
> > >         umount /tmp/$TEMPDIR
> > >         rmdir  /tmp/$TEMPDIR
> > >      fi
> > > fi
> > > -----------------------------------------------
> > > 
> > > A brief explanation is in order.  nfs_server:/home is mounted to
> > > /tmp/$uid$pid on the client workstation and the script checks to
> > > see
> > > if
> > > the user's home directory already exists.  If so do nothing.  If
> > > not,
> > > create it in /home/temp.  On the NFS server, the /home/temp
> > > directory
> > > has 1777 permissions, so anyone can write to it, including the
> > > nobody
> > > user from the workstations.
> > > 
> > > Now for some systemd black magic.  On the NFS server there is a
> > > systemd
> > > path unit file and accompanying service file.  Whenever a
> > > directory
> > > is
> > > created in /home/temp, there's an NFS server script which moves
> > > it
> > > to
> > > /home and sets the appropriate user permissions.  This process is
> > > nearly
> > > instantaneous; i.e. if I type `mkdir stuff` in /home/temp on the
> > > NFS
> > > server, I don't have time to type `ls` before the directory is
> > > moved
> > > to
> > > /home with appropriate user permissions set.
> > > 
> > > One last detail:  /etc/auto.home on the workstation:
> > > 
> > >     * -tcp,vers=4.2 helios.biosci.utexas.edu:/home/&
> > > 
> > > 
> > > OK, now for the puzzling part.  Notice the
> > > 
> > >     sleep 70
> > > 
> > > directive in the client side pam_exec script.  I've fiddled
> > > around
> > > with
> > > this quite a bit and anything less results in a message of
> > > 
> > >     Could not chdir to home directory /home/pgoetz: No such file
> > > or
> > > directory
> > > 
> > > on first log in. I've checked, and indeed the directory is not
> > > mounted.
> > > If you hang around in / long enough (roughly 70 seconds) you can
> > > eventually cd to your automounted home directory.
> > > 
> > > So, Question: Why the delay?  The home directory on the NFS
> > > server
> > > is
> > > created nearly instantly, so it can't be that.  And as mentioned,
> > > if
> > > I
> > > sleep for say, 60 seconds, the home directory isn't immediately
> > > accessible on login, although one can cd to it a few seconds
> > > later.  I
> > > can't fathom why the required delay.
> > 
> > It sounds like the NFS client isn't seeing the attribute change of
> > the server directory /home.
> > 
> > IIUC basically there are two things to worry about, first that the
> > VFS path walk on the client actually results calls into the NFS
> > client code (it might not for various reasons, like the VFS doesn't
> > think the directory dentry needs revalidation), and second, the
> > attributes used by the NFS client to detect staleness aren't being
> > changed by the server operations being done so revalidation isn't
> > done by the NFS client.
> > 
> > Not sure what to do about it short of diving into the NFS client
> > kernel code.
> > 
> > Ian
> > 
> > 
> > 
> 
> Thanks, Ian. I just wanted to make sure I'm not overlooking
> something 
> dumb. Looking at the NFS client code is not warranted, given the
> minor 
> inconvenience this causes.  While this is obviously a bit of an edge 
> case, since there are other ways to get this done, given the ongoing 
> shift to dynamic containerized computing these kinds of issues will 
> continue to gain prominence though.

All that attribute checking the NFS kernel client does is meant to
identify when a path component has changed, there's a lot of it.

Possibly what's happening is the VFS isn't calling ->d_revalidate(),
possibly during the lockless part of the path walk, because it's the
parent, not the last component of the path, and it doesn't appear its
changed based on what the VFS can check in that mode (so called
rcu-walk).

If that is the case it will likely be rather difficult for the VFS to
deal with, so essentially I suspect it's an NFS problem.

Ian

