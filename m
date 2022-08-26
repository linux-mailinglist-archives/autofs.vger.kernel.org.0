Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D875A2383
	for <lists+autofs@lfdr.de>; Fri, 26 Aug 2022 10:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiHZItY (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 26 Aug 2022 04:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiHZItY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 26 Aug 2022 04:49:24 -0400
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F368AD5DE9
        for <autofs@vger.kernel.org>; Fri, 26 Aug 2022 01:49:22 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 89D6C1002AB
        for <autofs@vger.kernel.org>; Fri, 26 Aug 2022 18:49:18 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tf3fkKC4tgGg for <autofs@vger.kernel.org>;
        Fri, 26 Aug 2022 18:49:18 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 816F1100382; Fri, 26 Aug 2022 18:49:18 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id C56D8100317;
        Fri, 26 Aug 2022 18:49:16 +1000 (AEST)
Subject: [PATCH v2 0/4] Updated LDAP SASL bind series
From:   Ian Kent <raven@themaw.net>
To:     ThomasReim <reimth@gmail.com>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 26 Aug 2022 16:49:16 +0800
Message-ID: <166150296106.37723.4019530934770123921.stgit@donald.themaw.net>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I think the series looks good now and I believe your ok with the
changes I've made.

The series will sit in my patch queue until I commit them and push
them to the repo. I will most likely test the function of them too
but that will take a while to do.

Changes since v1:
- in do_bind() don't free the passed in result in ldap_parse_result(),
  explicitly handle the free in the function that declares the result
  variable, do_bind().
---

Thomas Reim (4):
      autofs-5.1.8 - restore gcc flags after autoconf Kerberos 5 check
      autofs-5.1.8 - prepare for OpenLDAP SASL binding
      autofs-5.1.8 - let OpenLDAP handle SASL binding
      autofs-5.1.8 - configure: LDAP function checks ignore implicit declarations


 CHANGELOG             |   4 ++
 aclocal.m4            |  52 +++++++++++++++
 configure             |  55 +++++++++++++++-
 configure.in          |   5 +-
 include/config.h.in   |   3 +
 include/lookup_ldap.h |   6 ++
 modules/cyrus-sasl.c  | 150 +++++++++++++++++++++++++++++++++++++++++-
 modules/lookup_ldap.c | 137 +++++++++++++++++++++++++++++++++++++-
 8 files changed, 408 insertions(+), 4 deletions(-)

--
Ian

