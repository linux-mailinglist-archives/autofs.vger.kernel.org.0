Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77CB35D66C
	for <lists+autofs@lfdr.de>; Tue, 13 Apr 2021 06:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhDMEZR (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 13 Apr 2021 00:25:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47879 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229644AbhDMEZQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 13 Apr 2021 00:25:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4814F5C01DF;
        Tue, 13 Apr 2021 00:24:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 13 Apr 2021 00:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        Wdlt+WRLM+WJInrmztPATh1tKC7J0pf+BKYfJLmB010=; b=SMFM6Hkcf3Z7bQej
        5Xh3k/mYZS9Hh8DyYR8yNZJORrZEMcV/NETHbNEeBairjGXtTeZyJpBw+mmT7OGS
        cX6iTutjFxdCvE+HUQIRJtUycVWRtwJRav+Dia7Lq3OauiX8XnoV+FAbmz0neWeg
        RNoMyX8TCsnI7X37lHNv4r/alu5IP7Hs9qC8Gj9ZaT8WddJ6ahPoAQwe40XnnXs1
        Gh5klgEJvE78WMM4d8QiLTslrUcC6sWV/6GFT+CRyqvM4D3eyaHVz8A5bZxlXaio
        +NIHDd73Oi25YCWo2ldVXVaKy9XonXNChaZb7JK3kWwKFbwJKsWSNFhRzOqX/V5h
        5Y2/BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Wdlt+WRLM+WJInrmztPATh1tKC7J0pf+BKYfJLmB0
        10=; b=KBl/Vuoir8F8cujEXdK7doiJiKwDthawcl5z5xlECO2n2OP+ma4s/QQvH
        t7LIvWCsVdSte/xf0KGnvWAYjRIyzTiQDdiY76h8AkaPkxxpBiGtg2NEdtMMJ9OE
        Ic/9tDvZxKzpu7GLrzQi0lxtiVSDsgDdAtsfhBLfzfSdlUT6W2awpjLtp/vVWNzd
        o3m9uBs7C/Qlexsbo8i/jiJXfxQm/qZH/TMvnUZoitTApe8F41pUNZx5SYAqZ/dI
        efEQyM0aCMvNYo4hjAKKa9izEny6jVntbrqBLgrY0l0jrJ/ctoeRx1vzmhhDB8D4
        P/ics1ENZkcUrPHAFZfxMic6R3avQ==
X-ME-Sender: <xms:Fx11YEJfZqN1G8qVVoNy2O__QvjJFr6VXT6wgD4Ftom6w05CKbKipQ>
    <xme:Fx11YEL3-eDHoc-Gp-Ph9hMcZEjlmi0RliwGJerJ-TaLTz8kuwx9ZWhVhrWBSqWSt
    BOdHkAXeA2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekkedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
    ertddtreejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepfeefteetvdeguddvveefveeftedtffduudehue
    eihfeuvefgveehffeludeggfejnecukfhppedutdeirdeiledrvdehfedrvdefleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:Fx11YEvry4ICXC4QWy6P5OzGOaTbXftkQ_2PlN57oKGMsSrZOfOdsA>
    <xmx:Fx11YBb9Px4qVlrLHWco9wgLhODKxPBcHwXvfgbL1wp1wlutgt43aw>
    <xmx:Fx11YLZKLP_7U6U4TlfH-GV0z1V0O0ZGM_FNjhSTC5d6kDG5p_Abcw>
    <xmx:GB11YEmwNvRQHWAtXtkaIG1BlxKzXygRRPf9Li6_8S6sNnrEaFSF3Q>
Received: from mickey.themaw.net (106-69-253-239.dyn.iinet.net.au [106.69.253.239])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6ED0A1080064;
        Tue, 13 Apr 2021 00:24:54 -0400 (EDT)
Message-ID: <2cb9921cb463c65adb7da31852f3ce6dad3572bc.camel@themaw.net>
Subject: Re: do_mount_autofs_direct: failed to create mount directory ...
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <autofs@lists.drosera.ch>, autofs@vger.kernel.org
Date:   Tue, 13 Apr 2021 12:24:49 +0800
In-Reply-To: <46056a24-9d69-8ad2-1067-c1cc21a8413f@drosera.ch>
References: <967e781d-75a2-754d-f439-67529ca7081a@lists.drosera.ch>
         <6793611de80745dc7d3d5705f2633aea5b5186a2.camel@themaw.net>
         <54a4b76d-3a46-00c5-8888-6aec74715a78@lists.drosera.ch>
         <3c305bd12fce8b1431f9d5cb2c5ff6aa892dad21.camel@themaw.net>
         <46056a24-9d69-8ad2-1067-c1cc21a8413f@drosera.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2021-04-12 at 20:40 +0200, Frank Thommen wrote:
> 
> On 11.04.21 04:58, Ian Kent wrote:
> > On Sat, 2021-04-10 at 23:50 +0200, Frank Thommen wrote:
> > > On 09.04.21 02:50, Ian Kent wrote:
> > > > On Thu, 2021-04-08 at 19:50 +0200, Frank Thommen wrote:
> > > > > Dear all,
> > > > > 
> > > > > I have problems "submounting" a share when using direct
> > > > > mounts.
> > > > > Given
> > > > > the following automounter tables:
> > > > > 
> > > > > /etc/auto.master:
> > > > > -----------------------------------
> > > > > /-  /etc/auto.groups
> > > > > 
> > > > > 
> > > > > /etc/auto.groups
> > > > > -----------------------------------
> > > > > /groups/group1/int        server:/export/group1
> > > > > /groups/group1/int/svc/a  server2:/export/service_a
> > > > > /groups/group2/int        server2:/export/group2
> > > > > /groups/group3/int        server:/export/group3
> > > > > [... ca. 100 entries here ...]
> > > > > 
> > > > > 
> > > > > /groups/group1/int/svc/a is not mounted and I get the error
> > > > > message
> > > > > "do_mount_autofs_direct: failed to create mount directory
> > > > > /groups/group1/int/svc/a" on any host which doesn not have
> > > > > root
> > > > > permissions (no_root_squash) on server:/export/group1 (which
> > > > > is
> > > > > on
> > > > > 99%
> > > > > of all clients).
> > > > 
> > > > autofs won't (shouldn't) create directories in remote file
> > > > systems
> > > > to perform mounts, it requires they are already present.
> > > > 
> > > > > The directory "svc/a" has been created on
> > > > > server:/export/group1,
> > > > > so
> > > > > there is no need to recreate it.
> > > 
> > > I am sure autofs /did/ recreate it.  But I will doublecheck that.
> > 
> > I think you'll find the directory must already exist on the server
> > in this case since it's inside a containing NFS mount.
> > 
> > If it doesn't exist mounting the offset trigger will fail and the
> > non-strict default can lead to other problems if that mount is
> > expected to be there (non-strict is mean to prevent fails from
> > administrative access restrictions on mounts to hosts rather
> > than this case).
> 
> Hm.  I checked.  Yes, it seems, that the directory has to be created
> on 
> the server, *but* on a server which has root permissions on the
> "base" 
> share (/groups/group1/int, i.e. server:/export/group1), I see the 
> following entries in the autofs debug log (note the call to
> "mkdir_path"):
> 
> automount[18052]: mount_mount: mount(nfs): calling mkdir_path 
> /groups/group1/int/svc/a
> automount[18052]: mount(nfs): calling mount -t nfs4 -s -o 
> vers=4.0,rw,sec=sys server2:/export/service_a
> /groups/group1/int/svc/a
> automount[18052]: mount_mount: mount(nfs): mounted 
> server2:/export/service_a/icgc/dmg/otp on /groups/group1/int/svc/a
> automount[18052]: mounted /groups/group1/int/svc/a
> 
> and there is a mount in place at that path
> 
> 
> On a server which does *not* habe root permissions on the base share,
> I 
> get a
> 
> automount[21701]: do_mount_autofs_direct: failed to create mount 
> directory /groups/group1/int/svc/a
> 
> and there is /no/ mount in place at that path.
> 
> I don't understand that...

