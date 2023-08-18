Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4BE781314
	for <lists+autofs@lfdr.de>; Fri, 18 Aug 2023 20:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379489AbjHRStK (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 18 Aug 2023 14:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379509AbjHRSsf (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 18 Aug 2023 14:48:35 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD0D3A98
        for <autofs@vger.kernel.org>; Fri, 18 Aug 2023 11:48:34 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IHvwHs017261;
        Fri, 18 Aug 2023 18:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=I1vJ9kRHx1EKshFM4+btlkNelvPkKd2CgSxKmqHmvzk=;
 b=Bp+ycP8GElgLkYM+xMMeJqAfj7dmeapPDUSlNSQz7B1VNsA/uWAYC+b9aFZvGo71jZ2c
 8WCTzN3qu2WM10rlVNXd0JDI4KFOwqEvQIaOjDp7RjIbfzN0sAYtBzbI9Xkz/xNtPpH/
 1nwdQLwXHGagbLgdv1LewcSX9/2Yta0FdcbIbTdysXQMBcF/aJISm6s4/dDoNtYux/cZ
 ymcRnDhkofeS+xIJSj+jSLQcO3eBwtJFBXRgyBm3/MYeBbFdGun2D21WZWP1R3uNCSix
 w0JRJCF4KT282o5wfYSDIMf1x0ut+fLxRoxEiqlQOlFsKTEHtzRGEra+T16AKRuKyG0+ MQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sht44a9dj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Aug 2023 18:48:32 +0000
Received: from sunapee.qualcomm.com (sunapee.qualcomm.com [10.62.117.90])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37IImVub000386;
        Fri, 18 Aug 2023 18:48:31 GMT
Received: by sunapee.qualcomm.com (Postfix, from userid 32836)
        id 5998B4167; Fri, 18 Aug 2023 11:48:31 -0700 (PDT)
Date:   Fri, 18 Aug 2023 11:48:31 -0700
From:   Mike Marion <mmarion@qualcomm.com>
To:     Robert Vasek <rvasek01@gmail.com>
Cc:     autofs@vger.kernel.org
Subject: Re: Sharing a direct map
Message-ID: <20230818184831.GB7856@qualcomm.com>
References: <CADVsYmhgT=E+o3r9fEhQT2Wg04MJqeYr_xt0pDV9TTtFQjFrzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVsYmhgT=E+o3r9fEhQT2Wg04MJqeYr_xt0pDV9TTtFQjFrzA@mail.gmail.com>
X-Operating-System: Linux 5.14.21-150400.24.33-default x86_64
X-Distribution: SUSE Linux Enterprise Server 15 (x86_64) 15.4
User-Agent: Mutt/1.10.1 (2018-07-13)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oWRQ7b_YnI0HjJeBh02fKDquvihmUCvo
X-Proofpoint-ORIG-GUID: oWRQ7b_YnI0HjJeBh02fKDquvihmUCvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_23,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180172
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, Aug 18, 2023 at 03:08:19PM +0200, Robert Vasek wrote:

> Dear autofs community,
> 
> is it possible to bind-mount a direct map without triggering the
> underlying mount? Or is this considered simply "beyond stat" and
> cannot be done?

We're doing this all the time.  We're using singularity vs docker, which
likely makes a difference, but instead of binding various paths, we only
bind the root path in direct map. e.g. bind a root of /nfs where all the
paths in the direct map start with /nfs and the accesses inside the
container trigger things from the main OS.

Unfortunately it means you have to mount the entire direct map tree and
not only specific paths, but that works for our use case. 

> I'm trying to share the autofs mount into a container. While indirect
> maps work as expected (in the container I can see the autofs mount and
> then trigger mounts inside), sharing and bindmounting direct maps
> triggers the volume mount immediately, and the container sees only the
> volume.

I have worked with peers that tried mounting several specific paths in
the map, and they've run into a lot of issues.  Both that it mounts like
you mention, but also they apparently have issues where it can time out
and be umounted, and then accesses from inside the container after that
don't trigger it to mount again.

-- 
Mike Marion-Unix SysAdmin/Sr. Staff IT Engineer-http://www.qualcomm.com
