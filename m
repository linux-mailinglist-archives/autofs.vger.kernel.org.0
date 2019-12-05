Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C004113F16
	for <lists+autofs@lfdr.de>; Thu,  5 Dec 2019 11:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbfLEKM0 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Dec 2019 05:12:26 -0500
Received: from ny018.relay.arandomserver.com ([172.96.188.180]:38953 "EHLO
        ny018.relay.arandomserver.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728629AbfLEKM0 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Dec 2019 05:12:26 -0500
X-Greylist: delayed 2728 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Dec 2019 05:12:25 EST
Received: from nyc006.hawkhost.com ([172.96.186.142])
        by se004.arandomserver.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <nazard@nazar.ca>)
        id 1icnPQ-0008aU-TH
        for autofs@vger.kernel.org; Thu, 05 Dec 2019 03:26:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nazar.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Xkyql0oU80YATmM3B78QFxLPataTQBDdgDUfeWUfxDw=; b=e1P12YPDzwHO6rQH7p3g24IHOv
        lXMzM++oRhZtP9Qn/xcc62kDGUdFv9vlLkw9cCgYJSR6bpVglEGHK19P5e/PUxYQ2fpGHoXfnqClb
        Fb8nKeLk2qWYxhgxCPbH1R1asDvuEiyCrqRP4x5yQ7abwheLTx3XOzSIp/cDDUszgfAhWxFi7x1t9
        pMrtq/KRE74xYPlg+jIuD616YIUpE104296d+wN/7WwwDMRtnvaKJhnkGtQ4iK61jKSHxSYziu1+J
        4Tf4IlJIOGon0TuimiEmnfbJmf9Pwfk/J4g7qDr0nsu/Am/F/8KVVRf2DcYfn+vX+HH+eZH4sKwph
        mMYEOY4A==;
Received: from [24.114.72.155] (port=5898 helo=[192.168.21.100])
        by nyc006.hawkhost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <nazard@nazar.ca>)
        id 1icnPQ-0006R6-L6
        for autofs@vger.kernel.org; Thu, 05 Dec 2019 04:26:52 -0500
To:     autofs@vger.kernel.org
From:   Doug Nazar <nazard@nazar.ca>
Subject: Failure of program map to recover after failure
Message-ID: <80e57bb7-09b9-e58c-dfa0-1bd670238cee@nazar.ca>
Date:   Thu, 5 Dec 2019 04:26:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101
 Thunderbird/71.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AuthUser: nazard@nazar.ca
X-Originating-IP: 172.96.186.142
X-SpamExperts-Domain: nyc006.hawkhost.com
X-SpamExperts-Username: relay
Authentication-Results: arandomserver.com; auth=pass (login) smtp.auth=relay@nyc006.hawkhost.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.13)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fKZ8wcD78QFAaYhvfMzLIKpSDasLI4SayDByyq9LIhV5o9wXX2OjMEK
 ueLZvajmPkTNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGDKURNgjK07tDLDmdD7xEdEih4
 MK0k2uSGCYA7tfg2EIEohhURmujkQFaKQo+8xh+gBMmyNbDn7R5kilAhwr3KtPRgtEKbbJiCf5yI
 2Oixqpv29K3Gp8HBKlhPMU/wySsmlmcytzu44kYKJ1l+OBE/TZKNta2mByIIGahJdU0/XfpofAnZ
 4RKtSnQjD+BInceoy5HrTQ/15De+h26k3foyuTMZBlLTrx7cRhOA0AGNmQPxPM8Xh4brWj5zEVmt
 QhejZoF8ohh/W3XPHbTGICzfpfaiuirJIbOqVirTRI71PTAkCOqhU03a0FKO9ALZrAC4u26svGUu
 tW6twupTSrWQBKLqGvUU4QaGCh0e5PQXeR8UwXtyCZ4EfHnO3iwFffHyVoMZk3qQvq5jLX10jelH
 HLdY2rW50fd1ekaDpmIWc1Vmt3mnxMTQMQWbvBqEXskTQn6USYs98Imn+lZXe3dwYfgVB1xo6dCf
 BaU/iegBU8ZgbBlPTXkrGnKnMp2blIGx4nuZrRf7bMi0WRR6pZ+nWXet2UgCBLgTlHWPd4covp21
 bNtTsMOn+/elOyFCGIoLBFGIjgViOY1YorgL3vF1CNM+m4WpRRDP6YzwkAPgQJZrjSGcp8ImS28b
 vXXEVcZamQD4DmdW2x5lNiRBy1yDgeDENX9A9w6uNC/eRRGtF/gW0WwLMK4Qpnf9eKrsRpe1UV8S
 hebT8U8Xw9HTDfreWW7VTyzWu9kRz+27QABunh1hskTn1DOWgs8ZFF04wLkfrFYvYfO5e2ygexex
 jgpgP/lomRFajmwsPnptFxBvtDebO+8nMRYL9kekVL4dhx06EfJL2hMI4yCDSSr/HxDyN3tLn+N+
 iz/93wDyh8nftDKIqRqcBCZacIGP3Lo+GA83e0nz7X0QSiV0782rEUbD6fY4ocfmWv3Fe9Iziczd
 q+A=
