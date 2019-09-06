Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF15FAAFD1
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 02:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390102AbfIFAYN (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 20:24:13 -0400
Received: from act-mtaout6.csiro.au ([150.229.7.43]:17557 "EHLO
        act-MTAout6.csiro.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389986AbfIFAYM (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 20:24:12 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 20:24:12 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=csiro.au; i=@csiro.au; q=dns/txt; s=dkim;
  t=1567729452; x=1599265452;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HJyDtLMfcf/g8sRHa7FEh6klxP5VnAKjxWTAa+6SyF4=;
  b=BzzRSdx5dfftlzrtjDCB54naHfSEJ45hXWy8CZIpYBGijJ9vupInieP5
   bQl8YZfH4d4gIyBDgkA/It6UOn99OmcD217Ya1VqW/KeGWVrZoW9hinaU
   JgQTVQTr/jpWyCOPrWptmTwzNADv6uJa2QeruoZchrlzrZCKBWCzAQoY5
   A=;
IronPort-SDR: dC3AFYChvlGcXAoXebUOGWlAgYRHDp8b1hPFxr9kzm8nnopxna/XWgM05GRbm2YGMPAbVs0OwW
 sAA4JADOSFVw==
X-SBRS: 4.0
IronPort-PHdr: =?us-ascii?q?9a23=3A5LJVoRwyXdal6P/XCy+N+z0EezQntrPoPwUc9p?=
 =?us-ascii?q?sgjfdUf7+++4j5YhyN/u1j2VnOW4iTq+lJjebbqejBYSQB+t7A1RJKa5lQT1?=
 =?us-ascii?q?kAgMQSkRYnBZu7CEvwIfj2KQkxHcJeRUVo13qgMFJSXs/jNBXf?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+HPBQAhpXFdjACwBSSwhIATAJKcgDF?=
 =?us-ascii?q?lHAEBAQQBAQcEAQGBZwKBQ1BcFHYENQqHXgOKdIJcmj4DGDwJAQEBDQEbEgI?=
 =?us-ascii?q?BAQKBAoIUgScCgjcjOBMCAwkBAQUBAQEBAQYEAgIQAQEBJoVeDEIBEAGCcTk?=
 =?us-ascii?q?xAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCMwU5AQE?=
 =?us-ascii?q?BAxIoBgEBNwEPAgEIDgoJFRAPIyUCBA4FIoMAAYFqAxwBAQICn1MCgTiIYAE?=
 =?us-ascii?q?BgiSCfQEBBXWEIhiCFgkJAYEqAYt3gVk+hCM+hESFY4xMij2VKwcDHYIChne?=
 =?us-ascii?q?NZQwbgjRvlVOELIsGkzGDdAIEAgQFAg4BAQWBaSCBWmyDQAmCORoegzqCVod?=
 =?us-ascii?q?9c4EphBuIZQGBIgEB?=
X-IPAS-Result: =?us-ascii?q?A+HPBQAhpXFdjACwBSSwhIATAJKcgDFlHAEBAQQBAQcEA?=
 =?us-ascii?q?QGBZwKBQ1BcFHYENQqHXgOKdIJcmj4DGDwJAQEBDQEbEgIBAQKBAoIUgScCg?=
 =?us-ascii?q?jcjOBMCAwkBAQUBAQEBAQYEAgIQAQEBJoVeDEIBEAGCcTkxAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCMwU5AQEBAxIoBgEBNwEPA?=
 =?us-ascii?q?gEIDgoJFRAPIyUCBA4FIoMAAYFqAxwBAQICn1MCgTiIYAEBgiSCfQEBBXWEI?=
 =?us-ascii?q?hiCFgkJAYEqAYt3gVk+hCM+hESFY4xMij2VKwcDHYIChneNZQwbgjRvlVOEL?=
 =?us-ascii?q?IsGkzGDdAIEAgQFAg4BAQWBaSCBWmyDQAmCORoegzqCVod9c4EphBuIZQGBI?=
 =?us-ascii?q?gEB?=
Received: from exch1-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:31])
  by act-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384; 06 Sep 2019 10:17:01 +1000
Received: from exch1-cdc.nexus.csiro.au (2405:b000:601:13::247:31) by
 exch1-cdc.nexus.csiro.au (2405:b000:601:13::247:31) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 6 Sep 2019 10:17:00 +1000
Received: from ExEdge1.csiro.au (150.229.7.34) by exch1-cdc.nexus.csiro.au
 (152.83.247.31) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Sep 2019 10:17:00 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.52)
 by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Sep 2019 10:16:55 +1000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqZnT5YmzcltQsVbERJ+DaA6nOS2inE5TrWy9mphY6ci29Bw4HWheeC9eu5KsHZpBoEBscmJSauwlviMACk4QjRLZwjp0x3JUi/qy3Ri64M8vCSMLA5HPF4tqrpQkT8VnS/Ad8SnDfWDRsRjpfDYmYyYgIzOtsEyhZbbzK97RHCtS2+cVzii16AEP14AC561TmhcdmqT/2ZAPDLdDA568BJKVAfdWE+AC3u5jHx+0kf6SWpqI5/toRMXiTt7MhDABFHj88u5eKb5wy3D2CVg0V275SPRH9w0QedktgG0F14Fc4QalCVOsr4O6BFJd2J4feA1MANBIDTM/p7FB/9paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raCwQm63gy3W0228OGwCooEBEvysSVrv89h8mDF5eI8=;
 b=hSgPSAzbORlWYKmFNdYCzK1Bf9vVNGyyf2GuS5VTQ23HyP3iRzJVZp9L5jeHQYXc/I9IrkSByingk8ek+iRGFACC7hvibbSKHtIpFCUbv2kZJ717b8r9vQRfMbDISHf46Z5oFf/vCPTEd74PUReDspRZTxMm/BSlt13tLZprUhbPPOT2xGjcNWFFBzH2Je36RFO5XUfyVDd4HNqgC/88pZif6mYYzmy65hWMoCvo9ODA7CiIB+t79uMhi3bk5fdvmXhCHhi7o0hEiv/MEy2QdWbw3gTLp0++bNDP4QPddzp64dldFQ3LvZHujfZ6ynizFffL6tnBAjxUTvPR8X8r9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csiro.au; dmarc=pass action=none header.from=csiro.au;
 dkim=pass header.d=csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector2-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raCwQm63gy3W0228OGwCooEBEvysSVrv89h8mDF5eI8=;
 b=KHGYBt+AgoTUnn9Zuou+FGswJ0LQPSASXke8u9i7W7u916HrOSn7w/FDMjHev103B3m87jMkStB7wfhPHRAQBVlfHG2kPj4I/r+d40jvB3zqZszKoTLvI/hBJ4rczVUdM8eY3fMXWqKFpNWfUmJAWaYh/Nd+Png3ltxlWWtQqV8=
