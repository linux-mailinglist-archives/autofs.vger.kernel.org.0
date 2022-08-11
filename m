Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4E858F751
	for <lists+autofs@lfdr.de>; Thu, 11 Aug 2022 07:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbiHKFhr (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 11 Aug 2022 01:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbiHKFhq (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 11 Aug 2022 01:37:46 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E998A6D7
        for <autofs@vger.kernel.org>; Wed, 10 Aug 2022 22:37:45 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 5531F5C00FE;
        Thu, 11 Aug 2022 01:37:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 11 Aug 2022 01:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1660196265; x=
        1660282665; bh=uWVGW0SRgbhO2DdhLrH8+/GBxKBwi+V4Xf+rYxVrPfA=; b=y
        11XVmi+EGhPhhVoDTusnHo6KyC7ZAg6686cwaL+w2jOoWXxf5Gtk6ICT2yPHWHBY
        M6iegrJYvqNEC/jWC/j1eeqMN0xjihCUmEk1uE9fdWNgp7xl8MRVtrCyPMzm0lJg
        tyVJjw55r/2cPXWIMb0BphLMQIUS69CV+Dk1CootO47Hf6sF+4UAbgJN4w2D5e/E
        2KNheaW5tZAvqrzBYQ65hICuz617r7XoeN3FXLuySiCwS1ipnpW2+2hO/+++a6U5
        RbRl2bcXfjWEjnFLbv8Yj5wJzDN1A6StLlHPKMRUlII28m6GPx0uCKW9/sYr1XOQ
        IBUy7AUXnNNhO1bBP8roA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; t=1660196265; x=1660282665; bh=u
        WVGW0SRgbhO2DdhLrH8+/GBxKBwi+V4Xf+rYxVrPfA=; b=bk25rssq6ysuBS0Xv
        Zr1FrF3Y5CBBNRAL4ZVfJI4F9PXx1rrAMqcujJQ2Wgph5W4eCwi0lkM/QTo8UHSz
        PcsKfDkAguV/r53xvaJt53aC9lrg+HPQzkQjZHiIy4xwR/ciLpSZS6OBZdx4NjBN
        /yFUdM7M/ptrltg9jaa90bGqjvGY8gJEaievds3VoxFOzXo0KJ1GqoosUwoTQew4
        +dMkA7lxGC2efQaabLEWzaxWh+cNbHRMzbapemek8rsCMqgGplEFnyzZlpx4YlaJ
        660EN6Yrigwdamijby2zgjbtYD5b+998unyr1rMWMXwFCXssDRcCyUA0ZgplzNPF
        J0vAQ==
X-ME-Sender: <xms:qZX0YiwdqhMtIFCSdj-XjqouBX6oA2jRUlARRJLKqfERdKcsehHULw>
    <xme:qZX0YuQPKopcSuLnyQZx2UqNFH0h6GyZqqt_rBXFa2cp3aIZyYN0OsDaLhgvNDL4t
    cxPcIoTxXhm>
X-ME-Received: <xmr:qZX0YkX0v_OpbGwZVHBgTYOcRzSYfwA5yWLZtgZw0t8evetE3NUBqrZdw_IktoL11CeRHLSYPspf-TInX29LecZTsWd45SpANkjzV-fgwhE_xCXqGix9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepgfegkedtvddtgeeilefhteffffeukeeggeehvd
    duleegvdeiieeihfetudehjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:qZX0YohrsIj0BTB9OPt9bJjFPnOSTewe1TlXFmTjISk-x_gLnC7zcw>
    <xmx:qZX0YkC9XQHJV6r_8xkkDQEMuk_CVHP8Kn8AJso2HQOdAdi6x4KAhQ>
    <xmx:qZX0YpKw10QaV1zvFmPP_74Z2-wkfGYSPxlE2G2BtxcnP56F5I9mUg>
    <xmx:qZX0Yj_bAkcMEko2Wgd86Jcr5oJPdekrp7eEZbNic7UHD7id6LWl0w>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Aug 2022 01:37:43 -0400 (EDT)
Message-ID: <4d3d7cd0-6a6a-fade-5eaa-457d4a6de0ef@themaw.net>
Date:   Thu, 11 Aug 2022 13:37:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] autofs-5.1.8 - internal SASL logging only in debug
 log mode
Content-Language: en-US
To:     ThomasReim <reimth@gmail.com>, autofs@vger.kernel.org
References: <20220809115710.108512-1-reimth@gmail.com>
 <20220809115710.108512-4-reimth@gmail.com>
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <20220809115710.108512-4-reimth@gmail.com>
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
> Cyrus SASL library is known for useless error notifications of internal
> events that can and will be easily handled by the applications. By default
> automounter provides a logging callback to the SASL library, which displays
> annoying SASL error messages to users for internal library issues that do
> not harm SASL authentication operation.
>
> OpenLDAP only provides a logging callback to SASL library for its server
> application. Client side applications won't see any internal SASL
> notifcations.
>
> Choose a compromise and provide SASL internal logging messages only if user
> requests debug logging mode.
>
> Signed-off-by: Thomas Reim <reimth@gmail.com>
> ---
>   include/log.h        |  2 ++
>   lib/log.c            | 10 ++++++++++
>   modules/cyrus-sasl.c | 17 +++++++++++++++--
>   3 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/include/log.h b/include/log.h
> index 3ec8f0c..f073300 100644
> --- a/include/log.h
> +++ b/include/log.h
> @@ -37,6 +37,8 @@ extern void set_log_verbose_ap(struct autofs_point *ap);
>   extern void set_log_debug_ap(struct autofs_point *ap);
>   extern void set_mnt_logging(unsigned global_logopt);
>   
> +extern unsigned int have_log_verbose(void);
> +extern unsigned int have_log_debug(void);
>   extern int get_log_debug_level(void);
>   
>   extern void open_log(void);
> diff --git a/lib/log.c b/lib/log.c
> index 9567460..1c5b3da 100644
> --- a/lib/log.c
> +++ b/lib/log.c
> @@ -58,6 +58,16 @@ static char *prepare_attempt_prefix(const char *msg)
>   	return prefixed_msg;
>   }
>   
> +unsigned int have_log_verbose(void)
> +{
> +	return do_verbose;
> +}
> +
> +unsigned int have_log_debug(void)
> +{
> +	return do_debug;
> +}
> +
>   int get_log_debug_level(void)
>   {
>   	return debug_level;
> diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
> index 8984f0f..9059b54 100644
> --- a/modules/cyrus-sasl.c
> +++ b/modules/cyrus-sasl.c
> @@ -109,6 +109,13 @@ static int getpass_func(sasl_conn_t *, void *, int, sasl_secret_t **);
>   static int getuser_func(void *, int, const char **, unsigned *);
>   
>   static sasl_callback_t callbacks[] = {
> +	{ SASL_CB_USER, &getuser_func, NULL },
> +	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
> +	{ SASL_CB_PASS, &getpass_func, NULL },
> +	{ SASL_CB_LIST_END, NULL, NULL },
> +};
> +
> +static sasl_callback_t debug_callbacks[] = {
>   	{ SASL_CB_LOG, &sasl_log_func, NULL },
>   	{ SASL_CB_USER, &getuser_func, NULL },
>   	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
> @@ -136,7 +143,7 @@ sasl_log_func(void *context, int level, const char *message)
>   	case SASL_LOG_DEBUG:
>   	case SASL_LOG_TRACE:
>   	case SASL_LOG_PASS:
> -		debug(LOGOPT_NONE, "%s", message);
> +		log_debug(LOGOPT_NONE, "libsasl2: %s", message);
>   		break;
>   	default:
>   		break;
> @@ -1243,6 +1250,7 @@ static void sasl_mutex_dispose(void *mutex __attribute__((unused)))
>    */
>   int autofs_sasl_client_init(unsigned logopt)
>   {
> +	int result;
>   
>   	sasl_set_mutex(sasl_mutex_new,
>   		       sasl_mutex_lock,
> @@ -1250,7 +1258,12 @@ int autofs_sasl_client_init(unsigned logopt)
>   		       sasl_mutex_dispose);
>   
>   	/* Start up Cyrus SASL--only needs to be done at library load. */
> -	if (sasl_client_init(callbacks) != SASL_OK) {
> +	if (have_log_debug()) {
> +		result = sasl_client_init(debug_callbacks);
> +	} else {
> +		result = sasl_client_init(callbacks);
> +	}

And again, ;(


Ian

> +	if (result != SASL_OK) {
>   		error(logopt, "sasl_client_init failed");
>   		return 0;
>   	}
