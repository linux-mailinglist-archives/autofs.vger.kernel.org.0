Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C467C1FCFB
	for <lists+autofs@lfdr.de>; Thu, 16 May 2019 03:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfEPBqe (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 15 May 2019 21:46:34 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42961 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726265AbfEPB2W (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 15 May 2019 21:28:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B1FDE248BE;
        Wed, 15 May 2019 21:28:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 15 May 2019 21:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        wXegjlqRk5HHIQ8DA8JccE6YZkps333v+avaS8i8t/Q=; b=abwyrtutOb2LxO8r
        mMNtYnipz+3LVjI0b2MPFp3HqqzE03rHQf3xFIL9gceh8lPUEpFw35jNYErEBgUN
        JX00H1jpYUPwbxJnM6rovqE3/d77+iPtyj9zeMpeG/3yUi9NYvZ0QZ4kTgrI1kyV
        E+EDL1KFoAGHLfVQQHhpeXSHhrbxLJo+U417MTmbQf4Dx3JbGe2yOU34DmzrDFcS
        Xt3xR5iypD0yghxyYJYNichnQpLlKiqVHILvDo/kxjIO6C8X60nrjWHEo2rsguvF
        WVrBaUR7Ik1/rDP4agMf6tU9XbLcY11fjrApEj+nKqCP4AbNRMsglqw72P7vZtr0
        8c4a7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=wXegjlqRk5HHIQ8DA8JccE6YZkps333v+avaS8i8t
        /Q=; b=b7xZdC7KwxNWW456UUAACTH2PJL/MRwgiShXESCQ2zYVvdw1qfGNLdazN
        0q8WEF+idvKVk5YX9joaBVTsFTSUg5N/JR6OZgdYUpc3WKRcBeulugRlIbJstOzX
        0UYUayFz+9arXFp9yRzt48vW9ZLmIavNYwfAEchmlsWSDUEsddRh3Qmwyv0GGUUG
        thZBTgPl/6Dqp1HULCMxlwy+XhN71vhuagldB/RG55uoAjHIDAJh+pQ+yOVxqh/G
        lDjOSEFSw2qkwMWdvFgJH7b7ofhbvuylgi04Zqc5q3XHI/1zY6NZ3JmdCEgruIn5
        zyUSgRlMU0FtBZmYuvwUi/QU+HXJg==
X-ME-Sender: <xms:tbzcXCyuizl8arZ8V-EzjkI4bEoey8DqZ3ORo2iMQKGV1tPhFEftPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleelgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtofgggfesthejre
    dtredtjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhn
    vghtqeenucfkphepuddukedrvddtkedrheeirdduuddvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:tbzcXCimqVjy8ANEGZEjPaZTpqhGN76b6jMWVao3AKhTK4X-7PGj4g>
    <xmx:tbzcXPWbDsrFC-osxe8nWIPMLfVC24xaDRc7xT3Ac6OsK7kn3mi44w>
    <xmx:tbzcXM2OMXO2gnr3GUz5IqfoMDTniFTfHn3ar5oDU2WOWR_Tyyju6A>
    <xmx:tbzcXBr_yuWuHBWbeHuABVmif6ub6HYN8ckfO_06Q7O_6AcOI-VotQ>
Received: from pluto.themaw.net (unknown [118.208.56.112])
        by mail.messagingengine.com (Postfix) with ESMTPA id CBCC580059;
        Wed, 15 May 2019 21:28:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by pluto.themaw.net (Postfix) with ESMTP id 57BA01C0133;
        Thu, 16 May 2019 09:28:17 +0800 (AWST)
Message-ID: <93d8c49815cc059c80bd43493e8a3e0a7a79c8e0.camel@themaw.net>
Subject: Re: Changes in indirect multi-maps don't become effective w/o
 autofs restart
From:   Ian Kent <raven@themaw.net>
To:     Frank Thommen <list.autofs@drosera.ch>, autofs@vger.kernel.org
Date:   Thu, 16 May 2019 09:28:17 +0800
In-Reply-To: <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
References: <1f7715b4-5f95-c79e-a80c-9d70755a7a5d@drosera.ch>
         <f6ea87d9cfb287fff91c35e89ea082917c201b06.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Thu, 2019-05-16 at 09:01 +0800, Ian Kent wrote:
> 
> > We are running autofs-5.0.7-70.el7_4.1.x86_64 on CentOS 7.4.1708 and we 
> > cannot update to newer CentOS releases due to other restrictions 
> > (special hardware/drivers).
> 
> Mmm ... CentOS 7.4, that's a while ago so I'm not sure if the
> changes are present but I suspect they are.
> 
> So it's likely the changes made for this are not working properly.
> 
> I'll check if the changes are present (it will take a while as
> I'll need to track down what those changes were first) and try
> to duplicate it to see what's going on.

Yes, that's not working properly even with the current upstream
code.

I'll look further into it.

Ian

