Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83094027E9
	for <lists+autofs@lfdr.de>; Tue,  7 Sep 2021 13:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244798AbhIGLgO (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 7 Sep 2021 07:36:14 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:54524 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245329AbhIGLgM (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 7 Sep 2021 07:36:12 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2631E1FF75;
        Tue,  7 Sep 2021 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1631014506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pl6BIliZ5bo0YfkM4lFkn4iGFSYmdeow7I5BjpcGsQc=;
        b=TjQ14nxO+nZq4sxLj0MdlE2ewrckEH03EBiR6PQxnHP2JZS649FQqsraixL/zDfX4c1BOX
        NsI2a9i201diG06vRn6sZNtZcJxxB9iDhAOhgaKGlgmotiJyJjW1RJ0lVhs6hkxzy0csaq
        YiR50w/j5bveFY/IaVuj5NXsRYVgEsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1631014506;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pl6BIliZ5bo0YfkM4lFkn4iGFSYmdeow7I5BjpcGsQc=;
        b=/A7jXs3+GnHryoSH945DrMzdPgO9JLLbDMy6dfzqYafJEbHMZgwJrhaP8U/1CvAdtoxGoh
        njZQ8duQtSPn82Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id BE41F132FD;
        Tue,  7 Sep 2021 11:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 22YyIGlON2HQVgAAGKfGzw
        (envelope-from <rgoldwyn@suse.de>); Tue, 07 Sep 2021 11:35:05 +0000
Date:   Tue, 7 Sep 2021 06:35:03 -0500
From:   Goldwyn Rodrigues <rgoldwyn@suse.de>
To:     Ian Kent <raven@themaw.net>
Cc:     Sietse van Zanen <sietse@wizdom.nu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Subject: Re: autofs & glibc 2.34
Message-ID: <20210907113503.vlfpcok3f2ixrj7a@fiona>
References: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
 <62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
 <c3a9f593933b4db5907637c505279e1e@wizdom.nu>
 <f78fc66f41caf701141737e61aa1e6988115920b.camel@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f78fc66f41caf701141737e61aa1e6988115920b.camel@themaw.net>
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian,

On 19:43 10/08, Ian Kent wrote:
> On Mon, 2021-08-09 at 13:42 +0000, Sietse van Zanen wrote:
> > 
> > If you're already aware and will relwase an update soon there's nothing
> > more to do. Glibc 2.34 is not even a week old. I noticed that a few
> > packages were running into this so I thought I'd notify their
> > maintainers.
> 
> I'll commit the change fairly soon and I hope I'll be able to post
> a release by the end of the month.

When do you plan to make this release? If sometime later, could you post
the patch removing _POSIX_THREAD_ATTR_STACKSIZE/PTHREAD_STACK_MIN? or
update git? I don't want to deviate too much from upstream for our
releases.

<snip> 

-- 
Goldwyn
