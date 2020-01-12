Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E556138BAC
	for <lists+autofs@lfdr.de>; Mon, 13 Jan 2020 07:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733291AbgAMGKt (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 13 Jan 2020 01:10:49 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:2848 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgAMGKs (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 13 Jan 2020 01:10:48 -0500
IronPort-SDR: VnYUoEZ/GimcgI5/bLxiCMAn+0ppUsV2XgmJXCaIeKQBeGdPj4U6si+CJ2gdQ2EfcWMAUYc6Ez
 M+Dk0mTfCgBw==
IronPort-PHdr: =?us-ascii?q?9a23=3AP7NYxBLzeulljkirNtmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgeLfTxwZ3uMQTl6Ol3ixeRBMOHsqkC0bSH+PG6EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oMhm7rAHcusYSjId8N6081g?=
 =?us-ascii?q?bHrnxUdupM2GhmP0iTnxHy5sex+J5s7SFdsO8/+sBDTKv3Yb02QaRXAzo6PW?=
 =?us-ascii?q?814tbrtQTYQguU+nQcSGQWnQFWDAXD8Rr3Q43+sir+tup6xSmaIcj7Rq06VD?=
 =?us-ascii?q?i+86tmTgLjhCEAOzAk7G7YkMlwjaJCrB+/oBx/2ZbUYIaPNPVkYqPSY8oWSn?=
 =?us-ascii?q?RHXspISyFBHp+8YJETAOoBI+lYqpfyp10SrRenGwasAvrjxDhPhn/ww6I70/?=
 =?us-ascii?q?0tHh/A3Ac9G94DvmjYoMnwOKoUTOu7zrTHzS/bYv1Y2Tn98pbGfBM8r/6DQb?=
 =?us-ascii?q?1+ftHcyVUtGgzZklmctZDpMy2T2+8Qs2ab9e1gVee3hmA9tQ5xviagxt0xgY?=
 =?us-ascii?q?bJgYIVzF/E/jh+zYYtO9K4VFB0YcSqEZtXsSGaOJB7QsM5Q25zpCk20KEJuZ?=
 =?us-ascii?q?m+fCQQyJQnxAfSZvqaeIaL+hLuTPidLSp6iX5/Zb6yiQq+/VK+xuDzTMW53l?=
 =?us-ascii?q?ZHoyxYmdfWrH8NzQbc6s2fR/t4+UeuxCiA2hjI6uFBPUA0ja3bK4M9wrIolp?=
 =?us-ascii?q?ocr0DDHijulUXzlqCWd0Ek+vK25OTjfrnrqYWQN5Fzig7jKKsulMu/AeImPQ?=
 =?us-ascii?q?QUQWeb4vyw1Lzl/ULnXLVHluM6nrTbvZzAOMgWqLK1DxVL3oss8RqyATer3M?=
 =?us-ascii?q?wdnXYdLVJFfByHj5LuO1HLOP34Femwg0iynzdxyfHGObvhAprWI3jDi7fuZq?=
 =?us-ascii?q?py51RAxwo0yNBT/ZJUCrIZLPLpRkDxrMDYDgM+MwGs2ennFcl91oQQWWKUGa?=
 =?us-ascii?q?KZLqzSvkGS5u41IOmDepUVuDDjJPgh/fLuimU5mVBONZWuiJIKdHe2Bdx4LE?=
 =?us-ascii?q?iDJ3nhmNEMFSENpAVtduHyjEy+Vmtramq/ReoD4Tc0QNa+AJvOXJ+qhrOB3y?=
 =?us-ascii?q?egFJZ+aWVPC1TKGnDtIdaqQfAJPRqfPsJ72gMDU7fpH5csyRy0qwj8xJJnNe?=
 =?us-ascii?q?DfvCYfsNTj144mtKXoiRgu+GktXIym2GaXQjQvxjsF?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GUIwDtCBxemCMYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBewIBGAEBgS6BTVIgEpNQgU0fg0OLY4EAgx4?=
 =?us-ascii?q?VhggTDIFbDQEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhA?=
 =?us-ascii?q?BAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgks?=
 =?us-ascii?q?BATOcXgGNBA0NAoUdgjIECoEJgRojgTYBjBgagUE/gSMhgisIAYIBgn8BEgF?=
 =?us-ascii?q?sgkiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4ROgX2?=
 =?us-ascii?q?jN1eBDA16cTMagiYagSBPGA2IG44tQIEWEAJPiS6CMgEB?=
X-IPAS-Result: =?us-ascii?q?A2GUIwDtCBxemCMYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBewIBGAEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbDQEBA?=
 =?us-ascii?q?QEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNCwYph?=
 =?us-ascii?q?UqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOcXgGNBA0NA?=
 =?us-ascii?q?oUdgjIECoEJgRojgTYBjBgagUE/gSMhgisIAYIBgn8BEgFsgkiCWQSNQhIhg?=
 =?us-ascii?q?QeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4ROgX2jN1eBDA16cTMag?=
 =?us-ascii?q?iYagSBPGA2IG44tQIEWEAJPiS6CMgEB?=
X-IronPort-AV: E=Sophos;i="5.69,427,1571695200"; 
   d="scan'208";a="323833362"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 13 Jan 2020 07:10:47 +0100
Received: (qmail 6762 invoked from network); 12 Jan 2020 02:27:31 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <autofs@vger.kernel.org>; 12 Jan 2020 02:27:31 -0000
Date:   Sun, 12 Jan 2020 03:27:30 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     autofs@vger.kernel.org
Message-ID: <26529379.10889.1578796051114.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

