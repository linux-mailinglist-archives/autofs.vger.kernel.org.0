Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3788F59B7D7
	for <lists+autofs@lfdr.de>; Mon, 22 Aug 2022 05:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbiHVDFG (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sun, 21 Aug 2022 23:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbiHVDFE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sun, 21 Aug 2022 23:05:04 -0400
X-Greylist: delayed 594 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 21 Aug 2022 20:05:03 PDT
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [121.200.0.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AE818373
        for <autofs@vger.kernel.org>; Sun, 21 Aug 2022 20:05:03 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 58C941004CA
        for <autofs@vger.kernel.org>; Mon, 22 Aug 2022 12:55:05 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id esq-OwSJxVxP for <autofs@vger.kernel.org>;
        Mon, 22 Aug 2022 12:55:05 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 3E8271002DB; Mon, 22 Aug 2022 12:55:05 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (180-150-90-198.b4965a.per.nbn.aussiebb.net [180.150.90.198])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 756B91002DB;
        Mon, 22 Aug 2022 12:55:03 +1000 (AEST)
Subject: [PATCH 0/4] Updated LDAP SASL bind series
From:   Ian Kent <raven@themaw.net>
To:     ThomasReim <reimth@gmail.com>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Mon, 22 Aug 2022 10:55:02 +0800
Message-ID: <166113608481.58093.9170369400839858971.stgit@donald.themaw.net>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

I've made a few changes, mostly to the do_bind() interact area.

I'm still a little unclear of what's going on there with ldap_res.

For example, ldap_sasl_interactive_bind() is called with ldap_res
as a parameter but it's passed by value so the caller can't see any
changes to it. Further down the call to ldap_result() is where it
imight get a value. So the question is, is ldap_res used in the call
to ldap_sasl_interactive_bind() on subsequent iterations?

I did some more white space changes, added some initializations, and
added a CHANGELOG entry.

Can you have a look and let me know if the changes I've made are ok
with you and that I haven't made any mistakes.

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

