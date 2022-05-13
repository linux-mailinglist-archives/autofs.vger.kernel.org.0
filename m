Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A905259A4
	for <lists+autofs@lfdr.de>; Fri, 13 May 2022 04:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376478AbiEMCQx (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 12 May 2022 22:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376475AbiEMCQw (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 12 May 2022 22:16:52 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F024BFF3
        for <autofs@vger.kernel.org>; Thu, 12 May 2022 19:16:50 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 4115432009E5;
        Thu, 12 May 2022 22:16:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 12 May 2022 22:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1652408207; x=
        1652494607; bh=Ghe0YJ3AfE4GoTJgiUDCrGEMBttUMlT8DB6PLVPUyxA=; b=t
        G0YoII6xXC+vdG/KaQ+IPGLAj8T2AoHXg08499Rw1oewdonUajd4Gqw+J4v+CF00
        rA0GgTA5h8XRYZu0cnvaxGf0kFScDaXOS4tVWzIZ9mY4DHMVaNc2BLege8MzFZY5
        9kXp49oMn9MaUUSdWXAb0Mj52NkdxAGQJE2WBlAn7Lbo0GyuCMwBmtNoQnWXYY/O
        zEm6jr0hjaxtohdUgXBdkCQRcAs/UjMs05myDtjc+5XI5e4fgGrtiunHY8ca/eq5
        cQgcqU+0kLDKW6i75bCrbadfrAvs6/ub/yXD+Cfqvq46q863usmzNuo3QEVtONVT
        IFsYalTYNETuR1JDGyPqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1652408207; x=1652494607; bh=Ghe0YJ3AfE4GoTJgiUDCrGEMBttU
        MlT8DB6PLVPUyxA=; b=Awz/VP7sGTJ+GR8I+u8qEFIyGzGmmxbbSeYWE6fHnoqj
        ph2c+dp4cYS+z8WcCgA7tkSLWtEuAZ4L4pos355PQif4jyfCYLFkTnsFCawMP1OW
        YEQigzJjj2dKRNk7xU6sa88e5JgeOvIka9P42wrcixPiQwhWXsNlWKqCgiGg/xeP
        zCOmPDw6azgRHBrIv3qb55vemMrCmpmkMZlhFbF7igZJet0yXpHOy4GBU/zUDyOF
        k0smA3RQ+x4hS/68ZvFJNsquhSHjumcEFB/EHJwV29vkv8bE47l2xv4PVoMQkAlU
        zoX4w1pRHqCX2H0YaHC97ynwhYJygNNFBGMj6kj2Hw==
X-ME-Sender: <xms:j799YlTghRp7uTkqW4JAq2_Uui9evLqY_qu4qAm22Jdem_lnksElIA>
    <xme:j799YuwX8n8y_x1lc2S399vUAIA_pY5od5OHjKMMcEJilwzg2p1K3gW-0Z6vrmy2B
    nfkH9-qiD85>
X-ME-Received: <xmr:j799Yq2PgqgVLK6hzGFe-PEk9QLhM-5OMdfGBsNal_SBsF066BDq82Gg1tfhWYgs70BR8fynO-LrrVzStJGoPfARvv8QCtN6M0srHqryumYdyljG4Q8G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeekgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepgf
    elleekteehleegheeujeeuudfhueffgfelhefgvedthefhhffhhfdtudfgfeehnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:j799YtAGDMv5XTU-b7IwTKQiTaFcTyRQco68eagv6bM_wsQ6gvFBLg>
    <xmx:j799YuiKQSaIB5yVSWrqQQV_l6rROhsbkqeND3ENcXmrqosNVsq_CQ>
    <xmx:j799Yhoxe-shfChzjcbJxg2rPBczUgUaU61gRekqlMJ9D0yQXlNqlg>
    <xmx:j799Ykfc8FNvoD1Utlg602baq0OGgZivbn2v2FfgQfpJfKAqbxVv_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 22:16:45 -0400 (EDT)
Message-ID: <58e0486f7b646e0dbbbc5f2424b634f865d4573e.camel@themaw.net>
Subject: Re: [PATCH 1/1] daemon: initialize pthread key before attempting to
 log
From:   Ian Kent <raven@themaw.net>
To:     Clayton Craft <clayton@igalia.com>, autofs@vger.kernel.org
Date:   Fri, 13 May 2022 10:16:40 +0800
In-Reply-To: <20220512234145.18308-2-clayton@igalia.com>
References: <20220512234145.18308-1-clayton@igalia.com>
         <20220512234145.18308-2-clayton@igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2022-05-12 at 16:41 -0700, Clayton Craft wrote:
> Fixes a segfault when running the automount daemon with -v, where
> log.c:prepare_attempt_prefix calls pthread_getspecific when no
> key_thread_attempt_id exists.

Could you have a look at commit ab9570be7ee7 and adjust this patch
as needed if it is needed please.

> 
> Signed-off-by: Clayton Craft <clayton@igalia.com>
> ---
>  daemon/automount.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/daemon/automount.c b/daemon/automount.c
> index 32f95a5..b941129 100644
> --- a/daemon/automount.c
> +++ b/daemon/automount.c
> @@ -2629,15 +2629,9 @@ int main(int argc, char *argv[])
>                 exit(1);
>         }
>  
> -       info(logging, "Starting automounter version %s, master map
> %s",
> -               version, master_list->name);
> -       info(logging, "using kernel protocol version %d.%02d",
> -               get_kver_major(), get_kver_minor());
> -
> -       status = pthread_key_create(&key_thread_stdenv_vars,
> -                               key_thread_stdenv_vars_destroy);
> +       status = pthread_key_create(&key_thread_attempt_id, free);
>         if (status) {
> -               logerr("%s: failed to create thread data key for std
> env vars!",
> +               logerr("%s: failed to create thread data key for
> attempt ID!",
>                        program);
>                 master_kill(master_list);
>                 if (start_pipefd[1] != -1) {
> @@ -2649,9 +2643,15 @@ int main(int argc, char *argv[])
>                 exit(1);
>         }
>  
> -       status = pthread_key_create(&key_thread_attempt_id, free);
> +       info(logging, "Starting automounter version %s, master map
> %s",
> +               version, master_list->name);
> +       info(logging, "using kernel protocol version %d.%02d",
> +               get_kver_major(), get_kver_minor());
> +
> +       status = pthread_key_create(&key_thread_stdenv_vars,
> +                               key_thread_stdenv_vars_destroy);
>         if (status) {
> -               logerr("%s: failed to create thread data key for
> attempt ID!",
> +               logerr("%s: failed to create thread data key for std
> env vars!",
>                        program);
>                 master_kill(master_list);
>                 if (start_pipefd[1] != -1) {

