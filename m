Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2083A4F51E
	for <lists+autofs@lfdr.de>; Sat, 22 Jun 2019 12:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfFVKOx (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 22 Jun 2019 06:14:53 -0400
Received: from sonic312-20.consmr.mail.bf2.yahoo.com ([74.6.128.82]:46782 "EHLO
        sonic312-20.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbfFVKOx (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 22 Jun 2019 06:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561198491; bh=3fXYToOZXvh5MOJ1JSawYDThjnynC/Ekt2gucIg6zZg=; h=Date:From:Reply-To:Subject:From:Subject; b=eMmIfIqjYlVVrEltFu0Ucej/5KibtGqEJY3vBhZkOSdXRO7Grgs9sMQPynToirV2AWpU+kbgqsYgQXInS7UyqrDJx56QbXfdfaLe2WadkPb+2Znp8qztCN0UW9hParepwV5+pDJBXxKR5or5Xb1u1Z0ktAxGFQwKqXhkAiiDGYXcVqGqc6jXibkpetE99fr7bQHhZ3Zlb2glgFZioA6yFfuTqCwgKEnr91iXPUwQBOTIsLnUALUOpOooSQBz1ymuQysPpWS0yBNvu2lVnlMzi+ZKvjp94I3cwmP6vS2YpuF1az4ai4PG/+b37grwhWcwYaEHtklqmo6g9/DhPZC+Jw==
X-YMail-OSG: V0r.na4VM1l7yFV1sUletlj21qXMyn61BjuzHDS.ju6UR_6kICGr6PtNP8YvL13
 Qt8nJkvDCkuO5GvbVo7y8iEkvZ4c08Yinl6LcExJuVNG5XtXuvwwCIyasRGJFGZz4PXygyYSzRd7
 fm0eP_EuZRonTfHBDO7Z4CT2LfYU3dErVWxKb4JJUaX35RtsjieYDgPslstJ1PXS8X9yHnopjn0S
 jJ6cW7HnU3R6QVeyo9SFnjKSyFSezSMghn4VsqFsvQMLnSYc38q40n72oT9ufLwcz4Pe38BYDlsD
 lQ6JW53VuP1hMWVLL.qagKfH_F_IGzslzrQy4I55tOeysa2B2yMgsteK0OsCk6eajh3ZI_78IO1J
 GL8288XKXb.ntIrfw5tn2ZPFHTCU7MzAF_umfj_xj8NQYvReVBTkwSvKiTmdy3fvdwinZbdm8JN.
 5OjyqCDv5MT3vc94DbQaswRXTzSDa52m3N7dCGPkieO39AibdcK9SILAbaTk0pz7hMXn64M3Gdk7
 JlnbcGYRyEJxTaWSapFWmE8gdIPIbKu5HtwCRWQUS5wTOh7wPyxAjbB9dvkpuJehLs_YFT4gU_.t
 EFF2JuZADxg5evePMS1xX_XLjp59OPF..rKMhIXITyPHstkS29SNIov7GHXy3dasxLwsb3IyFIwG
 p5KYdzPC9TbA43M91ub2tRtsrAHvOf2Lj4FFG7iHlDceGrrWV6mqVJ8v8ET8H5TdUbELPU0rs6e7
 s8JnXfYnGwY5msx91KVwdhn_asU7BczcsaG0TOwyIF7fPO5ORgawg0G7DplWy_i1VjrlvPukNmUs
 N59rp8lii3ikhJUQbqf.Te.1oXIsKO6uK5CrKxeOcOswdHfYRFAHzOU6fOtBn_P0jRZVJuPOO_Go
 Ki0_xeV53AUWgjcmvRyPAd5.tTwkvRH4_7oUY_dOEBqrK.8dbAOuNU_0IR.MMfhD._4u5o0AOSIT
 I1WifDvFF35oXe.Gyho9XvIMQS6BUOVQc3l24zfowPvXwSZVlVOk5QSmRUM6.d2Q3Shta6N_NXei
 465SsJDAh9ws6_6NmDEUjKsbVfHZIR2A1xVpg4rqAhKPHMvJvk59qEC1SJJFU.LfNR340JV5sWtH
 0lAkLyUodoFOhVQzQxOGw2xQKV0YKY_L.V282UCKCRCM97.cKccVMQEFFYe_l_SI8f3qqO4Zff8I
 dDyj9B8PUClL5c4T8WI0iIlKotyb6IkolnWexvma.tbjU_4TvZkI-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Sat, 22 Jun 2019 10:14:51 +0000
Date:   Sat, 22 Jun 2019 10:14:45 +0000 (UTC)
From:   "Miss.Fatima Yusuf" <fatimayusuf5@outlook.fr>
Reply-To: miss.fmayusuf11@gmail.com
Message-ID: <965703353.224509.1561198485950@mail.yahoo.com>
Subject: From:Miss: Fatima Yusuf.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org



From:Miss: Fatima Yusuf.

For sure this mail would definitely come to you as a surprise, but do take your good time to go through it, My name is Ms. Fatima Yusuf,i am from Ivory Coast.

I lost my parents a year and couple of months ago. My father was a serving director of the Agro-exporting board until his death. He was assassinated by his business partners.Before his death, he made a deposit of US$9.7 Million Dollars here in Cote d'ivoire which was for the purchase of cocoa processing machine and development of another factory before his untimely death.

Being that this part of the world experiences political and crises time without number, there is no guarantee of lives and properties. I cannot invest this money here any long, despite the fact it had been my late father's industrial plans.

I want you to do me a favor to receive this funds into your country or any safer place as the beneficiary, I have plans to invest this money in continuation with the investment vision of my late father, but not in this place again rather in your country. I have the vision of going into real estate and industrial production or any profitable business venture.

I will be ready to compensate you with 20% of the total Amount, now all my hope is banked on you and i really wants to invest this money in your country, where there is stability of Government, political and economic welfare.

My greatest worry now is how to move out of this country because my uncle is threatening to kill me as he killed my father,Please do not let anybody hear about this, it is between me and you alone because of my security reason.

I am waiting to hear from you.
Yours Sincerely,
Miss.Fatima Yusuf.
