Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCCB96C2860
	for <lists+autofs@lfdr.de>; Tue, 21 Mar 2023 03:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjCUC4M (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Mar 2023 22:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCUC4L (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Mar 2023 22:56:11 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F4F32E7A
        for <autofs@vger.kernel.org>; Mon, 20 Mar 2023 19:56:09 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id C4D8A5C00DD;
        Mon, 20 Mar 2023 22:56:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 20 Mar 2023 22:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1679367366; x=1679453766; bh=oUUbREiNXLPzWMeN/A8eCEjzNkp6cUriVWC
        d8eaC76A=; b=fEaFndkjHp80AHiKi2FBQ/wbIg9yxfrocwkpNWVYmFYfDoSC9TA
        Ae9OrZNgeN7t8qwvE5cQV7GMvzezqmvsgx+bfqhvm6fzN/7KEAQu/5kWdF8ltPJ5
        DkVHlUUZRhPGV1PCz+8TkQqnpCMJ0noJVJarevpcNQXTaXaOvD5bb34tOnQk7g1+
        aWC+B8cgrRbrNjQrsrAJrCiAyk7ChFPOjYCE75VMATpbS16xs+dkw0Sr7hzMyZ/i
        Cqe3R+9n6DWG80hJP6xqe0GjgNZ2RpChnqzjbFCiwIx+Mh0nLlggYXx20OgOv8dI
        2Lqf9hxrqWEWwFqpc4r9+5EV0XjfDZaYEIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679367366; x=1679453766; bh=oUUbREiNXLPzWMeN/A8eCEjzNkp6cUriVWC
        d8eaC76A=; b=qQb09Jq+I/bX/b2ExsPq+8JOaegqGuN/JJuUAzPYQ2bwEpVFhhT
        cz+Bo/d7whQCw/qluU77ADLGc5uHqfi97QYnzFmyvdri0d4dKrtyXbqcAxIIXNaw
        YVYScHjQD5mI972khJyYjNjhydyGrP0GtcrS8spAaW+AYUU2nW5iYjOiAC8tssjs
        Oo/GXG+OLdLss/4+Rs1jdB1SXgprs6In4cQHb+u1ewp3ZQcfvc9uMoERKzcw4mv2
        4Pyo6Vx/wrECu+A5Qdd8KlZH4zcqlrXKlNbT0/U/eiLp62/GoH2tahgvSE+Sf/UM
        0Y7qKun0/SWbh0PgWjegBiKpA9lHHuwFYvg==
X-ME-Sender: <xms:xhwZZL8hhtmaHGi2dk8Ec2kUeLK-ks4kdA4y2L_xOOB_cpMsYdLzrA>
    <xme:xhwZZHsUeCYYkm8X6JwQDIS3MJ4Uh3AC3Ee6t9rIQq0RxuWfPgLcWObcsbJlkt8i2
    gwWhJVaRryQ>
X-ME-Received: <xmr:xhwZZJCSS8YeiwOrJD3it7PXJDyiDiByG_oxG7a57HA2ub2Wb4F8Inn4zK9ZZEZKSEkLU3WXNPweZ66kzjhKswCrQSnAeiVUZ32FYW33omOqd6dOLOgVow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefledghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtgfgfggesth
    hqredttderudenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgif
    rdhnvghtqeenucggtffrrghtthgvrhhnpefhgeeuvdeitedtleelgffgjeevgeffudegff
    evgeejjedttedtkedvudefffejgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:xhwZZHczfpUCp1dnAZn0bsmu8e6OA0u6I1OE2Zb3AC783ygVpZbU2A>
    <xmx:xhwZZAOY8OgqVNeX480Z4qrEpdhRbFy3ZwlmBH5-Eg5-vndEReOWRA>
    <xmx:xhwZZJkHrpSJlPZ12wzhT3ZgWdLbcMW2ejG-OJYg8W6pYqsM46ir2g>
    <xmx:xhwZZLY7vlSzai-_OKOy6yfD6dmEgZAUY1IeQZXoOXKHJoG_YGIghQ>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Mar 2023 22:56:05 -0400 (EDT)
Message-ID: <ee2c887ec0d62142063102cadda40a4ee8cc37e9.camel@themaw.net>
Subject: Re: Bug in try_remount()
From:   Ian Kent <raven@themaw.net>
To:     NeilBrown <neilb@suse.de>
Cc:     autofs@vger.kernel.org
Date:   Tue, 21 Mar 2023 10:56:00 +0800
In-Reply-To: <167936307307.8008.4763527658279935147@noble.neil.brown.name>
References: <167936307307.8008.4763527658279935147@noble.neil.brown.name>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2023-03-21 at 12:44 +1100, NeilBrown wrote:
>=20
>=20
> Hi,
> =A0I've been playing with automount and recently tried "kill -1" to get
> it
> =A0to re-read the config file.=A0 It crashed.
>=20
> =A0Crash happens in try_remount().
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0if (MM_PARENT(me)->key[0] =3D=3D '/') {
>=20
> MM_PARENT() is NULL.
> My guess is that MM_PARENT() is only non-NULL for offset mounts and
> the
> breakage was introduced in=20
> =A0Commit ba9fe0a (\"autofs-5.1.8 - fix incorrect path for is_mounted()
> in try_remount()\")
>=20
> The very latest patch.
> Prior to this patch it would only try MM_PARENT when type =3D=3D
> t_offset.
> Now it always accesses it.

Yes, I saw that.
In fact I have 35-40 unpublished (mostly) cleanup patches in my
patch queue.

I'm pretty sure this is ok for a fix.

autofs-5.1.8 - fix mount tree startup reconnect

From: Ian Kent <raven@themaw.net>

When reconnecting to an existing mount tree at startup trying to work
out if we created the mountpoint directory uses the parent path of the
current map entry.

But if the current map entry has no parent we should use the map entry
path.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |    8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 45fd9dde..1eab3d53 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -69,6 +69,7 @@
 - add command pipe handling functions.
 - switch to application wide command pipe.
 - get rid of unused field submnt_count.
+- fix mount tree startup reconnect.
=20
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/mounts.c b/lib/mounts.c
index ec28e2bc..8778caf1 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -2807,6 +2807,7 @@ static int remount_active_mount(struct
autofs_point *ap,
 int try_remount(struct autofs_point *ap, struct mapent *me, unsigned
int type)
 {
 	struct ioctl_ops *ops =3D get_ioctl_ops();
+	struct mapent *mapent;
 	const char *path;
 	int ret, fd;
 	dev_t devid;
@@ -2841,12 +2842,13 @@ int try_remount(struct autofs_point *ap, struct
mapent *me, unsigned int type)
 	}
=20
 	me->flags &=3D ~MOUNT_FLAG_DIR_CREATED;
+	mapent =3D IS_MM(me) ? MM_PARENT(me) : me;
 	/* Direct or offset mount, key is full path */
-	if (MM_PARENT(me)->key[0] =3D=3D '/') {
-		if (!is_mounted(MM_PARENT(me)->key, MNTS_REAL))
+	if (mapent->key[0] =3D=3D '/') {
+		if (!is_mounted(mapent->key, MNTS_REAL))
 			me->flags |=3D MOUNT_FLAG_DIR_CREATED;
 	} else {
-		char *p_key =3D MM_PARENT(me)->key;
+		char *p_key =3D mapent->key;
 		char mp[PATH_MAX + 1];
 		int len;
=20

