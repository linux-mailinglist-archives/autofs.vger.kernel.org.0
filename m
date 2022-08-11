Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8A658F72F
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 07:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiHKFHC (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 11 Aug 2022 01:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbiHKFHB (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 11 Aug 2022 01:07:01 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9AE74E3E
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 22:07:00 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0D9395C0159;
        Thu, 11 Aug 2022 01:07:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 11 Aug 2022 01:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660194420; x=
        1660280820; bh=YtVfwEUUhGT6kjrefq/WdHjQFVLkeSHTDA3QHymVsq8=; b=g
        4NVm4OG+M8EvAUgHL5oCOVf9jOx9/RH55rIGdS7LoSq5v7hq+OiBkSDuT3FZEyuC
        KWQbnAUs2iZjx/j9rRfIPExAqiCgrcmrb5XKO+128RzzupT/MSvgRmJCmuQ269aP
        i67Y/XqeRrotuMOYqHH1NQx9OPeVgoo1SKErQzcOu8vAQ1fopf2th/NNYWWEPVrh
        wKXoNusOyVpG3JsPFDecmLRuwdGSUKZPS/tav59C89F2tYBfq+V/JcMTusYpGG1q
        Y6quKfxDhdk85/u2mnOTk62nFmAXfdHYaaruj55nfF18ThZt3sC7f9EUvlc9zfIC
        VuUW8N+GqD6f/qU5gX3/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660194420; x=1660280820; bh=Y
        tVfwEUUhGT6kjrefq/WdHjQFVLkeSHTDA3QHymVsq8=; b=dSKH/Cn9FnwpJK11H
        mDH3hTecvxVNVit/Dcr9EQISjL4p7vo2hTIk1tOQ9e8O5Cmh66DDVyAY23puDoO9
        00pbyEplHnpklBfSEI7fMQ54hWUoXWjnT2ariJqNaJgpVLdO5wCWnKyp01yDDWqD
        ec7NvSDYL1d+nBRK4VXcqMig/IdR4/rpUlRAXQ26Aq+SdSUxnBPpbciDq5qNSSHD
        MiNhQB2HjnOTgmexneeokGl7EmgL1f0kDdSZktZI6wAVGKQSy4XnbgdtVPrl53tf
        rKxNiEBlxGJ+QENcUjqQJWoQHDFKUaqDaEl/iEzCGmH4uIROyJ+3lcav1FSTuAm+
        ysS5w==
X-ME-Sender: <xms:c470YrF3STsyiLxPCLVof9hbBbUxWWALDKj39ZGKdnnolcNJsmH3Ig>
    <xme:c470YoUY81wwhbgFjx5H2dCgHySgt3sqAjp58Fab2R7ByOwl_G74M345cTwmuweRJ
    E_msn9IbgWY>
X-ME-Received: <xmr:c470YtJGheMxTdBKy-21kS8aUNMfMINrLdriJokmouIM4ObLf4sL190gNHjbX6QHef-Y5bIbLhc2baGhXYn8njxca-uyA0l_wAG-NbBQ9rpcv3-ov4tV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:c470YpE_20fwikcraDnwjnwJHUTr8CkzZvmxLl-dbqzedVQXeEaQXQ>
    <xmx:c470YhUbZidF3yoFjCxYTlkp-PsD01PcfXxmn_pC-VipRu8lnCu0tQ>
    <xmx:c470YkMCETGBsyEFrQDRMDKaqICZyoeN22xw8G-DGH2a5OrxYWP2pw>
    <xmx:dI70YgD3jY2IyLw_pxbdGH1CBWc-c0_oQ_lqdqUAm1UsKpYFvOvI-A>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Aug 2022 01:06:57 -0400 (EDT)
Message-ID: <53512a12-f121-db42-80f4-177bdcb5c3d3@themaw.net>
Date:   Thu, 11 Aug 2022 13:06:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] autofs-5.1.8 - improve debug logging of LDAP binds
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115710.108512-1-reimth@gmail.com>
 <20220809115710.108512-2-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115710.108512-2-reimth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


On 9/8/22 19:57, ThomasReim wrote:
> From: Thomas Reim <reimth@gmail.com>
>
> automounter only provides very limited debug information when binding
> using OpenLDAP. LDAP based directory services currently all increase
> communication security, which makes it difficult for system administrators
> to find the root cause of failed authentication binds.
>
> Allow users to switch on and configure debug logging for OpenLDAP client
> used by automount.
>
> Signed-off-by: Thomas Reim <reimth@gmail.com>

Looks good.


Ian

> ---
>   daemon/automount.c    | 31 ++++++++++++++++++++++++++-----
>   include/log.h         |  4 +++-
>   lib/log.c             |  9 ++++++++-
>   man/automount.8       |  9 +++++++--
>   modules/lookup_ldap.c | 37 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 81 insertions(+), 9 deletions(-)
>
> diff --git a/daemon/automount.c b/daemon/automount.c
> index 32f95a5..ce79078 100644
> --- a/daemon/automount.c
> +++ b/daemon/automount.c
> @@ -1413,6 +1413,21 @@ static unsigned long getnumopt(char *str, char option)
>   	return val;
>   }
>   
> +static long getsnumopt(char *str, char option)
> +{
> +	long val;
> +	char *end;
> +
> +	val = strtol(str, &end, 0);
> +	if (!*str || *end) {
> +		fprintf(stderr,
> +			"%s: option -%c requires a numeric argument, got %s\n",
> +			program, option, str);
> +		exit(1);
> +	}
> +	return val;
> +}
> +
>   static void do_master_cleanup_unlock(void *arg)
>   {
>   	int status;
> @@ -2017,7 +2032,9 @@ static void usage(void)
>   	        "			maximum wait time (seconds) for master\n"
>   	        "			map to become available\n"
>   		"	-v --verbose	be verbose\n"
> -		"	-d --debug	log debuging info\n"
> +		"	-d[level]\n"
> +		"	--debug[=level]\n"
> +		"			log debugging info\n"
>   		"	-Dvariable=value, --define variable=value\n"
>   		"			define global macro variable\n"
>   		"	-S --systemd-service\n"
> @@ -2282,18 +2299,19 @@ int main(int argc, char *argv[])
>   	int logpri = -1;
>   	unsigned int flags;
>   	unsigned int logging;
> +	int debug_level = 0;
>   	unsigned master_read;
>   	int master_wait;
>   	time_t timeout;
>   	time_t age = monotonic_time(NULL);
>   	struct rlimit rlim;
> -	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFUM:";
> +	const char *options = "+hp:t:vmd::D:SfVrO:l:n:CFUM:";
>   	static const struct option long_options[] = {
>   		{"help", 0, 0, 'h'},
>   		{"pid-file", 1, 0, 'p'},
>   		{"timeout", 1, 0, 't'},
>   		{"verbose", 0, 0, 'v'},
> -		{"debug", 0, 0, 'd'},
> +		{"debug", 2, 0, 'd'},
>   		{"define", 1, 0, 'D'},
>   		{"systemd-service", 0, 0, 'S'},
>   		{"foreground", 0, 0, 'f'},
> @@ -2363,6 +2381,8 @@ int main(int argc, char *argv[])
>   
>   		case 'd':
>   			logging |= LOGOPT_DEBUG;
> +			if (optarg)
> +				debug_level = getsnumopt(optarg, opt);
>   			break;
>   
>   		case 'D':
> @@ -2439,7 +2459,8 @@ int main(int argc, char *argv[])
>   
>   		case '?':
>   		case ':':
> -			printf("%s: Ambiguous or unknown options\n", program);
> +			fprintf(stderr, "%s: Ambiguous or unknown options\n", program);
> +			fprintf(stderr, "Try `%s --help` for more information\n", program);
>   			exit(1);
>   		}
>   	}
> @@ -2448,7 +2469,7 @@ int main(int argc, char *argv[])
>   		set_log_verbose();
>   
>   	if (logging & LOGOPT_DEBUG)
> -		set_log_debug();
> +		set_log_debug(debug_level);
>   
>   	if (geteuid() != 0) {
>   		fprintf(stderr, "%s: this program must be run by root.\n",
> diff --git a/include/log.h b/include/log.h
> index a7b09f9..3ec8f0c 100644
> --- a/include/log.h
> +++ b/include/log.h
> @@ -31,12 +31,14 @@ struct autofs_point;
>   
>   extern void set_log_norm(void);
>   extern void set_log_verbose(void);
> -extern void set_log_debug(void);
> +extern void set_log_debug(int level);
>   extern void set_log_norm_ap(struct autofs_point *ap);
>   extern void set_log_verbose_ap(struct autofs_point *ap);
>   extern void set_log_debug_ap(struct autofs_point *ap);
>   extern void set_mnt_logging(unsigned global_logopt);
>   
> +extern int get_log_debug_level(void);
> +
>   extern void open_log(void);
>   extern void log_to_stderr(void);
>    
> diff --git a/lib/log.c b/lib/log.c
> index 43eccc0..9567460 100644
> --- a/lib/log.c
> +++ b/lib/log.c
> @@ -31,6 +31,7 @@ static unsigned int logging_to_syslog = 0;
>   /* log notification level */
>   static unsigned int do_verbose = 0;		/* Verbose feedback option */
>   static unsigned int do_debug = 0;		/* Full debug output */
> +static unsigned int debug_level = 0;		/* Level for libldap debug output */
>   
>   static char *prepare_attempt_prefix(const char *msg)
>   {
> @@ -57,6 +58,11 @@ static char *prepare_attempt_prefix(const char *msg)
>   	return prefixed_msg;
>   }
>   
> +int get_log_debug_level(void)
> +{
> +	return debug_level;
> +}
> +
>   void set_log_norm(void)
>   {
>   	do_verbose = 0;
> @@ -70,9 +76,10 @@ void set_log_verbose(void)
>   	return;
>   }
>   
> -void set_log_debug(void)
> +void set_log_debug(int level)
>   {
>   	do_debug = 1;
> +	debug_level = level;
>   	return;
>   }
>   
> diff --git a/man/automount.8 b/man/automount.8
> index 1061c9d..2d2b56f 100644
> --- a/man/automount.8
> +++ b/man/automount.8
> @@ -48,9 +48,14 @@ Set the default timeout for caching failed key lookups. The default is 60 second
>   Enables logging of general status and progress messages for all
>   autofs managed mounts.
>   .TP
> -.I "\-d, \-\-debug"
> +\fB\-d\fR[\fILEVEL\fR], \fB\-\-debug\fR[=\fILEVEL\fR]
>   Enables logging of general status and progress messages as well as
> -debugging messages for all autofs managed mounts.
> +debugging messages for all autofs managed mounts. The default \fILEVEL\fR is 0.
> +automounter must perform OpenLDAP authenticated binds for optional argument
> +\fILEVEL\fR to have any effect. OpenLDAP uses a bitmap to enable debugging for
> +specific components. Debug \fILEVEL\fR=0 disables libldap deugging.
> +For further details see
> +.BR slapd (8).
>   .TP
>   .I "\-Dvariable=value, --define variable=value"
>   Define a global macro substitution variable. Global definitions
> diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
> index 14589c3..df9376e 100644
> --- a/modules/lookup_ldap.c
> +++ b/modules/lookup_ldap.c
> @@ -155,6 +155,18 @@ int ldap_parse_page_control(LDAP *ldap, LDAPControl **controls,
>   }
>   #endif /* HAVE_LDAP_PARSE_PAGE_CONTROL */
>   
> +static void autofs_ldap_debug(const char *buf)
> +{
> +	char *msg;
> +
> +	if (buf) {
> +		msg = strdup(buf);
> +		msg[strcspn(msg, "\n")] = '\0';
> +		log_debug(LOGOPT_DEBUG, "libldap: %s", msg);
> +		free(msg);
> +	}
> +}
> +
>   static void ldapinit_mutex_lock(void)
>   {
>   	int status = pthread_mutex_lock(&ldapinit_mutex);
> @@ -259,11 +271,36 @@ LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct lookup_conte
>   	LDAP *ldap = NULL;
>   	struct timeval timeout     = { ctxt->timeout, 0 };
>   	struct timeval net_timeout = { ctxt->network_timeout, 0 };
> +	int ldap_library_debug_level;
>   	int rv;
>   
>   	ctxt->version = 3;
>   
> +	ldap_library_debug_level = get_log_debug_level();
> +	if (ldap_library_debug_level == -1 || ldap_library_debug_level > 0) {
> +		rv = ber_set_option(NULL, LBER_OPT_DEBUG_LEVEL,
> +		                    &ldap_library_debug_level);
> +		if (rv != LBER_OPT_SUCCESS)
> +			info(logopt, MODPREFIX
> +			     "failed to set LBER debug level to %d, ignored",
> +			     ldap_library_debug_level);
> +		rv = ber_set_option(NULL, LBER_OPT_LOG_PRINT_FN,
> +		                    autofs_ldap_debug);
> +		if (rv != LBER_OPT_SUCCESS)
> +			info(logopt, MODPREFIX
> +			     "Failed to set LBER_OPT_LOG_PRINT_FN, ignored");
> +		rv = ldap_set_option(NULL, LDAP_OPT_DEBUG_LEVEL,
> +		                     &ldap_library_debug_level);
> +		if (rv != LDAP_OPT_SUCCESS)
> +			info(logopt, MODPREFIX
> +			     "failed to set LDAP debug level to %d, ignored",
> +			     ldap_library_debug_level);
> +	}
> +
>   	/* Initialize the LDAP context. */
> +	debug(logopt, MODPREFIX
> +	      "ldap_initialize( %s )",
> +	      uri ? uri : "default");
>   	rv = ldap_initialize(&ldap, uri);
>   	if (rv != LDAP_OPT_SUCCESS) {
>   		info(logopt, MODPREFIX
