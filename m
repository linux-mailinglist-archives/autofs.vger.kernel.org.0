Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683DE30DEA3
	for <lists+autofs@lfdr.de>; Wed,  3 Feb 2021 16:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbhBCPtV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 3 Feb 2021 10:49:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:41990 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233001AbhBCPsy (ORCPT <rfc822;autofs@vger.kernel.org>);
        Wed, 3 Feb 2021 10:48:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 099A6AC55;
        Wed,  3 Feb 2021 15:48:13 +0000 (UTC)
Date:   Wed, 3 Feb 2021 09:48:23 -0600
From:   Goldwyn Rodrigues <rgoldwyn@suse.de>
To:     autofs@vger.kernel.org, raven@themaw.net
Subject: Re: [PATCH] Fix option for master read wait
Message-ID: <20210203154823.2ylti4ksqbpvpesh@fiona>
References: <20201023135941.ednsszxsvgwv65k2@fiona>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023135941.ednsszxsvgwv65k2@fiona>
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian,

Any feedback on this? The fix is not included in 5.1.7.

Reproduction scenario:

# automount -M 2 -d -f
Segmentation fault (core dumped)

On  8:59 23/10, Goldwyn Rodrigues wrote:
> master wait expects a value, and if provided automount crashes with the
> following trace:
> 
> #0  __GI_____strtoul_l_internal (nptr=0x0, endptr=0x7fffffffe120, base=0, group=<optimized out>,
>     loc=0x7ffff77a63a0 <_nl_global_locale>) at ../stdlib/strtol_l.c:292
> #1  0x0000555555562c52 in getnumopt ()
> #2  0x0000555555564ec0 in main ()
> 
> This is because the options string is not correct and does not expect
> an argument for master wait (M), which sets optarg to NULL
> 
> Fixes: e68f07f ("autofs-5.1.2 - add master read wait option")
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> diff --git a/daemon/automount.c b/daemon/automount.c
> index 0391bfb..c2a0f58 100644
> --- a/daemon/automount.c
> +++ b/daemon/automount.c
> @@ -2219,7 +2219,7 @@ int main(int argc, char *argv[])
>  	time_t timeout;
>  	time_t age = monotonic_time(NULL);
>  	struct rlimit rlim;
> -	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFM";
> +	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFM:";
>  	static const struct option long_options[] = {
>  		{"help", 0, 0, 'h'},
>  		{"pid-file", 1, 0, 'p'},

-- 
Goldwyn
