Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A9E11E93B
	for <lists+autofs@lfdr.de>; Fri, 13 Dec 2019 18:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfLMRa5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 13 Dec 2019 12:30:57 -0500
Received: from ny018.relay.arandomserver.com ([172.96.188.180]:32861 "EHLO
        ny018.relay.arandomserver.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbfLMRa5 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 13 Dec 2019 12:30:57 -0500
Received: from nyc006.hawkhost.com ([172.96.186.142])
        by se004.arandomserver.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <nazard@nazar.ca>)
        id 1ifomC-0003OI-TO; Fri, 13 Dec 2019 11:30:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nazar.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=o4SBbrGXV3lzk+KNy4ZreJUrUkZEBi9qIJ7/82U4SDs=; b=gsVtUiqHTzluPeOh9p8jvFc2cV
        k+Y9MHmO1gGi6UJ5OwKzD+r45y7vHB7kVxXCRKuYyYKcEV/jnFqrIp1t3aIsvZxl2/TwdpH+b6Ld+
        cGUrnDtXo8iv+06Vdj8flg/ltpb7xGu1zAVgetr0pJoZfTfsc8oWnp1lJfYBbk7RDmTsQi4AGVUIk
        M1LdNGWOkamGcvK9YUHDNgXfi4bgm9/TJAkZnZ0KLdpLxu9GKjEJrwMk+bNE/fmLjNLtCvrHoOAsY
        UJu6/JXwfgCLUDG8/Cvaj+i0imNsA90p5Q2zmeAkZrKF4+yPZ2RvcR/8CJcLJ2hERtmx3MGxrKIyx
        x2tKCyBA==;
Received: from [24.114.67.144] (port=32561 helo=[192.168.21.100])
        by nyc006.hawkhost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <nazard@nazar.ca>)
        id 1ifomC-0000ZS-Jf; Fri, 13 Dec 2019 12:30:52 -0500
Subject: Re: Failure of program map to recover after failure
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
 <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
 <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
 <a4119d82-b722-1723-65f6-3e5550e5e62f@nazar.ca>
 <882530b92d107607777570d344d14f04f027a078.camel@themaw.net>
 <5fc61848a17c431d8b529b220e8c83ba9846f47e.camel@themaw.net>
From:   Doug Nazar <nazard@nazar.ca>
Message-ID: <35e97997-ca6d-9936-cb80-dfa4843bf614@nazar.ca>
Date:   Fri, 13 Dec 2019 12:30:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101
 Thunderbird/72.0
MIME-Version: 1.0
In-Reply-To: <5fc61848a17c431d8b529b220e8c83ba9846f47e.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: nazard@nazar.ca
X-Originating-IP: 172.96.186.142
X-SpamExperts-Domain: nyc006.hawkhost.com
X-SpamExperts-Username: relay
Authentication-Results: arandomserver.com; auth=pass (login) smtp.auth=relay@nyc006.hawkhost.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fKZ8wcD78QFAaYhvfMzLIKpSDasLI4SayDByyq9LIhVYWE0SHCMp82T
 lHTKCP/a60TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K+Gp+X5kVVv8zurzuy5IYVNxG
 S9AVygilm7mQ464aH3JME+lO8B0uGlAKJ+QN2q77CNkMkPiMYC+wMzHEMLPorYJrNgzPr0uqK3ug
 HDw73sMA8cYjACAs+j94NvLRgDL8nFDQUbFURApy7esejekderdSYTX5uBMdCcmw6lv2UcA6L4bb
 C3LjdxFJDyottvPAc+4l84gBClgS15jvOaQcD2hfj9whi8KpGkNMaaLS9DIcqbdy+7WYS7ujrPXH
 qhox0HpT3S2SFmqVvJUoDpLg153GLC8mUuZ69ZuJHxVoTX8lp5kWpqCtCxi6IU2i/fYSDOGgD80z
 g3N4KhEW6qIBSBUdFqkFA+YKkUlydLh5cSaHt73jJKU44zPi+Pzpc9G5IrNVXM0dgsHxp8LhGCD5
 dtad27bIXajXXo8vXH+RaTv+rgVEacJBv1CPC7fpONadtHUijJVykBfF9R5cnDw9IpnLGL9oVuhN
 QBoDT12SU/9oh9VoIekQHpwUfpYnEThmwCT2zD7Wo0oNZ/JGqYJGP/gmB4lkQGfbLYTtlsVm4CUN
 gBPG8iTgPK5DFbDEW5DXn3jE/bR4oM4MZAZGavjiWu6M4SGS3IWISyEGC0BKDVoSyz/7RqAXoFeN
 sdzps4cFis+IEmb63Ayq5rQaVXTsXBzapcbJivbmY6S0iqVkT199t+st+dQ0R5w86Voc5fM21ra6
 ZDhmY8tz6pCyfAACzlz1pRXWhjh9fdbl44I0Df2uEfwO5P/stIl4eLZ4t5GSdp79NejQz9dAUlZ6
 qCRRGmWiHUsyroukQx3JkuiCiAsfPFg46jzk0wb+4gNa+rlVthRNgs7Ig4l/XErpYn3glfy9e5xB
 Og+K8Aict/CL+wlOjsylLdJ6uPxsl5jvHeHVQuh8azqvS+xl7zM6cjmBr8cv4ibvfd0VeYmt2Kro
 k4cWfpirH8g1GOR1IFGt5BWm
