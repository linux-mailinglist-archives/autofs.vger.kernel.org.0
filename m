Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F2A3E336F
	for <lists+autofs@lfdr.de>; Sat,  7 Aug 2021 06:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhHGEo4 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Sat, 7 Aug 2021 00:44:56 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56715 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230322AbhHGEow (ORCPT
        <rfc822;autofs@vger.kernel.org>); Sat, 7 Aug 2021 00:44:52 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 645E6580B28;
        Sat,  7 Aug 2021 00:44:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 07 Aug 2021 00:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        Gh4W5Ai2dU/Kpmu2Xvizt81nmqTF3EtDkAjKSrQLw6I=; b=L3FZLtqYVDNSI1qZ
        ZwCmIvjyI3jut/SixtWR7df1sdFo4qZO2dDd8mFqrzMzWjfGM3pMzVxztiLT5IEp
        aodhFrFajLwltfZ1W2hCVop9CPkj+EzldcRyu9UO3ALwN05G/QinmDpjo1E/DLaW
        E5weM/Bl7nsfSuvL2pVoNkGNcrUYdFXLWmySvfkygSefNBkGCblvpE6YvYHC//aJ
        xO6xw+6CMParIHiNAd+jFEuJmsosIsr0NNxIHiDo4i1skCpeD/3NdZBIZoVB06GN
        +Oxvl+NHiMQva9YESnUASiyAOGdnFUoiVFeCKF5SwvHky3fMkli0AG43IBw7VKFD
        wq5bnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Gh4W5Ai2dU/Kpmu2Xvizt81nmqTF3EtDkAjKSrQLw
        6I=; b=B/6tc/TrHrSW3wOk/oU0YSlND1Z4Ow9e9UaHXJPR3H8FldaaL+aPxIdhs
        3zUsrUvdxi7NDUm3hZ9YPiIyEsbYNmFV+wrCSsb7vurCTQ/16BZUJ7isY8Q7uqZY
        AwrYPfa0UgbM4C/CyqkSGgfwGlr1Ve7xFBVmTuMLfQIHXgdFe1Ws+Udwx8sT/XdQ
        1Dy/MRi7bgyUJjQ4YcBL4ZESn6+H2Ek5YYmmbO7/2KZrL7RCdDvsuXuUJ/035OjM
        G8tL/whmFq/Lvek8gqrWlRhOJF4Hfqj/6xzQM/Kdz38ya3TXybxjcQ9jHaQouxaw
        wn4xthIEvs405eqKSEEx/B60NJjwg==
X-ME-Sender: <xms:qg8OYXX3FLOv5lDGGaqkF5iNH8ODLmilt1bdtKHlLNJ91vNPp219Wg>
    <xme:qg8OYfmWEvSoFpGqChwmDLJvOgPn-Te_z7GwJ8hbkVWlbID7KmB8zass9gA-lBOWA
    z5tQPl83F1A>
X-ME-Received: <xmr:qg8OYTZWerIB-XSQMLOrx-gIqgYJTDwdTTDTLoDDWk2QVr38et9n-u5OGN5ExpgJxxLXDXG7KfhVK5eX2UuYs-Ox13SbnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedvgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesth
    hhvghmrgifrdhnvght
X-ME-Proxy: <xmx:qg8OYSWlNnqlYncWhA5BbPcf1WQAQpqdrCjCRgVCmQB26_UElJyLJg>
    <xmx:qg8OYRlTA7IUhX7_zvzhLVaCYjRp_h_2otokx40NT3LbE71BB8lmEw>
    <xmx:qg8OYfdzBZKoZdDOouv1kz6DhGM139z5s7An809Sq4jHRRFovQFOyQ>
    <xmx:qg8OYfRP6-oqhhaZXNRHU4XAcDbZIaIda3FJSK9cjNr13sybeCPWIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 00:44:24 -0400 (EDT)
Message-ID: <62f5b47546351d5951fb4807053d76e60b833bcc.camel@themaw.net>
Subject: Re: autofs & glibc 2.34
From:   Ian Kent <raven@themaw.net>
To:     Sietse van Zanen <sietse@wizdom.nu>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Date:   Sat, 07 Aug 2021 12:44:18 +0800
In-Reply-To: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
References: <3d86a3c089bb44768dbe3ba5833d2d89@wizdom.nu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2021-08-06 at 12:46 +0000, Sietse van Zanen wrote:
> Autofs no longer compiles with newest glibc 2.34. From the changelog:
> 
> When _DYNAMIC_STACK_SIZE_SOURCE or _GNU_SOURCE are defined,
> PTHREAD_STACK_MIN is no longer constant and is redefined to
> sysconf(_SC_THREAD_STACK_MIN). This supports dynamic sized register
> sets for modern architectural features like Arm SVE.
> 
> 
> This is causing compilation error in daemon/automount.c line 87:
> 
> size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
> 
> 

I'm aware of this.

What would you like me to to do here?

I have two patches for this but haven't pushed them to the repo. yet.
Also there will be a release, probably later this month that will
include these.

Ian

