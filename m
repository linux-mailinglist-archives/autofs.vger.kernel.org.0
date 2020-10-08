Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C940F287E8E
	for <lists+autofs@lfdr.de>; Fri,  9 Oct 2020 00:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgJHWOc (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 8 Oct 2020 18:14:32 -0400
Received: from esa10.utexas.iphmx.com ([216.71.150.156]:9828 "EHLO
        esa10.utexas.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJHWOc (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 8 Oct 2020 18:14:32 -0400
IronPort-SDR: 8n7BhPEfm0oZWfK6AM1JyC8Pp3LO6RqL9l2Sy3eaIEl2nuYU6UlaIarDTzMfB8fG+G5nUEmCIx
 RdWifGpjB+WMSh6vXW5vLQFqC+otPpywwHZd/SeOsxBwVpI7jpIuZOIWcdxfd1QBt5ORlrmQdm
 9j3NwpAZGV6JrLH7f6cccg36erbGhqaiz9yIiHliEKHm+qrshumgJ0fnnL1pojIBfwKC/1IjXr
 NThkMNi9wdjiOeNdobNhCaabTBci8+lizjLQ/2GyTmNu51fwqGKBqMEzMRjogTpYfp8cKkUKn6
 uT8=
X-Utexas-Sender-Group: RELAYLIST-O365
X-IronPort-MID: 246660375
X-IPAS-Result: =?us-ascii?q?A2FpBACHjn9fh6o7L2hWCh4BAQsSDECDIVGCKwqEM4NHA?=
 =?us-ascii?q?QGFOYdrLph7glMDGD0CCQEBAQEBAQEBAQcCLQIEAQECgVOCdQI1gVcmOBMCA?=
 =?us-ascii?q?wEBAQMCAwEBAQEGAQEBAQEBBQQCAhABAQGFeTkMg1RJOgEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQw+AQEBAxIRBBEIAQE4DwsOC?=
 =?us-ascii?q?gICJgICMiUGAQwIAQEXB4MEgkwDLgGbZgGBKD4CIwE/AQELgQUpiVd/M4MBA?=
 =?us-ascii?q?QEFgkyCURhBCQ2BOQkJAYEEKoJyil6BQT+BOA+CWj6EEINEgmCcCFOJbpEUg?=
 =?us-ascii?q?nKaWwUHAx+SL48BkxudEoMLAgQCBAUCDgEBBYFrgXszGggdEzuCaVAXAg2OH?=
 =?us-ascii?q?xqDV4p0VjcCBgoBAQMJfIw7AYEQAQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3AGbsmwRAm/CUdTcsb1z3MUyQJPHJ1sqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLm5Zn5IUjD/qw20A3XUojBrfFJkezbt+bnQ2NTqZqCsXVXdptKWl?=
 =?us-ascii?q?dFjMgNhAUvDYaDDlGzN//laSE2XaEgHF9o9n22Kw5ZTcD5YVCBvHK/93gRFw?=
 =?us-ascii?q?/5OA4zIf76Scbeis2t3LW0/JveKwxDmDu6Z+Z0KxO7yGeZtsQfjYZ4bKgrzR?=
 =?us-ascii?q?6cp3JUe6JL2W54LEnVkhrhtco=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,352,1596517200"; 
   d="scan'208";a="246660375"
X-Utexas-Seen-Outbound: true
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
  by esa10.utexas.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 17:14:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QemliprmMNS8S+chae6Mv6wigS1l1rDhyjPNNbrUCEddnfcVPbsUAZB3dJNF6hW+HHms7goAhZyafg2RaUYmR2EZGX75peflitapThQhligDwe5LtO70yTTCi9YK2iVGUfV3uyz7Kh5lwZG/U8k0bpMVpbyGdkXPJ7qE1P3agC7iZ0ltW+vbXUHRKhMDpy3NOTCNAxJy7FsVNSATvWwbKvOPwQKotDGGGY/28xqCFAUC4lpqTWEFELgzXd88CMeVZq4RHIcYRIhqdDI5l1jNdrkgp+/zwhVl+iZf5k1cniT0Kef9y66aULpyub0pbstf0PKHKTQ9deoA1+EbmYuHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVKefr2bIWH/YXfZQ9eLYqF1t9ZKeBDmxmQXrFCs0Vg=;
 b=SOa3hOO2TH4kJnmzifVHNuZrNs9giwMhLRs6LOpDj2xrW1LkWupzHK+/eb9LeJCQa29OsMe837hmdI29uBsDxtpTbDFbteE1vUW+qIPWPc4JVVC5bbE8vhdRk/jxVNl2rtwHvlMRMNNYH+++7kcXodJYwHM4MRYOze3XVfBOVxNZlVFCZKZE5lkO4Ol02T0BWMybne0OLekjHTCD2qxOd3Rp2KeOKxm+bJZ6B2vrIfpWuYTT/P35enjbyTA5LX93jx9FYayKufStlOpgYo9WKyK1o5vGbavDc4VOfZchV/lfJf8BI/5zLZIKfXqfA4aqLLqzkMNJffrgivxY+ST4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=math.utexas.edu; dmarc=pass action=none
 header.from=math.utexas.edu; dkim=pass header.d=math.utexas.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.onmicrosoft.com; s=selector1-utexas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVKefr2bIWH/YXfZQ9eLYqF1t9ZKeBDmxmQXrFCs0Vg=;
 b=VXd6WqMY0N8zypDduX/DU9JgZAGWRyDYTkk9V3k062F25MXpkvsRzCVoI4a8lmj81Z+z8MGGT1AH0fkn01E1u6sUtc2NM1fhuo5xpuTz1uJs7yeG1+tCJxGTwzVXjnB1xz32877dHmd4zSGtK9ypeJ13jkfGq7/fbvMUTiEKMLs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=math.utexas.edu;
Received: from BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
 by BY5PR06MB6499.namprd06.prod.outlook.com (2603:10b6:a03:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 22:14:27 +0000
Received: from BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::145b:33d4:e2d3:ad59]) by BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::145b:33d4:e2d3:ad59%5]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 22:14:27 +0000
Subject: Re: A puzzling timing issue with automounted home directories
To:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
References: <61ce4c86-caee-6c91-6e04-09e6939d48f1@math.utexas.edu>
 <6c3517990e67642f3bd81c1e51e96ab0d9c7d078.camel@themaw.net>
 <73e0d2e4-aa58-44df-da49-8c7faafe3272@math.utexas.edu>
 <550c65be307dd9f200551f6d84e94069c89a6448.camel@themaw.net>
From:   Patrick Goetz <pgoetz@math.utexas.edu>
Message-ID: <5a88b85b-f837-5fb4-3ceb-83caaa1087a9@math.utexas.edu>
Date:   Thu, 8 Oct 2020 17:14:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <550c65be307dd9f200551f6d84e94069c89a6448.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.198.113.142]
X-ClientProxiedBy: DM6PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:5:134::28) To BYAPR06MB3848.namprd06.prod.outlook.com
 (2603:10b6:a02:8c::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.7] (67.198.113.142) by DM6PR13CA0051.namprd13.prod.outlook.com (2603:10b6:5:134::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend Transport; Thu, 8 Oct 2020 22:14:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b36f2c8-ef94-4f0c-19f4-08d86bd78511
X-MS-TrafficTypeDiagnostic: BY5PR06MB6499:
X-Microsoft-Antispam-PRVS: <BY5PR06MB64998372EAF559B177FEBD02830B0@BY5PR06MB6499.namprd06.prod.outlook.com>
X-Utexas-From-ExO: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFBOdwGuijZFBa97ttQBRFQmlrtfz8jtszO0/ruY2Cz4qI8NrZRbhrALVrRQVlSCQtd1mSfAfkPVYhOaJ0ZXckVPIN/+J1bE9dMCc9W+RtB0+5BM6SadfbL3Jfhrnh/tMF2UTMwq6S7pO2GyC2z133hLvIX2m0ZfecT9un/tRnVuDoGux9Fgktc0vDnvL6oXFwkCIm29RFB5oXZB9M03qXtacmzzHs6r+RwjWaxSAa6LxTAdQXjODiNG7q1rQVD7PIfZRMk6+X9DpS5/0b9ZhzaP3j5gigw3wsQuoA9A9XvPdOmkgHRlHrgfwHNesbnDp+rZ2HUcYzC7XpCTt4ltYK3SNUJ6xFlVCnKmMOa1O8vhURHawbYTPgNYK4Yc/ukN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR06MB3848.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(26005)(316002)(16576012)(83380400001)(66946007)(66476007)(53546011)(31686004)(66556008)(2906002)(5660300002)(2616005)(110136005)(8936002)(8676002)(956004)(786003)(75432002)(16526019)(186003)(31696002)(6486002)(52116002)(478600001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: S4O4h4KkQjSdEcze4L9n3qljcV9Hp3qSTkmYWRkXc2qUmJlV93AkeNyXSF/JRZERctuYLF+oMWLHwrz1NkdQsU+bQ2ja2HOy+YN0WdWQ9hOr1D8O566I42cTNGUn+QJXgyLU7jffqOxUUFgHHKzZZ1OxyCasMa38pvd4sM2yk1alsB4mWQno2AKH4dk58hL5QShh5KGFWJGPHUQ2Kbl8OITR6poFfLu0fq6Nc2OVEggNsZ25pdupJevUs5Ev6FSyhoZ4JGJ5FYFoQ8N4S566R4owvsozBi4uPUbnnD2h28su4S9mjN93Aufwh1eT77F1hNiLktW7qdYj8GwFdWJS6LBl7cdfPP+aiat0Vs0zCDirC7CLLFhMvFr0u8Kqda8lnGMZ66Kqg1flikdEYiXl3RwrgmRcab9AhTvprPm86zmIP1nrSCVQvwsOq99o4GSDxF4uV56j8CBWK1Ck7stBNM0HNR7+ilY3b7Ru60MYavwPCl7G3/uQ3wDCDHgR37JDiTA8WUr+Do9+D6nlNKjWtbmHeQ5RVYcUZl2WE+yY6oQrDjZd72/IB4eQmfjQWq6ZJmB7QZEoyfdY8vwrp9VTs5JvCoZEB2vqiGg0SNlPSHr8paco7igpYx5NXeKaKUEKb1Cxosa2wLCopTrXLxmuig==
X-OriginatorOrg: math.utexas.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b36f2c8-ef94-4f0c-19f4-08d86bd78511
X-MS-Exchange-CrossTenant-AuthSource: BYAPR06MB3848.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 22:14:27.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 31d7e2a5-bdd8-414e-9e97-bea998ebdfe1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPK19EfETAyum39Uy20TkJggbTKuYX8DkPxlCL8jHzqUJ23glrbwRKlWIaevAmPyMeV5n7bgMgAr3O04K7x3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR06MB6499
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On 10/8/20 9:30 AM, Ian Kent wrote:
> 
> All that attribute checking the NFS kernel client does is meant to
> identify when a path component has changed, there's a lot of it.
> 
> Possibly what's happening is the VFS isn't calling ->d_revalidate(),
> possibly during the lockless part of the path walk, because it's the
> parent, not the last component of the path, and it doesn't appear its
> changed based on what the VFS can check in that mode (so called
> rcu-walk).
> 
> If that is the case it will likely be rather difficult for the VFS to
> deal with, so essentially I suspect it's an NFS problem.


Someone contacted me off list about this and suggested it was a problem 
with negative VFS dentry caching, and this proved to be correct.  If I 
set lookupcache=pos for the autofs mount; e.g. use this /etc/auto.home:

   * -tcp,vers=4.2,lookupcache=pos helios.biosci.utexas.edu:/home/&

the problem goes away and the new home directory is found with no sleep 
necessary. Of course not doing the negative caching (i.e. not caching 
things which aren't found) has performance consequences for software 
(like most of the stuff we use) that searches paths for dynamically 
loadable libraries.

So, as you suggest, it doesn't look like there's a good solution to 
this.  New users are just going to have to wait 70 seconds the first 
time they log in, since this is pretty obviously the lesser of 2 evils.

It's nevertheless nice to understand what's going on.

Thanks for your help with this!


