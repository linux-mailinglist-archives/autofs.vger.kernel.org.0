Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFBD492187
	for <lists+autofs@lfdr.de>; Tue, 18 Jan 2022 09:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344858AbiARIo5 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 18 Jan 2022 03:44:57 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57345 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235174AbiARIo4 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 18 Jan 2022 03:44:56 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2846B5C00E2;
        Tue, 18 Jan 2022 03:44:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 18 Jan 2022 03:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        C0DGQyDsFUDSlvvvUPkcLS1FpwDIpp11XS9N6b/M8Pw=; b=gwQDWNjictHSkbmV
        uvy1wjpDcI9ptG8gF/kuFEXG4Uf2ysGa+ISQZtb4xNi5S3gRTgIGnBIBnhf4JJyA
        Im35u6fhAt6CuRcJ2tlIIOqLo/VK+MHVoV2qS+0TQhf0VTz4a9KzRpV/UppXgGtr
        Fwa7AxbZeN4K8Uhwj+h4sO0e3y8gFKL55x8BA0WV9lMJpLqE8zcxQsA/ESxo+YdA
        Rk3os9QlEK+DbsiemX1OMg0E0lEmJsBveLRMI+wiaTEI8zzfXSEzm/cY4kv52BTc
        QAYU7cR5+mVE61BfiN0ZA4xtw8gelDtYzsoHx1lVD3O8T+sNIl5E+5FBnYrZ1WPb
        TM4SbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=C0DGQyDsFUDSlvvvUPkcLS1FpwDIpp11XS9N6b/M8
        Pw=; b=ISzCnDeD0Hhu5ljLGvMBPVlvoWRcaUx7biFWw8HoD4OAjSW+28WGfc7bb
        gDbYeXTX8/mdwrvEtAZ4JEJ8srGKh5NKpXUQ7U4xnRwXBKAWeAhum8Z7dcNXiRUN
        IHLPbGy3KwwoKYfWk/VId/d51zfeduuEqm7xXXZoJEwFSIIGrmNWTWxyFTpeVAeS
        PlvWJ+SiNh6ln8rgLvi1aIj09FiwtzazATz6Rxg0nTJsP/zPNCMNTSUFwr/osbM1
        dlUSAvcXTnMFEx1fZw8ihehuuy9kCQPkivIKlQNcpPaEmNmNsR8wtQMNDp+kGZ6d
        LAg4oxGi4++2AkrO4+mf1zCfSwCGQ==
X-ME-Sender: <xms:Bn7mYQUyrxoRanePnqNHJk8lKVObZ9OP2A86YbLKDgzEDZkrmALWuA>
    <xme:Bn7mYUnmGn7DLAGbCF_frWJjiltgt_N76Iykyu6xCLBvq4JW-scpMFbr63_G_O84b
    63aTf_p0n0Z>
X-ME-Received: <xmr:Bn7mYUb7BW1_ovgHBKboZosiEVlfSO11edlsNhAOvP6PBge6h_pTtZfubmgB-a4T28f8BOjjkXbGSCYFL6MWIMjYY3W-mKXFDZDkO_qFjTyZ5_IDkaRePw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtke
    ertddtredunecuhfhrohhmpefkrghnucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidr
    nhgvtheqnecuggftrfgrthhtvghrnhepieduudejfeefkefhteevffeltefhieegffekhf
    eiteefkefgffetheeiieelvdeunecuffhomhgrihhnpehgvghnthhoohdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnse
    hthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:Bn7mYfVMuGgh81VIODElnfQ0U2pXOutshXRn2wHpxNyNTFSevjgAOg>
    <xmx:Bn7mYammvM9tbN_P4Ju2_E7_EPpEvALvNlHaYUAh4C0U5kw4ImNXyQ>
    <xmx:Bn7mYUdowaNtVDUDjsheFv_GUuiXdhVce1ubFo4av_QZAPHfxqXPHQ>
    <xmx:Bn7mYRv7QLhcMIicuSXY-gLKOeDpxPrC-HbhhO-EcboI2x64z9SzFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jan 2022 03:44:52 -0500 (EST)
Message-ID: <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
From:   Ian Kent <raven@themaw.net>
To:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Cc:     Fabian Groffen <grobian@gentoo.org>
Date:   Tue, 18 Jan 2022 16:44:47 +0800
In-Reply-To: <YeZ51EWg85akR6Ig@ofant>
References: <YeZ51EWg85akR6Ig@ofant>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, 2022-01-18 at 16:27 +0800, Yixun Lan wrote:
> Hi Ian Kent:
> 
> Fabian reported a bug about failing to mount /net with autofs-5.1.8,
> but have no problem with previous 5.1.6
> 
> I'm not able to reproduce this error (need more info about the
> settings)
> So write to the mailinglist to see if you can shed some light on
> this..
> 
> 
> The most verbose error messages like this:
> 
> Jan 11 13:53:09 khnum automount[3614]: mount_autofs_offset: failed to
> mount offset trigger  at 
> Jan 11 13:56:24 khnum automount[3614]: set_tsd_user_vars: failed to
> get
> buffer size for getpwuid_r
> Jan 11 14:56:52 khnum kernel: autofs4:pid:10191:validate_dev_ioctl:
> invalid path supplied for cmd(0xc018937e)

I've had several bug reports which have been mostly fixed now but these
log entries don't look like anything I have seen so far.

I haven't yet pushed those changes to the repository either.
How would you like to proceed?
I could post a patch series to you or the list to try if you wish.

That user vars log entry is in code that hasn't changed for quite a
long time, that's odd.


> 
> 
> detail of the bug report:
>  https://bugs.gentoo.org/831014
> 
> 


