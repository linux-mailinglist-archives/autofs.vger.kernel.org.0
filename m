Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEAA142C03
	for <lists+autofs@lfdr.de>; Mon, 20 Jan 2020 14:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgATNYN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Jan 2020 08:24:13 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:35523 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgATNYN (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Jan 2020 08:24:13 -0500
Received: from mail-ot1-f72.google.com ([209.85.210.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andreas.hasenack@canonical.com>)
        id 1itWxe-0005yV-0j
        for autofs@vger.kernel.org; Mon, 20 Jan 2020 13:19:22 +0000
Received: by mail-ot1-f72.google.com with SMTP id b10so11020318otp.3
        for <autofs@vger.kernel.org>; Mon, 20 Jan 2020 05:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Mqp+B2NzDe2AbbwWEZUPUbg49+g3s61NAZqtPs+hJgk=;
        b=lY8bv7cUl77Hx5fJWOldYdy7NXP4pOX7KSEqYxXkOaC9rFG0a+0nyRgreDWCABGl0/
         EYh8LSwf3+0DbZb3nEgZ0JoLMdQUbW7F5sjZP89NvgQGIH92y7gsn5IbBVXC0bOwI6F0
         OuzKQ2sGHCzOESTrn4tjBYogmKPs/C/daVMsJVswJXaMgpXJb2dbjWBW1Vaa9MLrnTj7
         trdzEYoLcXNk/N2usUBtafdPBBBgQswRTwCUa8EqR/VR/eowjoE1VO0P5MUc9XEUyd4+
         2J4vzsdwEwKmKky43eHRzHVMYgKCmubXlsOp2xZCEV4a5Miy6WoTn+w/moQWd++fyyxb
         chSQ==
X-Gm-Message-State: APjAAAWNQ6h6Pdbdt5rdLkzSPte5UbCcDMemhJVRowQAx4XH/SFeIP54
        Kfo0z84LsNO/eJyxCg9cPXMXlIaNW7s8G+GsL1u7hpuBfIRu0p7lUCglJ9b7qFMR2IGIcaCsAV5
        ha/kaoze0uew0u/MROFLr9LacbkCScTV56aam/aIzKM634vj+aw==
X-Received: by 2002:a05:6830:20c5:: with SMTP id z5mr15491318otq.0.1579526360841;
        Mon, 20 Jan 2020 05:19:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7cJZA9UAw3mPE+ju3ZnzyUsjS4/Abg4H/K393lkGz0OhQ+7CG0KyjsXs1MX98IOLJzIf08gwRCtG7/yuOoio=
X-Received: by 2002:a05:6830:20c5:: with SMTP id z5mr15491300otq.0.1579526360515;
 Mon, 20 Jan 2020 05:19:20 -0800 (PST)
MIME-Version: 1.0
From:   Andreas Hasenack <andreas@canonical.com>
Date:   Mon, 20 Jan 2020 10:19:09 -0300
Message-ID: <CANYNYEHsD+X=X=C743CG4DJQ6CCEk5k0zcTKa1KGGu3KfPWCEw@mail.gmail.com>
Subject: [PATCH] Use pkg-config to detect libxml2
To:     autofs@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a1f2aa059c922369"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

--000000000000a1f2aa059c922369
Content-Type: text/plain; charset="UTF-8"

Hi there,

Debian dropped[1] xml2-config from libxml2-dev in experimental,
favoring the use of pkg-config instead. This caused some packages to
fail to build, autofs among them[2].

I'm submitting the attached patch for your consideration and
review/comments. I realize this is a distro change and shouldn't
affect autofs building when everything is installed from source,
unless libxml2 upstream decides to follow suit and drop xml2-config as
well.

Thanks!


1. https://salsa.debian.org/xml-sgml-team/libxml2/commit/53de4f8ae1469e9068a6ab341836e523324c64c3
2. https://bugs.debian.org/949055

--000000000000a1f2aa059c922369
Content-Type: text/x-patch; charset="US-ASCII"; name="pkg-config-libxml.patch"
Content-Disposition: attachment; filename="pkg-config-libxml.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k5mh61fl0>
X-Attachment-Id: f_k5mh61fl0

LS0tIGEvY29uZmlndXJlLmluCisrKyBiL2NvbmZpZ3VyZS5pbgpAQCAtMjExLDcgKzIxMSwxMCBA
QAogQUNfU1VCU1QoRU5BQkxFX0ZFREZTKQogCiAjIExEQVAgU0FTTCBhdXRoIG5lZWRzIGxpYnht
bCBhbmQgS2VyYmVyb3MKLUFGX0NIRUNLX0xJQlhNTCgpCitQS0dfQ0hFQ0tfTU9EVUxFUyhbWE1M
XSxbbGlieG1sLTIuMF0sLAorWworSEFWRV9MSUJYTUw9MAorXSkKIEFGX0NIRUNLX0tSQjUoKQog
CiBBQ19TRUFSQ0hfTElCUyhbdmVyc2lvbnNvcnRdLFtdKQpAQCAtMzQ1LDcgKzM0OCw3IEBACiAJ
ZmkKIGZpCiAKLUFDX1NVQlNUKFhNTF9GTEFHUykKK0FDX1NVQlNUKFhNTF9DRkxBR1MpCiBBQ19T
VUJTVChYTUxfTElCUykKIEFDX1NVQlNUKFNBU0xfRkxBR1MpCiBBQ19TVUJTVChIQVZFX1NBU0wp
Ci0tLSBhL01ha2VmaWxlLmNvbmYuaW4KKysrIGIvTWFrZWZpbGUuY29uZi5pbgpAQCAtMzYsNyAr
MzYsNyBAQAogCiAjIFNBU0wgc3VwcG9ydDogeWVzICgxKSBubyAoMCkKIFhNTF9MSUJTID0gQFhN
TF9MSUJTQAotWE1MX0ZMQUdTID0gQFhNTF9GTEFHU0AKK1hNTF9GTEFHUyA9IEBYTUxfQ0ZMQUdT
QAogU0FTTCA9IEBIQVZFX1NBU0xACiBMSUJTQVNMPSBATElCU0FTTEAKIFNBU0xfRkxBR1MgPSBA
U0FTTF9GTEFHU0AKZGlmZiAtLWdpdCBhL2FjbG9jYWwubTQgYi9hY2xvY2FsLm00CmluZGV4IGVj
MzYyYmIuLjMzNTYxYWEgMTAwNjQ0Ci0tLSBhL2FjbG9jYWwubTQKKysrIGIvYWNsb2NhbC5tNApA
QCAtMjcyLDM4ICsyNzIsNiBAQCBlbHNlCiBmaV0pCiBdKQogCi1kbmwgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KLWRubCBBRl9DSEVDS19MSUJYTUwKLWRubAotZG5sIENoZWNrIGZvciBsaWIgeG1sCi1kbmwg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KLUFDX0RFRlVOKFtBRl9DSEVDS19MSUJYTUxdLAotW0FDX1BBVEhf
UFJPR1MoWE1MX0NPTkZJRywgeG1sMi1jb25maWcsIG5vKQotQUNfTVNHX0NIRUNLSU5HKGZvciBs
aWJ4bWwyKQotaWYgdGVzdCAiJFhNTF9DT05GSUciID0gIm5vIgotdGhlbgotICBBQ19NU0dfUkVT
VUxUKG5vKQotICBIQVZFX0xJQlhNTD0wCi1lbHNlCi0gIEFDX01TR19SRVNVTFQoeWVzKQotICBI
QVZFX0xJQlhNTD0xCi0gIFhNTF9MSUJTPWAkWE1MX0NPTkZJRyAtLWxpYnNgCi0gIFhNTF9GTEFH
Uz1gJFhNTF9DT05GSUcgLS1jZmxhZ3NgCi0gIFhNTF9WRVI9YCRYTUxfQ09ORklHIC0tdmVyc2lv
bmAKLSAgWE1MX01BSk9SPWBlY2hvICRYTUxfVkVSfGN1dCAtZFwuIC1mMWAKLSAgaWYgdGVzdCAk
WE1MX01BSk9SIC1sZSA5OQotICB0aGVuCi0gICAgWE1MX01JTk9SPWBlY2hvICRYTUxfVkVSfGN1
dCAtZFwuIC1mMmAKLSAgICBpZiB0ZXN0ICRYTUxfTUlOT1IgLWxlIDk5Ci0gICAgdGhlbgotICAg
ICAgWE1MX1JFVj1gZWNobyAkWE1MX1ZFUnxjdXQgLWRcLiAtZjNgCi0gICAgICBpZiB0ZXN0ICRY
TUxfUkVWIC1sZSA5OTsgdGhlbgotICAgICAgICBBQ19ERUZJTkUoTElCWE1MMl9XT1JLQVJPVU5E
LDEsIFtVc2UgbGlieG1sMiB0c2QgdXNhZ2Ugd29ya2Fyb3VuZF0pCi0gICAgICBmaQotICAgIGZp
Ci0gIGZpCi1maV0pCi0KIGRubCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZG5sIEFGX0NIRUNLX0tSQjUK
IGRubAo=
--000000000000a1f2aa059c922369--
