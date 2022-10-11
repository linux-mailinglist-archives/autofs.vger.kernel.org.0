Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043065FBE84
	for <lists+autofs@lfdr.de>; Wed, 12 Oct 2022 01:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJKXtV (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 11 Oct 2022 19:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiJKXtT (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 11 Oct 2022 19:49:19 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCFCA3455
        for <autofs@vger.kernel.org>; Tue, 11 Oct 2022 16:49:13 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 8D8D732001FC;
        Tue, 11 Oct 2022 19:49:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 11 Oct 2022 19:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1665532149; x=
        1665618549; bh=4oDF0/RLkvMUGBvKGZuZoNX1p7lOYTfHRqmLnqMLsuU=; b=v
        y1Yr1XnJdpD9bsol9NdImo10HUb7FS8p23U/Km/WzTDipC0T1dS7skZkS7W0ZpwF
        7AG2IXWps2EwhqOcXUeyDPP5CRlGsmk6kBHfMsMhodAEeJ1M5MVAp17LnkLaNJ8r
        u3rUt+5R9Vy/zXstMy/yuMt388kg2ZMJgNTDXHmalWwYoKxoiBp5XF6PsfWlXx6A
        jGkO41dd694O7m1Biohmf5vpd3XgxKNX5VJ+q9aKBB/dodB/FvcHtU7jTtXbkNy5
        1bNT4tLn6R201cz2ZfIEV8hdIT53gQkH174ssexmekGiQuTjF5R15+SvmMh41bXc
        uJID3VO7yl+1jSlTfeE1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; t=1665532149; x=1665618549; bh=4
        oDF0/RLkvMUGBvKGZuZoNX1p7lOYTfHRqmLnqMLsuU=; b=eYCeDp6dTIyUNI42L
        XtCnh/yYE5Nm7crlPYs79pPtunv9mqI0JH7cBbXWPmq4b4ZrR0masDHLk/jE91ai
        p0X6tzRanfqaf7lRXxYR5X0C7NUL+24b1Izs7Ek/s4vJRZcVwxqwWL1ELH4HGZo7
        bBwwE1Wth178B51I2gXck3RwbnloMv5J23KwSpSfLeMFlJPgNCp6wtBszcvFcsHY
        ZveRKJ+SyM2l38tsEGxzooKujX7UmQhSEwaBlAUSiWbazuVixYM7aBtC6/YiyHAf
        7rZHNOT+bakPCfJssZLxsatn5Ngd5yehli07wO80IWYVlZ9GRJDf1TEoPcHs5piO
        jPXZQ==
X-ME-Sender: <xms:9ABGY8ylT-arfWhU011sB4zG1U3AlW_4rvUMmvjMw6q7f-bRNC46OQ>
    <xme:9ABGYwT85KZli63f0ZQhGV9VWX2IyBFj9ZqBysNSvCwbJ0HTn0x2OlJ9MOUaI_JTY
    WT_GZyfUO2O>
X-ME-Received: <xmr:9ABGY-U9-4xsc6MXJXL7ux7DbBKGW_ktLYsgU087Ot4KdbTcuVNT0L4wh3D08NPKune2joRQlpl-1HmQKhEa0rGRK7YalciK6NItgMHUPixPZatDLmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthejredttdefjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    eggeetffegvdfhlefgteeuhfeludffffevheduveefuedvleeuveekieeuieejgeenucff
    ohhmrghinhepghhrihguhedttddtrdhfrhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghm
    rgifrdhnvght
X-ME-Proxy: <xmx:9ABGY6iElKpm9oWFngbalE1cVYErRtj8KdfMHYdTJV8O_UyPYBzqLA>
    <xmx:9ABGY-Avj0eMBcWf_Mygrw_1KPpczoCClL-iWGEnqsRmZNuSUav6vQ>
    <xmx:9ABGY7I-YQB1EA8wol5__R8PNlvrjhK_f50BuPpDNVCwgU7fEaX98w>
    <xmx:9QBGY18rYxRMT0nxVl8PkjUoq_oqtghrSDyRc7wS-ao05O6qb7bp7Q>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Oct 2022 19:49:07 -0400 (EDT)
Message-ID: <675bb30c-0a78-e8d0-117f-033243a7bef8@themaw.net>
Date:   Wed, 12 Oct 2022 07:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: autofs regression due to positive_timeout (valid timeout feature)
To:     Alexandre Merlin <alexandre.merlin@inria.fr>,
        autofs@vger.kernel.org
References: <298565857.11643783.1665498321494.JavaMail.zimbra@inria.fr>
Content-Language: en-US
From:   Ian Kent <raven@themaw.net>
In-Reply-To: <298565857.11643783.1665498321494.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 11/10/22 22:25, Alexandre Merlin wrote:
> Hello,
>
> TL;DR: Because of our use of a script-based map that dynamically creates exports server-side based on user's rights, we are experiencing a regression since commit 2f562f63a (autofs-5.1.6 - use a valid timeout in lookup_prune_one_cache()). Creating an option for a configurable  positive_timeout, as mentioned in the commit comment, would be an efficient solution for us.
>
> We are working for the Grid'5000 scientific testbed (see https://www.grid5000.fr/w/Grid5000:Home). Our users can reserve nodes to make their experiments, and from these nodes, they can access to different NFS shares if they are granted access to use them.
>
> We use autofs to mount these filesystems on the fly, using a map based on a script which checks that the user is granted, and which asks for the creation of the appropriate export file on the corresponding NFS server.
>
> When the reservation is done, we signal the node's automount daemon using the USR1 and HUP signals in order  to forget what was automounted by the user (as compute nodes may be shared by different users, we want to ensure that the previously mounted resource is no more in the running configuration).
>
> For this to work, our granting access script must be called each time a user request to access a mounted point. But since the commit [2f562f63a] introducing the positive timeout, when a user tries to access a mounted point, the cache is used if a another user used the same mounted point within the positive timeout timeframe (120s).
>
> So we need a way to disable the cache to be sure that our granting script is called. It can be done for the NEGATIVE_TIMEOUT but not yet for the POSITIVE_TIMEOUT.
>
> Since it is mentioned in the commit message that "The valid timeout probably should become configurable at some point too", we wonder if it would be possible to include it in a future release. You will find attached a patch introducing this new option.

Well, yes, that will be fine.


The patch looks mostly fine too, I'll possibly change some of

the wording but it should be otherwise unchanged.


Are you ok with having your email address as the patch author

since the patch will be uploaded to kernel.org when it's

committed (publicly available) or should I set myself as the

author (not my preferred choice)?


Anyway, I need to find time to make a new release so it

shouldn't too long before it's available.


If you need me to commit the patch earlier than I otherwise

would (such as your distro maintainer has upstream first policy

on package changes) then say so and I'll commit it.


Ian

