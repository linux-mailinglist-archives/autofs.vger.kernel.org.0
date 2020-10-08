Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AB72874EA
	for <lists+autofs@lfdr.de>; Thu,  8 Oct 2020 15:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgJHNHu (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 8 Oct 2020 09:07:50 -0400
Received: from esa12.utexas.iphmx.com ([216.71.154.221]:41675 "EHLO
        esa12.utexas.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730121AbgJHNHu (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 8 Oct 2020 09:07:50 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Oct 2020 09:07:49 EDT
IronPort-SDR: hbMMkj4ToClDgedfWFtry/MGatCIMl+iJKurTpARCVY3s5LT81yq/4VoO+jWPjRNQNY/Fsot9S
 Yy2BRLP0EElVwr9wJq6Xu7UePwk6YSDcLhC00R+2xCX8iJfdbqfZBnLQPRqKiszM+WyhVrSVfj
 4F7PXZ54U87gtsRVNYvWPNd44Mg5YXI4njN7/5Kh8chHMX+5sK6qZj3RgXKBUQCcr6VMWB/0gQ
 FKBPDY+4JEqQrSYMC1rLhBmCyBegic+KWECFYz7oOic8tYGlLtLit6YafRU/wd3hminRcvMjoo
 Nno=
X-Utexas-Sender-Group: RELAYLIST-O365
X-IronPort-MID: 246978366
X-IPAS-Result: =?us-ascii?q?A2HfAgAzDH9fh2hGL2hgHgEBCxIMQIMhKSh3gTQKhDODR?=
 =?us-ascii?q?wEBhTmHai6Ye4JTAxg9AgkBAQEBAQEBAQEHAQEfDgIEAQEChEgCNYFXJjgTA?=
 =?us-ascii?q?gMBAQEDAgMBAQEBBgEBAQEBAQUEAgIQAQEBhXk5DINUSTkBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQKBDD4BAQEDEhEVCAEBKgoED?=
 =?us-ascii?q?wsOCgICEgETAgIyJQYBDAgBAR6DBAGCSwMuAZs7AYEoPgIjARItAQELgQUpi?=
 =?us-ascii?q?VeBMoMBAQEFe4FRgkoYQQkNgTkJCQGBBCqCcohugW6BQT+BEScPgiowPoQlM?=
 =?us-ascii?q?S8Cgk2CYJAiB4tfU5sCgnKJAIZahHgfhWoFBwMfg0yOYo8BkxqgHAIEAgQFA?=
 =?us-ascii?q?g4BAQWBa4F7MxoIHRODJAlHFwINjh8MDgmBAgEOgj2KdFY3AgYKAQEDCXyLC?=
 =?us-ascii?q?A8YgQwBgRABAQ?=
IronPort-PHdr: =?us-ascii?q?9a23=3AOXAC5BVEMXQHxgjCu/H+Q7u151TV8LGuZFwc94?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSBN6HuexLhvCQsK36X2EEp5GbvyNKfJ9NUk?=
 =?us-ascii?q?oDjsMb10wlDdWeAEL2ZPjtc2QhHctEWVMkmhPzMUVcFMvkIVGHpHq04G0MFR?=
 =?us-ascii?q?jlcwl4POL4HsjVlcvkn+y38ofYNgNPgjf1aLhuLRKw+APWsMRz48NiJ689xw?=
 =?us-ascii?q?GPrGFPfrFTzH9oY0+Pkgb1/YG98IMw/g=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,350,1596517200"; 
   d="scan'208";a="246978366"
X-Utexas-Seen-Outbound: true
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
  by esa12.utexas.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 08:00:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCzzN9mPd8stOe7Zfu5mQ+euwdxKa4vJzhmO//fAwa3SGiuQSKXuez3I+j0BlB8vMei0nIwIhvqDtmWEq6eW5X0C2mHsTm4V7WxMj9QKy44aJ1vn8QsNNKx8e9wCYNal2RxU9zEiEjIJsxbjj/YduK73LNIE0GPaxs4zSQIZr3ocdxDKkItwV+wDLL95IHe7D8V2axxwLTzjWNjLxJil5Fawh4yQeB3BpjmKro7Ezgv6kRKHRKRjChPU/5UMPwD/yPHcENDtuf3Nr7D+dpVEwTYtlo3KOHWVDMgs7qztIoPKJ49tjOe4s+14pg+B+i0lbyoTuRHABNhYUdrOgFvdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUDhGcJPdLwKuL5i9RUCRLi8lkxqOyy1LQz9UluDx58=;
 b=ggCVaVLZF4Dlfr++wUloj56jUWPycUmuvhP8OYq0WvaaKHAQMMTNLt+KRDX8X1kRpoavgbbfaWYqLYWOhl4D/VkXWcrBTBSrKE7282Wmw0imPSeRc6rf9iM/inDINSrFquSqRWdghPZkU1fkIX0BH4wN+fhbts/ofS8BWNL6+zMwxQwSlgR4lepgj+nMWfqUgCmQpIqemYqvVUIoijnzfedyQlBDDTEXplgpze0WptCxUhwHwLm+SSb4CWGrYY11mfUCI6ZFyQlinY4WICzaRrIWRhgFKvAGwtmk6+vmQmSWfbjpK5Puvr4UNd6heHQKP1Mkgk4HAaFUuYe9Ftclfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=math.utexas.edu; dmarc=pass action=none
 header.from=math.utexas.edu; dkim=pass header.d=math.utexas.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.onmicrosoft.com; s=selector1-utexas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUDhGcJPdLwKuL5i9RUCRLi8lkxqOyy1LQz9UluDx58=;
 b=AKSQS/Z/0VskkEDv1wPEW08yYfd7IHKxxSuAIRiS1mnHQt37Src9DjF4mFLz63B8jVeA1YgyYN2NdlqnKIuUssGYmfiDL3gaiQ44vUxbcUXj9yov3ELfnvnb2P2d+1TUqg9tnLPOf4RlTk6P4P87X51JNZE7X3DUDsr76fEwQVk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=math.utexas.edu;
Received: from BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
 by BYAPR06MB3974.namprd06.prod.outlook.com (2603:10b6:a02:91::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Thu, 8 Oct
 2020 13:00:37 +0000
Received: from BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::145b:33d4:e2d3:ad59]) by BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::145b:33d4:e2d3:ad59%5]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 13:00:36 +0000
Subject: Re: A puzzling timing issue with automounted home directories
To:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
References: <61ce4c86-caee-6c91-6e04-09e6939d48f1@math.utexas.edu>
 <6c3517990e67642f3bd81c1e51e96ab0d9c7d078.camel@themaw.net>
From:   Patrick Goetz <pgoetz@math.utexas.edu>
Message-ID: <73e0d2e4-aa58-44df-da49-8c7faafe3272@math.utexas.edu>
Date:   Thu, 8 Oct 2020 08:00:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <6c3517990e67642f3bd81c1e51e96ab0d9c7d078.camel@themaw.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.198.113.142]
X-ClientProxiedBy: SN2PR01CA0043.prod.exchangelabs.com (2603:10b6:800::11) To
 BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.7] (67.198.113.142) by SN2PR01CA0043.prod.exchangelabs.com (2603:10b6:800::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Thu, 8 Oct 2020 13:00:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3564cb78-47ac-40f5-699f-08d86b8a263a
X-MS-TrafficTypeDiagnostic: BYAPR06MB3974:
X-Microsoft-Antispam-PRVS: <BYAPR06MB3974177CCDC3DBAE41C0DBAC830B0@BYAPR06MB3974.namprd06.prod.outlook.com>
X-Utexas-From-ExO: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8M7XvKrUAouoOLygVXdY5+6DBeapj/HjMfki29DKnQKCROOIILOUZ0QfVorx06CK3rh4/UAhZzm6R9rWudUMXRSNxVDL3H/unToIWYMyaG+P/0KQexh2f7DJBCkPLdnNs/KO/EVmKCZ7az0HWkpz0+BW3Q8LgTDSX8Fkm362d6Qos6venLO4qo7pL8dxYV7YhLwy4o6r8wVP/l7BQzF74WPekboY6n8AdN43coZzRiRaycSfRVukX3NR+XzDkt1vCiIwuDRoQvYZRVgqeI6vyPFSdxrCXdMVCsNC0h4qI5RPvaxM9u5BqAdaGm2qZFAcZn9aHRe6NfPbGPB5asjFD63JODfPj1wO3gKfG6EC/sPKxSiQGGVDiJbQ+GAvGBo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR06MB3848.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(66946007)(66476007)(86362001)(956004)(52116002)(31686004)(26005)(53546011)(16526019)(186003)(75432002)(2616005)(316002)(786003)(66556008)(8676002)(83380400001)(31696002)(45080400002)(16576012)(8936002)(5660300002)(6486002)(2906002)(110136005)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: n9EjM/XK5kq23SZIsgNH2tqXoeRgINqTwppPM34Ra22+WjONFzGcpFjmuXieX2QNiNJ5BrcSrJUthYAF8euh+BI9LdyNR0jYq7MVqNFjJodkiTglZNjPycBDPbCVjy31ZA2Xp3NtHYtkHejyQV1uSuggLSprX0N0JlezKFqOCqivVsGN5afRizGNdfZBboVOSDT/OnML+t4e+fLQW/2rr7nUTaWAtlQb9QJR46ySMjf5onD2nntF1RA8aA1F7HHUmy9HIiebKCFTuguKqIDc/5i7kppMQeDzg3JOhL8JFwkC9KiIVsfrVCXCwL3lyOrjacst2bNth8kmwfev7zBSPetoOSLlmjOOPgem8d2gFHDTiytkNSCBZgmNziWRU0cJd48k/xRZwlzN05jNkWClMrDfsaKb1o9p7yyuvx1XnkDPyIwx/Bc5GSycUo/WTWUG2TUESFbldM953JqFc2HUzUL6GQEr4cNnyOyFHjSrEKm4/KJdo2gyqhL3Bxg2AY1LW+g2bOV4HlASXGucyaE4IXNx88DftVL+W9m/NNxs3QTmUB4poe5popeOOvo2RLlbEnWpxVplLwDByxuxrBbdZ8fsf70yXbETKXnXd7Tgz5PpUd2j095Ag9SahBZM7CrGd6L5SSxdbTNZSa2pRecs4A==
X-OriginatorOrg: math.utexas.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3564cb78-47ac-40f5-699f-08d86b8a263a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR06MB3848.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 13:00:36.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 31d7e2a5-bdd8-414e-9e97-bea998ebdfe1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMqVxkk/ECsCV+xnIE72Dla48cX3gNmTI2KRp1c69JYaFmpKUetnaK+tvFqjWryE880cmz/qNTSX92hgPLxZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB3974
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org



On 10/7/20 7:38 PM, Ian Kent wrote:
> On Wed, 2020-10-07 at 18:39 -0500, Patrick Goetz wrote:
>> I have a rather puzzling timing issue which I hope someone can shed
>> some
>> light on. We are using a centralized authentication service
>> (Microsoft
>> AD) with authorization restricted to members of a particular
>> security
>> group.  Home directories are housed on an NFS server (Ubuntu 20.04)
>> and
>> automounted to a collection of compute workstations (currently a
>> mixture
>> of Ubuntu 18.04 and 20.04 systems).
>>
>> Because there is a reasonably high level of turnover (grad students
>> and
>> postdocs) and because I don't want people to login directly to the
>> NFS
>> server any more (hence can't use pam_mkhomedir without compromising
>> security by setting no_root_squash on the NFS server) I decided to
>> try
>> and automate the creation of home directories a different way. To
>> wit, I
>> run a pam_exec script in the session configuration:
>>
>> /etc/pam.d/common-session:
>> -------------------------
>> session	optional  pam_exec.so log=/tmp/pam_exec.log
>> /usr/local/sbin/make-nfs_homedir.sh
>>
>> Which runs this script:
>>
>> -----------------------------------------------
>> #!/bin/bash
>>
>> if [ $PAM_TYPE = "open_session" ]; then
>>
>>      UTEID="$(cut -d'@' -f1 <<<"$PAM_USER")"
>>      USERGID=$(id -g $UTEID)
>>      PROC=$$
>>      TEMPDIR=$UTEID$PROC
>>
>>      if (($USERGID > 100000)); then
>>
>>         mkdir /tmp/$TEMPDIR
>>         mount helios:/home /tmp/$TEMPDIR
>>
>>
>>         if [ ! -d /tmp/$TEMPDIR/$UTEID ]; then
>>            mkdir /tmp/$TEMPDIR/temp/$UTEID
>>            sleep 70
>>         fi
>>
>>         cd /
>>         umount /tmp/$TEMPDIR
>>         rmdir  /tmp/$TEMPDIR
>>      fi
>> fi
>> -----------------------------------------------
>>
>> A brief explanation is in order.  nfs_server:/home is mounted to
>> /tmp/$uid$pid on the client workstation and the script checks to see
>> if
>> the user's home directory already exists.  If so do nothing.  If
>> not,
>> create it in /home/temp.  On the NFS server, the /home/temp
>> directory
>> has 1777 permissions, so anyone can write to it, including the
>> nobody
>> user from the workstations.
>>
>> Now for some systemd black magic.  On the NFS server there is a
>> systemd
>> path unit file and accompanying service file.  Whenever a directory
>> is
>> created in /home/temp, there's an NFS server script which moves it
>> to
>> /home and sets the appropriate user permissions.  This process is
>> nearly
>> instantaneous; i.e. if I type `mkdir stuff` in /home/temp on the NFS
>> server, I don't have time to type `ls` before the directory is moved
>> to
>> /home with appropriate user permissions set.
>>
>> One last detail:  /etc/auto.home on the workstation:
>>
>>     * -tcp,vers=4.2 helios.biosci.utexas.edu:/home/&
>>
>>
>> OK, now for the puzzling part.  Notice the
>>
>>     sleep 70
>>
>> directive in the client side pam_exec script.  I've fiddled around
>> with
>> this quite a bit and anything less results in a message of
>>
>>     Could not chdir to home directory /home/pgoetz: No such file or
>> directory
>>
>> on first log in. I've checked, and indeed the directory is not
>> mounted.
>> If you hang around in / long enough (roughly 70 seconds) you can
>> eventually cd to your automounted home directory.
>>
>> So, Question: Why the delay?  The home directory on the NFS server
>> is
>> created nearly instantly, so it can't be that.  And as mentioned, if
>> I
>> sleep for say, 60 seconds, the home directory isn't immediately
>> accessible on login, although one can cd to it a few seconds
>> later.  I
>> can't fathom why the required delay.
> 
> It sounds like the NFS client isn't seeing the attribute change of
> the server directory /home.
> 
> IIUC basically there are two things to worry about, first that the
> VFS path walk on the client actually results calls into the NFS
> client code (it might not for various reasons, like the VFS doesn't
> think the directory dentry needs revalidation), and second, the
> attributes used by the NFS client to detect staleness aren't being
> changed by the server operations being done so revalidation isn't
> done by the NFS client.
> 
> Not sure what to do about it short of diving into the NFS client
> kernel code.
> 
> Ian
> 
> 
> 

Thanks, Ian. I just wanted to make sure I'm not overlooking something 
dumb. Looking at the NFS client code is not warranted, given the minor 
inconvenience this causes.  While this is obviously a bit of an edge 
case, since there are other ways to get this done, given the ongoing 
shift to dynamic containerized computing these kinds of issues will 
continue to gain prominence though.



