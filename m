Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A99D6C3F38
	for <lists+autofs@lfdr.de>; Wed, 22 Mar 2023 01:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjCVAix (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 21 Mar 2023 20:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjCVAip (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 21 Mar 2023 20:38:45 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B6B5261
        for <autofs@vger.kernel.org>; Tue, 21 Mar 2023 17:38:21 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id EE9015C0091;
        Tue, 21 Mar 2023 20:38:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 21 Mar 2023 20:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1679445497; x=1679531897; bh=swjYuE6Kuq92o3hcKMCO/H9i5+kAx+S0F/k
        LaNe/4AY=; b=Wth3yVL8icWWYB0YB5c/p997cv29ve+RMtKe4dRdWE1YYtxAwzY
        71dkY5L3IpiKtAr/vAP4By0VnDpeG1IbbecTlla5HmbWSvnulOqzk0KgN+u2D5O0
        FXTnwBH4GE2jLL3XNHoDaijGLvnrOXClUpbFAk2+KbOPx1ZBbNBO6vnwGm4It3T1
        3olb5x7SDju3ZbTjlV8MJYqgQcAp6BFxXNQYW4vgLR9HWYfd2JoH6gmsAavIjZMY
        zS+Wbj9tjKVJrOElq309l5wgylc0ujuYquAjomEbFn7dgFD67B4hFZVR6n/L861a
        mlaf0A8HCP+lMGgN1gpp3N0xU3jqSSJXFZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679445497; x=1679531897; bh=swjYuE6Kuq92o3hcKMCO/H9i5+kAx+S0F/k
        LaNe/4AY=; b=Jp/dM9oGZVi5PhvH6oDkor0xOxR2WnMKIPAIcYvHYCFPt/btcxu
        9NyuR+wS4Lgbol8/DHojNXXp3wn2wzK9xK6iRToKqhSg0p7kDteuz2MYMPFbb6eJ
        omOY4bWUSZmI61dB19VmPnlHMoISnfFXgDw5vp73WIWgmbOxEqz9Aam1n1cgA7QH
        JYXsgGM3wcAWrktu0wKqWB2geX2+6iELLPZ9UWBXMe3COh5KcWZUO84jq4fveSXb
        Tcb6ytZdrcaR1RS7cF+GPR5omzQsI3S/fa9/DvY3fv6Edf1fzZU3/xlxmKFS6vnJ
        N4uX4gxruOATG3tGET5qi5U2LsFKqminh4g==
X-ME-Sender: <xms:-U0aZHkFyK_K39opjVE-qK6MQwgGQp4809eG883-g_XpZSBKOoUKOQ>
    <xme:-U0aZK0ml86RirM4yP8af7TPqilrnc-6GTDK4HMX5OfSn9klR8tlY2uAkWe08atZu
    XgqjGAWB8bg>
X-ME-Received: <xmr:-U0aZNo992cx2vllLgn05a-e1IKAqyUBi7TzAptIJUpJZCpdpsQDeHE-5FmFiSl1EPvltYNaOsHo2ayywxGavmEElYtIl9RMMSLG_xnwlbSiZO8mTi7r>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeguddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeevleffleefjeefgeeitdehleektdegfedvve
    ethffhleeigeffgfeijefftdegkeenucffohhmrghinhepthhokhdrlhgsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvg
    hmrgifrdhnvght
X-ME-Proxy: <xmx:-U0aZPmdsrt3mjGO84uO11M-KinL8PjannG3_LLcTwRHwN7ecSdDnw>
    <xmx:-U0aZF29yjA96jEMjLTElPioyrnDTDH7SUmRp06V9VQdllzpRXrJaA>
    <xmx:-U0aZOvKFqVrn6MjJGrpQ_qvvL-W1B_R4v67FYdeOqOGlqbTJZ3QaQ>
    <xmx:-U0aZCiiRvx9j0oosvdM62EJDNYXEulaOwgwQrUhJGQZMJuYDgM8bw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 20:38:16 -0400 (EDT)
Message-ID: <fc354f86-a31d-5fae-e0da-0cf2749bbe01@themaw.net>
Date:   Wed, 22 Mar 2023 08:38:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] autofs-5.1.8 - add "unshared" option to disable mount
 propagation.
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167928279599.8008.18190549797975624979@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167928279599.8008.18190549797975624979@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 20/3/23 11:26, NeilBrown wrote:
> [[This is a different approach to meeting my customer's need.
>    Thoughts? - thanks.]]

I'm a bit lost here now.


> Sometimes it is useful for an autofs mount to be "private" for mount
> propagation.  For example, this allows submounts to be moved off with
> "mount --move" - such movement is not permitted for shared mounts.

I always use "submount" to refer to map entries that have fstype=autofs,

they are distinct mounts, is that the case here?


>
> Changing the autofs mount point to "private" with "mount --make-private"
> after the automount daemon has started can be problematic.  If the
> mount point is already shared there will be another copy that will never
> get acted on by automount and so tools accessing it can hang.

Right, I get that.


>
> So to safely achieve non-shared auto-mountpoints we need to create a
> transparent bind mount at the mount point, mark it as private, then
> mount the autofs mount there.

Yes, it's the parent mount that things need to be done to, was always

a bit of a pain to understand IMHO, and easy to get confused by.


So what do we end up with here, a stack of mounts with one extra

mount?

It sounds like the goal is to set the autofs mount propagation

private, is that right?


I'm not sure but this might cause some trouble for the kernel.

I've been working on fixing the expire check for mount trees to

work for multiple mount namespaces in the kernel and mount stacking

topology looks a bit odd.


Do these mount points continue to expire as they should?

I wonder what this will do to my expire changes ...


I'm sorry, I feel like I'm being difficult now and I don't want

to be but what's being done here is puzzling me and sounds just

a bit unusual.


Ian

>
> This patch does this when the "unshared" option is given in the
> auto.master file.
>
> Ideally we would check if the target mountpoint is shared and skip the
> extra bind mount in that case.  However checking the propagation status
> requires reading /proc/self/mountinfo which is more work than seems
> justified in this case.
>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>   daemon/automount.c    | 20 ++++++++++++++++----
>   daemon/direct.c       | 26 ++++++++++++++++++++++++++
>   daemon/indirect.c     | 18 ++++++++++++++++++
>   daemon/master_parse.y |  7 +++++++
>   daemon/master_tok.l   |  1 +
>   include/automount.h   |  6 ++++++
>   man/auto.master.5.in  |  9 +++++++++
>   7 files changed, 83 insertions(+), 4 deletions(-)
>
> diff --git a/daemon/automount.c b/daemon/automount.c
> index f550bc8fb222..dbc8976550eb 100644
> --- a/daemon/automount.c
> +++ b/daemon/automount.c
> @@ -32,6 +32,7 @@
>   #include <sys/stat.h>
>   #include <sys/time.h>
>   #include <sys/resource.h>
> +#include <sys/mount.h>
>   #include <sys/poll.h>
>   #include <dirent.h>
>   #include <sys/vfs.h>
> @@ -1739,7 +1740,7 @@ static void handle_mounts_cleanup(void *arg)
>   {
>   	struct autofs_point *ap;
>   	char buf[MAX_ERR_BUF];
> -	unsigned int clean = 0, submount, logopt;
> +	unsigned int clean = 0, clean_bind = 0, submount, logopt;
>   	unsigned int pending = 0;
>   
>   	ap = (struct autofs_point *) arg;
> @@ -1747,9 +1748,12 @@ static void handle_mounts_cleanup(void *arg)
>   	logopt = ap->logopt;
>   	submount = ap->submount;
>   
> -	if (!submount && strcmp(ap->path, "/-") &&
> -	    ap->flags & MOUNT_FLAG_DIR_CREATED)
> -		clean = 1;
> +	if (!submount && strcmp(ap->path, "/-")) {
> +		if (ap->flags & MOUNT_FLAG_DIR_CREATED)
> +			clean = 1;
> +		if (ap->flags & MOUNT_FLAG_DID_BIND)
> +			clean_bind = 1;
> +	}
>   
>   	if (submount) {
>   		struct mnt_list *mnt;
> @@ -1787,6 +1791,14 @@ static void handle_mounts_cleanup(void *arg)
>   		master_free_mapent(ap->entry);
>   	}
>   
> +	if (clean_bind) {
> +		if (umount2(ap->path, MNT_DETACH)) {
> +			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
> +			warn(logopt, "failed to remove internal bind mount %s: %s",
> +			     ap->path, estr);
> +		}
> +	}
> +
>   	if (clean) {
>   		if (rmdir(ap->path) == -1) {
>   			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
> diff --git a/daemon/direct.c b/daemon/direct.c
> index 316ffd781762..db15689def9d 100644
> --- a/daemon/direct.c
> +++ b/daemon/direct.c
> @@ -205,6 +205,14 @@ force_umount:
>   	} else
>   		info(ap->logopt, "umounted direct mount %s", me->key);
>   
> +	if (!rv && (me->flags & MOUNT_FLAG_DID_BIND)) {
> +		if (umount2(me->key, MNT_DETACH) == -1) {
> +			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
> +			warn(ap->logopt, "failed to unmount internal bind mount %s: %s",
> +			     me->key, estr);
> +		}
> +	}
> +
>   	if (!rv && me->flags & MOUNT_FLAG_DIR_CREATED) {
>   		if  (rmdir(me->key) == -1) {
>   			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
> @@ -400,6 +408,24 @@ int do_mount_autofs_direct(struct autofs_point *ap,
>   
>   	map_name = me->mc->map->argv[0];
>   
> +	me->flags &= ~MOUNT_FLAG_DID_BIND;
> +	if (ap->flags & MOUNT_FLAG_UNSHARED) {
> +		/* Ideally we would check if the mount is shared, but
> +		 * that requires reading mountinfo which isn't easy.
> +		 */
> +		if (mount(me->key, me->key, "none", MS_BIND, NULL) != 0) {
> +			error(ap->logopt,
> +			      "failed to create internal bind mount for 'unshared': %s",
> +			      me->key);
> +		} else {
> +			if (mount(NULL, me->key, NULL, MS_PRIVATE, NULL) == 0)
> +				me->flags |= MOUNT_FLAG_DID_BIND;
> +			else
> +				error(ap->logopt,
> +				      "failed to make %s private", me->key);
> +		}
> +	}
> +
>   	ret = mount(map_name, me->key, "autofs", MS_MGC_VAL, mp->options);
>   	if (ret) {
>   		crit(ap->logopt, "failed to mount autofs path %s", me->key);
> diff --git a/daemon/indirect.c b/daemon/indirect.c
> index 23ef9f41398d..70c601814f6d 100644
> --- a/daemon/indirect.c
> +++ b/daemon/indirect.c
> @@ -108,6 +108,24 @@ static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
>   	if (!type || strcmp(ap->entry->maps->type, "hosts"))
>   		map_name = ap->entry->maps->argv[0];
>   
> +	ap->flags &= ~MOUNT_FLAG_DID_BIND;
> +	if (ap->flags & MOUNT_FLAG_UNSHARED) {
> +		/* Ideally we would check if the mount is shared, but
> +		 * that requires reading mountinfo which isn't easy.
> +		 */
> +		if (mount(root, root, "none", MS_BIND, NULL) != 0) {
> +			error(ap->logopt,
> +			      "failed to create internal bind mount for 'unshared': %s",
> +			      root);
> +		} else {
> +			if (mount(NULL, root, NULL, MS_PRIVATE, NULL) == 0)
> +				ap->flags |= MOUNT_FLAG_DID_BIND;
> +			else
> +				error(ap->logopt,
> +				      "failed to make %s private", root);
> +		}
> +	}
> +
>   	ret = mount(map_name, root, "autofs", MS_MGC_VAL, options);
>   	if (ret) {
>   		crit(ap->logopt,
> diff --git a/daemon/master_parse.y b/daemon/master_parse.y
> index 469cfe9765ac..9e4e9d0e02ff 100644
> --- a/daemon/master_parse.y
> +++ b/daemon/master_parse.y
> @@ -62,6 +62,7 @@ static long positive_timeout;
>   static unsigned symlnk;
>   static unsigned strictexpire;
>   static unsigned nobind;
> +static unsigned unshared;
>   static unsigned ghost;
>   extern unsigned global_selection_options;
>   static unsigned random_selection;
> @@ -116,6 +117,7 @@ static int master_fprintf(FILE *, char *, ...);
>   %token OPT_TIMEOUT OPT_NTIMEOUT OPT_PTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VERBOSE
>   %token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK OPT_MODE
>   %token OPT_STRICTEXPIRE OPT_SHARED OPT_SLAVE OPT_PRIVATE
> +%token OPT_UNSHARED
>   %token COLON COMMA NL DDASH
>   %type <strtype> map
>   %type <strtype> options
> @@ -223,6 +225,7 @@ line:
>   	| PATH OPT_SLAVE { master_notify($1); YYABORT; }
>   	| PATH OPT_PRIVATE { master_notify($1); YYABORT; }
>   	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
> +	| PATH OPT_UNSHARED { master_notify($1); YYABORT; }
>   	| PATH OPT_GHOST { master_notify($1); YYABORT; }
>   	| PATH OPT_NOGHOST { master_notify($1); YYABORT; }
>   	| PATH OPT_VERBOSE { master_notify($1); YYABORT; }
> @@ -642,6 +645,7 @@ daemon_option: OPT_TIMEOUT NUMBER { timeout = $2; }
>   	| OPT_SHARED	{ propagation = PROPAGATION_SHARED; }
>   	| OPT_SLAVE	{ propagation = PROPAGATION_SLAVE; }
>   	| OPT_PRIVATE	{ propagation = PROPAGATION_PRIVATE; }
> +	| OPT_UNSHARED  { unshared = 1; }
>   	| OPT_NOBIND	{ nobind = 1; }
>   	| OPT_NOGHOST	{ ghost = 0; }
>   	| OPT_GHOST	{ ghost = 1; }
> @@ -716,6 +720,7 @@ static void local_init_vars(void)
>   	symlnk = 0;
>   	strictexpire = 0;
>   	propagation = PROPAGATION_SLAVE;
> +	unshared = 0;
>   	nobind = 0;
>   	ghost = defaults_get_browse_mode();
>   	random_selection = global_selection_options & MOUNT_FLAG_RANDOM_SELECT;
> @@ -918,6 +923,8 @@ int master_parse_entry(const char *buffer, unsigned int default_timeout, unsigne
>   	entry->ap->flags &= ~(PROPAGATION_MASK);
>   	entry->ap->flags |= propagation;
>   
> +	if (unshared)
> +		entry->ap->flags |= MOUNT_FLAG_UNSHARED;
>   	if (random_selection)
>   		entry->ap->flags |= MOUNT_FLAG_RANDOM_SELECT;
>   	if (use_weight)
> diff --git a/daemon/master_tok.l b/daemon/master_tok.l
> index e2d15bce8b4d..28b34647ecc6 100644
> --- a/daemon/master_tok.l
> +++ b/daemon/master_tok.l
> @@ -437,6 +437,7 @@ MODE		(--mode{OPTWS}|--mode{OPTWS}={OPTWS})
>   	-?shared		{ return(OPT_SHARED); }
>   	-?slave			{ return(OPT_SLAVE); }
>   	-?private		{ return(OPT_PRIVATE); }
> +	-?unshared		{ return(OPT_UNSHARED); }
>   	-?strictexpire		{ return(OPT_STRICTEXPIRE); }
>   	-g|--ghost|-?browse	{ return(OPT_GHOST); }
>   	-v|--verbose		{ return(OPT_VERBOSE); }
> diff --git a/include/automount.h b/include/automount.h
> index 9387ad1b1ce2..32372c5cabce 100644
> --- a/include/automount.h
> +++ b/include/automount.h
> @@ -548,6 +548,12 @@ struct kernel_mod_version {
>   /* Indicator for applications to ignore the mount entry */
>   #define MOUNT_FLAG_IGNORE		0x1000
>   
> +/* The autofs mount must not be shared */
> +#define MOUNT_FLAG_UNSHARED		0x2000
> +
> +/* The bind mount was created first to change propagation */
> +#define MOUNT_FLAG_DID_BIND		0x4000
> +
>   struct autofs_point {
>   	pthread_t thid;
>   	char *path;			/* Mount point name */
> diff --git a/man/auto.master.5.in b/man/auto.master.5.in
> index 167170150292..db907b6bc878 100644
> --- a/man/auto.master.5.in
> +++ b/man/auto.master.5.in
> @@ -221,6 +221,15 @@ since the automount target is itself an (unwanted) automount trigger.
>   This option is an autofs pseudo mount option that can be used in the
>   master map only.
>   .TP
> +.I unshared
> +This option ensures that the auto-mountpoint created is not shared for
> +the purposes of mount propagation.  Marking the mountpoint "private"
> +after it is mounted is not safe for auto-mountpoints as it can leave
> +orphans auto-mountpoints which will causing any tool accessing them to
> +hang.  So automount must ensure the auto-mountpoints are not shared when
> +first mounted.  It does this by creating an internal bind mount at the
> +target mountpoint which has mount propagation disabled.
> +.TP
>   .I "\-r, \-\-random-multimount-selection"
>   Enables the use of random selection when choosing a host from a
>   list of replicated servers. This option is applied to this mount
