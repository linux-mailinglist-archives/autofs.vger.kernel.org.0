Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F6CE8C4E
	for <lists+autofs@lfdr.de>; Tue, 29 Oct 2019 17:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389940AbfJ2QAX (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 29 Oct 2019 12:00:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:58178 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389902AbfJ2QAW (ORCPT <rfc822;autofs@vger.kernel.org>);
        Tue, 29 Oct 2019 12:00:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C8176B661;
        Tue, 29 Oct 2019 16:00:19 +0000 (UTC)
Date:   Tue, 29 Oct 2019 11:00:17 -0500
From:   Goldwyn Rodrigues <rgoldwyn@suse.de>
To:     Ian Kent <raven@themaw.net>
Cc:     viro@zeniv.linux.org.uk, autofs@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [RFC] Don't propagate automount
Message-ID: <20191029160017.33chq3w2alyzscfa@fiona>
References: <d163042ab8fffd975a6d460488f1539c5f619eaa.camel@themaw.net>
 <7f31f0c2bf214334a8f7e855044c88a50e006f05.camel@themaw.net>
 <b2443a28939d6fe79ec9aa9d983f516c8269448a.camel@themaw.net>
 <20190927161643.ehahioerrlgehhud@fiona>
 <f0849206eff7179c825061f4b96d56c106c4eb66.camel@themaw.net>
 <20191001190916.fxko7vjcjsgzy6a2@fiona>
 <5117fb99760cc52ca24b103b70e197f6a619bee0.camel@themaw.net>
 <20191028162835.dtyjwwv57xqxrpap@fiona>
 <2dcbe8a95153e43cb179733f03de7da80fbbc6b2.camel@themaw.net>
 <8ca2feb2622165818f27c15564ca78529f31007e.camel@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ca2feb2622165818f27c15564ca78529f31007e.camel@themaw.net>
User-Agent: NeoMutt/20180716
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 14:39 29/10, Ian Kent wrote:
> On Tue, 2019-10-29 at 07:57 +0800, Ian Kent wrote:
> > On Mon, 2019-10-28 at 11:28 -0500, Goldwyn Rodrigues wrote:
> > > Hi Ian,
> > > 
> > > On 10:14 02/10, Ian Kent wrote:
> > > > On Tue, 2019-10-01 at 14:09 -0500, Goldwyn Rodrigues wrote:
> > > <snip>
> > > 
> > > > Anyway, it does sound like it's worth putting time into
> > > > your suggestion of a kernel change.
> > > > 
> > > > Unfortunately I think it's going to take a while to work
> > > > out what's actually going on with the propagation and I'm
> > > > in the middle of some other pressing work right now.
> > > 
> > > Have you have made any progress on this issue?
> > 
> > Sorry I haven't.
> > I still want to try and understand what's going on there.
> > 
> > > As I mentioned, I am fine with a userspace solution of defaulting
> > > to slave mounts all of the time instead of this kernel patch.
> > 
> > Oh, I thought you weren't keen on that recommendation.
> > 
> > That shouldn't take long to do so I should be able to get that done
> > and post a patch pretty soon.
> > 
> > I'll get back to looking at the mount propagation code when I get a
> > chance. Unfortunately I haven't been very successful when making
> > changes to that area of code in the past ...
> 
> After working on this patch I'm even more inclined to let the kernel
> do it's propagation thing and set the autofs mounts, either silently
> by default or explicitly by map entry option.
> 
> Because it's the propagation setting of the parent mount that controls
> the propagation of its children there shouldn't be any chance of a
> race so this should be reliable.
> 
> Anyway, here is a patch, compile tested only, and without the changelog
> hunk I normally add to save you possible conflicts. But unless there
> are any problems found this is what I will eventually commit to the
> repo.
> 
> If there are any changes your not aware of I'll let you know.
> 
> Clearly this depends on the other two related patches for this issue.

This works good for us. Thanks.
However, I have some review comments for the patch.

> --
> 
> autofs-5.1.6 - make bind mounts propagation slave by default
> 
> From: Ian Kent <raven@themaw.net>
> 
> Make setting mount propagation on bind mounts mandatory with a default
> of propagation slave.
> 
> When using multi-mounts that have bind mounts the bind mount will have
> the same properties as its parent which is commonly propagation shared.
> And if the mount target is also propagation shared this can lead to a
> deadlock when attempting to access the offset mounts. When this happens
> an unwanted offset mount is propagated back to the target file system
> resulting in a deadlock since the automount target is itself an
> (unwanted) automount trigger.
> 
> This problem has been present much longer than I originally thought,
> perhaps since mount propagation was introduced into the kernel, so
> explicitly setting bind mount propagation is the sensible thing to do.
> 
> Signed-off-by: Ian Kent <raven@themaw.net>
> ---
>  include/automount.h  |    9 +++++----
>  lib/master_parse.y   |   11 ++++++++---
>  lib/master_tok.l     |    1 +
>  man/auto.master.5.in |   19 ++++++++++---------
>  modules/mount_bind.c |   40 ++++++++++++++++++++++------------------
>  5 files changed, 46 insertions(+), 34 deletions(-)
> 
> diff --git a/include/automount.h b/include/automount.h
> index 4fd0ba96..fe9c7fee 100644
> --- a/include/automount.h
> +++ b/include/automount.h
> @@ -551,14 +551,15 @@ struct kernel_mod_version {
>  #define MOUNT_FLAG_AMD_CACHE_ALL	0x0080
>  
>  /* Set mount propagation for bind mounts */
> -#define MOUNT_FLAG_SLAVE		0x0100
> -#define MOUNT_FLAG_PRIVATE		0x0200
> +#define MOUNT_FLAG_SHARED		0x0100
> +#define MOUNT_FLAG_SLAVE		0x0200
> +#define MOUNT_FLAG_PRIVATE		0x0400
>  
>  /* Use strict expire semantics if requested and kernel supports it */
> -#define MOUNT_FLAG_STRICTEXPIRE		0x0400
> +#define MOUNT_FLAG_STRICTEXPIRE		0x0800
>  
>  /* Indicator for applications to ignore the mount entry */
> -#define MOUNT_FLAG_IGNORE		0x0800
> +#define MOUNT_FLAG_IGNORE		0x1000
>  
>  struct autofs_point {
>  	pthread_t thid;
> diff --git a/lib/master_parse.y b/lib/master_parse.y
> index f817f739..e9589a5a 100644
> --- a/lib/master_parse.y
> +++ b/lib/master_parse.y
> @@ -59,6 +59,7 @@ static long timeout;
>  static long negative_timeout;
>  static unsigned symlnk;
>  static unsigned strictexpire;
> +static unsigned shared;
>  static unsigned slave;
>  static unsigned private;
>  static unsigned nobind;
> @@ -106,7 +107,7 @@ static int master_fprintf(FILE *, char *, ...);
>  %token MAP
>  %token OPT_TIMEOUT OPT_NTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VERBOSE
>  %token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK OPT_MODE
> -%token OPT_STRICTEXPIRE OPT_SLAVE OPT_PRIVATE
> +%token OPT_STRICTEXPIRE OPT_SHARED OPT_SLAVE OPT_PRIVATE
>  %token COLON COMMA NL DDASH
>  %type <strtype> map
>  %type <strtype> options
> @@ -208,6 +209,7 @@ line:
>  	| PATH OPT_TIMEOUT { master_notify($1); YYABORT; }
>  	| PATH OPT_SYMLINK { master_notify($1); YYABORT; }
>  	| PATH OPT_STRICTEXPIRE { master_notify($1); YYABORT; }
> +	| PATH OPT_SHARED { master_notify($1); YYABORT; }
>  	| PATH OPT_SLAVE { master_notify($1); YYABORT; }
>  	| PATH OPT_PRIVATE { master_notify($1); YYABORT; }
>  	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
> @@ -622,6 +624,7 @@ daemon_option: OPT_TIMEOUT NUMBER { timeout = $2; }
>  	| OPT_NTIMEOUT NUMBER { negative_timeout = $2; }
>  	| OPT_SYMLINK	{ symlnk = 1; }
>  	| OPT_STRICTEXPIRE { strictexpire = 1; }
> +	| OPT_SHARED	{ shared = 1; }
>  	| OPT_SLAVE	{ slave = 1; }
>  	| OPT_PRIVATE	{ private = 1; }
>  	| OPT_NOBIND	{ nobind = 1; }
> @@ -907,8 +910,10 @@ int master_parse_entry(const char *buffer, unsigned int default_timeout, unsigne
>  		entry->ap->flags |= MOUNT_FLAG_SYMLINK;
>  	if (strictexpire)
>  		entry->ap->flags |= MOUNT_FLAG_STRICTEXPIRE;
> -	if (slave)
> -		entry->ap->flags |= MOUNT_FLAG_SLAVE;
> +	/* Default is propagation slave */
> +	entry->ap->flags |= MOUNT_FLAG_SLAVE;
> +	if (shared)
> +		entry->ap->flags |= MOUNT_FLAG_SHARED;
>  	if (private)
>  		entry->ap->flags |= MOUNT_FLAG_PRIVATE;

If the user mention shared or private flag, you will end up
enabling both MOUNT_FLAG_SLAVE and MOUNT_FLAG_SHARED.
It would be better to put it in a if..else if..else sequence.
These are options are mutually exclusive.

It may not affect your current implementation, it will
show up as a bug if there are further changes in the
mount() sequence.

-- 
Goldwyn

>  	if (negative_timeout)
> diff --git a/lib/master_tok.l b/lib/master_tok.l
> index 7486710b..87a6b958 100644
> --- a/lib/master_tok.l
> +++ b/lib/master_tok.l
> @@ -389,6 +389,7 @@ MODE		(--mode{OPTWS}|--mode{OPTWS}={OPTWS})
>  	-?symlink		{ return(OPT_SYMLINK); }
>  	-?nobind		{ return(OPT_NOBIND); }
>  	-?nobrowse		{ return(OPT_NOGHOST); }
> +	-?shared		{ return(OPT_SHARED); }
>  	-?slave			{ return(OPT_SLAVE); }
>  	-?private		{ return(OPT_PRIVATE); }
>  	-?strictexpire		{ return(OPT_STRICTEXPIRE); }
> diff --git a/man/auto.master.5.in b/man/auto.master.5.in
> index 6e510a59..58132d69 100644
> --- a/man/auto.master.5.in
> +++ b/man/auto.master.5.in
> @@ -208,17 +208,18 @@ applications scanning the mount tree. Note that this doesn't completely
>  resolve the problem of expired automounts being immediately re-mounted
>  due to application accesses triggered by the expire itself.
>  .TP
> -.I slave \fPor\fI private
> +.I slave\fP, \fIprivate\fP or \fIshared\fP
>  This option allows mount propagation of bind mounts to be set to
> -either \fIslave\fP or \fIprivate\fP. This option may be needed when using
> -multi-mounts that have bind mounts that bind to a file system that is
> -propagation shared. This is because the bind mount will have the same
> -properties as its target which causes problems for offset mounts. When
> -this happens an unwanted offset mount is propagated back to the target
> -file system resulting in a deadlock when attempting to access the offset.
> +\fIslave\fP, \fIprivate\fP or \fIshared\fP. This option defaults to
> +\fIslave\fP if no option is given. When using multi-mounts that have
> +bind mounts the bind mount will have the same properties as its parent
> +which is commonly propagation \fIshared\fP. And if the mount target is
> +also propagation \fIshared\fP this can lead to a deadlock when attempting
> +to access the offset mounts. When this happens an unwanted offset mount
> +is propagated back to the target file system resulting in the deadlock
> +since the automount target is itself an (unwanted) automount trigger.
>  This option is an autofs pseudo mount option that can be used in the
> -master map only. By default, bind mounts will inherit the mount propagation
> -of the target file system.
> +master map only.
>  .TP
>  .I "\-r, \-\-random-multimount-selection"
>  Enables the use of random selection when choosing a host from a
> diff --git a/modules/mount_bind.c b/modules/mount_bind.c
> index 9cba0d7a..5253501c 100644
> --- a/modules/mount_bind.c
> +++ b/modules/mount_bind.c
> @@ -153,6 +153,7 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
>  
>  	if (!symlnk && bind_works) {
>  		int status, existed = 1;
> +		int flags;
>  
>  		debug(ap->logopt, MODPREFIX "calling mkdir_path %s", fullpath);
>  
> @@ -190,24 +191,27 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
>  			      what, fstype, fullpath);
>  		}
>  
> -		if (ap->flags & (MOUNT_FLAG_SLAVE | MOUNT_FLAG_PRIVATE)) {
> -			int flags = MS_SLAVE;
> -
> -			if (ap->flags & MOUNT_FLAG_PRIVATE)
> -				flags = MS_PRIVATE;
> -
> -			/* The bind mount has succeeded but if the target
> -			 * mount is propagation shared propagation of child
> -			 * mounts (autofs offset mounts for example) back to
> -			 * the target of the bind mount must be avoided or
> -			 * autofs trigger mounts will deadlock.
> -			 */
> -			err = mount(NULL, fullpath, NULL, flags, NULL);
> -			if (err) {
> -				warn(ap->logopt,
> -				     "failed to set propagation for %s",
> -				     fullpath, root);
> -			}
> +		/* The bind mount has succeeded, now set the mount propagation.
> +		 *
> +		 * The default is propagation shared, change it if the master
> +		 * map entry has a different option specified.
> +		 */
> +		flags = MS_SLAVE;
> +		if (ap->flags & MOUNT_FLAG_PRIVATE)
> +			flags = MS_PRIVATE;
> +		else if (ap->flags & MOUNT_FLAG_SHARED)
> +			flags = MS_SHARED;
> +
> +		/* Note: If the parent mount is propagation shared propagation
> +		 *  of child mounts (autofs offset mounts for example) back to
> +		 *  the target of the bind mount can happen in some cases and
> +		 *  must be avoided or autofs trigger mounts will deadlock.
> +		 */
> +		err = mount(NULL, fullpath, NULL, flags, NULL);
> +		if (err) {
> +			warn(ap->logopt,
> +			     "failed to set propagation for %s",
> +			     fullpath, root);
>  		}
>  
>  		return 0;
> 
