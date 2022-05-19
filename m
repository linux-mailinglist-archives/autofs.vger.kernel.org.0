Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F05653002A
	for <lists+autofs@lfdr.de>; Sun, 22 May 2022 03:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiEVBGq (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 21 May 2022 21:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiEVBGp (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 21 May 2022 21:06:45 -0400
X-Greylist: delayed 1917 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 21 May 2022 18:06:42 PDT
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02hn2212.outbound.protection.partner.outlook.cn [139.219.146.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16DD3D4BE
        for <autofs@vger.kernel.org>; Sat, 21 May 2022 18:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU+b//viqfH2feF3zbAuRTzDlQjEoAapsmPrrfCPFFsAP6ZYwDykgfh20B0MG/ruuLhPtBTCDYwFJNBb9sthLrb+9uZa0eUmRY03c2u+Gcp0RDNS6x1N/oBr+GMlHswwsGbWWYToSzNJs99o4USvMlypx95UNOmy3ydW9R781+MYnKMb+IVzlJgtsR2viXrcUdmm1qlXImVDQ7s5Hq706AkUMFF7Iypo5xFQdkLT5EakTP71gOsxYAWc6GMCpyQ8PGcCv/c6OoYj+DOelSrejtTtIr+scnR3RmThf9oxjpMf4juBhw5Ij0Y5Rm3NEWCJmZFVn+ORIw6d4EDH7Wb1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcnLqhMsusH1MbM+yJFHT/lonUwm/+7GT3njOROwhbg=;
 b=B0O8FYZmZnJTjU89OSQHAFErOEVluBNS53ts8+14HxEl4zvio+tfqpvk5X1YaP68O9sVsw+4jDIqxRsrHKOSI+rVKuFR3m73chgHVF8E3JTvqxL/kpvR6UM+1mTgwffjoBUD8gH3OFg3MbH5S9FzwSHgHhPIhmn8yjWDThKnzJrbS0bsffsWm3gJHIqWL5YdRXqz0ZSgsDzV0YSYOlUOL6mUuIJsLbGlmeY10IJ+4xm5UvhflD/TfrHb72sF4dmcviE8O1jhejm8Q+1yKY1TkLue0HotfcFYFApeQvDaIM72yVLyflb1fQJ3C1V/zHxsgq7RlI9WXVlPAJR6saylBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gientech.com; dmarc=pass action=none header.from=gientech.com;
 dkim=pass header.d=gientech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gientech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcnLqhMsusH1MbM+yJFHT/lonUwm/+7GT3njOROwhbg=;
 b=pxiOXhxfGxPNe4b0Ls/CVGwPHSdNuFeP5Mp2fJ3spx2uY8rgdo4pZcmMmfy3wOXMGL21NApOeOdujhLwl1CCdouQwWishhY1otoovwDqvE/46ILHj9AVDltOtLoUmKxqrY2lDgukMjT2MzEsQZ6cSEwq+j0h/NP0sYGqk11MBZz2mBt2K+usmCfacSBAVfR85kdEo1iREYAxq8xqDLTPfJLwyzLQCXw3ROrlOGi1r5ds0yLRqqEsJ+adP+iBYhrtbbXP8OfHZtkuvkxcq+M2E3wfBHmwUhxwAi8eR4OMcRgCzWnMYuigBGGU3laaHbtpGugyqoD6NI0u7bdKFALzWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gientech.com;
Received: from SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn (10.43.110.19) by
 SHXPR01MB0829.CHNPR01.prod.partner.outlook.cn (10.43.107.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Sun, 22 May 2022 00:34:42 +0000
Received: from SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn ([10.43.110.19])
 by SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn ([10.43.110.19]) with mapi
 id 15.20.5273.021; Sun, 22 May 2022 00:34:42 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Ree
To:     Recipients <cuidong.liu@gientech.com>
From:   "J Wu" <cuidong.liu@gientech.com>
Date:   Thu, 19 May 2022 01:38:24 +0000
Reply-To: contact@jimmywu.online
X-ClientProxiedBy: SH2PR01CA039.CHNPR01.prod.partner.outlook.cn (10.41.247.49)
 To SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn (10.43.110.19)
Message-ID: <SHXPR01MB06235F38087E8635EB4FD4F289D09@SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45300374-ffc4-4103-9c26-08da393851a4
X-MS-TrafficTypeDiagnostic: SHXPR01MB0829:EE_
X-Microsoft-Antispam-PRVS: <SHXPR01MB0829A6B571AAF4590E813F1C89D59@SHXPR01MB0829.CHNPR01.prod.partner.outlook.cn>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?P8+LucMO4TD/d4iA6ekVkpN64WJP6YEZ4bd+uwuXX9MJYM++aWDB5n8Jl9?=
 =?iso-8859-1?Q?mQlCIl6ivZ92o/FLstqZTSg5OY5GJtz9bdKPt62SrmPj8ZV+UNj4unTa9J?=
 =?iso-8859-1?Q?2R5zgszk54A5rIRrIMTQ1diH/x+hukRwb+bLwGvIRSvq4gaMgD6t77Lwbs?=
 =?iso-8859-1?Q?OI3s43VH3FqjpWIyh/6YmWID91Xouz2yI2uofxjK++1vh4m1G6R4yPIznc?=
 =?iso-8859-1?Q?aP9R6dDlg282E8a8YLs/q5RnEzKLW8abLB+KwOkHtY2nIog4zqziPd5py2?=
 =?iso-8859-1?Q?+B6XLhE4LUIkG/sZd6/1gH6oF0xQ7ddcsPhOjb6XP2nG1tUzKhmvFhyGM6?=
 =?iso-8859-1?Q?Cu1Ss8xWd9yauN72Zm7bne5feBeIHPXJ7SQ7YGVoRJmdI8mhpK+HyfUxbS?=
 =?iso-8859-1?Q?RvlgBh0O8mQducjXcz6M2TkX4DjHJs8HzTUxazpy67CPXFREJZd8TV0OBE?=
 =?iso-8859-1?Q?ubmkgCdmeSc85K9SuOtiJQRqJGt9TSO4cBjDFQ3LxTArPdFSjd160NTcDe?=
 =?iso-8859-1?Q?VI+UxUBOQ+o4mLVbSg900tqP/PDeqXgQhN29elqs+jV3Mnx1xCkPdmPDk+?=
 =?iso-8859-1?Q?m79mYy+Pbsxx6TdJIjbsSVfjBYjLpEaxUtU+IiZeL3JK05KLIZn0g/k6ZQ?=
 =?iso-8859-1?Q?bt28m1+Kt/pgMHygvcQ5aWQ7b6+78WqFuHJ38G0XiOHRYvy1mXTehUWYeN?=
 =?iso-8859-1?Q?fF5fG2e/FAbqmSixBtJvA2B8IB8eSMBuVZnDW/Lh3l/9ZtVAolo5P+9b2k?=
 =?iso-8859-1?Q?doQ+YMOLvyBWDoa5cX4lf6pT7xmRLJnxY/nsD4ubgxMHnSwEScP5vBeVdo?=
 =?iso-8859-1?Q?d7ETsI2r0nIIhk69zU9pUV05LhWr5jUki4jpjirHrxoeeA0g4H64Dl7qwK?=
 =?iso-8859-1?Q?6NnZqlGFj+YL0wlM3fZwboZAUlXDftcR7keUgDfRLQGsX3T7j7siJPw0b3?=
 =?iso-8859-1?Q?1QMmPjZQz3F+D5p+7mThjOyxpzIwPyQ9l5WrpoQPJvDDW5xiUP/Q8+8yS9?=
 =?iso-8859-1?Q?DzdHcVpiUwuVoj3dg2uDjmjCx4NurRi+4grh6P4JVF/z7Js05KE3eZ6/dW?=
 =?iso-8859-1?Q?yA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230001)(366004)(8676002)(6862004)(9686003)(66476007)(7116003)(26005)(66946007)(66556008)(186003)(86362001)(40180700001)(19618925003)(38350700002)(52116002)(7696005)(38100700002)(6200100001)(6666004)(33656002)(2906002)(508600001)(7406005)(3480700007)(40160700002)(55016003)(7416002)(8936002)(558084003)(4270600006)(5660300002)(62346012);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6CxsS/CvzZI/xNWlvvieMHPkB8ow7+SbAE81w/4SB4PuIiOmKKgXqmNl4c?=
 =?iso-8859-1?Q?s4ee0eWRPiYK2zZPFq6lpwD7ToWBE6n5pWtWnA7Of2D2VAdMjoBiEGphQt?=
 =?iso-8859-1?Q?IXI/JG7ymufZitYkyy+P2llnBY/HLURmQWDHf2bePfw0Q7OkFNMBNuvzHQ?=
 =?iso-8859-1?Q?+51eiY68eC8MXDwSkPnG8PLFou+ptHW42Fkll/bUVSNZU4rfiGZvxrsR8w?=
 =?iso-8859-1?Q?wuudEdZ1jVhN9jp607lltqxCx0m1m5YXP1YZLqizKD7CvxdG/1f03AS2Kb?=
 =?iso-8859-1?Q?OEoPAdtDxDI11kev00lrqgrKIwoMPGDMIbbOe3K2zwb1Q2biau/Y2vPLxe?=
 =?iso-8859-1?Q?OgWeiGrIOp9x3FXdeeMyG9kouvZCPKTy3j5UPYrzjcmuWnQZvmXR8y3NQt?=
 =?iso-8859-1?Q?aEUPVm+9m6I/XJPpEZTatYqNefJvnYexIbbHkOUQnXyPgA1m4abo4srj64?=
 =?iso-8859-1?Q?6AickUPtr1BNQPP+NtHuZKlsTOCD9abaMoWNzIHEhs1OuBXPmW3BSFkjHk?=
 =?iso-8859-1?Q?Dd2ht0WD/s2MPlv3HQEwp9Q794xb0AljhJQ9g0bqfU1cteePiUs5BzbMvz?=
 =?iso-8859-1?Q?Aasvko9twKtZt6uTkBv02t7yrq2LrG0abR/xFceJubMIZ6Lab154FRzzHp?=
 =?iso-8859-1?Q?7XNrMzQIw7Rzk6N0tvLxwQgIeVMdYexyePfky/7xNzuvPAt9gXBs3+r6hJ?=
 =?iso-8859-1?Q?JucUXhLUJboUQhWuspzbbcLoAivjmKvhWq5YHB0tnd2uaOfpR5F9rq//9g?=
 =?iso-8859-1?Q?u2Iau/Muqr7jNb+MnJJwT3EiL0IIdPOhTJzglU+A4YWVRL1wGmtOwd31au?=
 =?iso-8859-1?Q?74Ug0IqL1+WZghVLeXMMpQbM52VMZfoYym32XwJSPRI4veEoetWfZRzKtp?=
 =?iso-8859-1?Q?n3NvlbJhNTLCwm8dwYNUNwmQWWe/Rv+yVVmbe6uS2Mpc9Y7lFIWDjJTy5U?=
 =?iso-8859-1?Q?Mg31U9/UYBxSpsrJb71wLy2CxC3lHsntQ8B1gAJrAhX0kFhf2G/c0xtx4u?=
 =?iso-8859-1?Q?puTI9Tl05MylbR+P+/dX3UNwZo2D2de4TpRbm9Zv5ZfrZiLsBGWsM+5xDC?=
 =?iso-8859-1?Q?Y61jJbJb4ZpGpZFRN5OnxmIBoEwMUCl8941J/PXQxd2+ll5r8k/DibzyoH?=
 =?iso-8859-1?Q?DK/5UWYyo2THM8fs7IOuoD/jpjySf2Y0Txnw2ah1l4B4BkP94o6p48wWaR?=
 =?iso-8859-1?Q?b877T8eaw2CPs3BnADnGyaCJOzRrL0Ln507NGZoDojDUnUMJv2oRR0xzbF?=
 =?iso-8859-1?Q?4T5Hl4WgM5rne7nz8odHfn/IhwjYsN6vvx+z8Y/0J7sfUWSZJrhC8FdnVU?=
 =?iso-8859-1?Q?8Sd+8BNMh2p+lAh9rjuVNmDl4TYn5eAiTnmPs7V5fDuSV4mqCSL8by9wZc?=
 =?iso-8859-1?Q?28343f+tIDY5OyWtKya0N0gsFMLrUfqUzwFhgKJW+aK9RFjPRahgDS6PjZ?=
 =?iso-8859-1?Q?6l7ZrVkBMYwY9F3DhViSpStooEfz2qsFpYzOGlmwPerxuTDIpz60KUSXwC?=
 =?iso-8859-1?Q?0mPCU/YfEWZh7B8y4QUjm6qF898+R6eSJf3YUAwwQDq3FRiqygWYU9gIlO?=
 =?iso-8859-1?Q?5YSuXGrDTcQ8wIALmaBACGUECjVER6NObfJWivQvGJWraB/e2HSM+Vak8/?=
 =?iso-8859-1?Q?PE2llE/TWrDmoV3B0ea/Uuaxd4JCCdnzgFOY/fGzwxMWJkkMuMvPAhDV8Q?=
 =?iso-8859-1?Q?hYqYkIPhG7TMG0Kvtl+LWNIW8oIq3Z5AWhW3PoMKrs16QKD6JwUnFK+tv5?=
 =?iso-8859-1?Q?rssA=3D=3D?=
X-OriginatorOrg: gientech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45300374-ffc4-4103-9c26-08da393851a4
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 01:38:47.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 89592e53-6f9d-4b93-82b1-9f8da689f1b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ymAvbYways7w4pCtDch8Podf+CUg4C8y+VcZxQShRHof2nrgoBIW0Bpj/oAuGoOKcd1+Le/O1eZ7m7uDd3ESAMT0REbcUrCS8lmR7Tdcu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0829
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_MSPIKE_H2,RCVD_IN_PSBL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Did you receive my previous email?
