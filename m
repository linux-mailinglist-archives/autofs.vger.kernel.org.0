Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3215FC139
	for <lists+autofs@lfdr.de>; Wed, 12 Oct 2022 09:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJLHYp (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 12 Oct 2022 03:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJLHYo (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 12 Oct 2022 03:24:44 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0325222
        for <autofs@vger.kernel.org>; Wed, 12 Oct 2022 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=AEqauQNfqludIfFdeH9fjhAYCKuAqc8cX5I3wZ7thjk=;
  b=DfDGRETnW3EziVll2woioJ8hrVPyUr6YXKWjGi/eAWuASi+OZOS7tJm0
   JD8uoiYVsKWP5xlfQ0cI8KcdC2+fOsacyc93hHxhLiuT60TWZPs6hJwy1
   vSIKk/016G9wYHA089jJVtuFZu/sFIn59KAgjT54treBW71dROhjxg8bV
   g=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=alexandre.merlin@inria.fr; spf=None smtp.helo=postmaster@zcs-store1.inria.fr
Received-SPF: SoftFail (mail2-relais-roc.national.inria.fr:
  domain of alexandre.merlin@inria.fr is inclined to not
  designate 128.93.142.28 as permitted sender)
  identity=mailfrom; client-ip=128.93.142.28;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="alexandre.merlin@inria.fr";
  x-sender="alexandre.merlin@inria.fr"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  ip4:192.134.164.0/24 mx ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs-store1.inria.fr) identity=helo;
  client-ip=128.93.142.28;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="alexandre.merlin@inria.fr";
  x-sender="postmaster@zcs-store1.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.95,178,1661810400"; 
   d="scan'208";a="60252508"
X-MGA-submission: =?us-ascii?q?MDGqnE4LmZnDPEBFdZGjw6zMDZzU89q22z7JeQ?=
 =?us-ascii?q?9OQtZEvjS2/0NCCtWd+oYvTIxH2+ZOOZRz6j4aOoYQy6dfar6Guz2Q+R?=
 =?us-ascii?q?/ZOEs+x94D5JuHljbOWWkmiwSO3zijYAlyTWsqi/ahcCg3JwnrnKXYVF?=
 =?us-ascii?q?K874YJQQJ6dHwrJNh9EqXntA=3D=3D?=
Received: from zcs-store1.inria.fr ([128.93.142.28])
  by mail2-relais-roc.national.inria.fr with ESMTP; 12 Oct 2022 09:24:40 +0200
Date:   Wed, 12 Oct 2022 09:24:37 +0200 (CEST)
From:   Alexandre Merlin <alexandre.merlin@inria.fr>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs <autofs@vger.kernel.org>
Message-ID: <101062384.12004693.1665559477080.JavaMail.zimbra@inria.fr>
In-Reply-To: <675bb30c-0a78-e8d0-117f-033243a7bef8@themaw.net>
References: <298565857.11643783.1665498321494.JavaMail.zimbra@inria.fr> <675bb30c-0a78-e8d0-117f-033243a7bef8@themaw.net>
Subject: Re: autofs regression due to positive_timeout (valid timeout
 feature)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [77.204.107.233]
X-Mailer: Zimbra 8.8.15_GA_4372 (ZimbraWebClient - FF105 (Win)/8.8.15_GA_4372)
Thread-Topic: autofs regression due to positive_timeout (valid timeout feature)
Thread-Index: CEj7qT73EPAkRen3Lwag5zpaPRaFjA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 12/10/22 01:49, Ian Kent wrote:
> On 11/10/22 22:25, Alexandre Merlin wrote:
>> Hello,
>>
>> TL;DR: Because of our use of a script-based map that dynamically creates exports
>> server-side based on user's rights, we are experiencing a regression since
>> commit 2f562f63a (autofs-5.1.6 - use a valid timeout in
>> lookup_prune_one_cache()). Creating an option for a configurable
>> positive_timeout, as mentioned in the commit comment, would be an efficient
>> solution for us.
>>
>> We are working for the Grid'5000 scientific testbed (see
>> https://www.grid5000.fr/w/Grid5000:Home). Our users can reserve nodes to make
>> their experiments, and from these nodes, they can access to different NFS
>> shares if they are granted access to use them.
>>
>> We use autofs to mount these filesystems on the fly, using a map based on a
>> script which checks that the user is granted, and which asks for the creation
>> of the appropriate export file on the corresponding NFS server.
>>
>> When the reservation is done, we signal the node's automount daemon using the
>> USR1 and HUP signals in order  to forget what was automounted by the user (as
>> compute nodes may be shared by different users, we want to ensure that the
>> previously mounted resource is no more in the running configuration).
>>
>> For this to work, our granting access script must be called each time a user
>> request to access a mounted point. But since the commit [2f562f63a] introducing
>> the positive timeout, when a user tries to access a mounted point, the cache is
>> used if a another user used the same mounted point within the positive timeout
>> timeframe (120s).
>>
>> So we need a way to disable the cache to be sure that our granting script is
>> called. It can be done for the NEGATIVE_TIMEOUT but not yet for the
>> POSITIVE_TIMEOUT.
>>
>> Since it is mentioned in the commit message that "The valid timeout probably
>> should become configurable at some point too", we wonder if it would be
>> possible to include it in a future release. You will find attached a patch
>> introducing this new option.
> 
> Well, yes, that will be fine.
> 
> 
> The patch looks mostly fine too, I'll possibly change some of
> 
> the wording but it should be otherwise unchanged.
> 
> 
> Are you ok with having your email address as the patch author
> 
> since the patch will be uploaded to kernel.org when it's
> 
> committed (publicly available) or should I set myself as the
> 
> author (not my preferred choice)?

Using my email address as the patch author is fine.

> Anyway, I need to find time to make a new release so it
> 
> shouldn't too long before it's available.

That's perfect.

> 
> If you need me to commit the patch earlier than I otherwise
> 
> would (such as your distro maintainer has upstream first policy
> 
> on package changes) then say so and I'll commit it.

No need for that.

Regards,
Alexandre
