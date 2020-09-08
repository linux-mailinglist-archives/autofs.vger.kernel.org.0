Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01924260F0B
	for <lists+autofs@lfdr.de>; Tue,  8 Sep 2020 11:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgIHJyM (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 8 Sep 2020 05:54:12 -0400
Received: from mout.gmx.net ([212.227.17.22]:45959 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728876AbgIHJyI (ORCPT <rfc822;autofs@vger.kernel.org>);
        Tue, 8 Sep 2020 05:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1599558844;
        bh=FwoUF6fJ8eb5/7yecEZQSOOei+OvqGEzHscrj9YknzI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=UmLJza+KABrZxDy9D8VFFkZQWkYDWKDTKnBQUXit+5yn2xflx10Enk9YSqbe3baWX
         xNzbEc8kMCwLNo1kZsdCMnvFPTys4A/59F4MxDbPlq7XJR0V+4yPSiSRKlrtvfU0Mu
         QDErm8ORGh2wRJXZNq8IB+nJMPi56TgGfzPuhrEs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.154.203]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1kPFUP0Fzh-00CNxP; Tue, 08
 Sep 2020 11:54:04 +0200
Date:   Tue, 8 Sep 2020 11:54:02 +0200
From:   Helge Deller <deller@gmx.de>
To:     autofs@vger.kernel.org, Ian Kent <raven@themaw.net>
Subject: [PATCH] autofs: Fix crash in sun_mount()
Message-ID: <20200908095402.GA25766@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:/aGJfypCo93Kp3L9F6NRu2ZyqSJhfvTdUgwgbfRBGWoL9utgXIL
 ZWvU8+ftdN2/43rZ0yXUrpeOaNkDT1Z65w/ohAeDLSDwzeQzLIopUsF8mz8tR1ZZa9t4JGD
 LkbsT2CDJnBOMxg5ti7Q9gOGLtyPrcJ4QRMeGlN5awfrPsTY+NKzT9ZQ5tfU7+2QKUMLHHk
 8z5P+9znSfVwM9Ot9lqFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mWw6BvfnslI=:8/sRZByQeVQL8YWX4EWvPY
 0jBcmhd5suLE+/Zu+/WeKyfBBQs6O+f+hds5oYDnL6pVqMd9pBeyxJON/FT58oq2RXRS1WR6W
 P+Srx0a5NJOyUhkL8o5KivLBusw38MLQEW97JkD04Vww4K6ek42pHc825V4kmSB0z16boLTSt
 lt+RYzdDjqFRxgsV1SQG5cnle7kVhZTdbuC9a8SH/d/d1IF5ZcI2JxiLVflFjXmQ8AQXZO0SK
 2wQ8hkvGq9a5lpmjFsBqkLr8UbS4eWjIijUgbEhxhdoJuxU+FVFYTt5yinco4iiYsnNnAkXaa
 MhHygdrjPT155BpcNt3AiaPNPo+KEEwd+4KNi3Rx3yCPOMB2Pu31woOMY9uHpIVA5EEBoOVkD
 r+8b+MYWvxdNm3VIZPUk5dKy0+XTHWGs4Vra1Y5E820xZkjTBpkKNJhzWMtcMSBOMGG+683zH
 xkjf0HIxT0pUVwXvlwOhNsV0YAq++i9ed+BpNrCRue176AG3J51EJCKdSeSYawVLmyKZZSkQA
 py52KkeysCkzJOWYCJsV6iWyurj0PXifK0UjHt/hrEDHuf04dtcNlTcXtMGNw2gTWDi2nCcsI
 cDlOHw4jpS5UCds69UY/ib3BFCORxQrZO5eCeBa1aR5A8cCgM+2G+QYMg0sBDlCzW+xOPgSop
 +vRBi/0c7Ql9oE9U3vU2NMfI8VAv3AKPKx0GMidDtsOJpn5EfAFaliiX65BNW496xPsgVbtsb
 G8LkfzwXnSWPVPB2K6frLNygAWkfNaHn+HLFxjTJtdvid0kL4cEm9dShr94G4/fof6QpAcWim
 STV1qThi5xgyO1Lw0Cdgm7dpsnTPL3oscR7eGT2WINyq9zg9mwJJz6mYHjkzUu8dGc7eXVQbq
 c7b6qOWbzcV2fj6sIW4Pwbw7QddQDiARK8r9Lu9SNlhUhPLH8++yMRSxKDNB09O/OUT7LAukV
 wh2IyEgTbpTsvK+CQFF1FTINuNybheeYa4ryEHATVTa+5tgG1MUEFsMqVUUUOjzXLvMAvb6a9
 P9Eq1eBrnLciubGhmg/Slon4iiUHX/qcQyx9p9gOZJozVloa543F8TJKOPFC4ltOtXsCJRGjR
 c075QFgHNwrza4KjM6tzRjsU4k7lsPXenQSxflgplvbhjjc50btTl/+Tum3Qd3xAK5PeyMPQ0
 zS9C1H3I53jhmhR0Mn80u2UKPsPGsuIOS9S3qFP9DX3JAIfh+cZyeGbuF39SBuS/eQqUoLTJk
 U0B/Uo6njwFlsLT8f+O5UZcAOx/jgnEcXFoCpFKL8YdMamYqI3DCYgPOUHmFwiVfQd7TLDce1
 L3anmm4oyrn9z1KaU/JV/Yvw7tSCnRDb6UWbAB3/ZYug6wAw97bXBpPK1dg4OiO2NjJSLoct
Content-Transfer-Encoding: quoted-printable
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

In sun_mount() the the variable np gets initialized to an alloca()
memory area:
  np =3D noptions =3D alloca();
Later on, at the end of a loop, it may get accessed like this:
  *(np - 1) =3D '\0';

If np hasn't been increased in between those lines, this access triggers
an out-of-bounds access which overwrites stack area and on the parisc
architecture segfaults the automount executable as desribed in the Debian
bugzilla #892953.

The patch below adds the necessary check and thus fixes the crash.

Signed-off-by: Helge Deller <deller@gmx.de>
Bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D892953

diff -up ./modules/parse_sun.c.org ./modules/parse_sun.c
=2D-- ./modules/parse_sun.c.org	2020-09-08 09:13:03.843105425 +0000
+++ ./modules/parse_sun.c	2020-09-08 09:16:49.321534049 +0000
@@ -575,8 +575,9 @@ static int sun_mount(struct autofs_point
 		if (np > noptions + len) {
 			warn(ap->logopt, MODPREFIX "options string truncated");
 			np[len] =3D '\0';
-		} else
+		} else if (np > noptions) {
 			*(np - 1) =3D '\0';
+		}

 		options =3D noptions;
 	}
