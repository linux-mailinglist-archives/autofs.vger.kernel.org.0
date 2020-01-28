Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9B614C380
	for <lists+autofs@lfdr.de>; Wed, 29 Jan 2020 00:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgA1XWo (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 28 Jan 2020 18:22:44 -0500
Received: from vic-mtaout3.csiro.au ([150.229.64.39]:1229 "EHLO
        vic-MTAout3.csiro.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgA1XWo (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 28 Jan 2020 18:22:44 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Jan 2020 18:22:43 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=csiro.au; i=@csiro.au; q=dns/txt; s=dkim;
  t=1580253763; x=1611789763;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=56b5vxH+Bbp5IejIbPjb1YBkb+Me+/ehoEA7MzFPG6E=;
  b=m/tCSX5DL9z+t68CpFVbGk2gko55rFYSC1vkAIkTWtdg0AAvaQq2QzAo
   U7XKnYczEE9T3zHZ+Yt2LSpvBt8jNo/6+MO5fbjgSL3w8VzjoeyYhQW0r
   N5bFS/EXc7HyS3xn+rbgjWrxOfV5MwpKYxNr1UhJ8Vzu7nC2giFw0YGTK
   I=;
IronPort-SDR: pOnWM1QS2ImIQ076dEyo5OpWYbYU14IkKDSLkcT0CsqdK+sNkVtOSkoNMbkcyE3z51I9hCeZY+
 h8o5nbCfZ7Yg==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?9a23=3ATl/o3R/F0mn+BP9uRHGN82YQeigqvan1NQcJ65?=
 =?us-ascii?q?0hzqhDabmn44+8bB7E/fs4iljPUM2b8P9Ch+fM+4HYEW0bqdfk0jgZdYBUER?=
 =?us-ascii?q?oMiMEYhQslVfCED0b2KuKsSic7GthTTlJN9Gq6K08TEdutL1A=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+HQAgDyvzBelwCwBSSwhIATAJKcgDJ?=
 =?us-ascii?q?lHAEBAQEBBwEBEQEEBAEBgXuBVCknXoELBDUKh1ADixeCX4lhkQADVAkBAQE?=
 =?us-ascii?q?NAS0CAQEChD4CgickOBMCAwEBCwEBBQEBAQEBBQQCAhABAQEBAR4GhWcMg05?=
 =?us-ascii?q?xAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQKBDD4BAQE?=
 =?us-ascii?q?DEigGAQE3AQ8CAQgYCRUQDxIRJQIEDgUigwSCSwMtAQECAqMQAoE5iGEBAYI?=
 =?us-ascii?q?mgn8BAQWFFA0LggwJCQGBLowegVw+gyZQLj6CG4IYFoVujVaJAYIhhzCOcEQ?=
 =?us-ascii?q?HAx6CG5IOhB0MG4JIjE+HIIRFkCqJPpAFAgQCBAUCDgEBBYFpIYFabINAUBg?=
 =?us-ascii?q?Njh0MDgmBBAEHgkSKU3SBKYt7AYEPAQE?=
X-IPAS-Result: =?us-ascii?q?A+HQAgDyvzBelwCwBSSwhIATAJKcgDJlHAEBAQEBBwEBE?=
 =?us-ascii?q?QEEBAEBgXuBVCknXoELBDUKh1ADixeCX4lhkQADVAkBAQENAS0CAQEChD4Cg?=
 =?us-ascii?q?ickOBMCAwEBCwEBBQEBAQEBBQQCAhABAQEBAR4GhWcMg05xAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQKBDD4BAQEDEigGAQE3AQ8CA?=
 =?us-ascii?q?QgYCRUQDxIRJQIEDgUigwSCSwMtAQECAqMQAoE5iGEBAYImgn8BAQWFFA0Lg?=
 =?us-ascii?q?gwJCQGBLowegVw+gyZQLj6CG4IYFoVujVaJAYIhhzCOcEQHAx6CG5IOhB0MG?=
 =?us-ascii?q?4JIjE+HIIRFkCqJPpAFAgQCBAUCDgEBBYFpIYFabINAUBgNjh0MDgmBBAEHg?=
 =?us-ascii?q?kSKU3SBKYt7AYEPAQE?=
Received: from exch2-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:32])
  by vic-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384; 29 Jan 2020 10:15:32 +1100
Received: from exch4-cdc.nexus.csiro.au (2405:b000:601:13::247:34) by
 exch2-cdc.nexus.csiro.au (2405:b000:601:13::247:32) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 29 Jan 2020 10:15:32 +1100
Received: from ExEdge1.csiro.au (150.229.7.34) by exch4-cdc.nexus.csiro.au
 (152.83.247.34) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jan 2020 10:15:32 +1100
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.59)
 by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jan 2020 10:15:26 +1100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAqp7lnvtrMeg6Kjhqh+r1HsjKa04lk0KYcrISEYuAqsu8a8vSnRgYwfiKNSSj1k4DvPz+Mpy2h4LE71pxffz4k2AeZ7SfjL4ZCxhXqHI00H2Pf1rnY08olFi0aV+Z3cmOLS5IVhRkjhcKRb++EYVY3nVQauMI/2z1NFCDEZ4Ix1T6FGLQtTHH7N88IRCGVv4YJ5XiW9LbFaJ0J4CPSKDe3ChcwyWL1lDd/t7cPHUpepdliE+Y32WXrJB+dFi9wyZjQY/CCSpbs3Ch3dbIzUFUoRRTVB1u94Z/JyH4x6UrttlIRFHs+pS8S0kip9lGBw5BCP7BzA6/nd0hRuEEhJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4QOy+ESjLUbDKQy12R/hJqw8A40LD7Oq3s7jRp2koA=;
 b=GaqIsDizZvMWjO3x/s0ifZMZh4AqSIiqGnYhSbRctN/FZ6mPC49Ep4MsvKpxesUosjNnlqSWETUQQQT2v5UrgqHsxxYb/FNd3DB0EINQmVIkmacxJL9KcF+CCIn7MtrNTdWKR2Ciz0yDpMEQ0s8CpZYBBJ+/Y7FGbKPaj4F1L3S8405qeADR460dUFC+Yn7KErD02MZ3x2KRMuA4kTvYXSgdOw1A3A1yNBLYCJpyvEE4uT/hJXn/B78X7afHzFD9TG/z3yQJFAVyuKT2VwIb8RTWogSt7gtn3NalsAW94riwiACl/nWZic/k7IGTTGbpVn+0EHREVs1hj9Ru+mC2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csiro.au; dmarc=pass action=none header.from=csiro.au;
 dkim=pass header.d=csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector1-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4QOy+ESjLUbDKQy12R/hJqw8A40LD7Oq3s7jRp2koA=;
 b=iUa+xKAjgGAvxvihcPiDgwq02lgXIJfbKoH5MNxd3Kh45YKLCBWCc4T/aZM3TouGY9tX4zDiO/fmwto9q15Mak/EsnGTcHGwSUEcwKrwWiPw/3hGfsxmZomvAy1ZlfBUcOCyEAVXASz/MFGyxcsgJOktpiJxF+AA/wcpM17JsDs=
