Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1FD517E3F2
	for <lists+autofs@lfdr.de>; Mon,  9 Mar 2020 16:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCIPvQ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 9 Mar 2020 11:51:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50425 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgCIPvQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 9 Mar 2020 11:51:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id a5so49380wmb.0
        for <autofs@vger.kernel.org>; Mon, 09 Mar 2020 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=R0FJ7AuCwLGOhq2BsVkVYXiqLzvz20kz1o7nEQ8KOVc=;
        b=Mq/ikUColBdnaQnZP5PViLMI/9n0Ec2b8p/28Ystbyi6x/whL6l63IxIPXTo/Ryp9u
         cLBBBo7Xq1Iu3wWRJTQntXY15btnQZqedhVHuvk8rxq9G3LnFKw9XOAzAq/wdDStU+jL
         Egi5pCIW/jxNegCD+4VDSA1/pK1g9APRebogw57xpybBaRKB9OK/9dEmUcfyPUig4AIo
         pOiPRsvrOkJM6cT9E/SIdsOgvL6SZhXzAh781OtIbA6+FyzSa9aG08s77nVKg+0maaC7
         oOgHU7NOQ/mSJWmYoLS+0rpFfMY8Aqu+OzRESj7OeYzmDfGPJZ0vW78vmzSzXPyDBWmI
         cGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=R0FJ7AuCwLGOhq2BsVkVYXiqLzvz20kz1o7nEQ8KOVc=;
        b=U752p5TfKjZgj2xraIKbCqxx89Ap2SXeve3QByKhdWd1sqVKRUH2iQWe+egqvVIleV
         rOSrymbGs2sAWg0c0d6zMpXbhJXHMg9ixWvE/ountdmB3Qg6Ti8TMhb04LCWBVxMmlO7
         mUWtFTLmVqPV4dhfmVWQoo8G0gM/RegM0EGuBdmnwyVncDLXeFcYvY7ppsEwC4/rFBj0
         1gFcpesrH7O68VwCLrWUpnEUlULKZ1qQDB+0sjbjaw3ezPiZDnsdHHNJrb5mhzOtBut3
         lroblUwZ2yGRO7HUCQ4XfIvxzIvYxYxRiIwf5D2k5bWCff+rrUE5OotYrd/LjjWsUkq4
         jYDg==
X-Gm-Message-State: ANhLgQ2aujdY+d3JDCoSwb+Rvr6LYXn1Uvwqljt7XISEhaFPavoVpykr
        SW6GCnyD9rpNGFQsoTmNApAH4Pzt
X-Google-Smtp-Source: ADFU+vsuYp50/YIdg0UZ0G0cLiWbN4XiZsMtp/ghzsZQBaj2s6YXMi8m3N2KTtRxMhPT3+mQxjRj2g==
X-Received: by 2002:a1c:5457:: with SMTP id p23mr21211236wmi.45.1583769073693;
        Mon, 09 Mar 2020 08:51:13 -0700 (PDT)
Received: from poirot.dhcp.lexmark.com ([192.146.101.90])
        by smtp.gmail.com with ESMTPSA id h3sm15670161wmi.41.2020.03.09.08.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:51:13 -0700 (PDT)
From:   Kyle Russell <bkylerussell@gmail.com>
To:     autofs@vger.kernel.org
Cc:     Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] samples: fix Makefile targets' directory dependencies
Date:   Mon,  9 Mar 2020 11:51:00 -0400
Message-Id: <20200309155100.21961-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Introduce an order-only prerequisite on dirs for targets that actually
use these directories to guarantee they exist at install time; otherwise,
the sample install commands can result in ENOENT in a parallelized make
invocation.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 samples/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/samples/Makefile b/samples/Makefile
index e7f242a..a505b1f 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -53,7 +53,7 @@ CONFIG = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/autofs.conf.orig || echo
 CEXISTS = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/autofs || echo "no")
 
 .PHONY: autofs.conf
-autofs.conf: autofs.conf.default
+autofs.conf: autofs.conf.default | dirs
 	@echo
 	@echo "Installing autofs default configuation in $(autofsmapdir)"
 	@if test -z "$(CONFIG)" ; \
@@ -76,7 +76,7 @@ CINIT = $(shell test -e $(INSTALLROOT)$(autofsconfdir)/autofs.orig || echo "-b -
 CIEXISTS = $(shell test -e $(INSTALLROOT)$(autofsconfdir)/autofs || echo "no")
 
 .PHONY: autofs.sysinit
-autofs.sysinit: autofs.init.conf
+autofs.sysinit: autofs.init.conf | dirs
 	@echo
 	@echo "Installing autofs init configuation in $(autofsconfdir)"
 	@if test -z "$(CINIT)" ; \
@@ -99,7 +99,7 @@ AUTH = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/autofs_ldap_auth.conf.orig
 AEXISTS = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/autofs_ldap_auth.conf || echo "no")
 
 .PHONY: autofs_ldap_auth.conf
-autofs_ldap_auth.conf:
+autofs_ldap_auth.conf: | dirs
 	@echo
 	@echo "Installing autofs ldap auth config \"autofs_ldap_auth.conf\" in $(autofsmapdir)"
 	@if test -z "$(AUTH)" ; \
@@ -122,7 +122,7 @@ MASTER = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.master.orig || echo
 MEXISTS = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.master || echo "no")
 
 .PHONY: auto.master
-auto.master:
+auto.master: | dirs
 	@echo
 	@echo "Installing autofs default master map in $(autofsmapdir)"
 	@if test -z "$(MASTER)" ; \
@@ -145,7 +145,7 @@ MISC = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.misc.orig || echo "-b
 IEXISTS = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.misc || echo "no")
 
 .PHONY: auto.misc
-auto.misc:
+auto.misc: | dirs
 	@echo
 	@echo "Installing autofs sample map \"auto.misc\" in $(autofsmapdir)"
 	@if test -z "$(MISC)" ; \
@@ -168,7 +168,7 @@ NET = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.net.orig || echo "-b --
 NEXISTS = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.net || echo "no")
 
 .PHONY: auto.net
-auto.net:
+auto.net: | dirs
 	@echo
 	@echo "Installing autofs sample map \"auto.net\" in $(autofsmapdir)"
 	@if test -z "$(NET)" ; \
@@ -191,7 +191,7 @@ SMB = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.smb.orig || echo "-b --
 SEXISTS = $(shell test -e $(INSTALLROOT)$(autofsmapdir)/auto.smb || echo "no")
 
 .PHONY: auto.smb
-auto.smb:
+auto.smb: | dirs
 	@echo
 	@echo "Installing autofs sample map \"auto.smb\" in $(autofsmapdir)"
 	@if test -z "$(SMB)" ; \
-- 
2.17.1

