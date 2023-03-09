Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76C36B1A56
	for <lists+autofs@lfdr.de>; Thu,  9 Mar 2023 05:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjCIEL1 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 8 Mar 2023 23:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjCIELP (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 8 Mar 2023 23:11:15 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F5AD3081
        for <autofs@vger.kernel.org>; Wed,  8 Mar 2023 20:11:13 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 262B85C0093;
        Wed,  8 Mar 2023 23:11:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 08 Mar 2023 23:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1678335069; x=1678421469; bh=/k9Dh0X8vL6YLZH5RN8PEpr8V/avFb93pV7
        2/gIcfko=; b=O4ZkOxpiKNdBNt1PugH5aYvaAqAyNt4IuxlPT+Gh5OrC6pePd54
        61MqWe7HUuKtHD/dLrkpvZfA8JSennJlCcQEUbzzrdNQ0SjEn/7Qm3qxNta/zjUU
        ndJ1ZBCsqwWb6eU1OsezyFYuOwqNza6mMXa4dXu10HCwPnMXrweVMlsqEf1XEyzW
        /kvsYSnvJkukP2cz0VHoWEvz/9GeXjXwx7YaFkI486sagosxx4vnPB51X96wBopF
        ppssJ+ELS+rRRnhnh4iVpitSEw6izwwGSJFgIiqBZl+JahwfwMinxoYmtS76Woc2
        3CEEsP76tweF+OgSFFU2sxy57HhE5db+cbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1678335069; x=1678421469; bh=/k9Dh0X8vL6YLZH5RN8PEpr8V/avFb93pV7
        2/gIcfko=; b=MGOKuyRyMLJQ/YzLSBW3SyEgA1RuNXrjAkVdwOybTuP+KJ4CQFq
        iKJrLxARpVDQi0/eG0sjr4v+eLEh3ELBQP2heV46YRU6S0VAxZKhs8jJXiWqlQTC
        mP0YBSyTBRLVr/v7YubgQAVssouWxNOrD/FGTRSOo9ESdDyznmzj+dz2nclohz7P
        QzWDlAWVY6ofrDb9B2Cq8q2TdaRYSMuEIqBoo9xyrWdMOXRRsMP8Dic1xy7MnYm5
        3r3EtjcVLfgUjRg1o8K7D4OgrDjo8OdgVcbZysC3TnCYAwDUn2B77+1F7/NX7lHo
        rCFSNzfCUX2wynLMfi0S8o64EeYOL9ecUjQ==
X-ME-Sender: <xms:XFwJZLeZ4CmOx5zJ3Ro6mCDTc_lLiJvbwMbjFhQB2dB83VFi09PLtg>
    <xme:XFwJZBP5ZU0kU9fbyOtJL3XP8rQBcq23ITyzSNhuZVClyH3Xyxf7u2m6VCset4R2M
    4WV7QA2EEch>
X-ME-Received: <xmr:XFwJZEh3FqHtnZpyNhHHs_7L-or1_jjy8rX7VciskcAe7ZKND4xRa7jZSTztXlC2g2gTZyPK0xQPcU7WYtSC900TFhcv-FprBKdSmUvUfdwSnR-xJO6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesth
    ejredttdefjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpeevleffleefjeefgeeitdehleektdegfedvve
    ethffhleeigeffgfeijefftdegkeenucffohhmrghinhepthhokhdrlhgsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvg
    hmrgifrdhnvght
X-ME-Proxy: <xmx:XFwJZM_l_nDkPRcnAye7gEeDxcyTzhNZSA-JGMVzjfgsjAeZShjLKg>
    <xmx:XFwJZHuXF7hX4xstF8d8QUqewFGbX_ROqfcmDp92q0mHaNCPRzEXBQ>
    <xmx:XFwJZLGdbmTrxBwlBs9MVpThUIJRL37tplEzD4iH-1m74zgEbu6e5Q>
    <xmx:XVwJZE4bW4xarDdHRcp0KmRBogSDXfMVLHYFgmil5WNd_eAvN1wh7Q>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 23:11:07 -0500 (EST)
Message-ID: <01bca36d-54c6-f26a-56fb-3955332f9c70@themaw.net>
Date:   Thu, 9 Mar 2023 12:11:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH/RFC] autofs-5.1.8 - support setting mount propagation for
 autofs mount point.
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
References: <167825473018.8008.14797686282321546235@noble.neil.brown.name>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <167825473018.8008.14797686282321546235@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 8/3/23 13:52, NeilBrown wrote:
> New flags in the master map:
>    autofsshared
>    autofsprivate
>    autofsslave
>
> cause the corresponding mount propagation flags to be set on the autofs
> mount point.  If none are specified the current behaviour of inheriting
> from the parent unchanged.
>
> For example specify "autofsprivate" allows mount points to be moved
> away from autofs using "mount -M .....".  This is not supported by the
> kernel for the normal default of "shared".
>
> Better flag names should be chosen.  I would have liked to use "shared",
> "private", and "slave", but they are already in use and only affect bind
> mounts.

