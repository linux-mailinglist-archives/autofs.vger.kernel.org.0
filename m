Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE9C13B580
	for <lists+autofs@lfdr.de>; Tue, 14 Jan 2020 23:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgANWwF (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 14 Jan 2020 17:52:05 -0500
Received: from act-mtaout4.csiro.au ([150.229.7.41]:5114 "EHLO
        act-MTAout4.csiro.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgANWwE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 14 Jan 2020 17:52:04 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jan 2020 17:52:03 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=csiro.au; i=@csiro.au; q=dns/txt; s=dkim;
  t=1579042323; x=1610578323;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r5ltIXCHjYBK/Eki0kUWsmF3RC9h/ik+fT5mLSl60ug=;
  b=E1yuTH+1k9ricaUXqFsgoYrGYCuiU3pnV4aOwTnoFF0j2wzn3w9rm+/f
   /Krknfvm1AVh0aNO/Qk4L89gDzz9cDr8tD1dWSPVcI4VmypHHSd+CHcx0
   dOg4fzvLgYt7wretgquei+/I7mfG/D7K/XPai6HdhkzJPxb6tmv4Ge28m
   w=;
IronPort-SDR: gtwKmsOiPx2eZRUzF5kuwG2915hvdIEQp703xZxVYMcen/Oj9Ce6nMqL0hwKvVHs+tPUUMlV+O
 OvmjfYQMyR4w==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?9a23=3AahHOpBP3YOypH8z0PHgl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEu6U/l0fHCIPc7f8My/HbtaztQyQh2d6AqzhDFf4ETB?=
 =?us-ascii?q?oZkYMTlg0kDtSCDBjFLfjhYiomWuFJVVl57mu2GUNOGdz5IVTP8TW/?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+E2AQAPRB5elwCwBSSwhIATAJKcgDN?=
 =?us-ascii?q?lHAEBAQEBBwEBEQEEBAEBgXuBVFBxeAQ1CodJA4sGgl+BAYhfkQADVAkBAQE?=
 =?us-ascii?q?NAR8OAgEBAoECgzwCgX8kOBMCAwEBCwEBBQEBAQEBBQQCAhABAQEBAR4GhWc?=
 =?us-ascii?q?Mg05wAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQc?=
 =?us-ascii?q?FPQEBAQECARIVEwYBATcBBAsCAQgYCRUQDxIRJQIEDgUigwQBgkoDDh8BAQI?=
 =?us-ascii?q?CCqE4AoE4iGABAYFzM4J+AQEFd4QeDQuCDAkJAYEsjBiBXD4Sf4JeNT6BBAG?=
 =?us-ascii?q?BFoIYFoVujTVMiEiYBDFEBwMeghqHPIVDhQiEGgwbgkd3kmuERJAkiTSLa4Q?=
 =?us-ascii?q?PAgQCBAUCDgEBBYFpIYFabFSCbAlHGA2IAQwMAgmDUIJWh310AYEnim0BgQ8?=
 =?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A+E2AQAPRB5elwCwBSSwhIATAJKcgDNlHAEBAQEBBwEBE?=
 =?us-ascii?q?QEEBAEBgXuBVFBxeAQ1CodJA4sGgl+BAYhfkQADVAkBAQENAR8OAgEBAoECg?=
 =?us-ascii?q?zwCgX8kOBMCAwEBCwEBBQEBAQEBBQQCAhABAQEBAR4GhWcMg05wAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQcFPQEBAQECARIVE?=
 =?us-ascii?q?wYBATcBBAsCAQgYCRUQDxIRJQIEDgUigwQBgkoDDh8BAQICCqE4AoE4iGABA?=
 =?us-ascii?q?YFzM4J+AQEFd4QeDQuCDAkJAYEsjBiBXD4Sf4JeNT6BBAGBFoIYFoVujTVMi?=
 =?us-ascii?q?EiYBDFEBwMeghqHPIVDhQiEGgwbgkd3kmuERJAkiTSLa4QPAgQCBAUCDgEBB?=
 =?us-ascii?q?YFpIYFabFSCbAlHGA2IAQwMAgmDUIJWh310AYEnim0BgQ8BAQ?=
Received: from exch3-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:33])
  by act-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384; 15 Jan 2020 09:44:23 +1100
