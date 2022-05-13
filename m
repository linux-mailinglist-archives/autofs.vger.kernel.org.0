Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904D15268D1
	for <lists+autofs@lfdr.de>; Fri, 13 May 2022 19:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiEMRzb (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 13 May 2022 13:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiEMRza (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 13 May 2022 13:55:30 -0400
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CD9106A48
        for <autofs@vger.kernel.org>; Fri, 13 May 2022 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
        From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=PoHp7HD7Anje6e2NK2M4+VEhGS/zHnohB5u1Qec1uKI=; b=YRT1Yl1vNfyp5bob8+oFaL/J0H
        wM241xqSdCCAN0gsPWhzuSoKE2w6nYiTRNMsxKKYB9IAwwfUKfAuFJMbXfr2Zl7l/D9nZ7v0KKZ0C
        nML4fJobO2vl/c4XNublS+14ebCYtfwlZ9fwHwkkbrr3JgQCIeuFB5y9PTkLuFJglzQfnINSS4O06
        3kkUJ693bLFwghKydWcyYsLMAeJRhY+Lyb83j+31ZfTLQktnydJynu+O4Z1lKayC+j+jW2S3cJkfH
        SaoRHa/fVh7HYOGqmHBWWDEFXVyIdAOoL+TfLGgR3lFO2snKMCsZjnrNkpVO26GxIVotaILIE3vEP
        4Z9cJ7Yw==;
Received: from [50.39.161.152] (helo=localhost)
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
        id 1npZVc-0025bb-Su; Fri, 13 May 2022 19:55:25 +0200
Date:   Fri, 13 May 2022 10:55:11 -0700
Message-ID: <20220513105511.GB4656@librem14.craftyguy.net>
From:   Clayton Craft <clayton@igalia.com>
To:     Ian Kent <raven@themaw.net>
Cc:     autofs@vger.kernel.org
Subject: Re: [PATCH 1/1] daemon: initialize pthread key before attempting to
 log
In-Reply-To: <58e0486f7b646e0dbbbc5f2424b634f865d4573e.camel@themaw.net>
References: <20220512234145.18308-1-clayton@igalia.com>
 <20220512234145.18308-2-clayton@igalia.com>
 <58e0486f7b646e0dbbbc5f2424b634f865d4573e.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="kx9YUAvV5V4i7+sq"; micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--kx9YUAvV5V4i7+sq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAxMyBNYXkgMjAyMiAxMDoxNjo0MCArMDgwMCBJYW4gS2VudCA8cmF2ZW5AdGhlbWF3
Lm5ldD4gd3JvdGU6Cj4gT24gVGh1LCAyMDIyLTA1LTEyIGF0IDE2OjQxIC0wNzAwLCBDbGF5dG9u
IENyYWZ0IHdyb3RlOgo+ID4gRml4ZXMgYSBzZWdmYXVsdCB3aGVuIHJ1bm5pbmcgdGhlIGF1dG9t
b3VudCBkYWVtb24gd2l0aCAtdiwgd2hlcmUKPiA+IGxvZy5jOnByZXBhcmVfYXR0ZW1wdF9wcmVm
aXggY2FsbHMgcHRocmVhZF9nZXRzcGVjaWZpYyB3aGVuIG5vCj4gPiBrZXlfdGhyZWFkX2F0dGVt
cHRfaWQgZXhpc3RzLgo+IAo+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCBjb21taXQgYWI5NTcw
YmU3ZWU3IGFuZCBhZGp1c3QgdGhpcyBwYXRjaAo+IGFzIG5lZWRlZCBpZiBpdCBpcyBuZWVkZWQg
cGxlYXNlLgoKWWEgSSBoaXQgdGhlIHNlZ2ZhdWx0IG9uIHRoZSBsYXRlc3QgbWFzdGVyLCBzbyB0
aGF0IGNvbW1pdCBpcyBpbmNsdWRlZDoKCiQgZ2l0IGxnfGdyZXAgYWI5NTcwCiogYWI5NTcwYiAt
IGF1dG9mcy01LjEuOCAtIGF2b2lkIGNhbGxpbmcgcHRocmVhZF9nZXRzcGVjaWZpYygpIHdpdGgg
TlVMTCBrZXlfdGhyZWFkX2F0dGVtcHRfaWQgKDggZGF5cyBhZ28pIDxJYW4gS2VudD4KJCBDRkxB
R1M9Ii1nZ2RiICRDRkxBR1MiIG1ha2UgLWoxMiA+L2Rldi9udWxsCiQgZG9hcyBnZGIgLS1hcmdz
IGRhZW1vbi9hdXRvbW91bnQgLXYKR05VIGdkYiAoR0RCKSAxMS4yClJlYWRpbmcgc3ltYm9scyBm
cm9tIGRhZW1vbi9hdXRvbW91bnQuLi4KKE5vIGRlYnVnZ2luZyBzeW1ib2xzIGZvdW5kIGluIGRh
ZW1vbi9hdXRvbW91bnQpCihnZGIpIHIKU3RhcnRpbmcgcHJvZ3JhbTogL2hvbWUvY2xheXRvbi9z
cmMvYXV0b2ZzL2RhZW1vbi9hdXRvbW91bnQgLXYKClByb2dyYW0gcmVjZWl2ZWQgc2lnbmFsIFNJ
R1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4KMHgwMDAwN2ZmZmY3ZmJhOTZlIGluIF9fcHRocmVh
ZF9nZXRzcGVjaWZpYyAoaz0wKSBhdCBzcmMvdGhyZWFkL3B0aHJlYWRfZ2V0c3BlY2lmaWMuYzo3
CjcgICAgICAgc3JjL3RocmVhZC9wdGhyZWFkX2dldHNwZWNpZmljLmM6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkuCihnZGIpIGJ0CiMwICAweDAwMDA3ZmZmZjdmYmE5NmUgaW4gX19wdGhyZWFk
X2dldHNwZWNpZmljIChrPTApIGF0IHNyYy90aHJlYWQvcHRocmVhZF9nZXRzcGVjaWZpYy5jOjcK
IzEgIDB4MDAwMDdmZmZmN2Y0Y2Y5YyBpbiA/PyAoKSBmcm9tIC91c3IvbGliL2xpYmF1dG9mcy5z
bwojMiAgMHgwMDAwN2ZmZmY3ZjRkODM2IGluIGxvZ21zZyAoKSBmcm9tIC91c3IvbGliL2xpYmF1
dG9mcy5zbwojMyAgMHgwMDAwNTU1NTU1NTZjODUxIGluIG9wZW5fZm9wZW5fciAoKQojNCAgMHgw
MDAwN2ZmZmY3ZjUxZmU5IGluIGRlZmF1bHRzX3JlYWRfY29uZmlnICgpIGZyb20gL3Vzci9saWIv
bGliYXV0b2ZzLnNvCiM1ICAweDAwMDA1NTU1NTU1NjJjYzggaW4gbWFpbiAoKQooZ2RiKSBmIDAK
IzAgIDB4MDAwMDdmZmZmN2ZiYTk2ZSBpbiBfX3B0aHJlYWRfZ2V0c3BlY2lmaWMgKGs9MCkgYXQg
c3JjL3RocmVhZC9wdGhyZWFkX2dldHNwZWNpZmljLmM6Nwo3ICAgICAgICAgICAgICAgcmV0dXJu
IHNlbGYtPnRzZFtrXTsKCg==

--kx9YUAvV5V4i7+sq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkdOrrjmBP3eB7DeWSkztbX7flQoFAmJ+m38ACgkQSkztbX7f
lQpB1A/7Bcj6NH/PAbcyOF04fzd8clTpkzzFNHBYvSokz8xZ9gq0hky5QtPxFzJ9
dVgVzoxE4or2uxMVQOFYA7TWPWIyGY2tjZEZuhE6IIOEkxebL1lX03NnZXwpMS09
ZLeIRbliFbKc9k24hM9FJSQ9Lnh8lF+221zk+b8pdTybQtu149uI09JARIemuaZX
7wkkNV8/X6xmfREO1aixzS5fDfLvIMOOkuZUnl/xFh8IdGJcUSgoThxCmW0dBgh/
cTl36TvDJr6pIx6ejCq0Yca5SUVmOFmT3ebJ0V8K+/4AJ84CZppZAC4drzjeqElC
NJ5sF5Q8zSijrqhwFw2a+WhhuQ3pDTsOura8gxkPr7njPmvuypCtdmUqbPfmcR+Y
JfxgPuoGLJvody8rpc1yC79p/SxzP10nnMIJ4qVhYofLvw3k/qR8CGbv+DlbebEG
LpXrQMZFfC6uIlkb3DNJaXQCjY9ebf/CpXSlc3IcJF45v/CttSS3VyK/iv1JvbeV
5apjkVZHckOdZw4auvORqKWUbPfAooAmnOWVnv5FNRxEgcAEYGB+ghcnp9tG02Qw
ATs0DsyHjtfWCS7apt+TW8EgwoS1/maQwhk1fXWK1JjXla7XNzs/LdeLR1qPh9/z
uaHDRaPl7511N6a7aFVDI9JInMIW1LAzNZ93tw81nbXaWX0DbLg=
=KsdC
-----END PGP SIGNATURE-----

--kx9YUAvV5V4i7+sq--