Looks fine, I'll add it to my patch queue, can't say when I'll commit

them though. If you need it committed sooner let me know.


This takes things a bit further than I had.

May I ask, what was the motivation for adding this?


Ian

>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>   daemon/direct.c       | 18 ++++++++++++++++++
>   daemon/indirect.c     | 18 ++++++++++++++++++
>   daemon/master_parse.y | 20 ++++++++++++++++++++
>   daemon/master_tok.l   |  3 +++
>   include/automount.h   |  5 +++++
>   man/auto.master.5.in  |  9 +++++++++
>   6 files changed, 73 insertions(+)
>
> diff --git a/daemon/direct.c b/daemon/direct.c
> index 316ffd781762..c11e27816990 100644
> --- a/daemon/direct.c
> +++ b/daemon/direct.c
> @@ -285,6 +285,7 @@ int do_mount_autofs_direct(struct autofs_point *ap,
>   	int status, ret, ioctlfd;
>   	const char *map_name;
>   	time_t runfreq;
> +	int flags;
>   	int err;
>   
>   	if (timeout) {
> @@ -406,6 +407,23 @@ int do_mount_autofs_direct(struct autofs_point *ap,
>   		goto out_err;
>   	}
>   
> +	flags = 0;
> +	if (ap->flags & MOUNT_FLAG_AUTOFS_PRIVATE)
> +		flags = MS_PRIVATE;
> +	if (ap->flags & MOUNT_FLAG_AUTOFS_SHARED)
> +		flags = MS_SHARED;
> +	if (ap->flags & MOUNT_FLAG_AUTOFS_SLAVE)
> +		flags = MS_SLAVE;
> +	if (flags) {
> +		ret = mount(NULL, me->key, NULL, flags, NULL);
> +		if (ret == -1) {
> +			error(ap->logopt,
> +			      "failed to set mount propagatoin %s",
> +			      me->key);
> +			goto out_umount;
> +		}
> +	}
> +
>   	ret = stat(me->key, &st);
>   	if (ret == -1) {
>   		error(ap->logopt,
> diff --git a/daemon/indirect.c b/daemon/indirect.c
> index 23ef9f41398d..f521c66ba109 100644
> --- a/daemon/indirect.c
> +++ b/daemon/indirect.c
> @@ -50,6 +50,7 @@ static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
>   	const char *map_name = hosts_map_name;
>   	const char *type;
>   	struct stat st;
> +	int flags;
>   	int ret;
>   	int err;
>   
> @@ -118,6 +119,23 @@ static int do_mount_autofs_indirect(struct autofs_point *ap, const char *root)
>   	free(options);
>   	options = NULL;
>   
> +	flags = 0;
> +	if (ap->flags & MOUNT_FLAG_AUTOFS_PRIVATE)
> +		flags = MS_PRIVATE;
> +	if (ap->flags & MOUNT_FLAG_AUTOFS_SHARED)
> +		flags = MS_SHARED;
> +	if (ap->flags & MOUNT_FLAG_AUTOFS_SLAVE)
> +		flags = MS_SLAVE;
> +	if (flags) {
> +		ret = mount(NULL, root, NULL, flags, NULL);
> +		if (ret == -1) {
> +			error(ap->logopt,
> +			      "failed to set mount propagatoin %s",
> +			      ap->path);
> +			goto out_umount;
> +		}
> +	}
> +
>   	ret = stat(root, &st);
>   	if (ret == -1) {
>   		crit(ap->logopt,
> diff --git a/daemon/master_parse.y b/daemon/master_parse.y
> index 469cfe9765ac..0b4ac6117390 100644
> --- a/daemon/master_parse.y
> +++ b/daemon/master_parse.y
> @@ -72,6 +72,7 @@ static int tmp_argc;
>   static char **local_argv;
>   static int local_argc;
>   
> +/* Propagation flags for bind mounts */
>   #define PROPAGATION_SHARED	MOUNT_FLAG_SHARED
>   #define PROPAGATION_SLAVE	MOUNT_FLAG_SLAVE
>   #define PROPAGATION_PRIVATE	MOUNT_FLAG_PRIVATE
> @@ -80,6 +81,15 @@ static int local_argc;
>   				 MOUNT_FLAG_PRIVATE)
>   static unsigned int propagation;
>   
> +/* Propagation flags for autofs mount points */
> +#define PROPAGATION_AUTOFS_SHARED	MOUNT_FLAG_AUTOFS_SHARED
> +#define PROPAGATION_AUTOFS_SLAVE	MOUNT_FLAG_AUTOFS_SLAVE
> +#define PROPAGATION_AUTOFS_PRIVATE	MOUNT_FLAG_AUTOFS_PRIVATE
> +#define PROPAGATION_AUTOFS_MASK		(MOUNT_FLAG_AUTOFS_SHARED | \
> +					 MOUNT_FLAG_AUTOFS_SLAVE | \
> +					 MOUNT_FLAG_AUTOFS_PRIVATE)
> +static unsigned int autofs_propagation;
> +
>   static char errstr[MAX_ERR_LEN];
>   static int errlen;
>   
> @@ -116,6 +126,7 @@ static int master_fprintf(FILE *, char *, ...);
>   %token OPT_TIMEOUT OPT_NTIMEOUT OPT_PTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VERBOSE
>   %token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK OPT_MODE
>   %token OPT_STRICTEXPIRE OPT_SHARED OPT_SLAVE OPT_PRIVATE
> +%token OPT_AUTOFS_SHARED OPT_AUTOFS_SLAVE OPT_AUTOFS_PRIVATE
>   %token COLON COMMA NL DDASH
>   %type <strtype> map
>   %type <strtype> options
> @@ -222,6 +233,9 @@ line:
>   	| PATH OPT_SHARED { master_notify($1); YYABORT; }
>   	| PATH OPT_SLAVE { master_notify($1); YYABORT; }
>   	| PATH OPT_PRIVATE { master_notify($1); YYABORT; }
> +	| PATH OPT_AUTOFS_SHARED { master_notify($1); YYABORT; }
> +	| PATH OPT_AUTOFS_SLAVE { master_notify($1); YYABORT; }
> +	| PATH OPT_AUTOFS_PRIVATE { master_notify($1); YYABORT; }
>   	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
>   	| PATH OPT_GHOST { master_notify($1); YYABORT; }
>   	| PATH OPT_NOGHOST { master_notify($1); YYABORT; }
> @@ -642,6 +656,9 @@ daemon_option: OPT_TIMEOUT NUMBER { timeout = $2; }
>   	| OPT_SHARED	{ propagation = PROPAGATION_SHARED; }
>   	| OPT_SLAVE	{ propagation = PROPAGATION_SLAVE; }
>   	| OPT_PRIVATE	{ propagation = PROPAGATION_PRIVATE; }
> +	| OPT_AUTOFS_SHARED { autofs_propagation = PROPAGATION_AUTOFS_SHARED; }
> +	| OPT_AUTOFS_SLAVE { autofs_propagation = PROPAGATION_AUTOFS_SLAVE; }
> +	| OPT_AUTOFS_PRIVATE { autofs_propagation = PROPAGATION_AUTOFS_PRIVATE; }
>   	| OPT_NOBIND	{ nobind = 1; }
>   	| OPT_NOGHOST	{ ghost = 0; }
>   	| OPT_GHOST	{ ghost = 1; }
> @@ -716,6 +733,7 @@ static void local_init_vars(void)
>   	symlnk = 0;
>   	strictexpire = 0;
>   	propagation = PROPAGATION_SLAVE;
> +	autofs_propagation = 0;
>   	nobind = 0;
>   	ghost = defaults_get_browse_mode();
>   	random_selection = global_selection_options & MOUNT_FLAG_RANDOM_SELECT;
> @@ -917,6 +935,8 @@ int master_parse_entry(const char *buffer, unsigned int default_timeout, unsigne
>   	}
>   	entry->ap->flags &= ~(PROPAGATION_MASK);
>   	entry->ap->flags |= propagation;
> +	entry->ap->flags &= ~(PROPAGATION_AUTOFS_MASK);
> +	entry->ap->flags |= autofs_propagation;
>   
>   	if (random_selection)
>   		entry->ap->flags |= MOUNT_FLAG_RANDOM_SELECT;
> diff --git a/daemon/master_tok.l b/daemon/master_tok.l
> index e2d15bce8b4d..e995f96d0df9 100644
> --- a/daemon/master_tok.l
> +++ b/daemon/master_tok.l
> @@ -437,6 +437,9 @@ MODE		(--mode{OPTWS}|--mode{OPTWS}={OPTWS})
>   	-?shared		{ return(OPT_SHARED); }
>   	-?slave			{ return(OPT_SLAVE); }
>   	-?private		{ return(OPT_PRIVATE); }
> +	-?autofsshared		{ return(OPT_AUTOFS_SHARED); }
> +	-?autofsslave		{ return(OPT_AUTOFS_SLAVE); }
> +	-?autofsprivate		{ return(OPT_AUTOFS_PRIVATE); }
>   	-?strictexpire		{ return(OPT_STRICTEXPIRE); }
>   	-g|--ghost|-?browse	{ return(OPT_GHOST); }
>   	-v|--verbose		{ return(OPT_VERBOSE); }
> diff --git a/include/automount.h b/include/automount.h
> index 9387ad1b1ce2..142c6ecb36cc 100644
> --- a/include/automount.h
> +++ b/include/automount.h
> @@ -548,6 +548,11 @@ struct kernel_mod_version {
>   /* Indicator for applications to ignore the mount entry */
>   #define MOUNT_FLAG_IGNORE		0x1000
>   
> +/* Propagation flag to be used on the autofs mount point */
> +#define MOUNT_FLAG_AUTOFS_SHARED	0x2000
> +#define MOUNT_FLAG_AUTOFS_SLAVE		0x4000
> +#define MOUNT_FLAG_AUTOFS_PRIVATE	0x8000
> +
>   struct autofs_point {
>   	pthread_t thid;
>   	char *path;			/* Mount point name */
> diff --git a/man/auto.master.5.in b/man/auto.master.5.in
> index 167170150292..343a78470d8c 100644
> --- a/man/auto.master.5.in
> +++ b/man/auto.master.5.in
> @@ -221,6 +221,15 @@ since the automount target is itself an (unwanted) automount trigger.
>   This option is an autofs pseudo mount option that can be used in the
>   master map only.
>   .TP
> +.I autofsslave\fP, \fIautofsprivate\fP, or \fIautofsshared\fP
> +These options allow mount propagation of the automount point
> +itself to be set to one of \fIslave\fP, \fIprivate\fP, or
> +\fIshared\fP.  This will be inherited by whatever is mounted there.
> +If none are specified the propagation of the automount point
> +will be inherted from its parent.
> +This option is an autofs pseudo mount option that can be used in the
> +master map only.
> +.TP
>   .I "\-r, \-\-random-multimount-selection"
>   Enables the use of random selection when choosing a host from a
>   list of replicated servers. This option is applied to this mount