X-Report-Abuse-To: spam@se001.arandomserver.com
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 2019-12-12 21:18, Ian Kent wrote:
> I think this is what should be done.
>
> Could you check and see if it behaves as required please, of course
> the CHANGELOG hunk needs to be dropped.

I haven't noticed any new issues after applying the third hunk (second 
hunk being identical to what I already was testing).
Still recovers after a failure. I'll roll it out locally to the rest of 
my systems and see if anything crops up.

Doug

> autofs-5.1.6 - fix program map multi-mount lookup after mount fail
>
> From: Ian Kent <raven@themaw.net>
>
> For the case of a singleton multi-mount program map lookup following
> a mount fail (and the negative timeout has passed) the lookup key is
> what's expected for an indirect map key but the the root offset map
> entry already exists. This causes autofs to think it has an incorrect
> lookup key and it fails the lookup when it should take the opptunity
> to delete and update the cache entry since it's not actually in use
> yet.
>
> Also, if a check is done to see if the lookup is for the root offset,
> deleting the entry fails because it contains an offset so it doesn't
> get updated.
>
> Signed-off-by: Ian Kent <raven@themaw.net>
> ---
>   CHANGELOG                |    1 +
>   modules/lookup_program.c |    7 +++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/CHANGELOG b/CHANGELOG
> index 981a0333..3c784d34 100644
> --- a/CHANGELOG
> +++ b/CHANGELOG
> @@ -1,6 +1,7 @@
>   xx/xx/2020 autofs-5.1.7
>   - make bind mounts propagation slave by default.
>   - update ldap READMEs and schema definitions.
> +- fix program map multi-mount lookup after mount fail.
>   
>   07/10/2019 autofs-5.1.6
>   - support strictexpire mount option.
> diff --git a/modules/lookup_program.c b/modules/lookup_program.c
> index fcb1af74..ca209488 100644
> --- a/modules/lookup_program.c
> +++ b/modules/lookup_program.c
> @@ -646,7 +646,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
>   				 name_len, ent, ctxt->parse->context);
>   			goto out_free;
>   		} else {
> -			if (me->multi) {
> +			if (me->multi && me->multi != me) {
>   				cache_unlock(mc);
>   				warn(ap->logopt, MODPREFIX
>   				     "unexpected lookup for active multi-mount"
> @@ -656,8 +656,11 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
>   			cache_unlock(mc);
>   			cache_writelock(mc);
>   			me = cache_lookup_distinct(mc, name);
> -			if (me)
> +			if (me) {
> +				if (me->multi)
> +					cache_delete_offset_list(mc, name);
>   				cache_delete(mc, name);
> +			}
>   			cache_unlock(mc);
>   		}
>   	}
>

