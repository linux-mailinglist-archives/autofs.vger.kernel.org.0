Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7157611DC0B
	for <lists+autofs@lfdr.de>; Fri, 13 Dec 2019 03:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfLMCTC (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 12 Dec 2019 21:19:02 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35199 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727084AbfLMCTC (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 12 Dec 2019 21:19:02 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 51BAA21340;
        Thu, 12 Dec 2019 21:19:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 12 Dec 2019 21:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        wyVeFmRcfASUgjO/u4Udi58tUPKuOC+4TeGWplrexrs=; b=WVVuNdNmM1Zj3Wg4
        p6M82yeQxfkxNHdkp6+fBcogLUotDguYmDIgxICUWir7D2wZ/D8HnbTKrN4jXa4s
        BZW2AuNrpHfaFnZ30oDOjlojHPSSI9PT1t1V3XE04QcNussU1FzFQPvYkiF9bKX7
        a/ok2bWQKwft1w9Uq5PT25LYXfkv9tnCKVy6PJEOs6vujRgJAfX4vN3v0hNn/tOA
        eMMSV7B6q9CCtyxZjcw+RPkI7fqLvocIhESR0RcDAd53cLq5l2FfhmY1lMonhYYF
        9BatfROPQt02u6I3Q93SfCaIak3FP28WqsgO7T6IGPTEUhXHQIC9bvSaPyQy3xMB
        vLwRSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=wyVeFmRcfASUgjO/u4Udi58tUPKuOC+4TeGWplrex
        rs=; b=bWRDnwE2ZuawZst7wyZzQX6Egtdis5rYRF2gVd0tSGH5FvYXcE3+mFR6Q
        G34DZdXthGhl3f7JNJDAQA07Ptth6tsNkcbYHcfPDGyvwv0rCnsoT0pQQqG2h4dX
        NcYusCX132lpzIupeBqLj3xFnXF3RQGhWo0czhbFqUk+fIMpMf9lHRW44cT6J6b6
        kFH+miEfLq0hWefKJ3+NbUDw5ndwwjSwSlVAmCZE6UOp8g3ogJQSf7mIA6AK8sMw
        lwkzMbCJqzfbiEZrt+B46zHtj8JratzPQvYw4sQdKjAuAgDgZ8y7HMlNAIjYvFVI
        YqaZWbHAmC2WCnAyDrt3QacGhN9ew==
X-ME-Sender: <xms:FfXyXWwXOkBvtP5rNIw3lg1s_MSh63ZcYlTFxAA-XUjKSS-GvCjzxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtle
    drudekledrudelkeenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghm
    rgifrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:FfXyXUJZG_SABkKYYWt4EV9Keg-x7mWlhQ-uXvHf6c8DCS7SHcpnjA>
    <xmx:FfXyXdd-DPjjvvFjLacP_e0aa0XDsQrygNbkjAcPBu2e1PI1y6kM0w>
    <xmx:FfXyXcuUTIFmPd3aqxKJLzubCw57tBXSusqVsOYGvnR_y3mvg65U_g>
    <xmx:FfXyXdlfQ2C6L-9jGI-JiExKEU6G7InLujMvAtXeN78IFXYbIuQ-KQ>
Received: from mickey.themaw.net (unknown [118.209.189.198])
        by mail.messagingengine.com (Postfix) with ESMTPA id BEE86306029E;
        Thu, 12 Dec 2019 21:18:59 -0500 (EST)
Message-ID: <5fc61848a17c431d8b529b220e8c83ba9846f47e.camel@themaw.net>
Subject: Re: Failure of program map to recover after failure
From:   Ian Kent <raven@themaw.net>
To:     Doug Nazar <nazard@nazar.ca>, autofs@vger.kernel.org
Date:   Fri, 13 Dec 2019 10:18:55 +0800
In-Reply-To: <882530b92d107607777570d344d14f04f027a078.camel@themaw.net>
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
         <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
         <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
         <a4119d82-b722-1723-65f6-3e5550e5e62f@nazar.ca>
         <882530b92d107607777570d344d14f04f027a078.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-12-12 at 10:07 +0800, Ian Kent wrote:
> On Wed, 2019-12-11 at 05:54 -0500, Doug Nazar wrote:
> > On 2019-12-09 23:49, Ian Kent wrote:
> > > I also need to work out why you don't get caught by the negative
> > > map entry check that's meant to prevent multiple retries for a
> > > failing map entry for a configured time.
> > 
> > Sorry, I should have been more explicit. The several minute wait
> > was
> > to 
> > exceed the negative cache timeout. That part was working fine.
> > 
> > > > And even the entry delete below it should be ok because it will
> > > > just lookup (aka. run the program map again to get the map
> > > > entry)
> > > > and then update the multi-mount during the entry parse.
> > > > 
> > > > So while the change above isn't strictly the way this should be
> > > > handled it probably should be ok.
> > > > 
> > > > I haven't worked out how to handle it immediately after the
> > > > fail
> > > > just yet but the change above probably should be kept as part
> > > > of
> > > > that as well, not sure yet.
> > > > 
> > > > Ian
> > 
> > I did that based on my greps, that seems to be a fairly common
> > check. 
> > However, it kind of felt wrong, in the sense that the 2nd attempt, 
> > shouldn't depend on any previous status. I was just having trouble 
> > trying to figure out the lifetime rules for the various
> > fields/states.
> 
> Yes, the root of a multi-mount has all sorts of special case handling
> in a number of places.

I think this is what should be done.

Could you check and see if it behaves as required please, of course
the CHANGELOG hunk needs to be dropped.

autofs-5.1.6 - fix program map multi-mount lookup after mount fail

From: Ian Kent <raven@themaw.net>

For the case of a singleton multi-mount program map lookup following
a mount fail (and the negative timeout has passed) the lookup key is
what's expected for an indirect map key but the the root offset map
entry already exists. This causes autofs to think it has an incorrect
lookup key and it fails the lookup when it should take the opptunity
to delete and update the cache entry since it's not actually in use
yet.

Also, if a check is done to see if the lookup is for the root offset,
deleting the entry fails because it contains an offset so it doesn't
get updated.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG                |    1 +
 modules/lookup_program.c |    7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 981a0333..3c784d34 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,6 +1,7 @@
 xx/xx/2020 autofs-5.1.7
 - make bind mounts propagation slave by default.
 - update ldap READMEs and schema definitions.
+- fix program map multi-mount lookup after mount fail.
 
 07/10/2019 autofs-5.1.6
 - support strictexpire mount option.
diff --git a/modules/lookup_program.c b/modules/lookup_program.c
index fcb1af74..ca209488 100644
--- a/modules/lookup_program.c
+++ b/modules/lookup_program.c
@@ -646,7 +646,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
 				 name_len, ent, ctxt->parse->context);
 			goto out_free;
 		} else {
-			if (me->multi) {
+			if (me->multi && me->multi != me) {
 				cache_unlock(mc);
 				warn(ap->logopt, MODPREFIX
 				     "unexpected lookup for active multi-mount"
@@ -656,8 +656,11 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
 			cache_unlock(mc);
 			cache_writelock(mc);
 			me = cache_lookup_distinct(mc, name);
-			if (me)
+			if (me) {
+				if (me->multi)
+					cache_delete_offset_list(mc, name);
 				cache_delete(mc, name);
+			}
 			cache_unlock(mc);
 		}
 	}

