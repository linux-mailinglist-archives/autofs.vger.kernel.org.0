Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9551FCEB5
	for <lists+autofs@lfdr.de>; Wed, 17 Jun 2020 15:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgFQNlR (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 17 Jun 2020 09:41:17 -0400
Received: from esa10.utexas.iphmx.com ([216.71.150.156]:44012 "EHLO
        esa10.utexas.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgFQNlQ (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 17 Jun 2020 09:41:16 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jun 2020 09:41:15 EDT
IronPort-SDR: yulI888RvSmV80lwMSIn3PJ1VRZU2NUUqYWruhUpv/seuaaQx+i1mOvalHIqzADvo8y+fi+shQ
 R15P085ss1nHYhKK2CTdm6c/dY4n3oSiGy88xbabI5EGfXROgoovaqXhT8yJwlMeBVHHAHH4ai
 pypO0j+HpQI/iBi+N97/gzmjc447lOBtd08n+KlSa1NJI+dmnHMbXezVl7whsFVfFjFXJytMOM
 npL6sHJGbW+j/QMnSFB13r0vkmc2gSI0vDVP4NOkHYCZJh6g52mwis5k7UnMYHQTPUVo9EEo2I
 YWw=
X-Utexas-Sender-Group: RELAYLIST-O365
X-IronPort-MID: 207071107
IronPort-PHdr: =?us-ascii?q?9a23=3AkPNi1hxMWMUVQErXCy+N+z0EezQntrPoPwUc9p?=
 =?us-ascii?q?sgjfdUf7+++4j5ZReDt+tigUWPXojB7f9Aze3MvPOoVW8B5MOHt3YPONxJWg?=
 =?us-ascii?q?QegMob1wonHIaeCEL9IfKrCk5yHMlLWFJ/uX3uN09TFZXgaFDI5H6/9zgfHl?=
 =?us-ascii?q?P4LwUmbujwE5TZ2sKw0e368pbPYgJO0Ty6Z74XTl22oAzdu9NQj5FlL/M0ww?=
 =?us-ascii?q?fJ5GZUdvRf3iVlKU/Akg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FRAgAbG+peh7A6L2hmgQmDHFGCKQq?=
 =?us-ascii?q?EGoNHAQGFOKBbglIDVQIJAQEBAQEBAQEBBgItAgQBAQKEeYFnJTgTAgMBAQE?=
 =?us-ascii?q?DAgUBAQYBAQEBAQEFBAICEAEBAQgNCQgphSk5AQuDVX4BAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEFAoEMVhEVCAEBODQCHwcCNCsNCAE?=
 =?us-ascii?q?BHoMEgkwDLgGpHQGBKD4CIwE/AQELgQUpiGABAXWBMoMBAQEFhSYYQQkNgTc?=
 =?us-ascii?q?JCQGBBCqCZ4oSgUE/gTgPgiyFEYMsgmCaF0uZa4JkBJkRBQcDHZB/jW+RI54?=
 =?us-ascii?q?5AgQCBAUCDgEBBYFqgXkzGggdEzuCaVAXAg2OOB2DOop0VjcCBggBAQMJfI8?=
 =?us-ascii?q?AAYEQAQE?=
X-IPAS-Result: =?us-ascii?q?A2FRAgAbG+peh7A6L2hmgQmDHFGCKQqEGoNHAQGFOKBbg?=
 =?us-ascii?q?lIDVQIJAQEBAQEBAQEBBgItAgQBAQKEeYFnJTgTAgMBAQEDAgUBAQYBAQEBA?=
 =?us-ascii?q?QEFBAICEAEBAQgNCQgphSk5AQuDVX4BAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEFAoEMVhEVCAEBODQCHwcCNCsNCAEBHoMEgkwDLgGpH?=
 =?us-ascii?q?QGBKD4CIwE/AQELgQUpiGABAXWBMoMBAQEFhSYYQQkNgTcJCQGBBCqCZ4oSg?=
 =?us-ascii?q?UE/gTgPgiyFEYMsgmCaF0uZa4JkBJkRBQcDHZB/jW+RI545AgQCBAUCDgEBB?=
 =?us-ascii?q?YFqgXkzGggdEzuCaVAXAg2OOB2DOop0VjcCBggBAQMJfI8AAYEQAQE?=
X-IronPort-AV: E=Sophos;i="5.73,522,1583215200"; 
   d="scan'208";a="207071107"
X-Utexas-Seen-Outbound: true
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
  by esa10.utexas.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2020 08:34:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNOCpsuo90Xs8YEeVmTsREzlpx6ar2teghDsTkcVBQOS3orup9ceiu6mkoSAT6MSALfXq4LrkWgcUoAkHpKNN5txyr3xidlfpSZ/bQ/DqRKI44sZk6n6Q5YELRgEVtVH7GtNg08e+BqpEYXCi5aMpeoH70VAu4F2jLMN/BvOzEvpjtHR81ZVZthh3Y+CDpTiacm7QHcjHbLdElqMQ/Ts1r7a40NzZWvXZWoseBf2QL0704liygRkd4fZ1BRgKM97j4ruKikNzbdWUeC0bouUto17Q1LpMtfAEXsyBRSTFZbebYNlty/PvUaphj8In/bXAxo0Svlmez1JqISm6fRTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5Ef5iDhrvL/SLV4IyYbZu2u6YgA9wzjcBe93q/Cg3Q=;
 b=IP1JFNk0fA3Vuo3GFO2P+qJ7WRGlBsv0zSCDgFHKw4OhFg0r0Q0PWvgYCl3vBqDOE4IAzlxHdYkiV3ayLnsMceK3wHOf6kgkosw8H/o8Z8qHwFokxhKxo7GChUtxiBNsJWHUMdVqwJMZqFL3aDbejidv+vUKNnAM/DJPGQCGTNeLRgP+K7m3+8okEflJA+QvShqopfrw5rYhzUds5j3zE2ZB94BhZh7H3FJGMr4m7D9/kLJvS3/gRjdp7Lx0BVTKv6kh1C16JwNxtt9ocR0a/L9OoR0iZTiSamEca/+djxXio/sSlMt3Str2z5fs0yXL7YTxdCRCwULW93lAIxGMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=math.utexas.edu; dmarc=pass action=none
 header.from=math.utexas.edu; dkim=pass header.d=math.utexas.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.onmicrosoft.com; s=selector1-utexas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5Ef5iDhrvL/SLV4IyYbZu2u6YgA9wzjcBe93q/Cg3Q=;
 b=bDb2UYIu12U3EgMaBQcDKc5/x7wWOXY9ucA8hlajLdvojGUMKOUhR6uIjnSn5EiEtaBXvkgm7Rp9g712K3ZxWnn7gJm9YSyE1ypRYgRymRElvv3/liW0s8b0v00HAIWkVo3Z6Ksqjz2O7ydklguC5xU9eofW0SdMokJcy6IriFo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=math.utexas.edu;
Received: from BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
 by BYAPR06MB6376.namprd06.prod.outlook.com (2603:10b6:a03:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 17 Jun
 2020 13:34:08 +0000
Received: from BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::8570:7340:3a13:1f87]) by BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::8570:7340:3a13:1f87%3]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 13:34:07 +0000
To:     "autofs@vger.kernel.org" <autofs@vger.kernel.org>
From:   Patrick Goetz <pgoetz@math.utexas.edu>
Subject: The automounter hangs on attempts to mount non-existent directories
 unless the option vers=4.2 is specified?
Message-ID: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
Date:   Wed, 17 Jun 2020 08:34:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To BYAPR06MB3848.namprd06.prod.outlook.com
 (2603:10b6:a02:8c::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.4] (67.198.113.142) by SN4PR0501CA0019.namprd05.prod.outlook.com (2603:10b6:803:40::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.9 via Frontend Transport; Wed, 17 Jun 2020 13:34:07 +0000
X-Originating-IP: [67.198.113.142]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5d138f-4e78-453b-8c19-08d812c31c3d
X-MS-TrafficTypeDiagnostic: BYAPR06MB6376:
X-Microsoft-Antispam-PRVS: <BYAPR06MB6376FCE5DD1306104A2CE5EC839A0@BYAPR06MB6376.namprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IankjNXzTFc4MwjTK9LeP3pHCL31jyQaJsUTDPt2XgQNhoFAgvqnhJGJHKAaQieWQlvns3ddt4W/KiSxuYCNUEoKK//RqT1JMigQPBPNNzz66rKKq1mMRlNwQMur1tMAmJMIr+nitcyDpdwPkjKCaiGr4LkAwoNF5ArHvou72hHqxz+a340azgCKUqJO1fizfTQ852waIRFoAlkcFZKAOopg0bU3k85+0aPw/4U6ovfp3VVMsPp/yVKb1tOxfv/6ImGM44bw0Z7OCkRLBSsw/rN002AFoXZInt30g462BGknvQdEgCPker64lnl6jnfXE+CGXJJIEkuJjBBn/VBmRWxrDG66urpE3fsCN554fzJXVqiLyLC0CupDlLJz8tBH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR06MB3848.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(478600001)(52116002)(8676002)(5660300002)(956004)(2616005)(31696002)(86362001)(66476007)(66556008)(75432002)(66946007)(2906002)(31686004)(16576012)(6916009)(316002)(16526019)(186003)(786003)(8936002)(26005)(83380400001)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kSEqjjoJ0CRsht16MLT+J8ZZy77ObdaF1wu8/KFWJ7ui+IXSbBVfHjTLERMuTHqr7cSL8OtrH/oV6wa12CtiOOpNYNOndFYBWAF7WPPZElo5Jfc4Y50sYOq4j+IHJvw2hsDk0w8uPj9EflBQMSbrVYuRUvGJw1QrNB4RlaktiNF5FHkqeB74Z68zGTprgASGo9Z4zof1IGLkxMFyY+lbEY496m8ojMSdQlcrWiqct3ZmL46qAjBLMrHk9rFfX6s+ynoEmdMLemNZuZqeuSB8kOuOQVFfTT54NHW/lAr6bsFIuNM7Ntc4LY2wegBNJ+nc01Nk7hV04gf4i8/u+SOHZqO4Nqn23hiaj4APfbD6LlcjjpYUsbWKJD7YOzMgi6prIv2f8mqCE/YiwDS9JYd7SlTut0MFSFYsZJw6FevhGa55d6bxlCTtwd3DFYqHBevBBXboOneX1+KfJ46ZuUmLe1J7ZlUXfgM3vlp4GR6wgc6Wso6FDUEKH7vY8qbcinoy
X-OriginatorOrg: math.utexas.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5d138f-4e78-453b-8c19-08d812c31c3d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:34:07.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 31d7e2a5-bdd8-414e-9e97-bea998ebdfe1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTl7jNWZmXETopo7vahNBVlFbq3h+S2kxBleA4Yp6KmiYto+Cn1rYrUawJ2ChQ1DPUIIl/rnO7noHUAO6z8eRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB6376
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi -

We've been having strange performance problems for over a year on high 
powered workstations with fast (10Gb) networking.  Programs that run 
instantly on user's laptops would take 5-10 minutes to even launch on 
these dual Xeon workstations with 128GB of RAM. The OS is Ubuntu 18.04

Last week I finally tracked this down to a comedy of errors, the first 
involving autofs.  We only use NFS v.4.x, and thanks to a tip from Ian 
Kent, I had added:

   mount_nfs_default_protocol = 4

to /etc/autofs.conf.  However, using this setting in /etc/auto.home:

   * octopus.biosci.utexas.edu:/home/&

any attempt to access a non-existent directory in /home (e.g. 
/home/syslog) would result in the automounter hanging while various 
attempts to mount were executed.  Changing the auto.home line to

   * -tcp,vers=4.2 octopus.biosci.utexas.edu:/home/&

resolved this issue.  I can understand the tcp option, but what doesn't 
make sense to me is the necessity to also specify vers=4.2
If I remove vers=4.2 from the options list, the automounter starts 
hanging again when asked to mount a non-existent directory.

Maybe this is just an issue with mount.nfs?

This isn't relevant to autofs, but to satisfy the curious, the next 
obvious question is why on earth were people attempting to mount 
non-existent directories in /home, and the answer is (in part) some 
negligent Debian package management.  After sifting through strace 
output I noticed entries like this in /etc/passwd:

   syslog:x:102:106::/home/syslog:/usr/sbin/nologin

I guess they were thinking that since no one can log in as syslog, it 
doesn't matter what the home directory is set to; likely someone who 
doesn't use or perhaps even know about autofs.  On my Arch systems these 
entries would look like this:

   syslog:x:102:106::/:/usr/sbin/nologin

The final piece of the puzzle is why on earth do misconfigured entries 
in /etc/passwd come in to play, and the answer is anaconda/miniconda.  A 
lot of computational biology tools are embedded in conda environments, 
and for some frankly inexplicable reason conda likes to troll through 
/etc/passwd searching for environments. This seems like an anachronism 
from the days when all real users were documented in /etc/passwd rather 
than via some LDAP, AD, NIS, or Kerberos directory server.

