Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0151424CB
	for <lists+autofs@lfdr.de>; Mon, 20 Jan 2020 09:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgATIIc (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 20 Jan 2020 03:08:32 -0500
Received: from act-mtaout3.csiro.au ([150.229.7.39]:61084 "EHLO
        act-MTAout3.csiro.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgATIIc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 20 Jan 2020 03:08:32 -0500
X-Greylist: delayed 443 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jan 2020 03:08:31 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=csiro.au; i=@csiro.au; q=dns/txt; s=dkim;
  t=1579507711; x=1611043711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dL+7BiPvwCU/oGWuNKJpdmG+Ym8WMIGqulS9q4rCl94=;
  b=OZt5y+3EcFbPgL8/tX3n04uB8PmsDy7rCkMh2tZbc3oN+oJZgXOxQ5ap
   N44jsTyD7KN5iysv2+XdrR24XlubG3GGKu9zNGaNN/yL3fVYL0NH3ioyO
   WXkJ7zO+kz+k0WwyVPYQoE+knRnitbqKuGTHBhAQs50SLuyxKF8Npoand
   Q=;
IronPort-SDR: vXhvoR7OeNclgqAxKDutFXCU9f3aiD1/ffQyz1OcTDgrjGvRiB9S38+QCNcbiK2njhn8QuL6QL
 9s4VaAjxv6Lg==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?9a23=3ABvzW6hYOZ2GxWzF7gOgAMvf/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el20g+bRp3VvvRDjeee87vtX2AN+96giDgDa9QNMn?=
 =?us-ascii?q?1NksAKh0olCc+BB1f8KavUbioxEcJeEnpu/nenIFJYMM3lZkfV5HSvvnYf?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+E1AACeXSVelwCwBSSwhIATAJKcgDN?=
 =?us-ascii?q?lHQEBAQkBEQUFAYFnCAELAYFTUF6BCwQ1CodOA4RahiGCX5k8gSQDVAkBAQE?=
 =?us-ascii?q?NAS0CAQEChD4Cgg4kNAkOAgMBAQsBAQUBAQEBAQUEAgIQAQEBAQEeBoVnDIN?=
 =?us-ascii?q?OcQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQw+AQE?=
 =?us-ascii?q?BAxIoBgEBNwEPAgEIGAkVEA8jJQIEDieDBIJLAy0BAQICn1cCgTmIYAEBgia?=
 =?us-ascii?q?CfwEBBYUBGIIMCQkBgS4BjBOBXD6DJn4+gQQBg0SFbo4IoU4HAx6CG403iG4?=
 =?us-ascii?q?MG5p3qWQCBAIEBQIOAQEFgVI4gVpsg0BQGA2IARgCg1mKU3SBKYsWAYEPAQE?=
X-IPAS-Result: =?us-ascii?q?A+E1AACeXSVelwCwBSSwhIATAJKcgDNlHQEBAQkBEQUFA?=
 =?us-ascii?q?YFnCAELAYFTUF6BCwQ1CodOA4RahiGCX5k8gSQDVAkBAQENAS0CAQEChD4Cg?=
 =?us-ascii?q?g4kNAkOAgMBAQsBAQUBAQEBAQUEAgIQAQEBAQEeBoVnDINOcQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQw+AQEBAxIoBgEBNwEPA?=
 =?us-ascii?q?gEIGAkVEA8jJQIEDieDBIJLAy0BAQICn1cCgTmIYAEBgiaCfwEBBYUBGIIMC?=
 =?us-ascii?q?QkBgS4BjBOBXD6DJn4+gQQBg0SFbo4IoU4HAx6CG403iG4MG5p3qWQCBAIEB?=
 =?us-ascii?q?QIOAQEFgVI4gVpsg0BQGA2IARgCg1mKU3SBKYsWAYEPAQE?=
Received: from exch3-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:33])
  by act-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384; 20 Jan 2020 19:01:06 +1100
Received: from exch2-cdc.nexus.csiro.au (2405:b000:601:13::247:32) by
 exch3-cdc.nexus.csiro.au (2405:b000:601:13::247:33) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 20 Jan 2020 19:01:05 +1100
Received: from ExEdge1.csiro.au (150.229.7.34) by exch2-cdc.nexus.csiro.au
 (152.83.247.32) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jan 2020 19:01:05 +1100
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.57)
 by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jan 2020 19:01:05 +1100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bsa0I/9SjWXK7dXe/gwcMtiugEOJnyjiPnj+ej0UwTouNtY/KXvqL6UzzcFVenxPsi4QM7KT52mP+s8N4pUAWE1JvGtWcXKXIt5ph24iXZolwl9RSgNltFhdMYKCS20UBeBkD8FqlPM5aQkQ4W/T0Usp0isnU97HmnynpxOZoAN4/lfVa4881A1sDSHZqZMoYGcLEk6lcojxj7Vnj3dMyOMZHlrpkrl8BOlFzdRH9a1twqeCCRza8Jsg+1JIDUVEMJOt+XcwG3FLgzoW6yvCNtoOH6mGrSDspm+oZuEtiVmw/+86zfesUB9OtQoNOa6Y0MIaWYw/OCXlqh0ruEzzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL+7BiPvwCU/oGWuNKJpdmG+Ym8WMIGqulS9q4rCl94=;
 b=j0TYbdfMMhoxzhy3FZouGeHNwZdy0qstxS/7LVuwUoGz6MyKACxiZH5xqHEUAmxL8YD4VUISYL49VGKve4J4vlvfKbM/94wYw+oHiZxRoEzoiVj9yQSVOa+qQkufBsTuHamnOWOm2VmX7BG2yvKzJHrFywTnr1rOrm1JHhdv9ujUfPrp4fUt/9cxdMuPeQRqBW/YnKk1YxrPSKS8tyFUDzzph2MYnnC3SrtK7CccGiz1elMktDi9qFec2qwNErsdYmBW+gitCGlSt/xNMpinsyB0gcL7DxkSXivaewJ165yLFELKf5mRphQ35HCz8vsgag3Hjluz9fadwz2P1iq3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csiro.au; dmarc=pass action=none header.from=csiro.au;
 dkim=pass header.d=csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector1-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL+7BiPvwCU/oGWuNKJpdmG+Ym8WMIGqulS9q4rCl94=;
 b=AQ30iMRw9GjLQJW58m3+ICHOVtR3zkSgBhJboaBRwQ+yOZ4EKQH2utAsno2FRiQYaNjAUccRAMeqhd4oRmYkTSGlJ4pwUODFbG+R6vV6XN+oXgfaNW8ezrbmmABREjIKI/le87Vo/ANP6V2T2OMqI+0yH67CBkqKckS1l27i3DU=
