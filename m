Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34F7057A81A
	for <lists+autofs@lfdr.de>; Tue, 19 Jul 2022 22:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiGSUOe (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 19 Jul 2022 16:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiGSUOd (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 19 Jul 2022 16:14:33 -0400
X-Greylist: delayed 1128 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Jul 2022 13:14:32 PDT
Received: from queue02a.mail.zen.net.uk (queue02a.mail.zen.net.uk [212.23.3.234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E52E5406D
        for <autofs@vger.kernel.org>; Tue, 19 Jul 2022 13:14:32 -0700 (PDT)
Received: from [212.23.1.5] (helo=smarthost01c.sbp.mail.zen.net.uk)
        by queue02a.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <james@dingwall.me.uk>)
        id 1oDtJm-0001mQ-Pr
        for autofs@vger.kernel.org; Tue, 19 Jul 2022 19:55:42 +0000
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
        by smarthost01c.sbp.mail.zen.net.uk with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.90_1)
        (envelope-from <james@dingwall.me.uk>)
        id 1oDtJl-0004Jx-By
        for autofs@vger.kernel.org; Tue, 19 Jul 2022 19:55:41 +0000
Received: from localhost (localhost [IPv6:::1])
        by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 053244739C1
        for <autofs@vger.kernel.org>; Tue, 19 Jul 2022 20:55:41 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
        by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3_lIMul-0Zpv for <autofs@vger.kernel.org>;
        Tue, 19 Jul 2022 20:55:40 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
        by dingwall.me.uk (Postfix) with ESMTP id D1C2B4739BC
        for <autofs@vger.kernel.org>; Tue, 19 Jul 2022 20:55:40 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
        id BD6FA7AA; Tue, 19 Jul 2022 20:55:40 +0100 (BST)
Date:   Tue, 19 Jul 2022 20:55:40 +0100
From:   James Dingwall <james-autofs@dingwall.me.uk>
To:     autofs@vger.kernel.org
Subject: autofs 5.1.8: ldap+kerberos leads to automount hang [patch]
Message-ID: <20220719195540.GB2871950@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Cross reference: https://bugs.launchpad.net/ubuntu/+source/autofs/+bug/1982219

I recently upgraded an Ubuntu system from 20.04 to 22.04 at which point
autofs stopped working.  `automount -d -m -v -f` would hang without
printing the maps.  After adding some debug statements I traced this to
an unbalanced pthread_mutex_lock()/unlock() in sasl_do_kinit_ext_cc() of
modules/cyrus-sasl.c.  The patch attached this email resolved the problem
for me.

Thanks,
James

--WIyZ46R2i8wDzkSu
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="sasl_do_kinit_ext_cc-unbalanced-lock.diff"

diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
index ae046e0..c0b4743 100644
--- a/modules/cyrus-sasl.c
+++ b/modules/cyrus-sasl.c
@@ -721,6 +721,9 @@ sasl_do_kinit_ext_cc(unsigned logopt, struct lookup_context *ctxt)
 
 	debug(logopt, "Kerberos authentication was successful!");
 
+	status = pthread_mutex_unlock(&krb5cc_mutex);
+	if (status)
+		fatal(status);
 	return 0;
 
 out_cleanup_def_princ:

--WIyZ46R2i8wDzkSu--