Received: from SYAPR01MB2526.ausprd01.prod.outlook.com (52.134.181.11) by
 SYAPR01MB2525.ausprd01.prod.outlook.com (52.134.183.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Fri, 6 Sep 2019 00:17:00 +0000
Received: from SYAPR01MB2526.ausprd01.prod.outlook.com
 ([fe80::d91e:cd8:4238:15e9]) by SYAPR01MB2526.ausprd01.prod.outlook.com
 ([fe80::d91e:cd8:4238:15e9%5]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 00:17:00 +0000
From:   "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To:     Ian Kent <raven@themaw.net>
CC:     autofs mailing list <autofs@vger.kernel.org>
Subject: Re: [PATCH 09/32] autofs-5.1.5 - update autofs(8) offset map entry
 update description
Thread-Topic: [PATCH 09/32] autofs-5.1.5 - update autofs(8) offset map entry
 update description
Thread-Index: AQHVZETMa2OtZKRZg0WDH51z2X0wF6cdyEKA
Date:   Fri, 6 Sep 2019 00:16:59 +0000
Message-ID: <20190906001659.qkr2baeo6mburhzn@mayhem.atnf.CSIRO.AU>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
 <156772689839.5865.7283001077042699778.stgit@mickey.themaw.net>
In-Reply-To: <156772689839.5865.7283001077042699778.stgit@mickey.themaw.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20170113 (1.7.2)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vincent.Mcintyre@csiro.au; 
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0814c5b5-43c9-4ada-e1fb-08d7325f8924
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SYAPR01MB2525;
x-ms-traffictypediagnostic: SYAPR01MB2525:
x-microsoft-antispam-prvs: <SYAPR01MB25250F0A73723E62944E0FDBF4BA0@SYAPR01MB2525.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(366004)(39840400004)(136003)(376002)(54534003)(189003)(199004)(446003)(11346002)(14444005)(486006)(256004)(99286004)(81166006)(305945005)(8676002)(81156014)(8936002)(476003)(66066001)(7736002)(316002)(2906002)(76116006)(66946007)(66446008)(66556008)(71200400001)(229853002)(66476007)(6916009)(58126008)(71190400001)(76176011)(64756008)(3846002)(25786009)(102836004)(6116002)(4326008)(6506007)(6436002)(6512007)(26005)(186003)(6486002)(5660300002)(14454004)(478600001)(53936002)(6246003)(86362001)(1076003)(15650500001);DIR:OUT;SFP:1101;SCL:1;SRVR:SYAPR01MB2525;H:SYAPR01MB2526.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bObPFK47EjAWVa3142SV4pToGASQjdOBVJKCDZ+CJwlX+LbAzdvA3WONwbDuf53WW0dutMIfj3fY2qWgivrjab+Pb7oAOGM40xc+8pxliDZLAhCxDRCRRCRdHfOKt8BoqHr1SiDLmtsqdpBAzcs1zTIG4Q3qD+u16bhgR9HcSP1ViH3SfKoNF3TSLQmFP03JqJ7hExk3sjw4+PLQfXri0VqHuOAeVlRyfV7c0m4tZt9kB7ARvuvZa1VYCdYH2H3Q/KPLU4WXmqFv8YGzgiDjVMK05KJcz/n+ymCvd0OrXt+rDY2/nTjgWBpOHAgTLRkdr0O1F/0oUzXp72U+Z3YhhCN3bUq7tiHKbPUxPAJ7Xw2lqziOtTtS7+Vz+1UwspmqySus0brsmK9zGLoqTebtu8mgypv5WJHXkVzmqDovo9k=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D651C522F0E9B4B9FBD67014BA80FA3@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0814c5b5-43c9-4ada-e1fb-08d7325f8924
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 00:16:59.9542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6xa66HoJSB8FYV8I22AoYjc9pvIwX4/GYRQMoB5RhqsZEnaV2orGbYxtn4etVVh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYAPR01MB2525
X-OriginatorOrg: csiro.au
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, Sep 06, 2019 at 07:41:38AM +0800, Ian Kent wrote:
> The autofs(8) man page imples that map entries that have offsets will
> be updated in the ame way as top level map keys.
>=20
> This isn't correct, if a map entry has offsets and is in use when the
> map is updated the mount must expire before it will see the update.
>=20
> Signed-off-by: Ian Kent <raven@themaw.net>
> ---
>  CHANGELOG       |    1 +
>  man/autofs.8.in |    5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/CHANGELOG b/CHANGELOG
> index 89b1545b..64eb0926 100644
> --- a/CHANGELOG
> +++ b/CHANGELOG
> @@ -15,6 +15,7 @@ xx/xx/2019 autofs-5.1.6
>  - plus map includes are only allowed in file sources.
>  - Update README.
>  - fix additional typing errors.
> +- update autofs(8) offset map entry update description.
> =20
>  30/10/2018 autofs-5.1.5
>  - fix flag file permission.
> diff --git a/man/autofs.8.in b/man/autofs.8.in
> index 9f03eada..909bdfd3 100644
> --- a/man/autofs.8.in
> +++ b/man/autofs.8.in
> @@ -56,6 +56,11 @@ map is modified then the
>  .B autofs
>  service control reload action must be rerun to activate the changes.
>  .P
> +However, if a map entry has offsets and is currently is use the offset

s/is/in/:

  +However, if a map entry has offsets and is currently in use the offset

> +mounts cannot be updated due to potential mount dependencies. In this
> +case the map entry offsets will not be updated until after the map
> +entry has expired.
> +.P
>  .B @@initdir@@/autofs status
>  or
>  .B systemctl autofs.service status
>=20

-- =
