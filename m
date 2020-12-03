Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1076D2CDA94
	for <lists+autofs@lfdr.de>; Thu,  3 Dec 2020 17:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbgLCQCJ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 3 Dec 2020 11:02:09 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47413 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgLCQCJ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 3 Dec 2020 11:02:09 -0500
X-Originating-IP: 95.182.196.44
Received: from mario.stefil.local (host-95-182-196-44.dynamic.voo.be [95.182.196.44])
        (Authenticated sender: filovitch@simpletech.be)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CCD2D20011
        for <autofs@vger.kernel.org>; Thu,  3 Dec 2020 16:01:27 +0000 (UTC)
Message-ID: <4aa8b6117c2a76cbbddc18a74626b98a0e6b0828.camel@simpletech.be>
Subject: autofs 5.1.6 : segfault at startup
From:   Jonathan Van den Broeck <filovitch@simpletech.be>
To:     autofs@vger.kernel.org
Date:   Thu, 03 Dec 2020 17:01:10 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

Sorry in advance if it is not the right place for this type a question,
I am tottally noob in mailing list.

I try to use autofs on Solus 4.1 (http://getsol.us). It seems there is
some problem with their package since version 5.1.3 and I want to help
to solve the issue but I cannot figure what is the problem. 

I have try on fedora without any problem so I compare two strace to see
the difference but it did not help me. It seems to crash when it need
to read the map file.

Here is a link the issue with the initial description of the problem
and a link to the source build of the package :
https://dev.getsol.us/T9026
https://dev.getsol.us/source/autofs/

SOLUS 4.1:
filovitch@solus ~/Downloads $ sudo automount -f -d -v
Starting automounter version 5.1.6, master map auto.master
using kernel protocol version 5.05
lookup_nss_read_master: reading master files auto.master
lookup_read_master: lookup(file): read entry /misc
Segmentation fault

filovitch@solus ~/Downloads $ sudo strace automount -f -d -v
...
openat(AT_FDCWD, "/etc/auto.master", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=1289, ...}) = 0
read(4, "#\n# Sample auto.master file\n# Th"..., 4096) = 1289
write(2, "lookup_read_master: lookup(file)"..., 50lookup_read_master:
lookup(file): read entry /misc) = 50
write(2, "\n", 1
)                       = 1
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=NULL} ---
+++ killed by SIGSEGV (core dumped) +++
Segmentation fault

FEDORA 33:
[filovitch@localhost ~]$ sudo strace automount -f -d -v
...
openat(AT_FDCWD, "/etc/auto.master", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=1289, ...}) = 0
read(4, "#\n# Sample auto.master file\n# Th"..., 4096) = 1289
write(2, "lookup_read_master: lookup(file)"..., 50lookup_read_master:
lookup(file): read entry /misc) = 50
write(2, "\n", 1
)
ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
brk(NULL)                               = 0x55d0336bc000
brk(0x55d0336de000)                     = 0x55d0336de000
...

--
filovitch

