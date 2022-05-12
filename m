Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F285258B7
	for <lists+autofs@lfdr.de>; Fri, 13 May 2022 01:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359625AbiELXsq (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 12 May 2022 19:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238274AbiELXsn (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 12 May 2022 19:48:43 -0400
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 May 2022 16:48:40 PDT
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050:0:465::103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3A41C6C97
        for <autofs@vger.kernel.org>; Thu, 12 May 2022 16:48:40 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4KzpGC0F6xz9scr;
        Fri, 13 May 2022 01:41:55 +0200 (CEST)
From:   Clayton Craft <clayton@igalia.com>
To:     autofs@vger.kernel.org
Subject: [PATCH 0/1] fix segfault with automount -v
Date:   Thu, 12 May 2022 16:41:45 -0700
Message-Id: <20220512234145.18308-1-clayton@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

This addresses a segfault when running automount with -v, caused from
log.c calling pthred_getspecific on a key id that doesn't exist.
I'm fairly sure this is not the best way to fix this; specifically
there's still an opportunity for it to segfault again if
pthread_key_create fails and logerr() is invoked...

-Clayton

