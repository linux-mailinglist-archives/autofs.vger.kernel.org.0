Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770174033C1
	for <lists+autofs@lfdr.de>; Wed,  8 Sep 2021 07:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345711AbhIHF0i (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 8 Sep 2021 01:26:38 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60075 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244525AbhIHF0e (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 8 Sep 2021 01:26:34 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 50CF5320093E;
        Wed,  8 Sep 2021 01:25:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 08 Sep 2021 01:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        qthAagVeyMl73+m2czimF+Ho0IqwSDSmukxTiF/ER5s=; b=UqUwh8IAhvL5gS16
        YyYQLtwtO8E8cfPJFt7Nm0AGHxX8jZWH+xpxH3wc4Ls3eWLP06fQTIv1Q8tlCroq
        Br8MMucIvnQFKpEehFtKu9sg5y2/4LNoEHVJoVAu87vqPvbOxv+PEA3/oOJ10tYC
        /vGwzpWYNYnjlTSJ5jPAt9xZicJSEG4bG93GCcl2Kcm85IQayfINpc171Ot1A09d
        l+DNA1Dc5s3rkq5IRRJtoCYk2RbaBtxOrCl69tbQw8yMZ/aWyk6pmww/KXrhisi1
        K+cdBttAv5Y79t5N8dyVwsDT2lt8b7C41MmsebVQ7OxwTC7R5tqMdAie7M7a9o9X
        /Dpcpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=qthAagVeyMl73+m2czimF+Ho0IqwSDSmukxTiF/ER
        5s=; b=Jt2VZ/eaep5haZikKCnJi3oiG6VvTosEW205HKzM1ZxZX696NhZjOlI3F
        k6eulidM8PM+kRurY7Z0A+zK2T2AHa+rJAGm6a2+VTGuv5j94tpzXNEh9Z7FnKh9
        l7bSrPQgRzQ9oyIfp37OBP+EQQd9w0dd78nEr709rdlQP5yudUZvVkxk8N1ncomc
        tpkzuXct0NKCyZf1b1kFowQNeD0fmnxgpNzVmrakzhROBP4OCA0ZTJ2MC6MYdFVD
        30QqOboGdNZysDwsTe3Zw0KVBGy48dQGFvEIXIoajcLcMUIyiYScFB7giDaIVJz0
        RqQ7WLZn4aV2RORb9jlfIqVK9t9YA==
X-ME-Sender: <xms:REk4YdsAz1PM2Xf03DFbx2ldovPyZmn2YHmYF2uZ1HeAUH5GMNvusg>
    <xme:REk4YWc7wqUFHTEL3PVEniPb_HMlOsAAmmwUlycNuUMwJkI5W6Ir2xQM5Ywmk8JIk
    IqoHMa3X-d0>
X-ME-Received: <xmr:REk4YQwtZiH5T9DVAOiqgIEnHU_foYvS-YSiMzwppYFZ4eg0en4VyQRBqLkIRCgN03GR4HiMXjazWbXkdmvorhGkgOsxkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:REk4YUNi7TgVlO80crSSTnrcG7jPOnx8E4GNZ8pxJ4c_OKRsSh6oWA>
    <xmx:REk4Yd_MYm8Xm4_pJaR92hCWrZLAJgCU49IHwJpnOTKTfDNcgmdg_g>
    <xmx:REk4YUUxnPFg52W4zAGc0ijzWmNYhLzqw1-UVKECDC_4B5q-Y2QQRw>
    <xmx:REk4YaFfL-PzWKd_5knH242Wu58iqkg3FEtNWxFk6DsNtemXY_EDWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Sep 2021 01:25:22 -0400 (EDT)
Message-ID: <342292a1db162b16ceb5ce5345874d895a59e87f.camel@themaw.net>
Subject: Re: autofs & glibc 2.34
From:   Ian Kent <raven@themaw.net>
To:     Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc:     Sietse van Zanen <sietse@wizdom.nu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Wed, 08 Sep 2021 13:25:18 +0800
In-Reply-To: <20210907113503.vlfpcok3f2ixrj7a@fiona>
References: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
         <62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
         <c3a9f593933b4db5907637c505279e1e@wizdom.nu>
         <f78fc66f41caf701141737e61aa1e6988115920b.camel@themaw.net>
         <20210907113503.vlfpcok3f2ixrj7a@fiona>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2021-09-07 at 06:35 -0500, Goldwyn Rodrigues wrote:
> Hi Ian,
> 
> On 19:43 10/08, Ian Kent wrote:
> > On Mon, 2021-08-09 at 13:42 +0000, Sietse van Zanen wrote:
> > > 
> > > If you're already aware and will relwase an update soon there's
> > > nothing
> > > more to do. Glibc 2.34 is not even a week old. I noticed that a
> > > few
> > > packages were running into this so I thought I'd notify their
> > > maintainers.
> > 
> > I'll commit the change fairly soon and I hope I'll be able to post
> > a release by the end of the month.
> 
> When do you plan to make this release? If sometime later, could you
> post
> the patch removing _POSIX_THREAD_ATTR_STACKSIZE/PTHREAD_STACK_MIN? or
> update git? I don't want to deviate too much from upstream for our
> releases.

Yes, I'm a bit behind.
I'll post the two patches later today, ;)


Ian

