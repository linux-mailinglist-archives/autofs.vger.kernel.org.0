Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B731D637D
	for <lists+autofs@lfdr.de>; Sat, 16 May 2020 20:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgEPSSB (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 16 May 2020 14:18:01 -0400
Received: from sonic316-11.consmr.mail.bf2.yahoo.com ([74.6.130.121]:42363
        "EHLO sonic316-11.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726341AbgEPSSB (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 16 May 2020 14:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589653079; bh=5gCyJ+OqEpp5mbAlNtNv58P62XCklDNCTlGARRHXZQA=; h=Date:From:Reply-To:Subject:References:From:Subject; b=VCLnvtaAC7dqKc9KfRmV5WebNg34yPCxunXGqxHl9+xL3yBt5NcbI23b7PsE0AARlSLrEMx7CHo1xBVLIzA7oq32ZslkU7LGe/VfoMpRv7ThW3CFJKNu0GJzx1O+bu5G3XgWU/4T6q5SgiPHyX+VYUab77KX8Ii2ZWWS/qGWFqLIr2P8fBUO4ecOXrbD130HqmtdNfnDilCWL5NYTMzGPIB9NMqJblKExG5FxI27nQaBeoBMOwO9E1TLXoRsdOu/IrEx376JUh8hOF+ar3VJnNpOwpaY0gYF3va/wcwkvsljwcmesNf3C4qe0Zgq7KVeUkxDeUm3HvjvLHpTiZnc6A==
X-YMail-OSG: Y1So.kwVM1n0ZTEFfeQocyODjxpBEnlckqOCDAL.V4FLxsUbzLDOFSNbLarJ7aU
 fZCx0jP8s9rbVa5hrE5C3nuckMJ2q8F3TbzvxD9HLITissPqyexmH4DCUApd.3yAr.ZmojKIASXQ
 U.Q6LfEyPqS9mC_OGBsQQCA.sWRSVejy8jjkt4N.xsPrelqvrk1LDRxs2Ea8qtf0VX2kz7p1GAfn
 nVJ9DwhlMpUszOEi2DaEa.BE6N54lUiLBOIzsBzvWQf5qlPz8syL62eWe4dUSKGe_oeRO3rQO4gG
 XaQErYyVaWs34sROIZT1lbUXbLoDETDKFKTDB_6cHR1QpXqoJ1AYZLrSYOe5jw9u0UMjFyRWx8PV
 Kcq9dxrZ8yQTS9HMfBAUFjaQmCsxqBmjDCmDGK7Xe6514AAcZfDWDtVWFChQeLy9kDUF_Md1XsBo
 vvSbnlKpfA3H8JkVHhIaG5Ra1Xg.y1h7lHGOi_FwhrygmwaJ1weg9ceF7hZuDXrkh0TYeBTiUvFo
 GHc.TACFBzGMI1EakcpcQ7qfGndeMZVyXZnfKMQRb8er.BpEuDeyR9t_apgnR46HaqmAIW.Lu7p6
 U_6erRToXX_9AUjaIc06iVWLUG1B9qDLAOWvNZw6lbOqVku2HZyiNA_nd79srMPYBaGrRwR0k1D5
 4xgez6l4397CbuMVHX6fhMmGu2v8fGXqUTEz_HMrID6FAMDf2S5C2iitg7Q1608F4JserH3xBT31
 MZOkqJXxEA1d1rHLGbqAE8r3Okw4UvdSy_j.nwHbV6JFsAFlZt2XFfj_ljjDgqUbmiK9zofQm1IR
 URXf.17FV1r_JaDfos.CdUgSMufRLjEGbT9oeMHAVdk6jC2MrY6_D39_TzcTi6Tc.msyqI09CmDt
 KRQHH9W7W3N85Sm6dxmrPAqwAisDcuywTHTWtwoppETKaM6SUcDyUQsl.7ijoP0RFs.fgu2mz2r8
 ioqO_Q0JxlP0cq1NHjdrqhVc8iuwlyvH_dzhFbbJrfQyDxBFIUrqKzsOU0QMpXBSKu2B3LifHrLk
 W9X2xjj_wNWAoa8p0OoyoGhHv0SwKPc_yzY2EvMOR.MZVMsdrULaMkz.fXRaMdnjP7TMux6VY7AU
 38c1lHFrPXpLct1U.Ds2CQz4LmD72F4OyMyiZHutLrFS5E7i3yv1dCGUwimbJWc7tCDUNYQT8R_R
 t.nJzgR.wGzt__IiEyWOew8tLUynzrL1oqEKflCVE2CtFYqflU5.5WEHiDp6Cl9vSAJXzLSL0pHB
 dqIz9f1tJjVbzI20ZSLAYhBYtZv0siNQBWlMi5i0_HAsNYtTBgPhH0C4syiV6MBPIyRcDXSLca2N
 7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Sat, 16 May 2020 18:17:59 +0000
Date:   Sat, 16 May 2020 18:17:55 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <1430773032.134790.1589653075694@mail.yahoo.com>
Subject: Hi there
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1430773032.134790.1589653075694.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Best of the day to you I'm Rose by name 32years old single lady, Can we be friends? born and raised in London in United Kingdom Take care Rose.