Received: from SYCPR01MB3917.ausprd01.prod.outlook.com (20.177.142.207) by
 SYCPR01MB4160.ausprd01.prod.outlook.com (20.178.187.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 08:01:05 +0000
Received: from SYCPR01MB3917.ausprd01.prod.outlook.com
 ([fe80::30d1:6b00:f7c8:8a9f]) by SYCPR01MB3917.ausprd01.prod.outlook.com
 ([fe80::30d1:6b00:f7c8:8a9f%6]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 08:01:04 +0000
From:   "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To:     Andreas P <nurgrak@gmail.com>
CC:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Subject: Re: [PATCH] Fix typing errors and formatting
Thread-Topic: [PATCH] Fix typing errors and formatting
Thread-Index: AQHVyyQDc8ZkkgeReUW4hSeElsBK5KfqwfmAgAejtICAANOLgA==
Date:   Mon, 20 Jan 2020 08:01:04 +0000
Message-ID: <20200120080057.ajd26asls5n6tk42@mayhem.atnf.CSIRO.AU>
References: <CABPfrkzxRo-zATezdNQgtuUDypLU+UPkpoHh6bE6J=mWBH8OFw@mail.gmail.com>
 <20200114224407.mcxlvedtjroh6ccc@mayhem.atnf.CSIRO.AU>
 <CABPfrkwFAXaZd7_BJAZ16CHvxj+TR9Sm64c773M6nG_M_B9Sog@mail.gmail.com>
In-Reply-To: <CABPfrkwFAXaZd7_BJAZ16CHvxj+TR9Sm64c773M6nG_M_B9Sog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20170113 (1.7.2)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vincent.Mcintyre@csiro.au; 
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e796d61-f37c-4861-586e-08d79d7ee5dc
x-ms-traffictypediagnostic: SYCPR01MB4160:
x-microsoft-antispam-prvs: <SYCPR01MB41604CCD473035075666F1A3F4320@SYCPR01MB4160.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(189003)(199004)(6486002)(5660300002)(316002)(81156014)(81166006)(8936002)(6916009)(8676002)(54906003)(26005)(86362001)(186003)(2906002)(71200400001)(4744005)(1076003)(66476007)(64756008)(4326008)(6512007)(478600001)(66446008)(66556008)(6506007)(76116006)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:SYCPR01MB4160;H:SYCPR01MB3917.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1FSuveulAyWai2BWcnsxDCcJjroiwVW5PXr8kyfDhlrjtrvKA3XZsBUB6zVGwng4o2kPGA+ViVhTlL8qv/1McQx9C9qT7s9N+xymv9SG94NYvGFMDhLUbeDxPr6k1vtxmoQuUxrTy1AS/LIRiS3qTLwZWZwmCVp755Wi9hRhZcFxSuemavKvEUok5GHnYOHQ7uQeRJhOyV3XV2hizZSzmkYxj1ghIGcw1dsfIhGbRMJtzM6OI5x0+4/Dd0JWghn9h1k6pijkDuS1ldUbsrQV8Jm5MHyrykRQ2W7+T0eXsxmB01WU6xBebfsghUgst0FS1JWuEKrbMi0yBTbBgqkw9ZG+zouzi+sg466n8TgyZ8pwFWLk/OFQZgr7XFXbph3rrdILCvyrGdJyP8U0p1xK2OzDHYpSsdfmNZ0ubm9tgfQ1OtmqIW0L6IneD0195/q
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28C1F4919918B540847BFFDAA9A7B1BF@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e796d61-f37c-4861-586e-08d79d7ee5dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 08:01:04.3717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTVZRMl7x8CZCr1/u3X1qPwAyI4iAn7j++R3zIVkB5Y0QQluCHsmexkB/+GI0aNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB4160
X-OriginatorOrg: csiro.au
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sun, Jan 19, 2020 at 08:23:51PM +0100, Andreas P wrote:
>Thank you for the feedback Vincent. I have accepted all the additional
>changes you provided as they all look good.
>I will answer following:
>
>>I want a ; after hosts. or 'with'. What do you think?
>> A comma might do but might be confusing.
>>
>"Multiple weighted, replicated hosts; same path:"
>I think the above looks better in the man file than
>"Multiple weighted, replicated hosts with same path:"
>I will use semicolon variant if it looks good to you.
>

yes, the semicolon looks the best option.

>+# If the kernel supports using the autofs miscellaneous device
>> > # and you wish to use it you must set this configuration option
>>
>> comma after 'it' ? not sure
>>
>A comma fits well there. Added it to patch. Changed it in
>samples/autofs.init.conf as well for consistency.
>
>I will add these changes to updated iteration of the patch coming this
>upcoming week.

Glad I could be of some help.
Kind regards
Vince=
