Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DD62124D7
	for <lists+autofs@lfdr.de>; Thu,  2 Jul 2020 15:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgGBNgM (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 2 Jul 2020 09:36:12 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:38171 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgGBNgL (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 2 Jul 2020 09:36:11 -0400
Received: by mail-vs1-f49.google.com with SMTP id s20so7898292vsq.5
        for <autofs@vger.kernel.org>; Thu, 02 Jul 2020 06:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=C4GWCQimQbMcKjy0XoIdv8lGQvlV3DipdlJwpTHndxM=;
        b=TxM4u4kUzeQev9IBG/FX12ZNk4VeIcGAQqzV8vEgITb47yAjkupWb6SKJLaSnkogGq
         +zbeLFBkzz1ovhARJZ0uOR10fG/OZv8Ewy/DiQjDc7Tmt7nvinUk7F5k0ES6MyXYDCQW
         /DN5VCS5d4hXj4LBgFs0jYYQmFAYFEVFuWowsrezDN55s3MbL1NXrm81UQcNXvGXLkNV
         AsAZPIdMzIC2pMerZmDoeyhnjD7WMXT0YJW+DzffoNAbnWkKGInriNpOO4zdKS9jPmwf
         WB57mfcDEr634MX98Rw3Ydw0Ny9gG9KaWHw0ToUTp2t42N7QeiT8Ox7MMycKsCxHonh9
         UqkQ==
X-Gm-Message-State: AOAM530TkUNItL3HrzLg15j0At3i8QeRqcNWjYziZIEysq9gswGACoMj
        CznzcDz0qbbfAukuOjXMHXG9EaIrAuLikTQPlU1+Nzw4
X-Google-Smtp-Source: ABdhPJwdW6vdZVEX89/0aODNXo1vfZq7LZjigZ27nzM1hI17VL7OIx9X9/cSvzQh4fnERS/XPNk8ERI35nsHZLzn0NA=
X-Received: by 2002:a67:ec0f:: with SMTP id d15mr15031270vso.121.1593696970577;
 Thu, 02 Jul 2020 06:36:10 -0700 (PDT)
MIME-Version: 1.0
From:   Hugh McMaster <hugh.mcmaster@outlook.com>
Date:   Thu, 2 Jul 2020 23:35:57 +1000
Message-ID: <CAN9BcdsAD8L_SD6b6WR8odZwvc797cPFj3PE-nv=qxrUwkpWXw@mail.gmail.com>
Subject: [PATCH 1/3] configure.in: Only call PKG_PROG_PKG_CONFIG once
To:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi there,

configure.in currently calls PKG_PROG_PKG_CONFIG twice, but this isn't
necessary.

This patch removes the second call to the macro.

--- a/configure.in
+++ b/configure.in
@@ -134,7 +134,6 @@ AC_SUBST(flagdir)
 #
 # Use libtirpc
 #
-PKG_PROG_PKG_CONFIG()
 AC_ARG_WITH([libtirpc], AS_HELP_STRING([--with-libtirpc], [use
libtirpc if available]))
 if test "x$with_libtirpc" = "xyes"; then
   PKG_CHECK_MODULES([TIRPC],[libtirpc],[
