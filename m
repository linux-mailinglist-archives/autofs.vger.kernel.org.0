Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A452058A5
	for <lists+autofs@lfdr.de>; Tue, 23 Jun 2020 19:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbgFWRcZ (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 23 Jun 2020 13:32:25 -0400
Received: from esa10.utexas.iphmx.com ([216.71.150.156]:9849 "EHLO
        esa10.utexas.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732408AbgFWRcY (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 23 Jun 2020 13:32:24 -0400
IronPort-SDR: 2E6P3f2UeJrb+1N1t+GGyMnhac3OeYYojTaHyXq8mQq0krPXigFTl1T39Mkkd2nCECSzVYhMIB
 DlGnTIr+fGWbjy1/DRgvgUYSSHwlO/4klpxrA+2Z8HsLLBXzqMvQBEGwCFA+K8GH36RS7WnyLz
 UQnh4+d+b0sk0pIy/ISCCH/8ZdQdvC7jEkX/PHnIzZK+P9Oz7+zB8j4Ntzc+R6eWV3c3PWygr7
 hIL3ZpjfabmDnoY/14PFyaURx0wQm7XPJIV23a4QH7LRDLCa+VuxSavrREXlWVUOvr9OR3u/WH
 94I=
X-Utexas-Sender-Group: RELAYLIST-O365
X-IronPort-MID: 209940174
IronPort-PHdr: =?us-ascii?q?9a23=3A46z1wxJyWh0YhmLHutmcpTVXNCE6p7X5OBIU4Z?=
 =?us-ascii?q?M7irVIN76u5InmIFeGvqk/klDER8PY5uhChu6QtLrvCiQM4peE5XYFdpEEFx?=
 =?us-ascii?q?oIkt4fkAFoBsmZQVb6I/jnY21ffoxCWVZp8mv9PR1TH8DzNEPdr2f07jMIHB?=
 =?us-ascii?q?j7cw1vKbe9Fovblc/i0ee09tXaaBlJgzzoZ7R0IXDU5QXcv8Ubm81sMKE0nx?=
 =?us-ascii?q?7AvnsOZvhb1WpzY1+fgkXx?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2E6AgCFO/JehypCL2hmHgEBCxIMQIM?=
 =?us-ascii?q?cUYIpCoQag0cBAYU4iA+YVYJSA1UCCQEBAQEBAQEBAQYCLQIEAQEChEUCNYF?=
 =?us-ascii?q?gJTgTAgMBAQEDAgUBAQYBAQEBAQEFBAICEAEBAQgNCQgphSk5DINVfgEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQw9AQEBAQIBEhE?=
 =?us-ascii?q?EEQgBATIGDwsOCgICHwcCAjIlBgEMCAEBHoMEgkwDDiABqhoBgSg+AiMBPwE?=
 =?us-ascii?q?BC4EFKYhgAQF1fzODAQEBBYJJgk0YQQkNgTcJCQGBBCqCZ4oWgUE/gTgMA4I?=
 =?us-ascii?q?lBy4+hCWDLIJgmh9MmHKBA4JkmR8FBwMdkQqNcZExmiKEJwIEAgQFAg4BAQW?=
 =?us-ascii?q?BaoF5MxoIHRODJFAXAg2OHhodgzqKdFY3AgYIAQEDCXyOTwGBEAEB?=
X-IPAS-Result: =?us-ascii?q?A2E6AgCFO/JehypCL2hmHgEBCxIMQIMcUYIpCoQag0cBA?=
 =?us-ascii?q?YU4iA+YVYJSA1UCCQEBAQEBAQEBAQYCLQIEAQEChEUCNYFgJTgTAgMBAQEDA?=
 =?us-ascii?q?gUBAQYBAQEBAQEFBAICEAEBAQgNCQgphSk5DINVfgEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQw9AQEBAQIBEhEEEQgBATIGDwsOC?=
 =?us-ascii?q?gICHwcCAjIlBgEMCAEBHoMEgkwDDiABqhoBgSg+AiMBPwEBC4EFKYhgAQF1f?=
 =?us-ascii?q?zODAQEBBYJJgk0YQQkNgTcJCQGBBCqCZ4oWgUE/gTgMA4IlBy4+hCWDLIJgm?=
 =?us-ascii?q?h9MmHKBA4JkmR8FBwMdkQqNcZExmiKEJwIEAgQFAg4BAQWBaoF5MxoIHRODJ?=
 =?us-ascii?q?FAXAg2OHhodgzqKdFY3AgYIAQEDCXyOTwGBEAEB?=
X-IronPort-AV: E=Sophos;i="5.75,272,1589259600"; 
   d="scan'208";a="209940174"
X-Utexas-Seen-Outbound: true
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
  by esa10.utexas.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 12:32:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ+7L6eerrimc2HGljDxVfCrhDTcRg7zJKqvPp0G5P6mGO6HN9U2vbxAuIJNPIMVpt1T3g2JxDAcOFMKvV5yMhGyzL7YXcIfqfdz7CoDJb+PVFtXzVOTg08D5r4n1vHrcu9VKZmPr0VcHIn4DNxnI1AD+kYjTOJDfrfkl9wlGA0vjelKbCTHKq1ps6IBedIWjowd2k7fSiZODROqfJ+ReYXYumYt7CeQNJKZD661pYBruzwJEmFsCGKpY4iMwdmNWrGcEaH0hQPJKFy81DI8GJOotlPiG+kQd6y0xmB/B7HZr6YXwjQnyd/AHzEGEuqq+Oir2Ajlwy+S2rZXi418QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWSO0Du/FNKYqq3w80Ta5PORx8dPemb3f0A3j3Kev3k=;
 b=lFP2lViC6V+L3H+7SEgNBk9c8CXs74DxQNeB+T7iJpGeMaz5V2PTGwX0JBp0u0/LVsBtD1ig/l4YuFA9TOHg0FXM/UQFRRHihbDeu1072lzLuD+lYHDKi2ZCkpJSZ9JfGRERARnsNf+f/rrXP0vMBoQYEmM2m6uQCvSRE7+sxMCbnB3QejXzwTg8NyBAdrGs4yeOPVj9fBygIsk61GpNgT4rzmO+GjALvsaToVR1bGNWU5FXDjYIw8zeboeQLl7LznqVP2+LXmfDGkKzicAytRG9ygsZLpz5hqEsGlgDfXBnC/yRhTfAlILKFoHeQWkBLnOQClw/j0/cg0aHN+XCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=math.utexas.edu; dmarc=pass action=none
 header.from=math.utexas.edu; dkim=pass header.d=math.utexas.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.onmicrosoft.com; s=selector1-utexas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWSO0Du/FNKYqq3w80Ta5PORx8dPemb3f0A3j3Kev3k=;
 b=XpX4U8Iy4COKupQDSfFhsi4HDSd9pOdtkPBqFO9FX+qiRv798TjFwz6S31ngZZCt9ZEsRgBBjuntwqLZPbMn3WL3WTZxolMGdCdnuHv1rc+BD+Fl26tHhzZuuTQOmECfbkg0N+2PMVbvTo1r3v7+lRJwbbIUM5D7Nvdgi4Y+1ww=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=math.utexas.edu;
Received: from BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
 by BYAPR06MB4248.namprd06.prod.outlook.com (2603:10b6:a03:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 17:32:22 +0000
Received: from BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::8570:7340:3a13:1f87]) by BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::8570:7340:3a13:1f87%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 17:32:21 +0000
Subject: Re: The automounter hangs on attempts to mount non-existent
 directories unless the option vers=4.2 is specified?
To:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
References: <fb9cccdf-5b80-ce24-1f68-2b6c772437d0@math.utexas.edu>
 <7f144a0767309316dd4662bb5c2fe1472befa724.camel@themaw.net>
From:   Patrick Goetz <pgoetz@math.utexas.edu>
Message-ID: <66a3171f-c514-8010-c8cb-214d1306351f@math.utexas.edu>
Date:   Tue, 23 Jun 2020 12:32:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <7f144a0767309316dd4662bb5c2fe1472befa724.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:5:54::36) To BYAPR06MB3848.namprd06.prod.outlook.com
 (2603:10b6:a02:8c::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.4] (67.198.113.142) by DM6PR06CA0059.namprd06.prod.outlook.com (2603:10b6:5:54::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 17:32:21 +0000
X-Originating-IP: [67.198.113.142]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f31b21bf-dbba-408f-5c31-08d8179b6292
X-MS-TrafficTypeDiagnostic: BYAPR06MB4248:
X-Microsoft-Antispam-PRVS: <BYAPR06MB42486E662365382F01EB658983940@BYAPR06MB4248.namprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zvm8Ozl8FCvrxVFSlzmHkLKxwL6VSYOjEBkxbmfMBe0a4j8Zaa2kxlU9RreRYZmxUNU8YcssqoDpZ+hbn80FKivtfohgqpZdtXSd6m0x+s4rT5wjUvD7cDgp+jCHcN18fWkDFAIQn4bNBZX3u1or3IqExbNINJ55sp7UCM58mzSoBnTPr1n40SFokZhmsAhekkKeV/8xy0MYPzYAqlGQjROqmrE66RW5Vdlarfz+YoHTeHKrbUim90lAk23OcAMLuHe4z+9svSceTxxyRs2OpPsTv1ktOjR+u3eNoRDOseZyJfZNEnh5K1bBB+hr7D95/HeKQJsote0LAcgTL9w15+89ubKtCfe5Lho2fEGheeq5/zjA9NCsVcYxiIaduz1N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR06MB3848.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(6486002)(8936002)(186003)(16576012)(110136005)(8676002)(16526019)(31686004)(2616005)(956004)(478600001)(31696002)(86362001)(5660300002)(4744005)(66556008)(66476007)(66946007)(2906002)(53546011)(316002)(786003)(75432002)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cYdgZU+J3H5aApdSYMP37ASXd4kRcY23PqrysJP1GAzsD+QETsAcn2cORzEd0NqUWvCPIdJ1yjijQWtcgNyPW3Qvd7/HY60GEexZS2WHJZQH7fCKo5JQQ8PQxLnx53zSMiclU3PODICzChjOyy7RPdcbd9ZAH3Bl7llpJt052yvCn3NGoH3njWBN+OApqIWL3e9aG3Nb5ceQo5XxUmARdT3D0b27ajuhdS8tKYB9IlRO0EcfvifUc19pasRwJN11XkopvXZHWQis9N1Q9tVEnjXOMyTpkF4RZC+vb6O63i84NfGCjib04YxDgZUdPtq4yIMoeb9LCeVDsddCeuZ92lGcsG6gJedj4bhswX/0aSoNZKnCtwNT217LyIyCoD+r0LWy6+Z6iUgU7vNjLsi0na1ziAKfy+TXiRSOySsrf5Hl28FTtGpqK8Q0+vqkruC5F5o385dfAHQw54aQoJwa798c02QQYGKFOJNWGvPuXlUAu9dDujZYsHxPDWzDAFhW
X-OriginatorOrg: math.utexas.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f31b21bf-dbba-408f-5c31-08d8179b6292
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 17:32:21.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 31d7e2a5-bdd8-414e-9e97-bea998ebdfe1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbgwLbLCtRPBBG0pi/LallMgwQ6u4q8OEFFJtULFHklAlrB1ZgWnF6QF2JzdIU7CC0+K1cr230g9VlHdiH+BVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB4248
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi -

Sorry for the delayed response.  Work has really picked up the last 
couple of weeks.

On 6/17/20 8:28 PM, Ian Kent wrote:
>>
>> Maybe this is just an issue with mount.nfs?
> 
> It's hard to say, possibly, that would need a debug log to check it
> out.

Although the problem is completely resolved by specifying

   -tcp,vers=4.2

in /etc/auto.home, I'm happy to turn on debugging on one of the 
workstations and send the results if this would help.


> 
> If the problem is bad enough it might be worth adding some entries
> above the wildcard entry that bind mount to one or more directories
> to keep those applications happy.
> 

Or create dummy home directories on the NFS server, or change 
/etc/passwd to the more correct:

    /home/syslog  -->  /

however, given that, for example,

   $ ls /home/syslog

returns instantly with "no such file or directory" when the mount 
options -tcp,vers=4.2 are specified in /etc/auto.home, my problem is 
functionally resolved; I'm just in the bug reporting stage.

