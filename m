Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF2311A94D
	for <lists+autofs@lfdr.de>; Wed, 11 Dec 2019 11:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfLKKya (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 11 Dec 2019 05:54:30 -0500
Received: from ny018.relay.arandomserver.com ([172.96.188.180]:53531 "EHLO
        ny018.relay.arandomserver.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726119AbfLKKya (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 11 Dec 2019 05:54:30 -0500
Received: from nyc006.hawkhost.com ([172.96.186.142])
        by se004.arandomserver.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <nazard@nazar.ca>)
        id 1iezdO-0008ZT-CA; Wed, 11 Dec 2019 04:54:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nazar.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FaPkUZIouBOC1b6rSRPgJ6XFTyzNAySgz9nA4McqxlA=; b=GNWfHLPpD7UP6TbWwSWu91OMZf
        2eVkHMW39QVCp2YDORsykVp9jauUeADCEYu0csghrTxXo35Gvd/PS7v/OejPpoGtCkgc4oOqDLp+/
        ddHK57Q2yfnUFXBGuSZC5W67dZpt/j+PsxJe4BKYQEco7AaF8BK1Dh4exFr1BbYuqB/gMB5QzqJDp
        CJku8apJrXfkS95qr8JzrPVLt2V67kJbyPvrFKvupMQP5hOUSI7Fyysq16XLlpTwPgEGV2rrh/vAI
        Ij1RwSjhRIUIS0/FT6Wg+gANf8i0cYbIOnDO0tGTv+dm7tErNcQ7BUiWhFtI9hzVV1SkXLxzdTPWY
        xbAaVvew==;
Received: from [72.139.205.109] (port=54297 helo=[192.168.21.100])
        by nyc006.hawkhost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <nazard@nazar.ca>)
        id 1iezdO-0002i4-2w; Wed, 11 Dec 2019 05:54:22 -0500
Subject: Re: Failure of program map to recover after failure
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
References: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
 <751a80abe6c09862018730b9a31b8ad79ebc4232.camel@themaw.net>
 <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
From:   Doug Nazar <nazard@nazar.ca>
Message-ID: <a4119d82-b722-1723-65f6-3e5550e5e62f@nazar.ca>
Date:   Wed, 11 Dec 2019 05:54:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101
 Thunderbird/71.0
MIME-Version: 1.0
In-Reply-To: <a19349d9c4c70fac7aa195cb70643862561d3705.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: nazard@nazar.ca
X-Originating-IP: 172.96.186.142
X-SpamExperts-Domain: nyc006.hawkhost.com
X-SpamExperts-Username: relay
Authentication-Results: arandomserver.com; auth=pass (login) smtp.auth=relay@nyc006.hawkhost.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.09)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fKZ8wcD78QFAaYhvfMzLIKpSDasLI4SayDByyq9LIhVtfEZteDeRnxt
 D3YNl73v9ETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K+Gp+X5kVVv8zurzuy5IYVNxG
 S9AVygilm7mQ464aH3JME+lO8B0uGlAKJ+QN2q77CNkMkPiMYC+wMzHEMLPorSeF+qYQ6s7/O7Cj
 ILqXXCkA8cYjACAs+j94NvLRgDL8nFDQUbFURApy7esejekderdSYTX5uBMdCcmw6lv2UcA6L4bb
 C3LjdxFJDyottvPAc+4l84gBClgS15jvOaQcD2hfj9whi8KpGkNMaaLS9DIcqbdy+7WYS7ujrPXH
 qhox0HpT3S2SFmqVvJUoDpLg153GLC8mUuZ69ZuJHxVoTX8lp5kWpqCtCxi6IU2i/fYSDOGgD80z
 g3N4KhEW6qIBSBUdFqkFA+YKkUlydLh5cSaHt73jJKU44zPi+Pzpc9G5IrNVXM0dgsHxp8LhGCD5
 dtad27bIXajXXo8vXH+RaTv+rgVEacJBv1CPC7fpONadtHUijJVykBfF9R5cnDw9IpnLGL9oVuhN
 QBoDT12SU/9oh9VoIekQHpwUfpYnEThmwCT2zD7Wo0oNZ/JGqYJGP/gmB4lkQGfbLYTtlsVm4CU/
 XyE9wR0oOKRphz6MZcrtn3jE/bR4oM4MZAZGavjiWu6M4SGS3IWISyEGC0BKDVoSyz/7RqAXoFeN
 sdzps4cFis+IEmb63Ayq5rQaVXTsXBzapcbJivbmY6S0iqVkT19n/vOcalYQ4SYyQKQ2lGLKPOSb
 tfTRuNYtFtENmdB5nFz1pRXWhjh9fdbl44I0Df2uEfwO5P/stIl4eLZ4t5GSdp79NejQz9dAUlZ6
 qCRRGmWiHUsyroukQx3JkuiCiAsfPFg46jzk0wb+4gNa+rlVthRNgs7Ig4l/XErpYn3glfy9e5xB
 Og+K8Aict/CL+wlOjsylLdJ6uPxsl5jvHeHVQuh8azqvS+xl7zM6cjmBr8cv4ibvfd0VeYmt2Kro
 k4cWfpirH8g1GOR1IFGt5BWm
X-Report-Abuse-To: spam@se001.arandomserver.com
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 2019-12-09 23:49, Ian Kent wrote:
> I also need to work out why you don't get caught by the negative
> map entry check that's meant to prevent multiple retries for a
> failing map entry for a configured time.

Sorry, I should have been more explicit. The several minute wait was to 
exceed the negative cache timeout. That part was working fine.

>> And even the entry delete below it should be ok because it will
>> just lookup (aka. run the program map again to get the map entry)
>> and then update the multi-mount during the entry parse.
>>
>> So while the change above isn't strictly the way this should be
>> handled it probably should be ok.
>>
>> I haven't worked out how to handle it immediately after the fail
>> just yet but the change above probably should be kept as part of
>> that as well, not sure yet.
>>
>> Ian

I did that based on my greps, that seems to be a fairly common check. 
However, it kind of felt wrong, in the sense that the 2nd attempt, 
shouldn't depend on any previous status. I was just having trouble 
trying to figure out the lifetime rules for the various fields/states.

Thanks,
Doug