Received: from ME2PR01MB3345.ausprd01.prod.outlook.com (52.134.220.205) by
 ME2PR01MB3330.ausprd01.prod.outlook.com (52.134.220.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Tue, 28 Jan 2020 23:15:31 +0000
Received: from ME2PR01MB3345.ausprd01.prod.outlook.com
 ([fe80::d095:8688:1c58:f84c]) by ME2PR01MB3345.ausprd01.prod.outlook.com
 ([fe80::d095:8688:1c58:f84c%5]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 23:15:30 +0000
From:   "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To:     Andreas P <nurgrak@gmail.com>
CC:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Subject: Re: [PATCH] Update --help parameter output in automount
Thread-Topic: [PATCH] Update --help parameter output in automount
Thread-Index: AQHV1WE/qjQp1nBc10yCn3ogElBqjqgAtucA
Date:   Tue, 28 Jan 2020 23:15:30 +0000
Message-ID: <20200128231529.lexlcp5ljdo2lykp@mayhem.atnf.CSIRO.AU>
References: <CABPfrkwch8S=WBstyzM3-B-9zDhCQgmACX6E1MKs_5AoJdc=4g@mail.gmail.com>
In-Reply-To: <CABPfrkwch8S=WBstyzM3-B-9zDhCQgmACX6E1MKs_5AoJdc=4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20170113 (1.7.2)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vincent.Mcintyre@csiro.au; 
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4c0837c-ebe4-4e82-d127-08d7a447f830
x-ms-traffictypediagnostic: ME2PR01MB3330:
x-microsoft-antispam-prvs: <ME2PR01MB3330D98D359B0BD19DFAD5EFF40A0@ME2PR01MB3330.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(346002)(39850400004)(189003)(199004)(6916009)(6506007)(6486002)(76116006)(66476007)(66446008)(66556008)(8676002)(6512007)(66946007)(64756008)(81166006)(316002)(8936002)(91956017)(81156014)(5660300002)(26005)(86362001)(71200400001)(4326008)(15650500001)(186003)(1076003)(478600001)(2906002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:ME2PR01MB3330;H:ME2PR01MB3345.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k6UN07DWV1U7y+1giLRCvlQ4deZQ883iW8h/soSzBQFSbvo7NZ62irI9+55i95xuH581RjBU5Ub9Wfy4IS76i6Mi7KS/Q2Ro5ni53IBGeZ6BKpyQNeQNv5v8PRq3v87ytbQPUifT1TfBxNIkiRoO7EmNTGxTpxvYomCHdJGf7lmeGdSlavS8+2sNoAhQu2tVmJ6IGbiM3clKCKjUShdoIo/DTxghN9eU3yZI5zxIiNLa0uOqQAfQEY+mSzXVWhLN6WKr96NzYrFE9RSrpp4+wUxGpU53r7+vCOBlh0OjN60BLSdWAAiT9PJLjFlvjC5Ss0qbWwEKzTGl+zH6FaYuQ4+qlc+FKNS+aYNevoqplJNpQBWhSfs6oUWbwRYMU8l8dwHmyTi/uzpEvB6M23HhdK7FGfCEp3dOjg4Tf0mfiGOCDAAxhs1NvypvJmjyWAOd
x-ms-exchange-antispam-messagedata: B/xmBVwiVTdwA5uP4rNPHlyCunnUAmG9fAXMFOhGNaY4ojxD5RlvH3Iax3/8eE1v6AeymrB2/ondFRrysAUocRfdYDkudOlBeTRHzD3/c/B60vjdHR2kT7Sj1e+Bjnq7A2YDf4+abAOClUf0Jbh6Ww==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F3C0404B3769342A42280C8D43B218A@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c0837c-ebe4-4e82-d127-08d7a447f830
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 23:15:30.8377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7NRshKyL1bn2+8PUFzAgR1b44n2gUdz+AFMeiRRv6CTtihx8oPqSJRVmJvaOlgI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB3330
X-OriginatorOrg: csiro.au
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Mon, Jan 27, 2020 at 11:29:03PM +0100, Andreas P wrote:
>The --help parameter output in daemon/automount.c has been updated by
>removing typos, fixing formatting, As well trying to make minor
>changes to to make it easier to read.
>
>Cheers
>
>Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
>---
>
>diff --git a/daemon/automount.c b/daemon/automount.c
>index 8ec4ac5..a7420fd 100644
>--- a/daemon/automount.c
>+++ b/daemon/automount.c
>@@ -1923,33 +1923,33 @@ static void usage(void)
> {
>        fprintf(stderr,
>                "Usage: %s [options] [master_map_name]\n"
>-               "       -h --help       this text\n"
>-               "       -p --pid-file f write process id to file f\n"
>-               "       -t --timeout n  auto-unmount in n seconds (0-disab=
le)\n"
>+               "       -h --help       Show this help\n"
>+               "       -p --pid-file f Write process id to file \n"
>+               "       -t --timeout n  Auto-unmount in n seconds (0-disab=
le)\n"

Would (0=3D>disable) or (0=3Ddisable) be better? Not sure.

>                "       -M --master-wait n\n"
>-               "                       maximum wait time (seconds)
>for master\n"
>+               "                       Maximum wait time for master\n"
>                "                       map to become available\n"

My initial reaction was I'd be happier with the unit left in, eg

+               "                       Maximum wait time (sec) for master\=
n"

but see below.

>-               "       -v --verbose    be verbose\n"
>-               "       -d --debug      log debuging info\n"
>-               "       -Dvariable=3Dvalue, --define variable=3Dvalue\n"
>-               "                       define global macro variable\n"
>+               "       -v --verbose    Verbose logging\n"
>+               "       -d --debug      Log debugging info\n"
>+               "       -D variable=3Dvalue, --define variable=3Dvalue\n"
>+               "                       Define global macro variable\n"
>                "       -S --systemd-service\n"
>-               "                       run automounter as a systemd servi=
ce\n"
>-               "       -f --foreground do not fork into background\n"
>+               "                       Run automounter as a systemd servi=
ce\n"
>+               "       -f --foreground Run automount daemon in the
>foreground\n"
>                "       -r --random-multimount-selection\n"
>-               "                       use ramdom replicated server
>selection\n"
>+               "                       Use random replicated server
>selection\n"
>                "       -m --dumpmaps [<map type> <map name>]\n"
>-               "                       dump automounter maps and exit\n"
>+               "                       Dump automounter maps and exit\n"
>                "       -n --negative-timeout n\n"
>-               "                       set the timeout for failed key
>lookups.\n"
>+               "                       Set the timeout for failed key
>lookups\n"

Possibly the unit of time should be given here too,
but if it's mentioned for one time-like argument above (-t)
the reader will likely assume correctly all such use the same unit.
The man page documents the unit, anyway.
I wondered briefly what the default was, but that's too much detail
here; it's in the man page.

>                "       -O --global-options\n"
>-               "                       specify global mount options\n"
>+               "                       Specify global mount options\n"
>                "       -l --set-log-priority priority path [path,...]\n"
>-               "                       set daemon log verbosity\n"
>+               "                       Set daemon log verbosity\n"
>                "       -C --dont-check-daemon\n"
>-               "                       don't check if daemon is
>already running\n"
>-               "       -F --force      forceably clean up known
>automounts at start\n"
>-               "       -V --version    print version, build config and ex=
it\n"
>+               "                       Don't check if daemon is
>already running\n"
>+               "       -F --force      Forceably clean up known
>automounts at start\n"

This should be 'Forcibly'

>+               "       -V --version    Print package version, build
>config and exit\n"
>                , program);
> }

HTH

Reviewed-by: vincent.mcintyre@csiro.au (fwiw)