Received: from exch4-cdc.nexus.csiro.au (2405:b000:601:13::247:34) by
 exch3-cdc.nexus.csiro.au (2405:b000:601:13::247:33) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 15 Jan 2020 09:44:16 +1100
Received: from ExEdge1.csiro.au (150.229.7.34) by exch4-cdc.nexus.csiro.au
 (152.83.247.34) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Jan 2020 09:44:16 +1100
Received: from AUS01-ME1-obe.outbound.protection.outlook.com (104.47.116.57)
 by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jan 2020 09:44:11 +1100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ec9k4nbW5MsCl6NowkePGm1Istnou2FnAsdTROsXSCNgirrD3aBN1ZSRZawe2tJyWdU11MxEYDyh3LiiVbZ7YiPMOaeAEsU0YUinM6hovOAk22pt/CWDgtnPIsbTcek0TEp2ezlkd3pdp3G3kjSWN3ZXPa8TCFko2dfZ3kAJkont5ovLaNsdlF93JLfVZVV4OGSFGRXPYnf0PhxBbpbAht0J1NDnQDtjP6GVWWejsLkealXGuVQFVwgSNNe4AGflrYe6W8kN2XpM1bTJQ2zojn0Ol06lI+rnzMtTCkwFpHOYXzxp6B3tdjVUi3o37SEL7r6qvXSl67nDUZLp3aLM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t76mDmUkGUJUCYvSfVamuKsHfEhRDiUc+CRlaNt8Uo=;
 b=mM9UxACPQzR6dX5yBhE2E+E+HahGN5A9IzljPs12rpW9y2mcVX6+26SMKcVD+5VZ2M2/BQ68jWD6vneB46qSc+6iYeBVWce5CFtv0wjAyE7St+kAWOy+qJ6cgDVhvkDHVb/9Qjs6PF458rDHnRk+tv0GWL7fD5utaWOm/exnyMeTgjITswU1ld3FdKR4nFgle9kWDIyU/3pZUPU+gF8+tlB5mT0UY7k3gQXG0clQs4vKx2L9BbmCwAhBCW7Nz/vmRY6/IsfRU8hL+I5Hb9IyKuaTYaEBVkhD8WvgnrmAsGJeomChxybt2cX0qE+K9jnyenlvKxQ92q+WqhCHBMctQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csiro.au; dmarc=pass action=none header.from=csiro.au;
 dkim=pass header.d=csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector1-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t76mDmUkGUJUCYvSfVamuKsHfEhRDiUc+CRlaNt8Uo=;
 b=1PsOww8r82ziUbKnd3vc7Ti5m48j3mxT63w+xToIt3rlAQv8ZGcFPrToVuz4UXrUfw1oEfr7O9Rm2YLX65q3mUKOiSufPBgUsbrKWiSxpSjb7cVJ9MNL2hkHZzXsGh+EdlAgAbdtYbD77GTWkwdbINNZ3o9g6tmHXBStCKpkods=
