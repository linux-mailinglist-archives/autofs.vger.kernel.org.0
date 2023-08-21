Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AD1782F96
	for <lists+autofs@lfdr.de>; Mon, 21 Aug 2023 19:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbjHURoI (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 21 Aug 2023 13:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235173AbjHURoI (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 21 Aug 2023 13:44:08 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E438B100
        for <autofs@vger.kernel.org>; Mon, 21 Aug 2023 10:44:01 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LHE4Gm024513;
        Mon, 21 Aug 2023 17:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=PD9t5ZsFOx08s1q3CeT/7aODCy+OTNVkJPrEWvXaiVc=;
 b=MQS70h7Yra1VA7/QIPRCIBYMSlV2G1rjmhcCNb+uOjo0z/54GeCvseTiwkeWQ9E0lVVB
 WT59wNSu+a/c25lHkcFbJeWRh0nSxDZ/NqzvcUENxO/QGMeK3NlFjfVDDG+tgP6ELuBC
 DDk5ciyOdPbrs3OWNWmgF1kg23O2vgNBRkYMuWZbHegvzT+KsC84wUxUHdYWHTVlYc6u
 9ShjNpPbey+Bl+3gWj7FfqM3XbQ3MIfnBj5P1UxwUIS826uBQzYaZeNxPTk/ZRbkhAzl
 wp3xT+nBTBqpJ0Ifl0Z4Pbpnf5f3eoa0+B4DrpPJdaUjKNhIY0AQ3+SemJDyCogtfUYg tQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sjmremb6u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Aug 2023 17:43:59 +0000
Received: from sunapee.qualcomm.com (sunapee.qualcomm.com [10.62.117.90])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37LHhvQ6001242;
        Mon, 21 Aug 2023 17:43:57 GMT
Received: by sunapee.qualcomm.com (Postfix, from userid 32836)
        id D0E234167; Mon, 21 Aug 2023 10:43:57 -0700 (PDT)
Date:   Mon, 21 Aug 2023 10:43:57 -0700
From:   Mike Marion <mmarion@qualcomm.com>
To:     Ian Kent <raven@themaw.net>
Cc:     Robert Vasek <rvasek01@gmail.com>, autofs@vger.kernel.org
Subject: Re: Sharing a direct map
Message-ID: <20230821174357.GE7856@qualcomm.com>
References: <CADVsYmhgT=E+o3r9fEhQT2Wg04MJqeYr_xt0pDV9TTtFQjFrzA@mail.gmail.com>
 <20230818184831.GB7856@qualcomm.com>
 <81ada237-f5ae-58fd-b2bd-2118c7c9b326@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81ada237-f5ae-58fd-b2bd-2118c7c9b326@themaw.net>
X-Operating-System: Linux 5.14.21-150400.24.33-default x86_64
X-Distribution: SUSE Linux Enterprise Server 15 (x86_64) 15.4
User-Agent: Mutt/1.10.1 (2018-07-13)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eQBAzeW8ohuJlAG7edFPwS5T4llbZCMQ
X-Proofpoint-ORIG-GUID: eQBAzeW8ohuJlAG7edFPwS5T4llbZCMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_05,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210165
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, Aug 21, 2023 at 02:17:48PM +0800, Ian Kent wrote:

> > We're doing this all the time.  We're using singularity vs docker, which
> > likely makes a difference, but instead of binding various paths, we only
> > bind the root path in direct map. e.g. bind a root of /nfs where all the
> > paths in the direct map start with /nfs and the accesses inside the
> > container trigger things from the main OS.
> >
> > Unfortunately it means you have to mount the entire direct map tree and
> > not only specific paths, but that works for our use case.
> 
> Do you mean the entire tree?

Yes. e.g. if we have a direct map where all the paths start with /nfs,
we simply bind /nfs into the container and it works from inside the
container, just like outside.  Note that the paths are visible the same
inside and out no matter where the mount is triggered.

> The autofs trigger mounts for direct mounts get mounted regardless of
> this.

True, the fs type of autofs is fully mounted in the containers and outside.  
But the triggering of the nfs (or other) FS type that wakes up automount and
causes the actual nfs (or other) mount to happen works just fine.  For
us, using singularity.

> > I have worked with peers that tried mounting several specific paths in
> > the map, and they've run into a lot of issues.  Both that it mounts like
> > you mention, but also they apparently have issues where it can time out
> > and be umounted, and then accesses from inside the container after that
> > don't trigger it to mount again.
> 
> That's because the expire check cannot check propagated mount expiry.
> I have had a lot of trouble with this over a long time.

I assumed as much, which is why our group's solution was to simply
mount the entire direct map base path instead of trying to target
specific paths in said map.

In one specific solution where we wanted different mounts based on
different job requirements, we had to create different direct maps with
different base paths to bind into the container depending on which
subset of the map we wanted to see.

> I do have kernel changes for it but they too are very likely going to
> be controversial when I post them, we will have to see ...
> 
> 
> Ian
> 
> 
> >
> 

-- 
Mike Marion-Unix SysAdmin/Sr. Staff IT Engineer-http://www.qualcomm.com
