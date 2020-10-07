Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF20286B98
	for <lists+autofs@lfdr.de>; Thu,  8 Oct 2020 01:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgJGXqb (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 7 Oct 2020 19:46:31 -0400
Received: from esa10.utexas.iphmx.com ([216.71.150.156]:44238 "EHLO
        esa10.utexas.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgJGXqb (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 7 Oct 2020 19:46:31 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 19:46:31 EDT
IronPort-SDR: F3nzdGNFwwqJSM/ZIpFdopgCB4p8zey8OssW8nm+31U75890hv1NG1MUYBqQuern8kjUlEViKI
 IWzeXhKxiGxF6bw/dtx15En64AkoYmefN0TYujWoMCkb7Mm4Pi64XuzrpDgzW2IcBO5F/njDcD
 YOLpv6i5tY1iDtkXVBzZi+kLMzZueWchJep9hnWijXzb30YvWyc7UvS6SvXNAtwnjwD6vBvtA8
 03I7ckaQUMsxJ33Nbk7ynBUNbPeyxGkuKHve7+Sjl3RVoXxE8VIfY8IqqJXjy3EcGZf+6B6IdV
 H7U=
X-Utexas-Sender-Group: RELAYLIST-O365
X-IronPort-MID: 246532705
X-IPAS-Result: =?us-ascii?q?A2EPAwBKUH5fhzYkL2hggQmDIVF3gTQKhDODRwEBhTmID?=
 =?us-ascii?q?pkpglMDGD0CCQEBAQEBAQEBAQcCEwwOAgQBAQKESDeBVCY4EwIDAQEBAwIDA?=
 =?us-ascii?q?QEBAQYBAQEBAQEFBAICEAEBAYV5OQyDVEk5AQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQUCgQxWERUIAQE4KAwCEgETAjQrAQwIAQEeg?=
 =?us-ascii?q?wQBgksDLgGbVAGBKD4CIwE/AQELgQUpiVeBMoMBAQEFe4FRglgYQQkNgTkJC?=
 =?us-ascii?q?QGBBCqCcohugW6BQT+BEScPgiqFEzEvAoJNgmCQIQeLX1ObAoJyiQCGWoR4H?=
 =?us-ascii?q?4VqBQcDH4NMjmGPAJMaoBsCBAIEBQIOAQEFgWuBezMaCB0TgyQJRxcCDY4rD?=
 =?us-ascii?q?gmDTop0VjcCBgoBAQMJfIsID4EkAYEQAQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3A1/l2uRVAiXqLGQvbnq8zNr8m1AbV8LGuZFwc94?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSBN6HuexLhvCQsK36X2EEp5GbvyNKfJ9NUk?=
 =?us-ascii?q?oDjsMb10wlDdWeAEL2ZPjtc2QhHctEWVMkmhPzMUVcFMvkIVGHpHq04G0MFR?=
 =?us-ascii?q?jlcwl4POL4HsjVlcvkn+y38ofYNgNPgjf1aLhuLRKw+APWsMRz48NiJ689xw?=
 =?us-ascii?q?GPrGFPfrFTzH9oY0+Pkgb1/YG98IMw/g=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,348,1596517200"; 
   d="scan'208";a="246532705"
X-Utexas-Seen-Outbound: true
Received: from mail-sn1nam02lp2054.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.54])
  by esa10.utexas.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 18:39:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsXz8hpeMnwt9skgG7ZMOHDxT5ZGj7fOWuduIZ8mIoBy/dM3SW+EAqWhqB0dkFfpNwUroTm/edDO6Aa1lZB1V2dNMeqH58x9Mc+4zalXSCEeGiLw1Qv2iw91YAOAsER1MdWFLSvFO67uUQLkcgV/d6x/eFSgrphxDFOY0IJIVLcSdr2S+MKOCemOKaOHE/DLKR3Tesdz6QmEbC6O0SXvt+7r2ea8TjzsayXaWXzZGU4jBj6Nv2xETBtL06iIsVxX/c2WZd6qD0HY5yUYdt3tf2SlI/UT+hyx/ELAfJ8C3bW43dNW45SrFqcl5pUyyYjyeMvTDI8HVLt+rIwkJ/P+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjMzGuu7Khp9PYpIhbliRS6lfcLt5qO6qz9ZDqh6g7o=;
 b=iWwCBPZrOj021voEpyTPN+tx/S1j+Tkk5l+7pvJMpmbs83+v0dI25Qp4wj5stLde2MUXDJZYHSOW9kkItcnLJ2S9c+PDAjL4K0n++4pWWo+TjwfScCrk9h+GGZPgsLN5mbqTg4E+Yrkzqouaouh9Pd/zi1eKc+IfFodfIzxPiuq/C1W8KmRqNQXD26HmcgQv/Z/RHHVoNwuVk8ldSdSUhhf50nQt9WtiKW9b2sAgzslYOINbvj03So35WPVE0NYmH5cu0Bw1w96H1edbACTNL0UmdA7uRrOadzO+fpGfaGDQGA6FX/sz/JYcdWm6zpb2HGH/paeLo56ketAnVslc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=math.utexas.edu; dmarc=pass action=none
 header.from=math.utexas.edu; dkim=pass header.d=math.utexas.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.onmicrosoft.com; s=selector1-utexas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjMzGuu7Khp9PYpIhbliRS6lfcLt5qO6qz9ZDqh6g7o=;
 b=L5HyEdkKFcWfkKpkq4GyTYzAAI9Uwv9GcavbTbqy0B35ggJEW0vIGNXhpX/OUOosUi74SPwhi2rF4xr2naNxeXh435iuiZ7gzJvzialTodj6+PhscxLpQ6h1B57yNcWmC3AiL0grwjTQXDTNO+1dzPtqgU75KCzAkuALQiCx8TA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=math.utexas.edu;
Received: from BYAPR06MB3848.namprd06.prod.outlook.com (2603:10b6:a02:8c::15)
 by BYAPR06MB3942.namprd06.prod.outlook.com (2603:10b6:a02:87::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 23:39:25 +0000
Received: from BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::145b:33d4:e2d3:ad59]) by BYAPR06MB3848.namprd06.prod.outlook.com
 ([fe80::145b:33d4:e2d3:ad59%5]) with mapi id 15.20.3433.046; Wed, 7 Oct 2020
 23:39:25 +0000
To:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
From:   Patrick Goetz <pgoetz@math.utexas.edu>
Subject: A puzzling timing issue with automounted home directories
Message-ID: <61ce4c86-caee-6c91-6e04-09e6939d48f1@math.utexas.edu>
Date:   Wed, 7 Oct 2020 18:39:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.198.113.142]
X-ClientProxiedBy: DM5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:3:93::12) To BYAPR06MB3848.namprd06.prod.outlook.com
 (2603:10b6:a02:8c::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.7] (67.198.113.142) by DM5PR20CA0002.namprd20.prod.outlook.com (2603:10b6:3:93::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Wed, 7 Oct 2020 23:39:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 006f72c4-622a-48e6-1ef8-08d86b1a395a
X-MS-TrafficTypeDiagnostic: BYAPR06MB3942:
X-Microsoft-Antispam-PRVS: <BYAPR06MB3942115D04D4A4F0A5D880E6830A0@BYAPR06MB3942.namprd06.prod.outlook.com>
X-Utexas-From-ExO: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIKvXNmms8V9KSSGkL6aSm/bMGjbolv/lefO63gRLqJp9g67qVQVQ+BWZYz/PP5AqNaYr7T++c5qpKZprckoYvDuoEeTYGe9Hmlr1OpT5Per0qIOPJ2HthNwpvDhWQ3RSZ98TnHgyTSbhh6OwrW9u+mxLpZkTt2R81MjEwX7duwFhAoIsj9lmpyO2P6G7X3gwH9Rz4U1kakuUCY4S/qZ3V2zVnQr3HIC7YsOp48jOdNVPBMVIemef8rpYfY4ztiiA/4vicZaOr7aWA/XAmgqBj9t3KOapTO3YCA8Io/asb5U2AEmhA7UqIm1/PH5YU8FPziRd1hz7cGCxECB3cf2KwtqMhVbqs96uLbLK+ZDKDdpbggAuLw/ox8Hmy60HDTT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR06MB3848.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(956004)(2616005)(86362001)(75432002)(83380400001)(26005)(2906002)(45080400002)(66476007)(66556008)(6486002)(316002)(786003)(16576012)(66946007)(31686004)(5660300002)(16526019)(8676002)(52116002)(31696002)(186003)(8936002)(478600001)(110136005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QV4VHHrjoKzv8/SHDX/GHyDNAGMNN3ZmabhsOtHQT4wUgXchUEE8ZD+8w4F9mgZCvAOO6Ie+ENugCvAqxgbcymAHfW23STtACNJhnfYBDs/2QE/H9LE7yzX6+EyowNUkSPY8iE3F+1Owr/uoJoCDwgXQ5E5cb83Lgka5GGyy/wVfvkUY4woldAIPUJk/NWHDPit3CxRNeAe2Gi6SX5z5oV+G1BmMeCqPaVwDs3Pucw+s94niji4BnI1Wdce1ClvO3rIl0gvB7t+nfFiR7rGQGcXLm8d67lPEzkdUs95Oe0IznWGkjlr77W8HA8QLc3PiI7DIjaF6wquHlvLpo/aAsPgH4JWAzO95m9o7nEQWLeR9aNzRDgvnxTg/cLjzz0B83xZqJ7bOrkztJiut69QzhDm42vjkhSYMqgX2XY2hyX3OFaJrrb/erX5GsSbghEcHQAvkF+a9zGL2L7D98V8vzn6Ie+9usrjfzpHbDnIlMgi5j5B5yfjEu/G/99z83s/22C/9dvP3jtsSkKm1R8QYssNdJWoKyS47U8ULSpALxLv+yoJ2Quq67T0O/kThGyFaJueGdLirf+AtzpnaeTF3O6Cx4CCs/EvKQuPU77qvv7y/Ug9RlXUQMpguf819DI9uqWgmTMmcKiT+79y8W8F8CA==
X-OriginatorOrg: math.utexas.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 006f72c4-622a-48e6-1ef8-08d86b1a395a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR06MB3848.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 23:39:25.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 31d7e2a5-bdd8-414e-9e97-bea998ebdfe1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgFyWvcjik4FL/DTxACCXj4jRo/nMYYXifYppYTLUIcRt8XGS3qUFRp+XLjmm+NpxDzYq28ARcZnbhGoiunkgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB3942
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


I have a rather puzzling timing issue which I hope someone can shed some 
light on. We are using a centralized authentication service (Microsoft 
AD) with authorization restricted to members of a particular security 
group.  Home directories are housed on an NFS server (Ubuntu 20.04) and 
automounted to a collection of compute workstations (currently a mixture 
of Ubuntu 18.04 and 20.04 systems).

Because there is a reasonably high level of turnover (grad students and 
postdocs) and because I don't want people to login directly to the NFS 
server any more (hence can't use pam_mkhomedir without compromising 
security by setting no_root_squash on the NFS server) I decided to try 
and automate the creation of home directories a different way. To wit, I 
run a pam_exec script in the session configuration:

/etc/pam.d/common-session:
-------------------------
session	optional  pam_exec.so log=/tmp/pam_exec.log 
/usr/local/sbin/make-nfs_homedir.sh

Which runs this script:

-----------------------------------------------
#!/bin/bash

if [ $PAM_TYPE = "open_session" ]; then

    UTEID="$(cut -d'@' -f1 <<<"$PAM_USER")"
    USERGID=$(id -g $UTEID)
    PROC=$$
    TEMPDIR=$UTEID$PROC

    if (($USERGID > 100000)); then

       mkdir /tmp/$TEMPDIR
       mount helios:/home /tmp/$TEMPDIR


       if [ ! -d /tmp/$TEMPDIR/$UTEID ]; then
          mkdir /tmp/$TEMPDIR/temp/$UTEID
          sleep 70
       fi

       cd /
       umount /tmp/$TEMPDIR
       rmdir  /tmp/$TEMPDIR
    fi
fi
-----------------------------------------------

A brief explanation is in order.  nfs_server:/home is mounted to 
/tmp/$uid$pid on the client workstation and the script checks to see if 
the user's home directory already exists.  If so do nothing.  If not, 
create it in /home/temp.  On the NFS server, the /home/temp directory 
has 1777 permissions, so anyone can write to it, including the nobody 
user from the workstations.

Now for some systemd black magic.  On the NFS server there is a systemd 
path unit file and accompanying service file.  Whenever a directory is 
created in /home/temp, there's an NFS server script which moves it to 
/home and sets the appropriate user permissions.  This process is nearly 
instantaneous; i.e. if I type `mkdir stuff` in /home/temp on the NFS 
server, I don't have time to type `ls` before the directory is moved to 
/home with appropriate user permissions set.

One last detail:  /etc/auto.home on the workstation:

   * -tcp,vers=4.2 helios.biosci.utexas.edu:/home/&


OK, now for the puzzling part.  Notice the

   sleep 70

directive in the client side pam_exec script.  I've fiddled around with 
this quite a bit and anything less results in a message of

   Could not chdir to home directory /home/pgoetz: No such file or directory

on first log in. I've checked, and indeed the directory is not mounted. 
If you hang around in / long enough (roughly 70 seconds) you can 
eventually cd to your automounted home directory.

So, Question: Why the delay?  The home directory on the NFS server is 
created nearly instantly, so it can't be that.  And as mentioned, if I 
sleep for say, 60 seconds, the home directory isn't immediately 
accessible on login, although one can cd to it a few seconds later.  I 
can't fathom why the required delay.