Received: from SYCPR01MB3917.ausprd01.prod.outlook.com (20.177.142.207) by
 SYCPR01MB3312.ausprd01.prod.outlook.com (20.177.106.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 22:44:15 +0000
Received: from SYCPR01MB3917.ausprd01.prod.outlook.com
 ([fe80::30d1:6b00:f7c8:8a9f]) by SYCPR01MB3917.ausprd01.prod.outlook.com
 ([fe80::30d1:6b00:f7c8:8a9f%6]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 22:44:14 +0000
From:   "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To:     Andreas P <nurgrak@gmail.com>
CC:     Ian Kent <raven@themaw.net>,
        "autofs@vger.kernel.org" <autofs@vger.kernel.org>
Subject: Re: [PATCH] Fix typing errors and formatting
Thread-Topic: [PATCH] Fix typing errors and formatting
Thread-Index: AQHVyyQDc8ZkkgeReUW4hSeElsBK5KfqwfsA
Date:   Tue, 14 Jan 2020 22:44:14 +0000
Message-ID: <20200114224407.mcxlvedtjroh6ccc@mayhem.atnf.CSIRO.AU>
References: <CABPfrkzxRo-zATezdNQgtuUDypLU+UPkpoHh6bE6J=mWBH8OFw@mail.gmail.com>
In-Reply-To: <CABPfrkzxRo-zATezdNQgtuUDypLU+UPkpoHh6bE6J=mWBH8OFw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20170113 (1.7.2)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vincent.Mcintyre@csiro.au; 
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1c27e88-f3de-4ae7-ff23-08d799434838
x-ms-traffictypediagnostic: SYCPR01MB3312:
x-microsoft-antispam-prvs: <SYCPR01MB3312D11160F7C92A646B2DF5F4340@SYCPR01MB3312.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(30864003)(6506007)(71200400001)(4326008)(66446008)(6916009)(66946007)(64756008)(66556008)(66476007)(2906002)(76116006)(86362001)(8676002)(316002)(6486002)(81166006)(81156014)(186003)(26005)(478600001)(8936002)(1076003)(5660300002)(54906003)(6512007);DIR:OUT;SFP:1101;SCL:1;SRVR:SYCPR01MB3312;H:SYCPR01MB3917.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6+nhzO/oO6PNmgR6NgA7+Fb+tqVIPS8E+E1yFksibMSI4nx5VAK4RQ8fltgd2ld4N0ecTvrOneptYuuF/4e0MvbHb/Wshsctrl7sE5kl2PSXdXFG+1vef/Ct1Qv5tTgwm7Yu+L7iAwEXPYp/capdNO+C1ltMF5Tp/DbZ4JHmMVolAG5IcC11N9N2xyN4fAbRl44/i4DB32a5euABPqTwD5pZN7WVt/okfevc3dBUroPdXoU5PIvNtA0Fu8BS+r+5b9Y3vDjFsTRTeYe4Tua57hlyDhd4m3G0fEO4Q8psbejP36hYrM4NX5xjxWnWzExOurAilwkG58XZr2dC/ULEzov9sqwD1Pwc5PTpjwde0MTL+lAHbGvfvnrt60W68ge4eEMvXhrG8F418PY7fIJhBl3OlPqNDW8SSygy51HG66ACdlNM+53U9RdHoJf19lfa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E79187E5CDB8C4882FA9978DDA28918@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c27e88-f3de-4ae7-ff23-08d799434838
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 22:44:14.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SuFyKX+PLRX7k1HbCW0gx/jYSJy5DkEIGPiAnbUOlYJDSr2D4GGag8EpZM4MHuC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB3312
X-OriginatorOrg: csiro.au
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Tue, Jan 14, 2020 at 10:45:33PM +0100, Andreas P wrote:
>Fixing multiple typing errors across the board. Combined with adding
>correct formatting for various configuration parameters in
>redhat/autofs.conf.default.in and samples/autofs.conf.default.in. For
>example force_standard_program_map_env.
>
>Signed-off-by: Andreas Polnas <nurgrak@gmail.com>
>---
>diff --git a/README.active-restart b/README.active-restart
>index 95e9862..0f98172 100644
>--- a/README.active-restart
>+++ b/README.active-restart
>@@ -6,7 +6,7 @@ The initial release of autofs version 5 used the
>"umount -l" (lazy
> umount) to clear stale mounts at startup so that new mounts could
> be made with a clean slate. This proved to be a bad choice because
> the lazy umount removes the mount from the kernel mount tree. While
>-the mount itself persists (invisibe to further VFS lookups) until
>+the mount itself persists (invisible to further VFS lookups) until
> the mount isn't busy anymore the kernel function d_path(), used to
> calculate the path from the mount point to the root, isn't able to
what about this as well

- the mount isn't busy anymore the kernel function d_path(), used to
- calculate the path from the mount point to the root, isn't able to
+ the mount isn't busy anymore, the kernel function d_path() (used to
+ calculate the path from the mount point to the root) isn't able to

> perform its function any more. This leads to things that use d_path(),
>@@ -106,7 +106,7 @@ or be set to permissive mode.
> Patches for several recent kernel that don't have the implementation

kernels

> can be found in the patches directory. They have "dev-ioctl" in their
> name. Note that, to use these patches, you should be using a kernel
>-patched with all the current autofs bug fixes since, apart from porobably
>+patched with all the current autofs bug fixes since, apart from probably
> not working, the patch probably won't apply either. The bug fix patches
> can also be found in the patches directory and they have "v5-update" in
> their names.
>diff --git a/README.amd-maps b/README.amd-maps
>index d933a67..7c518da 100644
>--- a/README.amd-maps
>+++ b/README.amd-maps
>@@ -35,7 +35,7 @@ map name given in the master map entry will override
>a "map_name"
> option in the amd per-mount section.
>
> If an amd per-mount section is used alone then not giving the "map_type"
>-option will alow the use of nsswicth for map selection.
>+option will alow the use of nsswitch for map selection.
>
> See below for an example of an amd per-mount configuration entry.
>
>diff --git a/README.autofs-schema b/README.autofs-schema
>index c121e1c..05c05f0 100644
>--- a/README.autofs-schema
>+++ b/README.autofs-schema
>@@ -4,7 +4,7 @@ autofs schema
> The distribution file samples/autofs.schema is very old and is
> incorrect.
>
>-This schema was added to the discribution long ago when it was
>+This schema was added to the distribution long ago when it was
> not clear what schema to use for Linux autofs information.
>
> The schema was corrected somewhere along the line but the autofs
>@@ -12,7 +12,7 @@ distribution copy was never updated. The schema has now =
been
> updated but it is not recommended for use as the schema for autofs
> map information.
>
>-The rfc2307 or, preferably the, rfc2307bis schema is the recommened
>+The rfc2307 or, preferably the, rfc2307bis schema is the recommended
> schema to use.
>
> Ian
>diff --git a/daemon/indirect.c b/daemon/indirect.c
>index 3225732..e2c7d8d 100644
>--- a/daemon/indirect.c
>+++ b/daemon/indirect.c
>@@ -112,7 +112,7 @@ static int do_mount_autofs_indirect(struct
>autofs_point *ap, const char *root)
>                  root);
>             goto out_err;
>         }
>-        /* If we recieve an error, and it's EEXIST or EROFS we know
>+        /* If we receive an error, and it's EEXIST or EROFS we know
>            the directory was not created. */
>         ap->flags &=3D ~MOUNT_FLAG_DIR_CREATED;
>     } else {
>diff --git a/daemon/lookup.c b/daemon/lookup.c
>index 60a48f3..8489d26 100644
>--- a/daemon/lookup.c
>+++ b/daemon/lookup.c
>@@ -765,7 +765,7 @@ int lookup_ghost(struct autofs_point *ap, const char *=
root)
>                 goto next;
>
>             /* This will also take care of amd "/defaults" entry as
>-             * amd map keys are not allowd to start with "/"
>+             * amd map keys are not allowed to start with "/"
>              */
>             if (*me->key =3D=3D '/') {
>                 if (map->flags & MAP_FLAG_FORMAT_AMD)
>diff --git a/daemon/state.c b/daemon/state.c
>index 95d87fc..86a3e50 100644
>--- a/daemon/state.c
>+++ b/daemon/state.c
>@@ -359,7 +359,7 @@ static void do_readmap_mount(struct autofs_point *ap,
>          * TODO: how do we recognise these orphaned map instances. We
>          * can't just delete these instances when the cache becomes
>          * empty because that is a valid state for a master map entry.
>-         * This is becuase of the requirement to continue running with
>+         * This is because of the requirement to continue running with
>          * an empty cache awaiting a map re-load.
>          */
>         valid =3D lookup_source_valid_mapent(ap, me->key, LKP_DISTINCT);
>diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
>index 3a7aba7..861f6d7 100644
>--- a/include/lookup_ldap.h
>+++ b/include/lookup_ldap.h
>@@ -65,7 +65,7 @@ struct lookup_context {
>       * uri is the list of servers to attempt connection to and is
>       * used only if server, above, is NULL. The head of the list
>       * is the server which we are currently connected to.
>-      * cur_host tracks chnages to connected server, triggering
>+      * cur_host tracks changes to connected server, triggering
>       * a scan of basedns when it changes.
>       * sdns is the list of basdns to check, done in the order

basedns

>       * given in configuration.
>diff --git a/man/auto.master.5.in b/man/auto.master.5.in
>index 6e510a5..6e43a64 100644
>--- a/man/auto.master.5.in
>+++ b/man/auto.master.5.in
>@@ -102,7 +102,7 @@ The map is a regular text file.
> .B program
> The map is an executable program, which is passed a key on the command
> line and returns an entry (everything besides the key) on stdout if succe=
ssful.
>-Optinally, the keyword exec may be used as a synonym for program to avoid
>+Optionally, the keyword exec may be used as a synonym for program to avoi=
d
> confusion with amd formated maps mount type program.

formatted

> .TP
> .B yp
>diff --git a/man/autofs.5 b/man/autofs.5
>index d32e772..63c96ac 100644
>--- a/man/autofs.5
>+++ b/man/autofs.5
>@@ -241,7 +241,7 @@ Multiple hosts, some with same path, some with another
> Multiple replicated hosts, different (potentially) paths:
> <path> host1:/path/pathA host2:/path/pathB
>
>-Mutliple weighted, replicated hosts same path:
>+Multiple weighted, replicated hosts same path:

I want a ; after hosts. or 'with'. What do you think?
A comma might do but might be confusing.

> <path> host1(5),host2(6),host3(1):/path/path
>
> Multiple weighted, replicated hosts different (potentially) paths:

ditto

>diff --git a/man/autofs_ldap_auth.conf.5.in b/man/autofs_ldap_auth.conf.5.=
in
>index 2357566..7b01c68 100644
>--- a/man/autofs_ldap_auth.conf.5.in
>+++ b/man/autofs_ldap_auth.conf.5.in
>@@ -55,7 +55,7 @@ This option tells whether an authenticated
>connection to the ldap server is
> required in order to perform ldap queries. If the flag is set to yes, onl=
y
> sasl authenticated connections will be allowed. If it is set to no then
> authentication is not needed for ldap server connections. If it is set to
>-autodetect then the ldap server will be queried to establish a suitable s=
asl
>+autodetect then the ldap server will be queried to establish a suitable S=
ASL
> authentication mechanism. If no suitable mechanism can be found, connecti=
ons
> to the ldap server are made without authentication. Finally, if it is set=
 to
> simple, then simple authentication will be used instead of SASL.
>diff --git a/modules/lookup_program.c b/modules/lookup_program.c
>index fcb1af7..241602e 100644
>--- a/modules/lookup_program.c
>+++ b/modules/lookup_program.c
>@@ -532,7 +532,7 @@ static int match_key(struct autofs_point *ap,
>     /*
>      * Now strip successive directory components and try a
>      * match against map entries ending with a wildcard and
>-     * finally try the wilcard entry itself.
>+     * finally try the wildcard entry itself.
>      */
>     while ((prefix =3D strrchr(lkp_key, '/'))) {
>         char *match;
>diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.in
>index 09bb5dd..c413a02 100644
>--- a/redhat/autofs.conf.default.in
>+++ b/redhat/autofs.conf.default.in
>@@ -79,7 +79,7 @@ mount_nfs_default_protocol =3D 4
> #            in a language that can load components from,
> #            for example, a user home directory.
> #
>-# force_standard_program_map_env =3D no
>+#force_standard_program_map_env =3D no
> #
> # use_mount_request_log_id - Set whether to use a mount request log
> #            id so that log entries for specific mount
>@@ -186,7 +186,7 @@ mount_nfs_default_protocol =3D 4
> # use_ignore_mount_option - This option is used to enable the use of auto=
fs
> #            pseudo option "disable". This option is used as a
> #            hint to user space that the mount entry should be
>-#            ommitted from mount table listings. The default is
>+#            omitted from mount table listings. The default is
> #            "no" to avoid unexpected changes in behaviour and
> #            so is an opt-in setting.
> #
>@@ -333,7 +333,7 @@ mount_nfs_default_protocol =3D 4
> #    machines without having to modify centrally managed maps.
> #    It is empty by default.
> #
>-# search_path - colon seperated paths to search for maps that
>+# search_path - colon separated paths to search for maps that
> #    are not specified as a full path.
> #
> # dismount_interval - is equivalent to the autofs timeout option. It
>@@ -377,7 +377,7 @@ mount_nfs_default_protocol =3D 4
> # ldap_hostports - has no default value set. It must be set to
> #    the URI of the LDAP server to be used for lookups when
> #    ldap is used a map source. It may contain a comma or
>-#    space seperated list of LDAP URIs.
>+#    space separated list of LDAP URIs.
> #
> # hesiod_base - the base name used for hesiod map sources.
> #
>diff --git a/redhat/autofs.sysconfig b/redhat/autofs.sysconfig
>index 0171696..8e3dcbf 100644
>--- a/redhat/autofs.sysconfig
>+++ b/redhat/autofs.sysconfig
>@@ -1,7 +1,7 @@
> #
> # Init system options
> #
>-# If the kernel supports using the autofs miscellanous device
>+# If the kernel supports using the autofs miscellaneous device
> # and you wish to use it you must set this configuration option

comma after 'it' ? not sure

> # to "yes" otherwise it will not be used.
> #
>diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.=
in
>index 4a18f6f..bae885c 100644
>--- a/samples/autofs.conf.default.in
>+++ b/samples/autofs.conf.default.in
>@@ -78,7 +78,7 @@ browse_mode =3D no
> #            in a language that can load components from,
> #            for example, a user home directory.
> #
>-# force_standard_program_map_env =3D no
>+#force_standard_program_map_env =3D no
> #
> # use_mount_request_log_id - Set whether to use a mount request log
> #            id so that log entries for specific mount
>@@ -185,7 +185,7 @@ browse_mode =3D no
> # use_ignore_mount_option - This option is used to enable the use of auto=
fs
> #            pseudo option "disable". This option is used as a
> #            hint to user space that the mount entry should be
>-#            ommitted from mount table listings. The default is
>+#            omitted from mount table listings. The default is
> #            "no" to avoid unexpected changes in behaviour and
> #            so is an opt-in setting.
> #
>@@ -332,7 +332,7 @@ browse_mode =3D no
> #    machines without having to modify centrally managed maps.
> #    It is empty by default.
> #
>-# search_path - colon seperated paths to search for maps that
>+# search_path - colon separated paths to search for maps that
> #    are not specified as a full path.
> #
> # dismount_interval - is equivalent to the autofs timeout option. It
>@@ -376,7 +376,7 @@ browse_mode =3D no
> # ldap_hostports - has no default value set. It must be set to
> #    the URI of the LDAP server to be used for lookups when
> #    ldap is used a map source. It may contain a comma or
>-#    space seperated list of LDAP URIs.
>+#    space separated list of LDAP URIs.
> #
> # hesiod_base - the base name used for hesiod map sources.
> #
>@@ -408,10 +408,10 @@ dismount_interval =3D 300
> # appears to work reasonably well most of the time without the
> # update).
> #
>-# autofs_use_lofs =3D yes
>+#autofs_use_lofs =3D yes
> #
> # Several configuration options can be set per mount point.
>-# In particulr map_type, map_name, map_defaults, search_path,
>+# In particular map_type, map_name, map_defaults, search_path,
> # browsable_dirs, dismount_interval and selectors_in_defaults
> # (not all of which are currently implemented, see above).
> #
>diff --git a/samples/rc.autofs.in b/samples/rc.autofs.in
>index 487669f..7601717 100644
>--- a/samples/rc.autofs.in
>+++ b/samples/rc.autofs.in
>@@ -30,7 +30,7 @@ PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> export PATH
>
> #
>-# load customized configuation settings
>+# load customized configuration settings
> #
> if [ -r $confdir/autofs ]; then
>     . $confdir/autofs

Nice work
Vince
