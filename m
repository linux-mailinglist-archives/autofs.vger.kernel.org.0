Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5671F345A03
	for <lists+autofs@lfdr.de>; Tue, 23 Mar 2021 09:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbhCWIoz (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 23 Mar 2021 04:44:55 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39745 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229728AbhCWIoT (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 23 Mar 2021 04:44:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C1A605807E9;
        Tue, 23 Mar 2021 04:44:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 23 Mar 2021 04:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        pSQsirzyCa43t4sWR/gd2pErOaEB1CUqGWJYC/8RYKU=; b=gxB2n8pqqBZT6Pfm
        tlN9BEmvCXNJki2+hYkpBlMms1jyFVCzOFdAhfWTuvFRpJWKGKpBOyj5MRuO90ZS
        t5X9bRvNnFnoIqFMAKiRTU29Dj1vOs3Ko/YnjoFqsCLOsJYIO32K29nz7MFp7uoM
        tDyJTE3trc0Pq4ogIJk/vDZEkC9ceUeXQZetaDacDFewrvk+a1loRp9d3PMbVsxQ
        Kf0Xo3vaH/wbmooCdwZo4Huyjsonm3LLKn9a5l/7IZUQdDwsimrxqepuR0HKFTQN
        iF8UPIc+Gn4OIyzG6bho6welnW1HCWZVQUXtSuciYPc0u9OJih1z27crfRrQHXjK
        PyYPsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=pSQsirzyCa43t4sWR/gd2pErOaEB1CUqGWJYC/8RY
        KU=; b=rPPLEGm3sB0JxQVQhMIPA4BoLr4BthRS0H09jjdEPPwrEJsAOQ9xVn0Xi
        tszTVW5kLUjKmEuo9KMu3h+OtrIm7jUanqy/YGpY+JqaRkJTwYZOMS6zSRtjov56
        lbVLtJiPb8V458ShyNkFz6UmoOH+e4iJwfG931qzEEwhmSYgBtYeMaW3ymZp8fck
        OT+UeFNuOY8a2xcwFZWW9RAsrh4t37TRK5A3iAsEyMMl9R0lFJMZIFW2HtG2VDGR
        bxUfVnljjvF8ncYDj7inhzx3MsCw3rGBLHXonlMpbwMV1mijTOn/LIP0Hcr/MPsc
        VoYv9lZyCFPMI3DxNwme/R5FjmwWg==
X-ME-Sender: <xms:XqpZYAzbLDiL5zc3Z__5GNb12x-auGFjOHiwKKostk-Rsa1GBhWReQ>
    <xme:XqpZYEQo7NYFeeIDdtCFpLLJ_9OLF7RMKOuRi14cCGc-EoD1RlAPS2cj5h5qaLg-t
    qwG0egeWllY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeghedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghn
    ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnh
    epfeefteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecu
    kfhppedutdeirdeiledrvdefkedruddtleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:XqpZYCWVyrwEQ3RvuC1jCp0LCAk1F_1H7Gj9MTlWDFfFi0VBGLJing>
    <xmx:XqpZYOgqQD1G_j5pG0K-n0IS0wBQj8z7F715VP-p8Xcv-03btk4pFA>
    <xmx:XqpZYCB5ArUNkRcA_Ed8uBqXP2-hXts4KO2b4xERF_5V0vkwKtExhg>
    <xmx:YqpZYDKiHln2FQ4CpC2S2iAFlPKnkhrqMVfiaJieBqTnBFjZS9P3bA>
Received: from mickey.themaw.net (106-69-238-109.dyn.iinet.net.au [106.69.238.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id C4CF824041F;
        Tue, 23 Mar 2021 04:44:09 -0400 (EDT)
Message-ID: <9491750260c27929733c938badb63b5962e5dc32.camel@themaw.net>
Subject: Re: [RFC PATCH] autofs: find_autofs_mount overmounted parent support
From:   Ian Kent <raven@themaw.net>
To:     Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>, autofs@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ross Zwisler <zwisler@google.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Eric Biggers <ebiggers@google.com>,
        Mattias Nissler <mnissler@chromium.org>,
        linux-fsdevel@vger.kernel.org, alexander@mihalicyn.com
Date:   Tue, 23 Mar 2021 16:44:04 +0800
In-Reply-To: <20210309134313.ed6abb23b920913f563265a1@virtuozzo.com>
References: <20210303152931.771996-1-alexander.mikhalitsyn@virtuozzo.com>
         <832c1a384dc0b71b2902accf3091ea84381acc10.camel@themaw.net>
         <20210304131133.0ad93dee12a17f41f4052bcb@virtuozzo.com>
         <4f9d9c80d9d5ae7f8eb80db60e1fa572a9c015dc.camel@themaw.net>
         <20210305145535.f5e41f54290f91968687f474@virtuozzo.com>
         <05b879c83b7aa2b6c6ceee6a05a52651b83e43de.camel@themaw.net>
         <20210309134313.ed6abb23b920913f563265a1@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2021-03-09 at 13:43 +0300, Alexander Mikhalitsyn wrote:
> On Sat, 06 Mar 2021 17:13:32 +0800
> Ian Kent <raven@themaw.net> wrote:
> 
> > On Fri, 2021-03-05 at 14:55 +0300, Alexander Mikhalitsyn wrote:
> > > On Fri, 05 Mar 2021 18:10:02 +0800
> > > Ian Kent <raven@themaw.net> wrote:
> > > 
> > > > On Thu, 2021-03-04 at 13:11 +0300, Alexander Mikhalitsyn wrote:
> > > > > On Thu, 04 Mar 2021 14:54:11 +0800
> > > > > Ian Kent <raven@themaw.net> wrote:
> > > > > 
> > > > > > On Wed, 2021-03-03 at 18:28 +0300, Alexander Mikhalitsyn
> > > > > > wrote:
> > > > > > > It was discovered that find_autofs_mount() function
> > > > > > > in autofs not support cases when autofs mount
> > > > > > > parent is overmounted. In this case this function will
> > > > > > > always return -ENOENT.
> > > > > > 
> > > > > > Ok, I get this shouldn't happen.
> > > > > > 
> > > > > > > Real-life reproducer is fairly simple.
> > > > > > > Consider the following mounts on root mntns:
> > > > > > > --
> > > > > > > 35 24 0:36 / /proc/sys/fs/binfmt_misc ... shared:16 -
> > > > > > > autofs
> > > > > > > systemd-
> > > > > > > 1 ...
> > > > > > > 654 35 0:57 / /proc/sys/fs/binfmt_misc ... shared:322 -
> > > > > > > binfmt_misc
> > > > > > > ...
> > > > > > > --
> > > > > > > and some process which calls
> > > > > > > ioctl(AUTOFS_DEV_IOCTL_OPENMOUNT)
> > > > > > > $ unshare -m -p --fork --mount-proc ./process-bin
> > > > > > > 
> > > > > > > Due to "mount-proc" /proc will be overmounted and
> > > > > > > ioctl() will fail with -ENOENT
> > > > > > 
> > > > > > I think I need a better explanation ...
> > > > > 
> > > > > Thank you for the quick reply, Ian.
> > > > > I'm sorry If my patch description was not sufficiently clear
> > > > > and
> > > > > detailed.
> > > > > 
> > > > > That problem connected with CRIU (Checkpoint-Restore in
> > > > > Userspace)
> > > > > project.
> > > > > In CRIU we have support of autofs mounts C/R. To acheive that
> > > > > we
> > > > > need
> > > > > to use
> > > > > ioctl's from /dev/autofs to get data about mounts, restore
> > > > > mount
> > > > > as
> > > > > catatonic
> > > > > (if needed), change pipe fd and so on. But the problem is
> > > > > that
> > > > > during
> > > > > CRIU
> > > > > dump we may meet situation when VFS subtree where autofs
> > > > > mount
> > > > > present was
> > > > > overmounted as whole.
> > > > > 
> > > > > Simpliest example is /proc/sys/fs/binfmt_misc. This mount
> > > > > present
> > > > > on
> > > > > most
> > > > > GNU/Linux distributions by default. For instance on my Fedora
> > > > > 33:
> > > > 
> > > > Yes, I don't know why systemd uses this direct mount, there
> > > > must
> > > > have been a reason for it.
> > > > 
> > > > > trigger automount of binfmt_misc
> > > > > $ ls /proc/sys/fs/binfmt_misc
> > > > > 
> > > > > $ cat /proc/1/mountinfo | grep binfmt
> > > > > 35 24 0:36 / /proc/sys/fs/binfmt_misc rw,relatime shared:16 -
> > > > > autofs
> > > > > systemd-1 rw,...,direct,pipe_ino=223
> > > > > 632 35 0:56 / /proc/sys/fs/binfmt_misc rw,...,relatime
> > > > > shared:315
> > > > > -
> > > > > binfmt_misc binfmt_misc rw
> > > > 
> > > > Yes, I think this looks normal.
> > > > 
> > > > > $ sudo unshare -m -p --fork --mount-proc sh
> > > > > # cat /proc/self/mountinfo | grep "/proc"
> > > > > 828 809 0:23 / /proc rw,nosuid,nodev,noexec,relatime - proc
> > > > > proc
> > > > > rw
> > > > > 829 828 0:36 / /proc/sys/fs/binfmt_misc rw,relatime - autofs
> > > > > systemd-
> > > > > 1 rw,...,direct,pipe_ino=223
> > > > > 943 829 0:56 / /proc/sys/fs/binfmt_misc rw,...,relatime -
> > > > > binfmt_misc
> > > > > binfmt_misc rw
> > > > > 949 828 0:57 / /proc rw...,relatime - proc proc rw
> > > > 
> > > > Isn't this screwed up, /proc is on top of the binfmt_misc mount
> > > > ...
> > > > 
> > > > Is this what's seen from the root namespace?
> > > 
> > > No-no, after issuing
> > > $ sudo unshare -m -p --fork --mount-proc sh
> > > 
> > > we enter to the pid+mount namespace and:
> > > 
> > > # cat /proc/self/mountinfo | grep "/proc"
> > > 
> > > So, it's picture from inside namespaces.
> > 
> > Ok, so potentially some of those have been propagated from the
> > original mount namespace.
> > 
> > It seems to me the sensible thing would be those mounts would
> > not propagate when a new proc has been requested. It doesn't
> > make sense to me to carry around mounts that are not accessible
> > because of something requested by the mount namespace creator.
> > 
> > But that's nothing new and isn't likely to change any time soon.
> > 
> > > > > As we can see now autofs mount /proc/sys/fs/binfmt_misc is
> > > > > inaccessible.
> > > > > If we do something like:
> > > > > 
> > > > > struct autofs_dev_ioctl *param;
> > > > > param = malloc(...);
> > > > > devfd = open("/dev/autofs", O_RDONLY);
> > > > > init_autofs_dev_ioctl(param);
> > > > > param->size = size;
> > > > > strcpy(param->path, "/proc/sys/fs/binfmt_misc");
> > > > > param->openmount.devid = 36;
> > > > > err = ioctl(devfd, AUTOFS_DEV_IOCTL_OPENMOUNT, param)
> > > > > 
> > > > > now we get err = -ENOENT.
> > > > 
> > > > Maybe that should be EINVAL, not sure about cases though.
> > > 
> > > in current version -ENOENT is returned in this particular case
> > > 
> > > > > > What's being said here?
> > > > > > 
> > > > > > For a start your talking about direct mounts, I'm pretty
> > > > > > sure
> > > > > > this
> > > > > > use case can't occur with indirect mounts in the sense that
> > > > > > the
> > > > > > indirect mount base should/must never be over mounted and
> > > > > > IIRC
> > > > > > that
> > > > > > base can't be /proc (but maybe that's just mounts inside
> > > > > > proc
> > > > > > ...),
> > > > > > can't remember now but from a common sense POV an indirect
> > > > > > mount
> > > > > > won't/can't be on /proc.
> > > > > > 
> > > > > > And why is this ioctl be called?
> > > > > 
> > > > > We call this ioctl during criu dump stage to open fd from
> > > > > autofs
> > > > > mount dentry. This fd is used later to call
> > > > > ioctl(AUTOFS_IOC_CATATONIC)
> > > > > (we do that on criu dump if we see that control process of
> > > > > autofs
> > > > > mount
> > > > > is dead or pipe is dead).
> > > > 
> > > > Right so your usage "is" the way it's intended, ;)
> > > 
> > > That's good! ;)
> > > 
> > > > > > If the mount is over mounted should that prevent expiration
> > > > > > of
> > > > > > the
> > > > > > over mounted /proc anyway, so maybe the return is correct
> > > > > > ...
> > > > > > or
> > > > > > not ...
> > > > > 
> > > > > I agree that case with overmounted subtree with autofs mount
> > > > > is
> > > > > weird
> > > > > case.
> > > > > But it may be easily created by user and we in CRIU try to
> > > > > handle
> > > > > that.
> > > > 
> > > > I'm not yet ready to make a call on how I think this this
> > > > should
> > > > be done.
> > > > 
> > > > Since you seem to be clear on what this should be used for I'll
> > > > need to look more closely at the patch.
> > > > 
> > > > But, at first glance, it looked like it would break the
> > > > existing
> > > > function of the ioctl.
> > > > 
> > > > Could you explain how the patch works, in particular why it
> > > > doesn't
> > > > break the existing functionality.
> > > 
> > > Sure. With pleasure. Idea of patch is naive:
> > > 1. find_autofs_mount() function called only from syscall context,
> > > so,
> > > we always can determine current mount namespace of caller.
> > > So, I've introduced
> > > 
> > > > > > > + int lookup_mount_path(struct mnt_namespace *ns,
> > > > > > > +		      struct path *res,
> > > > > > > +		      int test(const struct path *mnt, void
> > > > > > > *data),
> > > > > > > +		      void *data)
> > > 
> > > lookup_mount_path() helper function, which allows to traverse
> > > mounts
> > > list of
> > > mount namespace and find proper autofs mount by user-provided
> > > helper
> > > test().
> > > 
> > > 2. Helper function is fairly simple:
> > > a) it checks that mount is autofs mount (by magic number on
> > > superblock)
> > > b) it calculates full path to mount point of each mount in mount
> > > namespace
> > > and compare it with path which user was provided to the
> > > ioctl(AUTOFS_DEV_IOCTL_OPENMOUNT)
> > > parameters.
> > 
> > Oh right, it's using the mounts list, it isn't a path walk oriented
> > search. That's probably why I didn't see the expected follow call.
> > 
> > Another problem with the existing code is it will get it wrong if
> > there is more than one autofs mount in the stack. For example an
> > autofs submount mounted on a direct mount which is rare and not
> > all that sensible but possible.
> 
> Oh. :(
> 
> > So, if we change this, there will need to be some agreed policy
> > about which mount would is selected.
> 
> Sure. I'm ready to write some ltp (?) tests which will cover this
> autofs ioctl and all usecases.
> 
> > The originally code (long before what is there now) selected the
> > lowest mount in the stack because this mechanism is only needed
> > for direct mounts and, as long as there's not something seriously
> > wrong, that is the mount you would need. That's what would be
> > needed
> > for the case above and I think it's what's needed in your case too.
> > 
> > I still haven't yet looked closely at your change, I'll need to do
> > that.
> > 
> > > Problem here is case when user provided relative path in ioctl
> > > parameters
> > > (struct autofs_dev_ioctl). In this case we may fail to resolve
> > > user
> > > provided path to
> > > struct path. For instance:
> > 
> > I don't like the idea of allowing a relative path as an a parameter
> > at all. I think that should be a failure case.
> 
> I'm too, and I've even thought about to restrict use relative paths
> here,
> but actual kernel code allows that, so is it will be okay to discard
> compatibility here?
> I know that autofs daemon implementation uses full paths and if we
> restrict relative paths here
> it will not break systemd/automount daemons.

Sorry for not responding earlier, I've been distracted by other
work.

I have thought about this quite a bit though and the news is not
good I'm afraid.

First, as Al mentioned, the iterator over all the name space mounts
isn't ok, that itself is a significant problem. The only way that
searching for a mount would be ok is if you could use one of the
mount hash lists but I don't think you have enough information to
do that. For example the mount point hash uses the mount point
dentry to get the hash index and you don't have that in this case.

The problem is that the number of mounts can be very large, and
autofs can be one of the applications with a large number of mounts
itself but it's by no means the only one, so iterating over the
whole list of name space mounts is a no-go.

But there's more.

The ioctl is meant to allow you to get a file handle of a direct
mount that is covered by a mount at that mount point only (ie.
something mounted on the same path directory). Anything else
probably shouldn't be allowed.

There's also a problem with allowing access from a mount name
space other than the one in which the mount was originally
mounted and that's because of mount propagation that can occur.
Processes in another mount name space (that can receive these
mounts due to admin mount propagation setup) shouldn't be allowed
to alter these mounts using administrative ioctls. I don't check
for that but I probably should.

There's the notion of ownership, even processes in the same name
space that aren't the mounting process shouldn't be able to use
the admin type ioctls if they aren't the process that mounted it
unless the mount owner process has gone away. I also don't check
the mount is not owned, that probably can be done using the struct
pid of the owner process in the super block info., it should be
stale when the process has gone away.

And finally there's the issue of allowing access to mounts that
are covered by a mount further up the directory tree, historically
that is meant to hide everything below that mount point so it's
questionable (and possibly a security problem) to try and come up
with some way that is available modules to bypass it.

Sorry to be so negative but cross name space access has been a
concern of mine for quite a while and that's why I have fairly
specific views on it.

Ian
> 
> > These direct mounts come from a table (a map in autofs or a unit
> > in systemd) and they should always be identified by that full path.
> > 
> > Ian
> 
> Thank you!
> 
> Regards,
> Alex
> 
> > > # cat /proc/self/mountinfo | grep "/proc"
> > > 828 809 0:23 / /proc rw,nosuid,nodev,noexec,relatime - proc proc
> > > rw
> > > 829 828 0:36 / /proc/sys/fs/binfmt_misc rw,relatime - autofs
> > > systemd-
> > > 1 rw,...,direct,pipe_ino=223
> > > 943 829 0:56 / /proc/sys/fs/binfmt_misc rw,...,relatime -
> > > binfmt_misc
> > > binfmt_misc rw
> > > 949 828 0:57 / /proc rw...,relatime - proc proc rw
> > > 
> > > in this case 
> > > kern_path("/proc/sys/fs/binfmt_misc", LOOKUP_MOUNTPOINT, &path)
> > > ==
> > > -ENOENT
> > > 
> > > To overcome this issue, if kern_path() failed with -ENOENT
> > > AND user-provided mount path looks like fullpath (starts from /)
> > > we just try to find autofs mount in mounts list just by searching
> > > autofs mounts in mounts list with mount point path equal to user-
> > > provided
> > > path. This covers our problem case.
> > > 
> > > This patch is fully compatible with old behaviour - if parent
> > > mounts
> > > of
> > > autofs mount is not overmounted - then
> > > kern_path("/proc/sys/fs/binfmt_misc", LOOKUP_MOUNTPOINT, &path)
> > > will not fail, and we also easily find needed autofs mount in
> > > mounts
> > > list
> > > of caller mount namespace.
> > > 
> > > > Long ago I'm pretty sure I continued to follow up but IIRC that
> > > > went away and was replaced by a single follow_up(), but since
> > > > the changes didn't break the existing function of autofs I
> > > > didn't pay that much attention to them, I'll need to look at
> > > > that too. Not only that, the namespace code has moved a long
> > > > way too however there's still little attention given to
> > > > sanitizing the mounts in the new namespace by anything that I'm
> > > > aware of that uses the feature. TBH I'm not sure why I don't
> > > > see a lot more problems of that nature.
> > > > 
> > > > I have to wonder if what's needed is attention to the follow up
> > > > but that /proc covering the earlier mounts is a bit of a
> > > > concern.
> > > > 
> > > > > > I get that the mount namespaces should be independent and
> > > > > > intuitively
> > > > > > this is a bug but what is the actual use and expected
> > > > > > result.
> > > > > > 
> > > > > > But anyway, aren't you saying that the VFS path walk isn't
> > > > > > handling
> > > > > > mount namespaces properly or are you saying that a process
> > > > > > outside
> > > > > > this new mount namespace becomes broken because of it?
> > > > > 
> > > > > No-no, it's only about opening autofs mount by device id +
> > > > > path.
> > > > 
> > > > That's right, specifically getting a file handle to a covered
> > > > autofs
> > > > mount for things like bringing it back to life etc. But that
> > > > silently
> > > > implies the same mount namespace.
> > > > 
> > > > Let me look at the patch and think about it a bit.
> > > > I'll probably need to run some tests too.
> > > > I am a little busy right now so it may take a bit of time.
> > > > 
> > > > Ian 
> > > 
> > > Thank you very much for your attention to the patch and comments.
> > > 
> > > Regards,
> > > Alex
> > > 
> > > > > > Either way the solution looks more complicated than I'd
> > > > > > expect
> > > > > > so
> > > > > > some explanation along these lines would be good.
> > > > > > 
> > > > > > Ian
> > > > > 
> > > > > Regards,
> > > > > Alex
> > > > > 
> > > > > > > Cc: Matthew Wilcox <willy@infradead.org>
> > > > > > > Cc: Al Viro <viro@zeniv.linux.org.uk>
> > > > > > > Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> > > > > > > Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
> > > > > > > Cc: autofs@vger.kernel.org
> > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > Signed-off-by: Alexander Mikhalitsyn <
> > > > > > > alexander.mikhalitsyn@virtuozzo.com>
> > > > > > > ---
> > > > > > >  fs/autofs/dev-ioctl.c | 127
> > > > > > > +++++++++++++++++++++++++++++++++++++---
> > > > > > > --
> > > > > > >  fs/namespace.c        |  44 +++++++++++++++
> > > > > > >  include/linux/mount.h |   5 ++
> > > > > > >  3 files changed, 162 insertions(+), 14 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/fs/autofs/dev-ioctl.c b/fs/autofs/dev-
> > > > > > > ioctl.c
> > > > > > > index 5bf781ea6d67..55edd3eba8ce 100644
> > > > > > > --- a/fs/autofs/dev-ioctl.c
> > > > > > > +++ b/fs/autofs/dev-ioctl.c
> > > > > > > @@ -10,6 +10,7 @@
> > > > > > >  #include <linux/fdtable.h>
> > > > > > >  #include <linux/magic.h>
> > > > > > >  #include <linux/nospec.h>
> > > > > > > +#include <linux/nsproxy.h>
> > > > > > >  
> > > > > > >  #include "autofs_i.h"
> > > > > > >  
> > > > > > > @@ -179,32 +180,130 @@ static int
> > > > > > > autofs_dev_ioctl_protosubver(struct
> > > > > > > file *fp,
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >  
> > > > > > > +struct filter_autofs_data {
> > > > > > > +	char *pathbuf;
> > > > > > > +	const char *fpathname;
> > > > > > > +	int (*test)(const struct path *path, void *data);
> > > > > > > +	void *data;
> > > > > > > +};
> > > > > > > +
> > > > > > > +static int filter_autofs(const struct path *path, void
> > > > > > > *p)
> > > > > > > +{
> > > > > > > +	struct filter_autofs_data *data = p;
> > > > > > > +	char *name;
> > > > > > > +	int err;
> > > > > > > +
> > > > > > > +	if (path->mnt->mnt_sb->s_magic != AUTOFS_SUPER_MAGIC)
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	name = d_path(path, data->pathbuf, PATH_MAX);
> > > > > > > +	if (IS_ERR(name)) {
> > > > > > > +		err = PTR_ERR(name);
> > > > > > > +		pr_err("d_path failed, errno %d\n", err);
> > > > > > > +		return 0;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	if (strncmp(data->fpathname, name, PATH_MAX))
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	if (!data->test(path, data->data))
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	return 1;
> > > > > > > +}
> > > > > > > +
> > > > > > >  /* Find the topmost mount satisfying test() */
> > > > > > >  static int find_autofs_mount(const char *pathname,
> > > > > > >  			     struct path *res,
> > > > > > >  			     int test(const struct path *path,
> > > > > > > void
> > > > > > > *data),
> > > > > > >  			     void *data)
> > > > > > >  {
> > > > > > > -	struct path path;
> > > > > > > +	struct filter_autofs_data mdata = {
> > > > > > > +		.pathbuf = NULL,
> > > > > > > +		.test = test,
> > > > > > > +		.data = data,
> > > > > > > +	};
> > > > > > > +	struct mnt_namespace *mnt_ns = current->nsproxy-
> > > > > > > > mnt_ns;
> > > > > > > +	struct path path = {};
> > > > > > > +	char *fpathbuf = NULL;
> > > > > > >  	int err;
> > > > > > >  
> > > > > > > +	/*
> > > > > > > +	 * In most cases user will provide full path to autofs
> > > > > > > mount
> > > > > > > point
> > > > > > > +	 * as it is in /proc/X/mountinfo. But if not, then we
> > > > > > > need to
> > > > > > > +	 * open provided relative path and calculate full path.
> > > > > > > +	 * It will not work in case when parent mount of autofs
> > > > > > > mount
> > > > > > > +	 * is overmounted:
> > > > > > > +	 * cd /root
> > > > > > > +	 * ./autofs_mount /root/autofs_yard/mnt
> > > > > > > +	 * mount -t tmpfs tmpfs /root/autofs_yard/mnt
> > > > > > > +	 * mount -t tmpfs tmpfs /root/autofs_yard
> > > > > > > +	 * ./call_ioctl /root/autofs_yard/mnt <- all fine here
> > > > > > > because
> > > > > > > we
> > > > > > > +	 * 					 have full
> > > > > > > path and
> > > > > > > don't
> > > > > > > +	 * 					 need to call
> > > > > > > kern_path()
> > > > > > > +	 * 					 and d_path()
> > > > > > > +	 * ./call_ioctl autofs_yard/mnt <- will fail because
> > > > > > > kern_path()
> > > > > > > +	 * 				   can't lookup
> > > > > > > /root/autofs_yard/mnt
> > > > > > > +	 * 				   (/root/autofs_yard
> > > > > > > directory is
> > > > > > > +	 * 				    empty)
> > > > > > > +	 *
> > > > > > > +	 * TO DISCUSS: we can write special algorithm for
> > > > > > > relative path
> > > > > > > case
> > > > > > > +	 * by getting cwd path combining it with relative path
> > > > > > > from
> > > > > > > user. But
> > > > > > > +	 * is it worth it? User also may use paths with
> > > > > > > symlinks in
> > > > > > > components
> > > > > > > +	 * of path.
> > > > > > > +	 *
> > > > > > > +	 */
> > > > > > >  	err = kern_path(pathname, LOOKUP_MOUNTPOINT, &path);
> > > > > > > -	if (err)
> > > > > > > -		return err;
> > > > > > > -	err = -ENOENT;
> > > > > > > -	while (path.dentry == path.mnt->mnt_root) {
> > > > > > > -		if (path.dentry->d_sb->s_magic ==
> > > > > > > AUTOFS_SUPER_MAGIC) {
> > > > > > > -			if (test(&path, data)) {
> > > > > > > -				path_get(&path);
> > > > > > > -				*res = path;
> > > > > > > -				err = 0;
> > > > > > > -				break;
> > > > > > > -			}
> > > > > > > +	if (err) {
> > > > > > > +		if (pathname[0] == '/') {
> > > > > > > +			/*
> > > > > > > +			 * pathname looks like full path let's
> > > > > > > try to
> > > > > > > use it
> > > > > > > +			 * as it is when searching autofs mount
> > > > > > > +			 */
> > > > > > > +			mdata.fpathname = pathname;
> > > > > > > +			err = 0;
> > > > > > > +			pr_debug("kern_path failed on %s, errno
> > > > > > > %d.
> > > > > > > Will use path as it is to search mount\n",
> > > > > > > +				 pathname, err);
> > > > > > > +		} else {
> > > > > > > +			pr_err("kern_path failed on %s, errno
> > > > > > > %d\n",
> > > > > > > +			       pathname, err);
> > > > > > > +			return err;
> > > > > > > +		}
> > > > > > > +	} else {
> > > > > > > +		pr_debug("find_autofs_mount: let's resolve full
> > > > > > > path
> > > > > > > %s\n",
> > > > > > > +			 pathname);
> > > > > > > +
> > > > > > > +		fpathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
> > > > > > > +		if (!fpathbuf) {
> > > > > > > +			err = -ENOMEM;
> > > > > > > +			goto err;
> > > > > > > +		}
> > > > > > > +
> > > > > > > +		/*
> > > > > > > +		 * We have pathname from user but it may be
> > > > > > > relative,
> > > > > > > we need to
> > > > > > > +		 * have full path because we want to compare it
> > > > > > > with
> > > > > > > mountpoints
> > > > > > > +		 * paths later.
> > > > > > > +		 */
> > > > > > > +		mdata.fpathname = d_path(&path, fpathbuf,
> > > > > > > PATH_MAX);
> > > > > > > +		if (IS_ERR(mdata.fpathname)) {
> > > > > > > +			err = PTR_ERR(mdata.fpathname);
> > > > > > > +			pr_err("d_path failed, errno %d\n",
> > > > > > > err);
> > > > > > > +			goto err;
> > > > > > >  		}
> > > > > > > -		if (!follow_up(&path))
> > > > > > > -			break;
> > > > > > >  	}
> > > > > > > +
> > > > > > > +	mdata.pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
> > > > > > > +	if (!mdata.pathbuf) {
> > > > > > > +		err = -ENOMEM;
> > > > > > > +		goto err;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	err = lookup_mount_path(mnt_ns, res, filter_autofs,
> > > > > > > &mdata);
> > > > > > > +
> > > > > > > +err:
> > > > > > >  	path_put(&path);
> > > > > > > +	kfree(fpathbuf);
> > > > > > > +	kfree(mdata.pathbuf);
> > > > > > >  	return err;
> > > > > > >  }
> > > > > > >  
> > > > > > > diff --git a/fs/namespace.c b/fs/namespace.c
> > > > > > > index 56bb5a5fdc0d..e1d006dbdfe2 100644
> > > > > > > --- a/fs/namespace.c
> > > > > > > +++ b/fs/namespace.c
> > > > > > > @@ -1367,6 +1367,50 @@ void mnt_cursor_del(struct
> > > > > > > mnt_namespace
> > > > > > > *ns,
> > > > > > > struct mount *cursor)
> > > > > > >  }
> > > > > > >  #endif  /* CONFIG_PROC_FS */
> > > > > > >  
> > > > > > > +/**
> > > > > > > + * lookup_mount_path - traverse all mounts in mount
> > > > > > > namespace
> > > > > > > + *                     and filter using test() probe
> > > > > > > callback
> > > > > > > + * As a result struct path will be provided.
> > > > > > > + * @ns: root of mount tree
> > > > > > > + * @res: struct path pointer where resulting path will
> > > > > > > be
> > > > > > > written
> > > > > > > + * @test: filter callback
> > > > > > > + * @data: will be provided as argument to test()
> > > > > > > callback
> > > > > > > + *
> > > > > > > + */
> > > > > > > +int lookup_mount_path(struct mnt_namespace *ns,
> > > > > > > +		      struct path *res,
> > > > > > > +		      int test(const struct path *mnt, void
> > > > > > > *data),
> > > > > > > +		      void *data)
> > > > > > > +{
> > > > > > > +	struct mount *mnt;
> > > > > > > +	int err = -ENOENT;
> > > > > > > +
> > > > > > > +	down_read(&namespace_sem);
> > > > > > > +	lock_ns_list(ns);
> > > > > > > +	list_for_each_entry(mnt, &ns->list, mnt_list) {
> > > > > > > +		struct path tmppath;
> > > > > > > +
> > > > > > > +		if (mnt_is_cursor(mnt))
> > > > > > > +			continue;
> > > > > > > +
> > > > > > > +		tmppath.dentry = mnt->mnt.mnt_root;
> > > > > > > +		tmppath.mnt = &mnt->mnt;
> > > > > > > +
> > > > > > > +		if (test(&tmppath, data)) {
> > > > > > > +			path_get(&tmppath);
> > > > > > > +			*res = tmppath;
> > > > > > > +			err = 0;
> > > > > > > +			break;
> > > > > > > +		}
> > > > > > > +	}
> > > > > > > +	unlock_ns_list(ns);
> > > > > > > +	up_read(&namespace_sem);
> > > > > > > +
> > > > > > > +	return err;
> > > > > > > +}
> > > > > > > +
> > > > > > > +EXPORT_SYMBOL(lookup_mount_path);
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * may_umount_tree - check if a mount tree is busy
> > > > > > >   * @mnt: root of mount tree
> > > > > > > diff --git a/include/linux/mount.h
> > > > > > > b/include/linux/mount.h
> > > > > > > index 5d92a7e1a742..a79e6392e38e 100644
> > > > > > > --- a/include/linux/mount.h
> > > > > > > +++ b/include/linux/mount.h
> > > > > > > @@ -118,6 +118,11 @@ extern unsigned int
> > > > > > > sysctl_mount_max;
> > > > > > >  
> > > > > > >  extern bool path_is_mountpoint(const struct path *path);
> > > > > > >  
> > > > > > > +extern int lookup_mount_path(struct mnt_namespace *ns,
> > > > > > > +			     struct path *res,
> > > > > > > +			     int test(const struct path *mnt,
> > > > > > > void
> > > > > > > *data),
> > > > > > > +			     void *data);
> > > > > > > +
> > > > > > >  extern void kern_unmount_array(struct vfsmount *mnt[],
> > > > > > > unsigned
> > > > > > > int
> > > > > > > num);
> > > > > > >  
> > > > > > >  #endif /* _LINUX_MOUNT_H */

