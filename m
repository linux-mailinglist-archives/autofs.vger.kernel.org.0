Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB98205A64
	for <lists+autofs@lfdr.de>; Tue, 23 Jun 2020 20:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbgFWSTD (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 23 Jun 2020 14:19:03 -0400
Received: from esa12.utexas.iphmx.com ([216.71.154.221]:27263 "EHLO
        esa12.utexas.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbgFWSTD (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 23 Jun 2020 14:19:03 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jun 2020 14:19:02 EDT
IronPort-SDR: GlH0yFFk7aqVUjw5uPMbiaQcGKc5ACiWyfCQqmXRPK0k0XQXx8u4ldqxZnsDaJWgsfHPnXgK0J
 BXBbvcYVqbk35DQ/vulce5TewWuMTScvy76549TpTfpAVju1sjrqRGjvaB0M5zM5CFhYWgDi65
 AljsfnDMzQowOMfCNxsHLOREylKAGbeYMK/ZYGNh2d8F5+owmxrB2VUhdoX99MLzp2tcX8mQPW
 fEpJHy5vtoxe/N3SuLdkFUrMe7LHoqDJ37darcriIhAIq0gKAmQ/taO3+TIRMT3116H8CZqDDy
 tpY=
X-Utexas-Sender-Group: RELAYLIST-O365
X-IronPort-MID: 204873030
IronPort-PHdr: =?us-ascii?q?9a23=3AJhTX6xP7ElAcZDjQJmQl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEvK4x3kHGUJ+d6P9ejefS9af6Vj9I7ZWAtSUEd5pBH1?=
 =?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7eaYKVFJs83yhd0QAHsH4ag7MrXCoqz0fAB?=
 =?us-ascii?q?PyMUxyPOumUoLXht68gua1/ZCbag5UhT27NLV1KhjTz03Ru8AajJEkJLw2z0?=
 =?us-ascii?q?7Mq2dIPflKyHNhPhSekwuv6w=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FFAQDdRPJeh2Y6L2hmHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgUqBUlGCKQqEGoNHAQGFOIgPmFWCUgNVAgkBAQEBAQEBAQE?=
 =?us-ascii?q?GAi0CBAEBAoRFAjWBYCU4EwIDAQEBAwIFAQEGAQEBAQEBBQQCAhABAQEIDQk?=
 =?us-ascii?q?IKYUpOQyDVX4BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?FAoEMPgEBAQMSEQ8BBQgBATcBDwsOCgICHwcCAjIlBg0IAQEegwSCTAMuAao?=
 =?us-ascii?q?1AYEoPgIjAT8BAQuBBSmIYAEBdYEygwEBAQWCSYJDGEEJDYE3CQkBgQQqgme?=
 =?us-ascii?q?KFoFBP4E4DAOCLC4+h1GCYI8hKosgmXWCZJkfBQcDHZEKjXGvegIEAgQFAg4?=
 =?us-ascii?q?BAQWBaoF5MxoIHRODJFAXAg2OHgwOCRSDOop0VjcCBgEHAQEDCXyOTwGBEAE?=
 =?us-ascii?q?B?=
X-IPAS-Result: =?us-ascii?q?A2FFAQDdRPJeh2Y6L2hmHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UqBUlGCKQqEGoNHAQGFOIgPmFWCUgNVAgkBAQEBAQEBAQEGAi0CBAEBAoRFA?=
 =?us-ascii?q?jWBYCU4EwIDAQEBAwIFAQEGAQEBAQEBBQQCAhABAQEIDQkIKYUpOQyDVX4BA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEFAoEMPgEBAQMSE?=
 =?us-ascii?q?Q8BBQgBATcBDwsOCgICHwcCAjIlBg0IAQEegwSCTAMuAao1AYEoPgIjAT8BA?=
 =?us-ascii?q?QuBBSmIYAEBdYEygwEBAQWCSYJDGEEJDYE3CQkBgQQqgmeKFoFBP4E4DAOCL?=
 =?us-ascii?q?C4+h1GCYI8hKosgmXWCZJkfBQcDHZEKjXGvegIEAgQFAg4BAQWBaoF5MxoIH?=
 =?us-ascii?q?RODJFAXAg2OHgwOCRSDOop0VjcCBgEHAQEDCXyOTwGBEAEB?=
X-IronPort-AV: E=Sophos;i="5.75,272,1589259600"; 
   d="scan'208";a="204873030"
X-Utexas-Seen-Outbound: true
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
  by esa12.utexas.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 13:11:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfmMuoGXy6YBRH5hJ3yZiVuLArsPdZVBckU62jsASmh5R3bscBKiH4qH7Ua73mJrgCXLqM5vB3D5COknsCNN+fwkkazjt7n9A5C099soJu8w2kE++gUtpxJ5szBHaUfgozE4omDEjjWdt5kV4reUvZiEu/U19PlqNKMNyd9Z06D/TxaQfnMSztenmbSp+rrGJ86dhKCQjDH8/AKCxVTlNw46/WuZ8ndBj2zlCsNFcEPJlUpPWYYwcBosOg2D82UlKMNJXaZykHyl2wJS556O1oYdj4meJsml8Q7ipgT65ymLcCL02CcdSER26jsEUMbSsJXda9ujd7vCIvuWdv4+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdlGb+T7NoS0EnMY/ibvWw10ujbPoOFZxuVhUVNliEs=;
 b=X5+PtRSgfF/9p2GCiB8zaPDkxqPataHJeyY9iVsiAay4F9Tx9hKAWhZtCyzvAIetD7AoNbaa+Ne1ZYZINVzX0mqTeCVObsapLAkZ5zsfu782/HdqmQtqc2jNk9luBM8bFxfDgCgOCuKY1KiN1SK6Gll1DkknNB+SWXk/9jvBIMntQupPA45UHYE9Z8Wok9vlyIPf22Zfr2l8cQ5d4xVflSSiZYPzPC3REO1rmPnzbcWGjTfHe4Lkj4uLM2gPX1xvHhWs8z+q7i2lJUyt8UiMaeiaCzBOmc0CQ859Pt+rp96hWnzFa+We+c2y6u7w0e5iolAoCSbMQ5bW6gXMtRw3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=math.utexas.edu; dmarc=pass action=none
 header.from=math.utexas.edu; dkim=pass header.d=math.utexas.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.onmicrosoft.com; s=selector1-utexas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdlGb+T7NoS0EnMY/ibvWw10ujbPoOFZxuVhUVNliEs=;
 b=Mx0kVP4NdVa+N0HIqDGKVsZxbNhBAqiFS0HGWmJgk6FIKvQ/zILILlr1S4q7iorBiIkVGc3CmAsMw/xHio9ZFPBEpoXvqm808Gp4XZqJsVp5a75zPi91tJcZgwsSYRCc6yY58sqGl2/76NXwFmxtAPELgUPWJrcDan/nXBLGZTw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=math.utexas.edu;
Received: from BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
 by BYAPR06MB6294.namprd06.prod.outlook.com (2603:10b6:a03:f0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 23 Jun
 2020 18:11:53 +0000
Received: from BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::8570:7340:3a13:1f87]) by BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::8570:7340:3a13:1f87%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 18:11:53 +0000
Subject: Re: The automounter hangs on attempts to mount non-existent
 directories unless the option vers=4.2 is specified?
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     autofs@vger.kernel.org
References: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
 <3d88cf0d-2e0b-6a92-79ce-edc68c60066d@molgen.mpg.de>
From:   Patrick Goetz <pgoetz@math.utexas.edu>
Message-ID: <75b85731-da32-7fa4-3639-789379f80148@math.utexas.edu>
Date:   Tue, 23 Jun 2020 13:11:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <3d88cf0d-2e0b-6a92-79ce-edc68c60066d@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0201CA0009.namprd02.prod.outlook.com
 (2603:10b6:803:2b::19) To BYAPR06MB3848.namprd06.prod.outlook.com
 (2603:10b6:a02:8c::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.4] (67.198.113.142) by SN4PR0201CA0009.namprd02.prod.outlook.com (2603:10b6:803:2b::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Tue, 23 Jun 2020 18:11:52 +0000
X-Originating-IP: [67.198.113.142]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec25c370-4067-4fae-65f4-08d817a0e829
X-MS-TrafficTypeDiagnostic: BYAPR06MB6294:
X-Microsoft-Antispam-PRVS: <BYAPR06MB62946D7118379CF32B57A80B83940@BYAPR06MB6294.namprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyrhZ8nM17EYZQT3EZMuCf4OU/DfRmXkOxMkNHSD5M5bhchyw/rMPvjs1I/FZfQPYlK10QEIpBtNqQ04sxSoyXVhl93i71/yHabA9NPeEVWjO9ObuivYc5WrGNsK6juN+oWZcIzUERgV2prRWJDuiHOpvvycDZu0CHIuq0zHw1MFQjtbSjLgHxHrFt/FEL/gf0c+mLcSsUsUUOKRZQ+qehLPWZmnLNrcBLWkWKiNMo3yN82/VPEmZGqQctqC/JhzrCSVQKsu5MfcoMx+FtIw3l07GljayVaap3e3AYUq5SHDP6XoczpJMq6UaHLwYHaM5pwuIKoxfcD3zmWF6/NrDqMOn3iWM1k30kMbcRurNCYXn9s57+VnRedWzk2897jm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR06MB3848.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(6486002)(83380400001)(75432002)(8676002)(53546011)(26005)(786003)(16526019)(31686004)(316002)(52116002)(16576012)(186003)(2906002)(478600001)(4326008)(4744005)(5660300002)(66946007)(6916009)(66556008)(86362001)(956004)(66476007)(2616005)(31696002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ebeqkBOGNtt5Wa3OstDf1FKywknu6Wdnx0toma1oau+SIv6f1yr0MGLSx7lt/CL4/Xejz7DBCd3V8N7X9WwPKfwo+awrIhM73gqtbNV1zdyBQy9OB9VK/pgRPxs4fQocBjz1ncc36AgYXF2buLSnmvwvZnCUXi6m19ZKaZiCW7kV4ahfh7ypDtLYZ5GOdpS5k54RBgdwPSor+WzOtdEb11dFsHmq+4Q2zfdJqRieR+jao6MeY3tDRB5VPCbEc2iqW/H+aG0ZKrRUhfNvYvH+kMZ5RWPmrKp9eDoL0OmZ5R6NPdDyaJ82KktVErsnHZPh7MAUcv7PWrPuLdg4j8c7cka1+g3Nl7tbF90OfYx7jTUwAkNkyDPD2c9oHRHg6sQ3j15zXXrToWbvAkFjglGOLaSQzohAInFRRg4p3GCobf5HghdA+s37Uu5Nll0+Z/KXHcBjO9DEyO+WKxXvHGg6jywxIXIowWl9reiKTrFs8Xxqs2GzUvTSlZJbMTIfLGo9
X-OriginatorOrg: math.utexas.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ec25c370-4067-4fae-65f4-08d817a0e829
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 18:11:53.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 31d7e2a5-bdd8-414e-9e97-bea998ebdfe1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9anKTPpPU1mrS7qoGeIzK2euJ9jza4wnAIKOSez+IK7BdoxaWG5jC9dKntwpDN9nw1llVDUxQm6ZmtzNxRq3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB6294
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Paul, thanks for the response.

On 6/18/20 4:28 AM, Paul Menzel wrote:
>>
>> I guess they were thinking that since no one can log in as syslog, it 
>> doesn't matter what the home directory is set to; likely someone who 
>> doesn't use or perhaps even know about autofs.  On my Arch systems 
>> these entries would look like this:
>>
>>    syslog:x:102:106::/:/usr/sbin/nologin
> 
> Did you submit a bug report?
> 


Not yet, but will try and get to this today. Syslog isn't the only 
offender here, either:

   cups-pk-helper:x:111:118:user for cups-pk-helper 
service,,,:/home/cups-pk-helper:/usr/sbin/nologin

so multiple bug reports.  Thanks for the link to the conda github issue; 
that was kind of funny.

