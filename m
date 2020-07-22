Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA4B229693
	for <lists+autofs@lfdr.de>; Wed, 22 Jul 2020 12:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgGVKrQ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 22 Jul 2020 06:47:16 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33409 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726146AbgGVKrQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 22 Jul 2020 06:47:16 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 710EF16A9;
        Wed, 22 Jul 2020 06:47:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 22 Jul 2020 06:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        bwgnWJ2Cn3MJ1J+AJhEH9yo2sySLr6ZmetVfI2k8NPQ=; b=CwICuldu57uoS3YO
        79GQDkcrWFLOz9YWGglJCpK0PyMACANdWE2HNlKMFgrcatfDkU+OmlzxPlKVlaqk
        jK2e11g2Teq8EbQlpwXSvQF6U4tlAylb87bf01Z+qcwxdirLeFpmTtchRbQvdNjE
        huRFM4LMdnpkWQjzDgzcs5IhNHTAg9r4/yEEIFOyahBu6PdbuTPvT9KO3DHADe4L
        HX7gBeDFsx4cpmYZWGr4Lzxt9ehEnVMTD+7namIhcMzEXT19sVXgi6ub6oMVkxjJ
        ipM4Qc80GApkfdqV/FMtPvWpyDvZuNQ1nDlIGBkKEIRgiZiW+xQAnIaStVd/Z1lo
        OMZdmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=bwgnWJ2Cn3MJ1J+AJhEH9yo2sySLr6ZmetVfI2k8N
        PQ=; b=guOki+jFf86umb00UtnqC7/FIkpghJdws0zirPLzYXTgcVt+ev2xOxBI+
        V03EyF2wSfZRRdSU0Aaox59EwsMHMQzyohDJZvPkgIVj159HVZDWY81dkPyyQoCO
        2YPeRrY+w/0IKb3avPp8UKZVndwmno0oz9sJ06430bU9nhg1Z+Jz6D1ok+AqEQbJ
        000WLQKNMygy1ZDTumfbyksnVr1LZJjdqHMCOs1bRP7RXivxsw7Ww5RKp1MrYvwk
        MWDQprmHOW2NUcoY2oHUkmC+egw7Lp5jjUYBGMGrGB/pKOSq0Ly5w4g/eklLRLTZ
        ou+ZPeJw56FyCKH5Rpvd3FYdsaPYg==
X-ME-Sender: <xms:MhkYX1ghWJ0tgzygB1SpiES45-SfHsj2s8FduYoWbUmpZK_d4Y6STg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgeelgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecukfhp
    peduudekrddvtdekrdefjedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:MhkYX6BekYF62uPlWaQpElznIkIRzuN7ZOmtKNuyEIoPl56rbHKX3Q>
    <xmx:MhkYX1FiybgGZGcqd5G2tCh9GZ45NcfrzP2PbDSoETu7U2RodtLYYQ>
    <xmx:MhkYX6QOo8GCBJfMjW8xE_iONSmxJQ7gPP1r9sp04EGdzpG5hCYtTw>
    <xmx:MxkYX6h_nynP5PzvkSfGy0ThV3aRWvd2wrDpB-qB71fNN6L7kSC4aA>
Received: from mickey.themaw.net (unknown [118.208.37.175])
        by mail.messagingengine.com (Postfix) with ESMTPA id B48933060067;
        Wed, 22 Jul 2020 06:47:13 -0400 (EDT)
Message-ID: <d4386747fe63381d14c208bf8bae52c8191835af.camel@themaw.net>
Subject: Re: [PATCH 3/3] Use PKG_CHECK_MODULES to detect libxml2
From:   Ian Kent <raven@themaw.net>
To:     Hugh McMaster <hugh.mcmaster@outlook.com>
Cc:     autofs@vger.kernel.org
Date:   Wed, 22 Jul 2020 18:47:10 +0800
In-Reply-To: <CAN9BcdtFhvEQB_mYzzPUDjR7EQVBsivsZPMTb7mg5JaB3qG_cw@mail.gmail.com>
References: <CAN9BcdtuGxQBNWhsCdhTjqw=jr5CoHvVFxD1Nw1k5o-xF0PSog@mail.gmail.com>
         <548d94a2ebfc9fe2f5f1c0d736346965b64d18c4.camel@themaw.net>
         <CAN9BcdtFhvEQB_mYzzPUDjR7EQVBsivsZPMTb7mg5JaB3qG_cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, 2020-07-20 at 22:39 +1000, Hugh McMaster wrote:
> Hi Ian,
> 
> On Mon, 20 Jul 2020 at 17:11, Ian Kent wrote:
> > On Thu, 2020-07-02 at 23:43 +1000, Hugh McMaster wrote:
> > >  # LDAP SASL auth needs libxml and Kerberos
> > > -AF_CHECK_LIBXML()
> > > +PKG_CHECK_MODULES([XML], [libxml-2.0], [
> > 
> > I think perhaps I will need to change [libxml-2.0] to
> > [libxml-2.0 libxml2] ... the Fedora package name.
> > 
> > It's not clear from the PKG_CHECK_MODULES man page if that's the
> > correct way to specify this and if a space separator is meant to be
> > used between package names.
> 
> That won't do what you think it should.
> 
> pkg-config has no concept of package names. It only reads information
> from module files installed in /usr/lib/pkgconfig or similar paths.
> 
> Developers pass the name of the required module (without .pc) to
> pkg-config. So, for libxml2, it's libxml-2.0, not libxml2.
> 
> Also, pkg-config (and its macros) treat space-separated module names
> as one argument. pkg-config will fail if it can't find any one of the
> specified modules.
> In this case, libxml2.

Ok, thanks for that.
I'll check the .pc file installed on Fedora.

Ian

