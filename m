Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F59F323F
	for <lists+autofs@lfdr.de>; Thu,  7 Nov 2019 16:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388230AbfKGPKT (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 7 Nov 2019 10:10:19 -0500
Received: from e2i250.smtp2go.com ([103.2.140.250]:39809 "EHLO
        e2i250.smtp2go.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388499AbfKGPKS (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 7 Nov 2019 10:10:18 -0500
X-Greylist: delayed 742 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 10:10:17 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpcorp.com; s=a1-4; h=Feedback-ID:X-Smtpcorp-Track:Date:Message-ID:
        Subject:From:To:Reply-To:Sender:List-Unsubscribe;
        bh=2NMOELHcepTbetn/PHREoVPmJJYfVR4a1hwx2tjpJUk=; b=fr7BQQAYwNFNhwFO3YwIVXkhX5
        3fW8pPHZFy61UbI743HbkrdPZ88LJI1viylcsuoYrRzKAS9Pdn4N1SCI7nCc8++RSWto+++7QsI82
        nwbwbwVWu3ksuo7PM7SlyM7KQhhsyU+i6lFSrgTfrkyDOXKAv6TqhB6wIW/iopvHCBJb7/zgyj7wT
        6FmPib7Nsj/8h4yXCkAKLQjwcMn5xso4n7YjbH2UNr1lP+VV3dzu0QtBDPbobiBssaEN0vwLJHBeb
        hh8tweDxtV0EbANxQNu1Sm3LSG2rE4VgqoclZGlvAK3AewbXi9hsM7VdOUJLUfPpMTIHWoMmcP2RE
        qLHPubJw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linagora.com; 
 i=@linagora.com; q=dns/txt; s=s266739; t=1573139418; 
 h=from : subject : to : message-id : date; 
 bh=2NMOELHcepTbetn/PHREoVPmJJYfVR4a1hwx2tjpJUk=; 
 b=G+8xoM7oIVRxtwtL0rVqv+54LeKuhTgCd7tg1f4f+e5aNbTIxaFRMLXe
 gEXq5fzT71bS7aKLbP8i/NkGcXsxw/viDSiRIqP/fJVPhmsYywNXvn6phT
 rOgBvfMFUlvgLSL70ZhVB6+iY30I16FETncUk/LSMJFuOkrl6VsPM96lq1
 Hi84TSlwjUqq1SQlHlNf/jpQuysSlm250pXbZO6o/qb5UNPImlCyjH+Pi3
 OjPS9ZErU19hO8KQNIw1zUFf3IcMdjjC6K0BmgYkhCPimueq6+RDwP4R2w
 r6S7Bmrs1nDJDnODdu6JkzK3fXJdmXt0UXrAlSjyd1PvdxSkQ/ukPA==
Received: from [10.45.33.53] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
 id 1iSjEP-Y8PITV-MC
 for autofs@vger.kernel.org; Thu, 07 Nov 2019 14:57:53 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
 by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
 id 1iSjEO-rlZGkP-0G
 for autofs@vger.kernel.org; Thu, 07 Nov 2019 14:57:52 +0000
Received: from [10.75.71.198] (reverse.completel.net [92.103.166.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.linagora.com (Postfix) with ESMTPSA id 953C1418DB
 for <autofs@vger.kernel.org>; Thu,  7 Nov 2019 15:57:50 +0100 (CET)
To:     autofs@vger.kernel.org
X-LINAGORA-Copy-Delivery-Done: 1
From:   Simon ELBAZ <selbaz@linagora.com>
Subject: [RHEL 5.11][5.0.1] autofs hangs up
Message-ID: <8a7bc967-d620-39ba-d845-2175c941fa59@linagora.com>
Date:   Thu, 7 Nov 2019 15:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-Smtpcorp-Track: 1iSMEOr_ZGke0G.xmDxtQNwF
Feedback-ID: 266739m:266739aja3LFS:266739sp9XqbdQZd
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi,

I am working on an autofs issue.

Linux kernel: 2.6.18-398.el5
autofs: autofs-5.0.1-0.rc2.184.el5

There are 2 RHEL 5.11 servers accessing an NFS server.
They are rebooted every morning.

Sometimes, during the day, autofs hangs up on both servers. When one of 
the server is rebooted, the other autofs can resume its NFS access.

I am focusing on the /HOME/svsi_emr offset to debug the issue.

I suggested the customer to update the kernel to 2.6.18-419.el5 version 
but without being sure it will solve the issue.

The autofs is in debug mode. Logs are available.

Thanks for any help

Simon