X-Report-Abuse-To: spam@se001.arandomserver.com
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On autofs 5.1.6, after an unsuccessful mount attempt (stopped server) 
using a program map for /net, it'll never recover once the server is 
started again.

Here's the initial debug log for the failure:

handle_packet: type = 3
handle_packet_missing_indirect: token 6631, name wraith, request pid 32245
attempting to mount entry /net/wraith
lookup_mount: lookup(program): looking up wraith
lookup_mount: lookup(program): wraith -> 
-fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
parse_mount: parse(sun): expanded entry: 
-fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
parse_mount: parse(sun): gathered options: 
fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
parse_mount: parse(sun): dequote("/") -> /
parse_mapent: parse(sun): gathered options: 
fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
parse_mapent: parse(sun): dequote("wraith:/") -> wraith:/
update_offset_entry: parse(sun): updated multi-mount offset / -> 
-fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 wraith:/
parse_mapent: parse(sun): gathered options: 
fstype=nfs,hard,intr,nodev,nosuid,sec=krb5
parse_mapent: parse(sun): dequote("wraith:/") -> wraith:/
sun_mount: parse(sun): mounting root /net/wraith/, mountpoint wraith, 
what wraith:/, fstype nfs, options hard,intr,nodev,nosuid,sec=krb5
mount(nfs): root=/net/wraith/ name=wraith what=wraith:/, fstype=nfs, 
options=hard,intr,nodev,nosuid,sec=krb5
mount(nfs): nfs options="hard,intr,nodev,nosuid,sec=krb5", nobind=0, 
nosymlink=0, ro=0
get_nfs_info: called with host wraith(192.168.21.90) proto 6 version 0x20
get_nfs_info: called with host wraith(192.168.21.90) proto 17 version 0x20
get_nfs_info: called with host wraith(fde2:2b6c:2d24:21::5a) proto 6 
version 0x20
get_nfs_info: called with host wraith(fde2:2b6c:2d24:21::5a) proto 17 
version 0x20
mount(nfs): no hosts available
dev_ioctl_send_fail: token = 6631
failed to mount /net/wraith

After a few minutes another attempt after I've re-started the server on 
target:

handle_packet: type = 3
handle_packet_missing_indirect: token 6635, name wraith, request pid 32309
attempting to mount entry /net/wraith
lookup_mount: lookup(program): wraith -> 
-fstype=nfs,hard,intr,nodev,nosuid,sec=krb5 / wraith:/
lookup(program): unexpected lookup for active multi-mount key wraith, 
returning fail
dev_ioctl_send_fail: token = 6635
failed to mount /net/wraith

I'm currently running this patch but don't have much confidence in it. 
I'm unsure of the lifetime rules for me->multi, maybe it should have 
been cleared after failure mounting?

diff --git a/modules/lookup_program.c b/modules/lookup_program.c
index fcb1af7..b6f854b 100644
--- a/modules/lookup_program.c
+++ b/modules/lookup_program.c
@@ -646,7 +646,7 @@ int lookup_mount(struct autofs_point *ap, const char 
*name, int name_len, void *
                                  name_len, ent, ctxt->parse->context);
                         goto out_free;
                 } else {
-                       if (me->multi) {
+                       if (me->multi && me->multi != me) {
                                 cache_unlock(mc);
                                 warn(ap->logopt, MODPREFIX
                                      "unexpected lookup for active 
multi-mount"

Thanks,
Doug

