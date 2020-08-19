Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52DB324A5D5
	for <lists+autofs@lfdr.de>; Wed, 19 Aug 2020 20:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgHSSTD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 19 Aug 2020 14:19:03 -0400
Received: from mail.nimbios.org ([160.36.130.228]:43287 "EHLO mail.nimbios.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbgHSSTD (ORCPT <rfc822;autofs@vger.kernel.org>);
        Wed, 19 Aug 2020 14:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nimbios.org
        ; s=20190215; h=true; bh=hKKmQX2f8c08/xtb7tRZZLvIILKseJPblvNg0oaAK3s=; b=ROyo
        HQtqPeQYpeIykCmlJDZ/NAkTlakKQqJpYu6X/4qduu62DveAyH7qBkCr1uIVzSnkAF8OyBha+mECI
        FtT3So7EAKv1uSFvegvrXC5rJT/gPsuF0M/+roux43SubejUcJ4wARjxZFrvdDGwLipF/M/c6vcwH
        OaJd/W/okYM9E=;
Received: from [69.73.114.204] (helo=bash)
        by mail.nimbios.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <peek@nimbios.org>)
        id 1k8Sft-0000Wl-MH; Wed, 19 Aug 2020 14:19:01 -0400
Message-ID: <7eea934d8fb01ffdef05fb61880cfd6dc767b36e.camel@nimbios.org>
Subject: Bug in samples/autofs.schema file
From:   Michael Peek <peek@nimbios.org>
To:     autofs@vger.kernel.org
Date:   Wed, 19 Aug 2020 14:18:30 -0400
Content-Type: multipart/mixed; boundary="=-R2G++irxPXz1nKWmH7rt"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--=-R2G++irxPXz1nKWmH7rt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This bug starts with version 5.1.3, and continues up to and including
the latest 5.1.6.  Version 5.1.2 was fine.

When slapd is invoked while including the sample LDAP schema file
autofs.schema, slapd will crash with the following error:

5f359370 /<path-to>/autofs.schema: line 14 attributetype: 
AttributeType inappropriate matching rule: "caseExactMatch"

The problem is on line 13, which reads:

  EQUALITY caseExactMatch

It should read:

  EQUALITY caseExactIA5Match

Attached is a patch that will make the necessary change to
samples/autofs.schema that works for all versions 5.1.3 to 5.1.6.

Thanks,

Michael Peek

--=-R2G++irxPXz1nKWmH7rt
Content-Disposition: attachment; filename="autofs-5.1.3-ldap-schema-fix.diff"
Content-Type: text/x-patch; name="autofs-5.1.3-ldap-schema-fix.diff"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtdXIgYXV0b2ZzLTUuMS4zLm9yaWcvc2FtcGxlcy9hdXRvZnMuc2NoZW1hIGF1dG9mcy01
LjEuMy9zYW1wbGVzL2F1dG9mcy5zY2hlbWEKLS0tIGF1dG9mcy01LjEuMy5vcmlnL3NhbXBsZXMv
YXV0b2ZzLnNjaGVtYQkyMDE3LTA1LTIzIDIyOjE2OjU5LjAwMDAwMDAwMCAtMDQwMAorKysgYXV0
b2ZzLTUuMS4zL3NhbXBsZXMvYXV0b2ZzLnNjaGVtYQkyMDIwLTA4LTE5IDExOjQ3OjU0LjA3NTY2
MjI2MyAtMDQwMApAQCAtMTAsNyArMTAsNyBAQAogCiBhdHRyaWJ1dGV0eXBlICggMS4zLjYuMS40
LjEuMjMxMi40LjEuMiBOQU1FICdhdXRvbW91bnRJbmZvcm1hdGlvbicKIAlERVNDICdJbmZvcm1h
dGlvbiB1c2VkIGJ5IHRoZSBhdXRvZnMgYXV0b21vdW50ZXInCi0JRVFVQUxJVFkgY2FzZUV4YWN0
TWF0Y2gKKwlFUVVBTElUWSBjYXNlRXhhY3RJQTVNYXRjaAogCVNZTlRBWCAxLjMuNi4xLjQuMS4x
NDY2LjExNS4xMjEuMS4yNiBTSU5HTEUtVkFMVUUgKQogCiBvYmplY3RjbGFzcyAoIDEuMy42LjEu
NC4xLjIzMTIuNC4yLjMgTkFNRSAnYXV0b21vdW50JyBTVVAgdG9wIFNUUlVDVFVSQUwK


--=-R2G++irxPXz1nKWmH7rt--