What is it you don't understand?

> 
> 
> > > > Which you have done.
> > > > Presumably the permissions are ok?
> > > 
> > > Are special permissions required?
> > 
> > Well, no, but I have seen strange behaviours with restricted
> > permissions settings, it shouldn't be a problem I guess.
> > 
> > > > I haven't looked at this case for a very long time but I'm
> > > > pretty
> > > > sure nesting isn't allowed in direct mount maps (with any map
> > > > type
> > > > really). I'm also pretty sure I don't test for nesting in
> > > > direct
> > > > mount maps (quite difficult to do) and fail the trigger mount.
> > > > 
> > > > If you need to nest mounts your supposed to use offsets in the
> > > > mount entry (with both direct or indirect maps).
> > > > 
> > > > For example:
> > > > /groups/group1/int  /       server:/export/group1
> > > >                       /svc/a  server2:/export/service_a
> > > > 
> > > > where the "/" for the root offset is optional but may help with
> > > > map readability.
> > > 
> > > I wasn't aware that multi-maps were also possible with direct
> > > maps.
> > 
> > Ha, multi-mount please, multi-maps are a different feature and we
> > don't want to get confused.
> > 
> > > However we had major issues with updating such configurations, as
> > > an
> > > update of the "nested" part requires an autofs re/start/, while
> > > otherwise a re/load/ suffices.  We must avoid autofs restarts in
> > > our
> > 
> > Actually I think that's not quite what is happening.
> > 
> > I'm going by memory here so I might not be completely accurate.
> > 
> > The re-load will update the map entry that has the offsets but
> > the mounts won't change until the multi-mount is mounted again
> > from it's base.
> > 
> > IIRC the internal hosts map will try and re-configure the offsets
> > of the mounted multi-mount on re-load but I haven't expanded that
> > multi-mount feature to other areas.
> > 
> > Expanding that that is one possible way I could help but equally
> > the umount vs. mount order fix on re-load needs to be done too.
> > 
> > > environment at all costs, as they can lead to short interruptions
> > > in
> > > the
> > > accessibility of shares, which is a problem in a cluster
> > > environment
> > > where theses accesses happen all the time. See also our long
> > > thread
> > > "Changes in indirect multi-maps don't become effective w/o autofs
> > > restart" in 2019 ;-)
> > 
> > Ok, I don't remember that so I'm not sure what I said or did or
> > didn't do. But the situation I described above is essentially
> > what we have and so far I had only implemented it for the
> > internal hosts map.
> > 
> > The fact is that without a policy that minimises disruption on
> > mounts that are busy sufficient for a broad range of environments
> > the only choice is to ignore that bit of the update (and anything
> > below it) until it expires.
> > 
> > The bottom line is that if the update is forced some processes
> > will end in tears sooner or later and there's no way around it.
> > 
> > Fixing the mount/umount ordering on reload seems like the simplest
> > improvement but, again, in use mounts will be a problem.
> > 
> > > From what I've seen forcing the update by lazy umounting the busy
> > mount(s) is probably the least disruptive way to do it but that
> > will mean the change will be more extensive since I try and avoid
> > doing that by ignoring these (which I think is the cause of a fair
> > amount of the problems your seeing).
> > 
> > > If I may digress with a short syntactical question: Is the \ at
> > > the
> > > end
> > > of the line in multi-maps not required?  This would explain
> > > strange
> > > effects that we had when we indented some of the keys in some
> > > direct
> > > maps (to enhance readability)
> > 
> > My mistake, the line continuation is definitely needed there.
> > 
> > > 
> > > > I've not seen problem reports like this from direct mount map
> > > > users
> > > > so I'm pretty sure nesting isn't normally used so I'm not sure
> > > > it
> > > > will work properly.
> > > > 
> > > > However the testing I use does include pass/fail tests for
> > > > direct
> > > > mount map entries with offsets so it should work.
> > > > 
> > > > There could unfixed problems with the version of autofs you are
> > > > using
> > > > which we would need to look at separately.
> > > > 
> > > > > There are additional subdirectories in
> > > > > /groups/group1/int/svc/
> > > > > which
> > > > > directly reside on server:/export/group1.  Only "a" need to
> > > > > be
> > > > > mounted
> > > > > from a second location.
> > > > 
> > > > I think this should work fine using an offset as described
> > > > above.
> > > > 
> > > > Those other directories are present in the mount that contains
> > > > the
> > > > offset trigger so it should appear the same as you were hoping
> > > > the
> > > > original map entry would except that by using an offset the
> > > > expire
> > > > should now work.
> > > > 
> > > > > Can this be solved with direct mounts?  How?  We would prefer
> > > > > to
> > > > > use
> > > > > direct mounts, as this has shown to create the least problems
> > > > > when
> > > > > dynamically changing the mount tables (no automounter restart
> > > > > is
> > > > > required).  However I would not have a problem to use some
> > > > > indirect
> > > > > mount mechanism for /groups/group1/int/svc/a as long as the
> > > > > main
> > > > > /groups/groupN/int can stay in a direct mount table.
> > > > 
> > > > But you do need to do a reload for the direct mount triggers to
> > > > be updated, right?
> > > 
> > > yes a reload is required, but a reload doesn't disrupt access to
> > > NFS
> > > shares while a restart can/does (which is a major issue in our
> > > cluster
> > > environment, see above)
> > 
> > Yep, I get that and that pause in access is a problem I'm aware of,
> > and it's a problem that I can't resolve, and it's particularly bad
> > for busy sites, such as yours.
> > 
> > Anyway, you've got me at a good time to get some attention on this,
> > just don't don't let me forget about it if I get loaded with other
> > things ...
> 
> So if understand correctly, you see a possible way to alleviate (but
> not 
> completely solve) the situation with mount disruptions.  What
> can/should 
> I do to not let you forget about it? ;-)
> 
> 
> Frank
> 
> > Ian
> > 
> > 

