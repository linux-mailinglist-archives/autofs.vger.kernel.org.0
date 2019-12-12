Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3B511C2F2
	for <lists+autofs@lfdr.de>; Thu, 12 Dec 2019 03:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfLLCHY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 11 Dec 2019 21:07:24 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50901 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726793AbfLLCHX (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 11 Dec 2019 21:07:23 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id AE7E1983;
        Wed, 11 Dec 2019 21:07:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 11 Dec 2019 21:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        AVKerAoAQ9bWbMrVFmKmhF9LOv++ijkbsjC67ZNEO9Y=; b=OHSBMhvrO4BT/od+
        KnJxnzeKG37N+S4FNao13L2pa4pujTjB/dlFrsI1ul9yEeNimjQNrDbYx1cBW5mB
        4dXThiaTf+kHWB7+zG0/zqcbT5iYUHxiW7q5S+LQaHxjYiBAUTt7TfpeU7qPolbJ
        1zjojcPDVxT2aT8XXOMiEuzjoCxibf6EtHwoYOPOEmPMwyDEqce0a6/4+v8uzIed
        /jJ1WfoBcFomMDuAGCJ8k6cnmFUa1giq6+Z1piJaUk22SN6l0M4hfv0EIwq+Zauj
        KZMAdTPMFAZNyt0K2jeU7uB2MKunhLc12E2ca+IoIcSTtUHi3LAkCJpCVThPRMB8
        ga1sLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=AVKerAoAQ9bWbMrVFmKmhF9LOv++ijkbsjC67ZNEO
        9Y=; b=LrPLg3ZD1lUmQdZT4f0elJhkQYsVFCPmruJXevyE1qv5Pp7RoYpLtIJuW
        Vqxq4TKoEfiY0wbkTCfju2XL2FhSd9f4pmoQepOiUQ2N3HdjfQMxrF1kGd1ajBKX
        Gxk7vhUOX6hs9pADylEwv1AfWsrcc1+76l1GCLnbmNqPsWG7EkpIqfDntkyteR08
        pDF3oyrjKrOp5Ivg/coxPrv7ZCHjLGK8t+XEhjrWyzkl3AM2/OlVtIEjebgiRP5O
        zvK9aac8TxTR2qK0rW9aaUZOa4r4yaVW4y5324iHqPncd1rrubNpY0HHAHuCA/TB
        sLcGa+nok8kN4IHG0B88jGuDBuFcg==
X-ME-Sender: <xms:2qDxXQn3V1ZDB55a8fzo_9eCLOMblNgPaJR4tY6mksRWg6IAZ7oLaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeliedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtle
    drudekledrudelkeenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghm
    rgifrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:2qDxXaEXg_8mtAMuPVa1VXsfYZjaNuV7BVMKhG2y0TaJTbsE_mxTnw>
    <xmx:2qDxXbdujziJoQ2UHAP-T3gpgrC4o6CkGabVl_WNC5n5NtRDKIIyrQ>
    <xmx:2qDxXUab4QErtrSIXS1RLETeYgbQP9Qb6id-XdF-BPVpE3WkoMq9-Q>
    <xmx:2qDxXTtR5ij8N-L0gxScgFwue0um-Kwi7YtGqR62T3CAmpuPq7Gy2Q>
Received: from mickey.themaw.net (unknown [118.209.189.198])
        by mail.messagingengine.com (Postfix) with ESMTPA id B3F2F80061;
        Wed, 11 Dec 2019 21:07:20 -0500 (EST)
Message-ID: <882530b92d107607777570d344d14f04f027a078.camel@themaw.net>
Subject: Re: Failure of program map to recover after failure
From:   Ian Kent <raven@themaw.net>
To:     Doug Nazar <nazard@nazar.ca>, autofs@vger.kernel.org
Date:   Thu, 12 Dec 2019 10:07:16 +0800
In-Reply-To: <a4119d82-b722-1723-65f6-3e5550e5e62f@nazar.ca>
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
         <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
         <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
         <a4119d82-b722-1723-65f6-3e5550e5e62f@nazar.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2019-12-11 at 05:54 -0500, Doug Nazar wrote:
> On 2019-12-09 23:49, Ian Kent wrote:
> > I also need to work out why you don't get caught by the negative
> > map entry check that's meant to prevent multiple retries for a
> > failing map entry for a configured time.
> 
> Sorry, I should have been more explicit. The several minute wait was
> to 
> exceed the negative cache timeout. That part was working fine.
> 
> > > And even the entry delete below it should be ok because it will
> > > just lookup (aka. run the program map again to get the map entry)
> > > and then update the multi-mount during the entry parse.
> > > 
> > > So while the change above isn't strictly the way this should be
> > > handled it probably should be ok.
> > > 
> > > I haven't worked out how to handle it immediately after the fail
> > > just yet but the change above probably should be kept as part of
> > > that as well, not sure yet.
> > > 
> > > Ian
> 
> I did that based on my greps, that seems to be a fairly common
> check. 
> However, it kind of felt wrong, in the sense that the 2nd attempt, 
> shouldn't depend on any previous status. I was just having trouble 
> trying to figure out the lifetime rules for the various
> fields/states.

Yes, the root of a multi-mount has all sorts of special case handling
in a number of places.

> 
> Thanks,
> Doug
> 

