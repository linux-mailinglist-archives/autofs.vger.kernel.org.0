Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5615649777E
	for <lists+autofs@lfdr.de>; Mon, 24 Jan 2022 03:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240892AbiAXCmb (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 23 Jan 2022 21:42:31 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54759 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235357AbiAXCmb (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 23 Jan 2022 21:42:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 825685C0124;
        Sun, 23 Jan 2022 21:42:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 23 Jan 2022 21:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=ZO5pALWSBBxAZp
        0zRO7y/TLsLwYFgxzcgn8wq7VXaxM=; b=hn9nli6lt3Ckjh4dBNGmU5SnVBZYcx
        eh03wCA0pkpjB1R7dpx8DMGCYorWh4WDn0A/X38EKY5BQo5Pxco0DxYZms4g0GXe
        Ri+JNW9Cp9hQ08JHs8MCbRywZG3lk4hsCZDnX6JYjRA7gADAbp6b2x/ZIPhAv+/5
        oLv0INryEzgj5mUvrEgHfRNyap05xHQMCJ9svKAZMxvxn0z+cka+dh4SjmSqrRrN
        XDc0FAzW0c2J1F43VbMLebGicgJLLJX61cAg1NygjEFVCWmovZ7LtyocprDWXHBp
        J3mK10AplkmUrBXAlI3qUwbyteUixgCJdhYdl8RELHrI8nhUy4ZD8GQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ZO5pALWSBBxAZp0zRO7y/TLsLwYFgxzcgn8wq7VXaxM=; b=WJhlIm3a
        lRDV2MEsQf2mctI4KPtosd+nhan8GxDMFgfL+1TLfFx3+CnVJgtRRahqNLpRESlC
        N9/IY/XZJv9BYuTqkSexDFkTN0toXnai76cRqMUXStELnv5lRJWMTg52iC92yDKV
        4i2ldTFb8yDgjCdWrF5iw2aOGL2lsttkbccfSjTs+Crgecmxh1iVJXZkjw838IVA
        T4o+KFEQvXj3xJOcGewGe/U4Bw5L1gPUWQa9enokpkc92agLJB8F45eXBqKDcRZh
        bXUGtCs+UWGPk4Hghj5X0gy7nesECeQZGDuVW8pkpNgPEgZDpH3ivK1+nGCWdYYh
        mKUYEadXfOZiIA==
X-ME-Sender: <xms:FhLuYfeqQpQxuIzuC0Vae4LGHTm732paP72gOzZLIqskt_9OoN8q1Q>
    <xme:FhLuYVPRphs2MIscgd-0Qdbrw5eqrbnXf3swSZlherUBcoQZoji-AUf2j_JKKElcj
    DJbJTXLb-04>
X-ME-Received: <xmr:FhLuYYgK_I9-HSC1tn-gjLXki-ujdmzA9hF5pBw5OF2UYUKic8vUJtLheFrDazu0qNJWzuCnug5CjymVdk_OG4VLdm9xQgD-zCGqBTQsdwEN4lVlrQyhgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdehgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtredunecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepff
    etfeetieefvedvgfffieffjeefgeekkefhtdegudefueekgfeikeffkeegueefnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:FhLuYQ8YCqqzaHlDEpN620TVdugHuHQ80lGqBHU-QjCoCRZjKgQtFg>
    <xmx:FhLuYbt8AeR4HVPRFwBO7NQnFb1NPOeqnwKYjrcSy_XnrSw26Vd2LQ>
    <xmx:FhLuYfG5_BGAjc7CmPwiCToRFs89RtwK_Lq95y1ErAt7ViplXW18Xg>
    <xmx:FhLuYY67RmqO4REyx0ixqUDbBbFalN-yz7cmP40rO14idUI12V2BWA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Jan 2022 21:42:28 -0500 (EST)
Message-ID: <aca5cb6920b313953289db25adc8d63703af6b38.camel@themaw.net>
Subject: Re: 5.1.8 s390x error: invalid path supplied for cmd(0xc018937e)
From:   Ian Kent <raven@themaw.net>
To:     Andreas Hasenack <andreas@canonical.com>, autofs@vger.kernel.org
Date:   Mon, 24 Jan 2022 10:42:25 +0800
In-Reply-To: <CANYNYEG4uA8Tp5+W3=XHkXzaBWv1f9Sq5Re+oahGB4jNwYa6BQ@mail.gmail.com>
References: <CANYNYEGXa6Kp82nmpSieCzRs4iipSkQKq-tLqaLyFWxW1HgUSA@mail.gmail.com>
         <28d69ccef58b083a9726c8e7cc602cd938dd0c49.camel@themaw.net>
         <CANYNYEF46JrOAhozU=nCmqvKS2UwVOF0_yNXejvq9V83yQumhA@mail.gmail.com>
         <CANYNYEEbkztqHfs4hGngOV4qrxKZn3gsXbNZP5X79Ljcx862Fw@mail.gmail.com>
         <CANYNYEFVX4cNBXnB4iR1w_sgAi-NgEYz7_5-ad1c_-vzvvEtuQ@mail.gmail.com>
         <25f3fdb0fff76a6d347c5e6e1f12d6c6dac40916.camel@themaw.net>
         <7967061ccfa8de983f7a0c0320547011228cd1f8.camel@themaw.net>
         <CANYNYEG4uA8Tp5+W3=XHkXzaBWv1f9Sq5Re+oahGB4jNwYa6BQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2022-01-21 at 09:35 -0300, Andreas Hasenack wrote:
> Hello,
> 
> On Fri, Jan 21, 2022 at 5:08 AM Ian Kent <raven@themaw.net> wrote:
> 
> > I think this patch might help with that hang.
> > I may merge that into the original patch but it's separate for now
> > to facilitate testing.
> > 
> > autofs-5.1.8 - fix fix root offset error handling
> 
> 
> This indeed fixes the hang after patch 5, thanks! \o/

btw, I will fold that into the above patch since this is all being
done as development, hence the mistakes we are seeing.

Ian

