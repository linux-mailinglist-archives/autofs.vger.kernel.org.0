Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B74403403
	for <lists+autofs@lfdr.de>; Wed,  8 Sep 2021 08:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347656AbhIHGDv (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 8 Sep 2021 02:03:51 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50177 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235929AbhIHGDv (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 8 Sep 2021 02:03:51 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 597FC5C015E;
        Wed,  8 Sep 2021 02:02:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 08 Sep 2021 02:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        KM2suYig/Ir5Tza7XBMfsYZSOXPzqQO2fJ11tcjrsJM=; b=EJ54+IAdCPSMQuss
        k3l5KwATs6ARTwOHXlFXPOnNRvuHADs2wrdY5T1rh/wNS2eXnHqwRFDHl2e+YcZE
        Jt1byj9D2M6qLVdvfLdKnjY9lZk3pqKhsU0gy4QZmQy7EWcetOMTScFKNSmPCsSJ
        D6hVhIfh9kKqEp/tBdzFzSplbobKT58A0GdTjESr9es4MmBv4izknWKlBTVlbYKX
        B+sLcAAmeP68AO3wcPWbUTGJGWCv9o+Q6CdHz5EXEFoKz7mqOtUKY4aiHH1PhZER
        BltI9O5RthjjG1oOBZyHBN/V8cQweZnMkit7w85xg6bqESeGeyjWVSNw5wZzbooq
        GL0SWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=KM2suYig/Ir5Tza7XBMfsYZSOXPzqQO2fJ11tcjrs
        JM=; b=jw2fDUEYBlPxMfHxBvz+A5iAdHZqPTn/hpgh0X8uHX0ByRwccxQbbKEiu
        7lO0kqSEFA4mUfv0MUNBMgxA8MUOIMx0/xJrYLKJoC0AUSqQ+6SHxplUeBizUSVB
        8RIL6pTqcb+c1uVHTH2MMDOxgh2YcIRw6nHbBJ63P/xYHzpNVyQ1Vjm0VDuhaTA6
        +HEj8ljpYznlREbvPiW+bdLKwYTfXyy6n0Ey2S2gu7GFqag7CIxUKsQWwgmntvCq
        qy8yEHVkFEg31WDeXpwTYQ5tveh0G2O0h00yKSkkrEWNS+C4VWVl4vFvt9gZGSu3
        BFpjI9hcGVW55aIvmyIAWt1dMzaaA==
X-ME-Sender: <xms:A1I4Yfe5DMVux60UYgxsgN0hVZ2ShAtNNRabF5yZQ1rUhIwELqnk7Q>
    <xme:A1I4YVM0KT_xgUTvOCe7PIHE7tfqQDalFnas2MnY1-xh6O70HrsTNP7lKcUhyE_Sv
    DcFMluCQNzj>
X-ME-Received: <xmr:A1I4YYgxchfGcS3LzKAr4BqupM8O4jX6FskjcB-Nr446vCED_O44o2UscGqMrN9YWpTkfmm5L4g5Iy-pf5TSUgbBMh6uvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucggtffrrghtthgvrhhnpe
    effeettedvgeduvdevfeevfeettdffudduheeuiefhueevgfevheffledugefgjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:A1I4YQ-zYnIFDudaRESbuNRzswb-IR62hLQq7r2PKRlAEUw6nwyZbQ>
    <xmx:A1I4Ybt7_bB_uJpqwG42PJX8F1QOsNX1PW6Fc1JyQ5w19D8qasYzOw>
    <xmx:A1I4YfFMYtQjTnzhbG-xKlgaqdRQAWdNrVHC1v9vHKoYGfprW1w2pg>
    <xmx:A1I4YZ33cLv6IXrTfltFDmpAvb5dVrI4kBX6vaqGlIRTliUvVSq5Ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Sep 2021 02:02:41 -0400 (EDT)
Message-ID: <50ca2333aa0064d46a10a0af0d61c3f0eeada25b.camel@themaw.net>
Subject: Re: autofs & glibc 2.34
From:   Ian Kent <raven@themaw.net>
To:     Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc:     Sietse van Zanen <sietse@wizdom.nu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Wed, 08 Sep 2021 14:02:37 +0800
In-Reply-To: <342292a1db162b16ceb5ce5345874d895a59e87f.camel@themaw.net>
References: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
         <62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
         <c3a9f593933b4db5907637c505279e1e@wizdom.nu>
         <f78fc66f41caf701141737e61aa1e6988115920b.camel@themaw.net>
         <20210907113503.vlfpcok3f2ixrj7a@fiona>
         <342292a1db162b16ceb5ce5345874d895a59e87f.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2021-09-08 at 13:25 +0800, Ian Kent wrote:
> On Tue, 2021-09-07 at 06:35 -0500, Goldwyn Rodrigues wrote:
> > Hi Ian,
> > 
> > On 19:43 10/08, Ian Kent wrote:
> > > On Mon, 2021-08-09 at 13:42 +0000, Sietse van Zanen wrote:
> > > > 
> > > > If you're already aware and will relwase an update soon there's
> > > > nothing
> > > > more to do. Glibc 2.34 is not even a week old. I noticed that a
> > > > few
> > > > packages were running into this so I thought I'd notify their
> > > > maintainers.
> > > 
> > > I'll commit the change fairly soon and I hope I'll be able to
> > > post
> > > a release by the end of the month.
> > 
> > When do you plan to make this release? If sometime later, could you
> > post
> > the patch removing _POSIX_THREAD_ATTR_STACKSIZE/PTHREAD_STACK_MIN?
> > or
> > update git? I don't want to deviate too much from upstream for our
> > releases.
> 
> Yes, I'm a bit behind.
> I'll post the two patches later today, ;)

Umm ... I have pushed changes up to the needed patch to the repo.

The commit 91edcc55c681 "autofs-5.1.7 - use default stack size for
threads" is the one your after.

For this change I also had commit 7f711c687d41 "autofs-5.1.7 -
eliminate some more alloca usage" but I don't think it's actually
needed.

The original problem was due to glibc usage of alloca(3) when getting
group information for very large groups seen on Windows DCs IIRC. But
for some time now glibc doesn't do this any more so all should be ok
without the second patch.

Clearly you'll get a conflict on the CHANGELOG if you don't have all
the preceding patches from the repo. which is straight forward to fix.

Ian

