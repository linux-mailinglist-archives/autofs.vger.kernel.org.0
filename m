Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106B23E2AFC
	for <lists+autofs@lfdr.de>; Fri,  6 Aug 2021 14:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243161AbhHFMy1 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 6 Aug 2021 08:54:27 -0400
Received: from vps.wizdom.nu ([51.222.156.179]:54452 "EHLO mail.wizdom.nu"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231954AbhHFMy1 (ORCPT <rfc822;autofs@vger.kernel.org>);
        Fri, 6 Aug 2021 08:54:27 -0400
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Aug 2021 08:54:26 EDT
Received: from mail.wizdom.nu (localhost.localdomain [127.0.0.1])
        by mail.wizdom.nu (Proxmox) with ESMTP id 563E842153
        for <autofs@vger.kernel.org>; Fri,  6 Aug 2021 14:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wizdom.nu; h=cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:message-id:mime-version:reply-to:subject:subject:to:to; s=
        mail; bh=HsLTG7jBG1F7FnvgYNQt1P/p1+2JeXG9oIoiVZOF7LU=; b=heARHtT
        CxFzRwz0feC3TdmTpJZgpcdO8Yr7VmVtE5nGjAmVpd1jrbXckMDRpQSiFJqFg9ai
        Hk7m64X1IX/C4eLxz72uZWttTRQ7EV4gvXM9o+RjidXzDZ13waMXAm5b6un+69+3
        m55aNB7rRO/esEXlaeFJIffkPJHlDV/iTLBSLyXSygFg3sB97osKnECo/86qm3aZ
        IhBp6rhD+LjiAr3J6BkL4U8OUfO6FS2tpx2maxSNY5eLvW7FbzLUIqkMyz9erhY0
        e1omW3Oq3m/f5b6aPozurw5KmlBPYteueaedMWEj5pvKklx8amqWrlU8NV6k4o3y
        p4kLv0CzekGBjkQ==
From:   Sietse van Zanen <sietse@wizdom.nu>
To:     "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Subject: autofs & glibc 2.34
Thread-Topic: autofs & glibc 2.34
Thread-Index: AQHXisCgqJS3by9nT0WvFZys77aXCw==
Date:   Fri, 6 Aug 2021 12:46:07 +0000
Message-ID: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.21.2]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Autofs no longer compiles with newest glibc 2.34. From the changelog:

When _DYNAMIC_STACK_SIZE_SOURCE or _GNU_SOURCE are defined,
PTHREAD_STACK_MIN is no longer constant and is redefined to
sysconf(_SC_THREAD_STACK_MIN). This supports dynamic sized register
sets for modern architectural features like Arm SVE.


This is causing compilation error in daemon/automount.c line 87:

size_t detached_thread_stack_size =3D PTHREAD_STACK_MIN * 144;


