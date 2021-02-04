Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A5330E976
	for <lists+autofs@lfdr.de>; Thu,  4 Feb 2021 02:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbhBDBbz (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 3 Feb 2021 20:31:55 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56509 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232478AbhBDBby (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 3 Feb 2021 20:31:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5C6185C013F;
        Wed,  3 Feb 2021 20:30:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 03 Feb 2021 20:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        5+FKYYC9yvxBf2Kxchaq2UbFIqxVXpEL327mLdeDZy4=; b=VezEbh0A4OXx/S1z
        EVhW0aqEQ7aiDw9huZJm5h82tfO4LiS5oGaSRSzHYf+W3hLzEqKYeEyw3EtLZxC8
        P6kpr3HkEXhla/2hHHF4TgfhlP+a5XciVaQ5N+mBXtPr905f0LANk2TzYO11+aiy
        DHjuvh6t5okW8/GA5xWxrN7VOZIS3UMtbK5I5V2o6z/nwz1HPx8/JDi/bw+Bop+8
        1b/5SdDvpiZOksJnVdFSMOa+GieSLvq3rwYuputEEQ2ogJqK9SwdgQ8eTq1t2vVH
        sPpAzevnvt7XYNOT0MKUiGNWwjb8NqWhf9o3wMmz9eEU5S1yK1da3vezm1sxubdM
        ik71Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=5+FKYYC9yvxBf2Kxchaq2UbFIqxVXpEL327mLdeDZ
        y4=; b=rFTQxMK7Z61zQ3u5F6DEDiXwSc1Q13B5EBSLzNJc7YVM/haLkVKDwSDoZ
        1NSTdSmDExWxJdRbOJPQZ9jMgFsSv0yARScFfZo7pAJ8otrjadnZpJRdtIQA0dv5
        MVllv3HLrKQGbDi2gGVVMe+R9jJXmXhvL+a52hq/fF/ZF0s9G6f2++IL5BkZ8fAk
        ZB/PeJ2PnwAz3h7fvwq9w4jHwM5Eg8m9RMGzjUE4K6NCCGu0bVzd/Z/VWUZ/+SHJ
        6eZFkToc4J2Q0G3ImMm2y8aCX3TpdX8Lc+JKV/NrYCgGAgTxbMdJGFvxzMYnI7V4
        +haiZZm6PYockwiMeX0HKm8N/0xJA==
X-ME-Sender: <xms:R04bYL0f8v58S-p-ZLmvAW2DKw3HCgw8SIIXqDbmGNB0rVxr98GZQg>
    <xme:R04bYKFtzYUAbT6lMNNFDwglcx78raZIpaiRN2kNQ1MsRVcEs8b_-A7xIp59Z-D8V
    h7gvXrX-wIr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeefgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecukfhp
    pedutdeirdeiledrvdegledruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:R04bYL6rwi6NCt20ugYzdpXRJ4RSiJbUBgn7gIzZDHbqmh7F393hJQ>
    <xmx:R04bYA1AOyuvSLvUBsb9uiB8OLD-bxQirMIkhzdQ366fGwhV6FWt2Q>
    <xmx:R04bYOG3BTJwnwkDU_yLllwYKeTeOeDVg-i9-3fH2a19kEgoLn4aOQ>
    <xmx:SE4bYCTljcSazfRrlNkixCWH0l54WjnBKJTGDLMw_c8-T93f5TmiQA>
Received: from mickey.themaw.net (106-69-249-105.dyn.iinet.net.au [106.69.249.105])
        by mail.messagingengine.com (Postfix) with ESMTPA id BF2D11080059;
        Wed,  3 Feb 2021 20:30:46 -0500 (EST)
Message-ID: <b933de18ebd657ea9f00ef6c7d7781812c477d2a.camel@themaw.net>
Subject: Re: [PATCH] Fix option for master read wait
From:   Ian Kent <raven@themaw.net>
To:     Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org
Date:   Thu, 04 Feb 2021 09:30:41 +0800
In-Reply-To: <20210203154823.2ylti4ksqbpvpesh@fiona>
References: <20201023135941.ednsszxsvgwv65k2@fiona>
         <20210203154823.2ylti4ksqbpvpesh@fiona>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Wed, 2021-02-03 at 09:48 -0600, Goldwyn Rodrigues wrote:
> Hi Ian,
> 
> Any feedback on this? The fix is not included in 5.1.7.

I'm pretty sure I didn't see this.

It's not you it's me, I use Evolution and it's broken, not sure
what I'm going to do about it since it has some bits I want that
I haven't seen in other email clients.

The change looks fine, I'll apply it to my local repo.

I have a couple of other patches against 5.1.7 already and once
I've confirmed they are good to go I'll push them and this one
to the upstream repo. so at least it is available (and then must
be included in the next release).

Sorry about this.
Ian
 
> 
> Reproduction scenario:
> 
> # automount -M 2 -d -f
> Segmentation fault (core dumped)
> 
> On  8:59 23/10, Goldwyn Rodrigues wrote:
> > master wait expects a value, and if provided automount crashes with
> > the
> > following trace:
> > 
> > #0  __GI_____strtoul_l_internal (nptr=0x0, endptr=0x7fffffffe120,
> > base=0, group=<optimized out>,
> >     loc=0x7ffff77a63a0 <_nl_global_locale>) at
> > ../stdlib/strtol_l.c:292
> > #1  0x0000555555562c52 in getnumopt ()
> > #2  0x0000555555564ec0 in main ()
> > 
> > This is because the options string is not correct and does not
> > expect
> > an argument for master wait (M), which sets optarg to NULL
> > 
> > Fixes: e68f07f ("autofs-5.1.2 - add master read wait option")
> > Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > 
> > diff --git a/daemon/automount.c b/daemon/automount.c
> > index 0391bfb..c2a0f58 100644
> > --- a/daemon/automount.c
> > +++ b/daemon/automount.c
> > @@ -2219,7 +2219,7 @@ int main(int argc, char *argv[])
> >  	time_t timeout;
> >  	time_t age = monotonic_time(NULL);
> >  	struct rlimit rlim;
> > -	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFM";
> > +	const char *options = "+hp:t:vmdD:SfVrO:l:n:CFM:";
> >  	static const struct option long_options[] = {
> >  		{"help", 0, 0, 'h'},
> >  		{"pid-file", 1, 0, 'p'},

