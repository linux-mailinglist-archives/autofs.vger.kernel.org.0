Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96CC6C3F70
	for <lists+autofs@lfdr.de>; Wed, 22 Mar 2023 02:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCVBLn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 21 Mar 2023 21:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCVBLn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 21 Mar 2023 21:11:43 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BCD1BAC3
        for <autofs@vger.kernel.org>; Tue, 21 Mar 2023 18:11:41 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id C3B4F5C00F9;
        Tue, 21 Mar 2023 21:11:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 21:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1679447500; x=1679533900; bh=lSBRfWwtFkfFx67ULMcxJibcdIUcir7ZZ5I
        7gsg7494=; b=T0m9VeFcD+rPh7cyS1jdiv8efOml1YQw8ensmT5x0NnZE5DheDY
        RIx1tYXGaKtsmTddkXcgpiZRcSAsIZCc+vIrOl80fsAYiF7tO9zwxqZHnUvO/j5j
        eOAaLhecu9Vooe/dyoNDFFyKg1pZZU4BVHzJz0H5aOOaArFyBYxJs+y2OkxMs6tk
        qtAQZ6eeKanzgFDnHVVF2FABTBYJtvdtfXHL1ry89Qxyo50KTX76nG4lmnZtGfti
        eBiqOTOxNyzEmyTdakKoMLfDGHR+ruNOpVg/ygXjaYuq1L7y6+oFgFuN3zz1TqWh
        /yQg/4u97dgvpo0DgXUgJgZ6Xyb8Igj/MWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679447500; x=1679533900; bh=lSBRfWwtFkfFx67ULMcxJibcdIUcir7ZZ5I
        7gsg7494=; b=bzZx10E5YNDjJxerrL7wUnNISw+utieHzOqSylyz3AzEJrD1PKk
        RR/klrOs81qbUtMmK51jXhObsF9YTqZUUpAGh4cdVhohOaBz7mGm/BCGA2SN/1o+
        AvQMInzV8OvB/83IVhCpJD2JS/wb+WOnI7w4dMhUX0bZG/5HCu/kmPSOwO5HpYV/
        U+g5LMT2J/tg7FxOeXhYHdeAyNyaCRuHyWNAwaaUaUvs6hHa2ohBuoi0OK/aq5XH
        8WOgsTcOiBr3JBOn3kpgLrskWmKthk2pFiPEuzV5h6m2gwhDmzwlQ9voRxBfb/ol
        XOAEqIc1s4ZKyyGUoocKCY2glVi95s0u6JQ==
X-ME-Sender: <xms:zFUaZJB-ooygFmfV02tRyd3K7AZ5A1ukyfw-2Hzw0r_HHsKundBmnQ>
    <xme:zFUaZHhfm7MciBdYL63VrppZJ9ooDGU4kW_7vgamLe6h0HWwoZQSJzdr3d_r3Kdvk
    QKl7GqwTMqL>
X-ME-Received: <xmr:zFUaZEnO7Rrja0LL3SY9KTVS8YBRLgAb07Trr8yc65T0YKr8OKkQMwgrBB3Be2dW1b_6lCDTaeg-xK0gnmn3aKChzZ4miNvpZicOSI3phD-PbiSahJXe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeguddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeevleffleefjeefgeeitdehleektdegfedvve
    ethffhleeigeffgfeijefftdegkeenucffohhmrghinhepthhokhdrlhgsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvg
    hmrgifrdhnvght
X-ME-Proxy: <xmx:zFUaZDzXxdzzHy1HkWgzsIZ-USeiqV2_MYzap1lr0eNGpNOEoSTXRA>
    <xmx:zFUaZORQMG8J-Ht-P6Uhk1YkLYh3_FwKS56STmkFERvNeDHEhc447Q>
    <xmx:zFUaZGblVYvhTtjCRtcKFREc3LnXTx9o0eDypGvyWL4wM0YTcKS69g>
    <xmx:zFUaZFMJb2sUY5etEsJKO4hN7MpxiNp1zfK2-u4bCoJwrsXxoyod4w>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 21:11:39 -0400 (EDT)
Message-ID: <6de3cfaa-10ba-b350-960e-a21577db6dba@themaw.net>
Date:   Wed, 22 Mar 2023 09:11:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] autofs-5.1.8 - add "unshared" option to disable mount
 propagation.
Content-Language: en-US
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167928279599.8008.18190549797975624979@noble.neil.brown.name>
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
>
> Sometimes it is useful for an autofs mount to be "private" for mount
> propagation.  For example, this allows submounts to be moved off with
> "mount --move" - such movement is not permitted for shared mounts.
>
> Changing the autofs mount point to "private" with "mount --make-private"
> after the automount daemon has started can be problematic.  If the
> mount point is already shared there will be another copy that will never
> get acted on by automount and so tools accessing it can hang.
>
> So to safely achieve non-shared auto-mountpoints we need to create a
> transparent bind mount at the mount point, mark it as private, then
> mount the autofs mount there.
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

I think I have a bug here and you've been caught by it.


Not considering the directory created flag, that if clause above

says "if it's an indirect mount and it's not a submount" but below

there's an extra mount for both indirect and direct mounts. Looks

like it leaks direct mounts. I think I might require direct mount

point directories to already exist, so maybe it's not a bug before

the change here, I'd need to check.


Now direct mounts do need to be distinct (no nesting is allowed)

so that should be fine but we frequently see direct mount maps

with several hundred or less frequently several thousand map

entries and occasionally many more. So making each one consume 2

mounts is probably not such a good idea. Although it does require

a mount option so maybe it's ok.


Ian

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
