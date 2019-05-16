Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B61C2062F
	for <lists+autofs@lfdr.de>; Thu, 16 May 2019 13:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfEPLsJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 16 May 2019 07:48:09 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34957 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727430AbfEPLsE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 16 May 2019 07:48:04 -0400
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 May 2019 07:48:04 EDT
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 11026346;
        Thu, 16 May 2019 07:42:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 16 May 2019 07:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        y2pXjgOgp3LkiSPJ4l33IulpmHwGEi2F3r0vcPSk01g=; b=a56HkdVRnEeIbRcu
        0gJ5iBwDc2+b8dOLLwpU9x8jnCcKqay6VRbqLyNpCtk3zeMRwlEsWqKWv8m8OMG0
        80qnFPjD/yjR1hwpE1Y3knFXZAZgoQlOPH2xhGN8Z0dVxzJMAsYW06J5np3/hwFU
        B0wABkgUS7Mi0wbxhzLa9LEEO5sEQKCTKYoVM1DQNw9LPkddvvQ1W2fXrdHlaHxu
        aXAFBAehVa/80kvHVdcUhWS8O152kmuwIgYcSrVfADeolrfb2lnvJl3WPuPQqX38
        7XSead0jRPbfHN3Z0IEWn+qH4htEAUK2RQW6vbOMp3F5ZrwIQyq2z5+UwmfKYGE3
        nxd2bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=y2pXjgOgp3LkiSPJ4l33IulpmHwGEi2F3r0vcPSk0
        1g=; b=qDTPrEZYCMbsmujTknZ1EMaYrMI+ysyyTbZMOeDJXoG0PABY7ilbCf3UM
        eTuqKrGQLIURgpRVNHa5gXupyXpicsy11b76bPa+bbs3ML7jg5JiipbUchcom1eR
        o5i/w6/DJ/bEFxVVNdqrVSahXQgO5CRBGD7n1CubEb8LBouyNZovX88yNLbwL6bl
        rwTqyCDsNlhK0WPiXBvp08mRrgEuB1ZvzCMktaSo+PCWSLYeSccSuVUdVF6+JL3N
        haClpQMg8NDGdeBEAuO8Qm1XuyvNQuXczRNCZuYOtEzv/RekKzT2RvOB9CjAH/Qb
        MM9kYrXFktYmalajsyAukSTBymgyw==
X-ME-Sender: <xms:mEzdXDwnLRQeVGuh9Ji5JqYRAqcuHMO3z-GP8oumrfOn5dbIER_B_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddttddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftgfoggfgsehtje
    ertdertdejnecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecukfhppeduudekrddvtdekrdehiedrudduvdenucfrrghrrghmpehmrghilh
    hfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvghtnecuvehluhhsthgvrhfuihiivgep
    td
X-ME-Proxy: <xmx:mEzdXJr2Okn_5u8FiBTmePHbJAd8urum7ewo5RDukNjheQMHrt69lg>
    <xmx:mEzdXMa38o3xZjRufx2SXSzjp7zYEuuJFAcXY2zDYtz-Uoy2LWypGw>
    <xmx:mEzdXIDxcb8pfT_i6ed9hdvkmbGBktB_IydQ10288w2OfP4sIuI_GQ>
    <xmx:mEzdXGMhP4P2DwgDUh9nteOrkes4v4aco1nFdT6Uwgqw3A5JcLU9jg>
Received: from pluto.themaw.net (unknown [118.208.56.112])
        by mail.messagingengine.com (Postfix) with ESMTPA id A2A1680060;
        Thu, 16 May 2019 07:42:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id DA3731C0154;
        Thu, 16 May 2019 19:42:11 +0800 (AWST)
Message-ID: <6e26cbfa3b160a5befd1b1aff8b1eeae93ab864a.camel@themaw.net>
Subject: Re: Changes in indirect multi-maps don't become effective w/o
 autofs restart
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <list.autofs@drosera.ch>, autofs@vger.kernel.org
Date:   Thu, 16 May 2019 19:42:11 +0800
In-Reply-To: <5e0cd181-00c3-112e-20b1-1ba66f5931fa@drosera.ch>
References: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
         <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
         <5e0cd181-00c3-112e-20b1-1ba66f5931fa@drosera.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-05-16 at 12:53 +0200, Frank Thommen wrote:
> 
> On 5/16/19 3:01 AM, Ian Kent wrote:
> > On Wed, 2019-05-15 at 18:00 +0200, Frank Thommen wrote:
> > > Dear all,
> > > 
> > > the autofs manpages says:
> > > 
> > > "If  an  indirect  map  is modified then the change will become
> > > effective immediately.  If an indirect map uses the browse option, the
> > > master map contains direct mount maps or the auto.master map is modified
> > > then the autofs service control reload action must be rerun to activate
> > > the changes."
> > > 
> > > However this doesn't seem true when using multi-maps:
> > > 
> > > In /etc/auto.master:
> > > 
> > >       /base/data /etc/auto.data
> > > 
> > > 
> > > In /etc/auto.data:
> > > 
> > >      # section 1
> > >      #
> > >      p1  -fstype=nfs,vers=3,sec=sys  srv:/export/p1
> > >      p2  -fstype=nfs,vers=3,sec=sys  srv:/export/p2
> > > 
> > >      # section 2
> > >      #
> > >      others   -fstype=nfs,vers=3,sec=sys \
> > >         /p3   srv:/export/p2 \
> > >         /p4   srv:/export/p4
> > > 
> > > When adding an entry
> > > 
> > >      p5  -fstype=nfs,vers=3,sec=sys  srv:/export/p5
> > > 
> > > in section 1, I can immediately change into /base/data/p2 and it is
> > > mounted.  All well.  But when I add an entry
> > > 
> > >      /p5 srv:/export/p5
> > > 
> > > to section 2, then this new entry is not accessible as
> > > /base/data/others/p5 even after a `systemctl reload autofs`.  autofs has
> > > to be completely restarted.  Unfortunately we've had many issues
> > > (crashes) with clusterjobs accessing NFS shares during autofs restarts.
> > > That's why we'd like to avoid complete autofs restart whenever possible.
> > 
> > Yes, on restart there is a window of time where automounting won't
> > be happening.
> > 
> > That can be a problem and there's little I can do about it
> > but existing mounts should continue to function fine.
> > 
> > If you have an environment that's busy enough to get caught by
> > this then you have no choice but to avoid restarts.
> 
> I wouldn't have problems avoiding starts if the reload refreshed the 
> multi-mount maps.

Tell me more about the topology of your multi-mount map entries?
Perhaps you could use a direct mount map instead for these entries,
they should update fine on reload?

The problem you may have is that the paths can't be within an
indirect mount as the multi-mount entries.

> 
> 
> > > 
> > > Can you confirm that multi-maps are not updated by autofs reloads and/or
> > > is there a way to achieve this?
> > 
> > I call these multi-mounts because there's a different construct
> > I call multi-maps.
> 
> the autofs(5) manpage calls them "multi-map" in the "EXAMPLES" section 
> and "multi-mount map" in the "FEATURES" section.  That might be a point 
> for the "Future changes to documentation" thread?

Yes, I see that, I'll fix that.

Ian

