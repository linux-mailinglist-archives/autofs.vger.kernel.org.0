Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32C72890B1
	for <lists+autofs@lfdr.de>; Fri,  9 Oct 2020 20:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390346AbgJISXQ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 9 Oct 2020 14:23:16 -0400
Received: from mail.csu.ru ([195.54.14.68]:35495 "HELO mail.csu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
        id S1731198AbgJISXQ (ORCPT <rfc822;autofs@vger.kernel.org>);
        Fri, 9 Oct 2020 14:23:16 -0400
X-Greylist: delayed 684 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Oct 2020 14:23:06 EDT
Received: from webmail.csu.ru (webmail.csu.ru [195.54.14.80])
        (Authenticated sender: gmu)
        by mail.csu.ru (Postfix) with ESMTPA id 8FD8F146AD5;
        Fri,  9 Oct 2020 23:11:17 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.csu.ru 8FD8F146AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csu.ru; s=lso;
        t=1602267090; bh=EHyoM7tvrYOQrxF04FX0pRVRvphefdiNsT3iXJDpiBo=;
        h=Date:Subject:From:Reply-To:From;
        b=ayWnLYDpvscUZ+OIxKRVJ+6T0hFjm+IOEHNtctTiOSyRGvahloe7QQ20MTzGdIko7
         VMzuqqakKDSpUt+8W1B87EID11TgVWhzRH83NCUj2DsXcVeUuHv7IeFN5hP5C4jCPl
         8J+JVPz1FWVqsuKZo2f4H6pZKb5cZOp8ZWMCNi70=
Received: from 156.146.59.22
        (SquirrelMail authenticated user gmu)
        by webmail.csu.ru with HTTP;
        Fri, 9 Oct 2020 23:11:20 +0500
Message-ID: <280e695974a7e8d2b09d0946c35dff34.squirrel@webmail.csu.ru>
Date:   Fri, 9 Oct 2020 23:11:20 +0500
Subject: Vorschlag
From:   "Yi Huiman" <info@csu.ru>
Reply-To: info@huiman.cf
User-Agent: SquirrelMail/1.4.22
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
X-Priority: 3 (Normal)
Importance: Normal
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 159051 [Oct 09 2020]
X-KLMS-AntiSpam-Version: 5.9.11.0
X-KLMS-AntiSpam-Envelope-From: info@csu.ru
X-KLMS-AntiSpam-Auth: dmarc=none header.from=csu.ru;spf=softfail smtp.mailfrom=csu.ru;dkim=none
X-KLMS-AntiSpam-Rate: 70
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Info: LuaCore: 381 381 faef97d3f9d8f5dd6a9feadc50ba5b34b9486c58, {rep_avail}, {Tracking_content_type, plain}, {Prob_reply_not_match_from}, {Prob_to_header_missing}, {Prob_Reply_to_without_To}, {Tracking_susp_macro_from_formal}, csu.ru:7.1.1;195.54.14.80:7.1.2;webmail.csu.ru:7.1.1;huiman.cf:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, ApMailHostAddress: 195.54.14.80
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2020/10/09 16:54:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2020/10/09 00:29:00 #15463494
X-KLMS-AntiVirus-Status: Clean, skipped
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

ich habe ein Gesch=E4ft Vorschlag f=FCr dich.

