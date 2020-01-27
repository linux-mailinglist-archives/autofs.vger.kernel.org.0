Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3A8C14AC01
	for <lists+autofs@lfdr.de>; Mon, 27 Jan 2020 23:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgA0W3S (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 27 Jan 2020 17:29:18 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:35953 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgA0W3S (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 27 Jan 2020 17:29:18 -0500
Received: by mail-lj1-f169.google.com with SMTP id r19so12667198ljg.3
        for <autofs@vger.kernel.org>; Mon, 27 Jan 2020 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ThV1CBx5d6YtjiG4eFyzuwDcALA+G0sJHJOp/p5lhMc=;
        b=uSm0NIDxYd450XEj55Pc5jxUprFLL5r8SFb2VjQnMbdxkszlTTquot/7ROeaZVIM40
         PlSmFCm1FVaMclJdsUy6uPP3gsjD+7N38K413KJDkLv8JZ7ihfQi6WUJSAMmPUV3R+Dn
         bhgLQyS1ch5djBrcwgZILKrhaydSEXYN6kTJnbE3u87MTQpCVmw/bXVk3CVYOX7F+ss3
         nQcYUsvE/RJ6WSYtAgF1OuD9ai1CE2M6C7qQGdwKieAIccB7s8Sblbx34zR7JEB/50Ks
         3fdn40NBaexJR7tCDekiC7QVxHCUZ854xAVcMSxtTAV3XKdKm137pVW9DsRodzr51AbQ
         0v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ThV1CBx5d6YtjiG4eFyzuwDcALA+G0sJHJOp/p5lhMc=;
        b=G4/wtUN32RagHKgy6O5/3jHNGdfmrygLveR97UCXnl+cQZPCIvIpuwvIYhqCvRCI+u
         hZNVd5ZTXzoHke0QmDJHHIzdMO03WHpJkLQijznKs1WCg+t7/53E1r+yTJGDEdWep/pG
         9pUIdAQJrHnpGRk5uo/tP+f98270japd6bb0PNNuTrTHcDA9RYlOEAUd1+7XDp1dnzUV
         GtDtGis+LCb8U2f/muDqKPdjDxI01VT6xPcMA2Kh9w29M64NubW6D5bWAIAPGvJuOHVE
         nfhZxp8sXxV+GrotmjbRCfr0EpVuy+6I9xwWuEFrD/FUaQ/ZNGDAtgqGTsosU5qis5sN
         UFvg==
X-Gm-Message-State: APjAAAUlAUpHf+aHiO6DCmbIvVqgCRIoC3ZucFYfr3KTa+bBL/qiY8zv
        FtDLb+VCUN5bJi7ozokoBlHlYjYLBbGg01zf9/M=
X-Google-Smtp-Source: APXvYqype2vJreDWo821NuNBWXYDvA+JfBNYOFF4dtLKFmqKwBm+A08jXspUWNaLJYbejheeNeWCp8ZiYtJ0E6ZwcHc=
X-Received: by 2002:a2e:b610:: with SMTP id r16mr11810616ljn.33.1580164154428;
 Mon, 27 Jan 2020 14:29:14 -0800 (PST)
MIME-Version: 1.0
From:   Andreas P <nurgrak@gmail.com>
Date:   Mon, 27 Jan 2020 23:29:03 +0100
Message-ID: <CABPfrkwch8S=WBstyzM3-B-9zDhCQgmACX6E1MKs_5AoJdc=4g@mail.gmail.com>
Subject: [PATCH] Update --help parameter output in automount
To:     Ian Kent <raven@themaw.net>,
        "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
Cc:     autofs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

The --help parameter output in daemon/automount.c has been updated by
removing typos, fixing formatting, As well trying to make minor
changes to to make it easier to read.

Cheers

Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
---

diff --git a/daemon/automount.c b/daemon/automount.c
index 8ec4ac5..a7420fd 100644
--- a/daemon/automount.c
+++ b/daemon/automount.c
@@ -1923,33 +1923,33 @@ static void usage(void)
 {
        fprintf(stderr,
                "Usage: %s [options] [master_map_name]\n"
-               "       -h --help       this text\n"
-               "       -p --pid-file f write process id to file f\n"
-               "       -t --timeout n  auto-unmount in n seconds (0-disable)\n"
+               "       -h --help       Show this help\n"
+               "       -p --pid-file f Write process id to file \n"
+               "       -t --timeout n  Auto-unmount in n seconds (0-disable)\n"
                "       -M --master-wait n\n"
-               "                       maximum wait time (seconds)
for master\n"
+               "                       Maximum wait time for master\n"
                "                       map to become available\n"
-               "       -v --verbose    be verbose\n"
-               "       -d --debug      log debuging info\n"
-               "       -Dvariable=value, --define variable=value\n"
-               "                       define global macro variable\n"
+               "       -v --verbose    Verbose logging\n"
+               "       -d --debug      Log debugging info\n"
+               "       -D variable=value, --define variable=value\n"
+               "                       Define global macro variable\n"
                "       -S --systemd-service\n"
-               "                       run automounter as a systemd service\n"
-               "       -f --foreground do not fork into background\n"
+               "                       Run automounter as a systemd service\n"
+               "       -f --foreground Run automount daemon in the
foreground\n"
                "       -r --random-multimount-selection\n"
-               "                       use ramdom replicated server
selection\n"
+               "                       Use random replicated server
selection\n"
                "       -m --dumpmaps [<map type> <map name>]\n"
-               "                       dump automounter maps and exit\n"
+               "                       Dump automounter maps and exit\n"
                "       -n --negative-timeout n\n"
-               "                       set the timeout for failed key
lookups.\n"
+               "                       Set the timeout for failed key
lookups\n"
                "       -O --global-options\n"
-               "                       specify global mount options\n"
+               "                       Specify global mount options\n"
                "       -l --set-log-priority priority path [path,...]\n"
-               "                       set daemon log verbosity\n"
+               "                       Set daemon log verbosity\n"
                "       -C --dont-check-daemon\n"
-               "                       don't check if daemon is
already running\n"
-               "       -F --force      forceably clean up known
automounts at start\n"
-               "       -V --version    print version, build config and exit\n"
+               "                       Don't check if daemon is
already running\n"
+               "       -F --force      Forceably clean up known
automounts at start\n"
+               "       -V --version    Print package version, build
config and exit\n"
                , program);
 }
