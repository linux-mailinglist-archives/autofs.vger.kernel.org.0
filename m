Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EA5AAFC8
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 02:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389919AbfIFATW (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 20:19:22 -0400
Received: from vic-mtaout5.csiro.au ([150.229.64.42]:33256 "EHLO
        vic-MTAout5.csiro.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733029AbfIFATW (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 20:19:22 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 20:19:21 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=csiro.au; i=@csiro.au; q=dns/txt; s=dkim;
  t=1567729161; x=1599265161;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OXkicanINPwO9+qMkFTyQ2JanTALSgd8mJA/4s36ipo=;
  b=XGrZU+k7D3wlxnU65TsROt7GaJryT2Gma+LdV5vsTPDzQ1EelfTWWc3g
   aXncKYWZTxpxTMkYtfbcu2MM4CjB6ytYRYE0RGGMhWo6GzgweNnPJqd8N
   86SuV3Lv/C1vbg3OO7dfwgGe7ohxRaruoBSPyXafEzIWpOlOE1cSYjvjj
   M=;
IronPort-SDR: BVUgQMzW+PY8IK3K1naHr878C/a527WHZ9/7XfI/i3rzqqS8lp5tfTE81mirNGnPCW10HuPtFi
 LrlQt9Lmc4Iw==
X-SBRS: 4.0
IronPort-PHdr: =?us-ascii?q?9a23=3A+zMIDRH815lOTghyaHqSY51GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z3A3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+ecDraSc3GtgEcVRk+W2qK0V9E93/fVqUq2DhpTM=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+F1AACQo3FdjACwBSSwhIATAJKcgDR?=
 =?us-ascii?q?bChsBAQEBAwEBAQcDAQEBgVYDAQEBCwEBgUMpJ1wUdgQ1CodeA4p1glyJYZB?=
 =?us-ascii?q?dAxg8CQEBAQ0BHw4CAQECgQKCFIEnAoI3IzcGDgIDCQEBBQEBAQEBBgQCAhA?=
 =?us-ascii?q?BAQEmhV4MQgEQAYJxOTEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBBQIzBTgBAQEBAxIoBgEBNwEPAgEIDgQDAwkVEA8SERcOAgQOBSK?=
 =?us-ascii?q?DAAGBagMcAQECAp9SAoE4iGABAYIkgn0BAQV1hCINC4IWCQkBgSoBi3eBWT6?=
 =?us-ascii?q?EIz6BBAGBFYF/FRaFY4xOCigKh3GCDpRqQQcDHYIChneJc4NyDBuCNG+KbIp?=
 =?us-ascii?q?nhCyLBohLimaDdAIEAgQFAg4BAQWBaCGBWmxUgmwJgjkYAoENAQeCQ4JWh31?=
 =?us-ascii?q?zAYEohBuIZQGBIgEB?=
X-IPAS-Result: =?us-ascii?q?A+F1AACQo3FdjACwBSSwhIATAJKcgDRbChsBAQEBAwEBA?=
 =?us-ascii?q?QcDAQEBgVYDAQEBCwEBgUMpJ1wUdgQ1CodeA4p1glyJYZBdAxg8CQEBAQ0BH?=
 =?us-ascii?q?w4CAQECgQKCFIEnAoI3IzcGDgIDCQEBBQEBAQEBBgQCAhABAQEmhV4MQgEQA?=
 =?us-ascii?q?YJxOTEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQIzB?=
 =?us-ascii?q?TgBAQEBAxIoBgEBNwEPAgEIDgQDAwkVEA8SERcOAgQOBSKDAAGBagMcAQECA?=
 =?us-ascii?q?p9SAoE4iGABAYIkgn0BAQV1hCINC4IWCQkBgSoBi3eBWT6EIz6BBAGBFYF/F?=
 =?us-ascii?q?RaFY4xOCigKh3GCDpRqQQcDHYIChneJc4NyDBuCNG+KbIpnhCyLBohLimaDd?=
 =?us-ascii?q?AIEAgQFAg4BAQWBaCGBWmxUgmwJgjkYAoENAQeCQ4JWh31zAYEohBuIZQGBI?=
 =?us-ascii?q?gEB?=
Received: from exch4-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:34])
  by vic-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384; 06 Sep 2019 10:12:11 +1000
Received: from exch1-cdc.nexus.csiro.au (2405:b000:601:13::247:31) by
 exch4-cdc.nexus.csiro.au (2405:b000:601:13::247:34) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 6 Sep 2019 10:12:10 +1000
Received: from ExEdge1.csiro.au (150.229.7.34) by exch1-cdc.nexus.csiro.au
 (152.83.247.31) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Sep 2019 10:12:10 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.59)
 by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Sep 2019 10:12:06 +1000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPZ/R1xzLzmyK7VokR3ZyW/oVQbh5RZ7836g4OwAopw8DwryGnQaj4Wfy5hCQZpNr5nfDFT0QSYJV9rk5BbOsC1qXfhusUmGpo9VlJYfXCsxrn1p4XGJgvvZNCgRYV1hSImUbZcXHdx5g5hs/u+HdwGeUhcB3B9qSdM4/+NTy1a7C2x/gljIGlfdGAUYSAx4CD18i+7KbDEI3zV19+ol9F2a32w6L/rochPF1xvseGOk+1sD5pZMblNFKTvft3qL9x5SsplNCzfelqxHBAcEbHM0MG0NfRICMI/Ug7/4JZNwe40PZPTD76mA4vDDRCNz62JSdVp6qVAxvp9ZNG03TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwA7mrszt3DjYilVniiiYzmqPOFXGfqD2fCmTSTz4zc=;
 b=nfSWTUfhTNwmWvKqS56lJCDgE9tBs9/hrQS1NnkW6gO7HDZvBaWFdg0EZilkTOYmeVQwMDt09KZsvylViGFUy0Q5XEvNnTuZFG5PCDqn2xRJ8dOOWcpPRdYHj7wX8hxQUx9piKl8hVLkliO/bztSdjfHCqk2CPkL/IU0zMALHxyCu9NvnAjn+dZuKkcVvH4lJFb0N6qYpj1JHxgj1/v0uEaS5LrXVWsMt+CTIx2xQCjk1BChxkqiIpaDOPDgjdISUdUPPzz7tT1+N14Y/M9HnFfuhnBCppX1bl/gJ1PQS3ThBzbuwX8RJKi+wItWt/YZZDcvmRlxP9kPZsPEu71z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csiro.au; dmarc=pass action=none header.from=csiro.au;
 dkim=pass header.d=csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector2-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwA7mrszt3DjYilVniiiYzmqPOFXGfqD2fCmTSTz4zc=;
 b=YVmUwltJlNH/7XetXEJ0LOWpSoFhXpnylopkPU5gTzYJr57ha1RJWIjhaSz+FfDggyC1Id14kQbEDyPihAstIXMWUD/eOjprd4YtPxlaMBsGKEcAV+7NF8lmMdF551MhvhFi3smWddXYtYdltXd2C40GcvyoDYA/S8iOuvWAw3E=
Received: from SYAPR01MB2526.ausprd01.prod.outlook.com (52.134.181.11) by
 SYAPR01MB2623.ausprd01.prod.outlook.com (52.134.184.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 6 Sep 2019 00:12:06 +0000
Received: from SYAPR01MB2526.ausprd01.prod.outlook.com
 ([fe80::d91e:cd8:4238:15e9]) by SYAPR01MB2526.ausprd01.prod.outlook.com
 ([fe80::d91e:cd8:4238:15e9%5]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 00:12:06 +0000
From:   "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To:     Ian Kent <raven@themaw.net>
CC:     autofs mailing list <autofs@vger.kernel.org>
Subject: Re: [PATCH 04/32] autofs-5.1.5 - fix typing errors
Thread-Topic: [PATCH 04/32] autofs-5.1.5 - fix typing errors
Thread-Index: AQHVZES9R+QktF8tLkOlYiz5/zNOC6cdxuUA
Date:   Fri, 6 Sep 2019 00:12:06 +0000
Message-ID: <20190906001205.w3fagafcqddnfdrx@mayhem.atnf.CSIRO.AU>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
 <156772686966.5865.1649577308914702426.stgit@mickey.themaw.net>
In-Reply-To: <156772686966.5865.1649577308914702426.stgit@mickey.themaw.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20170113 (1.7.2)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vincent.Mcintyre@csiro.au; 
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8033a99-8c1f-44e6-fd55-08d7325eda59
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SYAPR01MB2623;
x-ms-traffictypediagnostic: SYAPR01MB2623:
x-microsoft-antispam-prvs: <SYAPR01MB2623B6D811552C0487FBADF3F4BA0@SYAPR01MB2623.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(199004)(189003)(54534003)(6506007)(316002)(58126008)(26005)(102836004)(76176011)(2906002)(3846002)(478600001)(186003)(6246003)(486006)(11346002)(446003)(6116002)(476003)(256004)(30864003)(66066001)(6512007)(53936002)(305945005)(8936002)(1076003)(86362001)(229853002)(6436002)(14454004)(66476007)(66556008)(64756008)(71190400001)(66446008)(66946007)(99286004)(76116006)(7736002)(25786009)(71200400001)(8676002)(5660300002)(14444005)(81156014)(6916009)(6486002)(81166006)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:SYAPR01MB2623;H:SYAPR01MB2526.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vVpwspopoyu/oTnFnNkPayRw2bS5yWSP+uBPK44NHMsgmCF8bsBv4/QsApUzRguZ4rb7WtadX5iDF4wgSOsHXp5LU4kb9v0YMf8v4b4M00+yDHl8ldd7Dj/fipTFPh0x6P/E17yUOsRhBLhDYYHtgNjVN1LZ+ba4sVZflUa+XrDJbTLQzGQwS86kqVfAHtX0gT+yM6XtJsDyf+LWADBWRji1gG8z7ctLMnUK7+kgtTwNO4UiKeJ7ZMQMrA6r/0OKEfm/6bFYS8yLB3C9xPBDM2Q6jAQG93fYHIWpUYNzj/78n9B3mQWEaIKcaixAg3BdksUFI4HM48jHkMXPpvS/ngE48lrVA6aJXXC2Qu85HMSZFeA+CTggXQ2QL/EMvfiYRFohC/60U2spxEX5NNaCQageqszmEGDUni9giVaorsI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA82E167E4ED414A871537D629ADB854@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8033a99-8c1f-44e6-fd55-08d7325eda59
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 00:12:06.7270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9w5/MDfXsPt3WKDGn7KTrkFwxdAQKG9JtlhBFNV+1qSYWnDGo5VyTycg7Yn6u6PA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYAPR01MB2623
X-OriginatorOrg: csiro.au
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

two tiny nitpicks

On Fri, Sep 06, 2019 at 07:41:10AM +0800, Ian Kent wrote:
> From: Andreas P <nurgrak@gmail.com>
>=20
> Fix typing errors of various files.
>=20
> Signed-off-by: Andreas P <nurgrak@gmail.com>
> Signed-off-by: Ian Kent <raven@themaw.net>
> ---
>  CHANGELOG                      |    1 +
>  Makefile.conf.in               |    2 +-
>  README.amd-maps                |    4 ++--
>  man/autofs.5                   |   12 ++++++-----
>  redhat/autofs.conf.default.in  |   42 ++++++++++++++++++++--------------=
------
>  samples/autofs.conf.default.in |   20 ++++++++++---------
>  samples/autofs.init.conf       |    2 +-
>  7 files changed, 42 insertions(+), 41 deletions(-)
>=20
> diff --git a/CHANGELOG b/CHANGELOG
> index 956a33b7..44ce6b69 100644
> --- a/CHANGELOG
> +++ b/CHANGELOG
> @@ -10,6 +10,7 @@ xx/xx/2019 autofs-5.1.6
>  - make expire remaining log level debug.
>  - allow period following macro in selector value.
>  - fix macro expansion in selector values.
> +- fix typing errors.
> =20
>  30/10/2018 autofs-5.1.5
>  - fix flag file permission.
> diff --git a/Makefile.conf.in b/Makefile.conf.in
> index ff9b18a1..a1e5eada 100644
> --- a/Makefile.conf.in
> +++ b/Makefile.conf.in
> @@ -72,7 +72,7 @@ RANLIB =3D @PATH_RANLIB@
>  TIRPCLIB =3D @TIRPC_LIBS@
>  TIRPCCFLAGS =3D @TIRPC_CFLAGS@
> =20
> -# Use dmalloc for memory debuging
> +# Use dmalloc for memory debugging
>  DMALLOCLIB =3D @DMALLOCLIB@
> =20
>  #
> diff --git a/README.amd-maps b/README.amd-maps
> index c7e22c8d..d933a678 100644
> --- a/README.amd-maps
> +++ b/README.amd-maps
> @@ -61,8 +61,8 @@ add it below the autofs configuration. Apart from chang=
ing the amd
>  changed. However, quite a few amd configuration options don't have
>  meaning within autofs. When these options are seen they are logged.
> =20
> -Be aware that, if the an old configuration exists and the configuration
> -hasn't been updated after the installation, changes to the the old
> +Be aware that, if an old configuration exists and the configuration
> +hasn't been updated after the installation, changes to the old
>  configuration will override changes to the new configuration because
>  backward compatibility takes priority over the new implementation.
> =20
> diff --git a/man/autofs.5 b/man/autofs.5
> index c2421272..2c224e18 100644
> --- a/man/autofs.5
> +++ b/man/autofs.5
> @@ -304,32 +304,32 @@ The \fBselectors\fP that take no arguments are:
>  .TP
>  .B arch
>  .br
> -The machine architecture which, if not set in the confugration, is
> +The machine architecture which, if not set in the configuration, is
>  obtained using uname(2).
>  .TP
>  .B karch
>  .br
> -The machine kernel architecture which, if not set in the confugration,
> +The machine kernel architecture which, if not set in the configuration,
>  is obtained using uname(2).
>  .TP
>  .B os
>  .br
> -The operating system name, if not set in the confugration, is obtained
> +The operating system name, if not set in the configuration, is obtained
>  using uname(2).
>  .TP
>  .B osver
>  .br
> -The operating system version, if not set in the confugration, is obtaine=
d
> +The operating system version, if not set in the configuration, is obtain=
ed
>  using uname(2).
>  .TP
>  .B full_os
>  .br
> -The full operating system name, if not set in the confugration this sele=
ctor
> +The full operating system name, if not set in the configuration this sel=
ector
>  has no value.
>  .TP
>  .B vendor
>  .br
> -The operating system vendor name, if not set in the confugration this se=
lector
> +The operating system vendor name, if not set in the configuration this s=
elector
>  has the value "unknown".
>  .TP
>  .B byte
> diff --git a/redhat/autofs.conf.default.in b/redhat/autofs.conf.default.i=
n
> index 4b89a5f7..59b9dfdd 100644
> --- a/redhat/autofs.conf.default.in
> +++ b/redhat/autofs.conf.default.in
> @@ -7,7 +7,7 @@
>  #
>  #master_map_name =3D auto.master
>  #
> -# timeout - set the default mount timeout in secons. The internal
> +# timeout - set the default mount timeout in seconds. The internal
>  #	    program default is 10 minutes, but the default installed
>  #	    configuration overrides this and sets the timeout to 5
>  #	    minutes to be consistent with earlier autofs releases.
> @@ -51,13 +51,13 @@ timeout =3D 300
>  browse_mode =3D no
>  #
>  # mount_nfs_default_protocol - set the default protocol that mount.nfs(8=
)
> -# 			       uses when performing a mount. Autofs needs
> -# 			       to know the default NFS protocol that
> -# 			       mount.nfs(8) uses so it can do special case
> -# 			       handling for its availability probe for
> -# 			       different NFS protocols. Since we can't
> -# 			       identify the default automatically we need
> -# 			       to set it in our configuration.
> +#			       uses when performing a mount. Autofs needs
> +#			       to know the default NFS protocol that
> +#			       mount.nfs(8) uses so it can do special case
> +#			       handling for its availability probe for
> +#			       different NFS protocols. Since we can't
> +#			       identify the default automatically we need
> +#			       to set it in our configuration.
>  #
>  #mount_nfs_default_protocol =3D 3
>  mount_nfs_default_protocol =3D 4
> @@ -71,9 +71,9 @@ mount_nfs_default_protocol =3D 4
>  #logging =3D none
>  #
>  # force_standard_program_map_env - disable the use of the "AUTOFS_"
> -#			prefix for standard environemt variables when
> +#			prefix for standard environment variables when
>  #			executing a program map. Since program maps
> -#			are run as the privileded user this opens
> +#			are run as the privileged user this opens
>  #			automount(8) to potential user privilege
>  #			escalation when the program map is written
>  #			in a language that  can load components from,
> @@ -92,7 +92,7 @@ mount_nfs_default_protocol =3D 4
>  #
>  # Define server URIs
>  #
> -# ldap_uri - space seperated list of server uris of the form
> +# ldap_uri - space separated list of server uris of the form
>  # 	     <proto>://<server>[/] where <proto> can be ldap
>  # 	     or ldaps. The option can be given multiple times.
>  # 	     Map entries that include a server name override
> @@ -111,7 +111,7 @@ mount_nfs_default_protocol =3D 4
>  #
>  #ldap_uri =3D ""
>  #
> -# ldap_timeout - timeout value for the synchronous API  calls
> +# ldap_timeout - timeout value for the synchronous API calls
>  #		  (default is LDAP library default).
>  #
>  #ldap_timeout =3D -1
> @@ -167,11 +167,11 @@ mount_nfs_default_protocol =3D 4
>  #map_hash_table_size =3D 1024
>  #
>  # use_hostname_for_mounts - nfs mounts where the host name resolves
> -# 			 to more than one IP address normally need
> -# 			 to use the IP address to esure a mount to
> -# 			 a host that isn't responding isn't done.
> -# 			 If that behaviour is not wanted then set
> -#			 ths to "yes", default is "no".
> +# 			to more than one IP address normally need
> +# 			to use the IP address to ensure a mount to
> +# 			a host that isn't responding isn't done.
> +# 			If that behaviour is not wanted then set
> +#			ths to "yes", default is "no".

s/ths/this/

>  #
>  #use_hostname_for_mounts =3D "no"
>  #
> @@ -184,7 +184,7 @@ mount_nfs_default_protocol =3D 4
>  #disable_not_found_message =3D "no"
>  #
>  # sss_master_map_wait - When sssd is starting up it can sometimes return
> -# 			"no such entry" for a short time until it has read
> +#			"no such entry" for a short time until it has read
>  # 			in the LDAP map information. Internal default is 0
>  # 			seconds, don't wait but if there is a problem with
>  # 			autofs not finding the master map at startup (when
> @@ -350,7 +350,7 @@ mount_nfs_default_protocol =3D 4
>  #	is translated in its official host name.
>  #
>  # domain_strip - if set to "yes" the domain name part of the host
> -# 	is strippped when normalizing hostnames. This can be useful
> +# 	is stripped when normalizing hostnames. This can be useful
>  #	when using of the same maps in a multiple domain environment.
>  #
>  # normalize_slashes - is set to "yes" by default and will collapse
> @@ -395,8 +395,8 @@ dismount_interval =3D 300
>  #
>  # Overriding this can cause autofs to use less resources because
>  # it will use symlinks instead of bind mounts in certain cases.
> -# You should ensure that the autofs kernel module your using
> -# supports expration of symlinks for best results (although this
> +# You should ensure that the autofs kernel module you are using
> +# supports expiration of symlinks for best results (although this
>  # appears to work reasonably well most of the time without the
>  # update).
>  #
> diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default=
.in
> index 2f155111..e0c5e320 100644
> --- a/samples/autofs.conf.default.in
> +++ b/samples/autofs.conf.default.in
> @@ -7,7 +7,7 @@
>  #
>  #master_map_name =3D auto.master
>  #
> -# timeout - set the default mount timeout in secons. The internal
> +# timeout - set the default mount timeout in seconds. The internal
>  #	    program default is 10 minutes, but the default installed
>  #	    configuration overrides this and sets the timeout to 5
>  #	    minutes to be consistent with earlier autofs releases.
> @@ -19,7 +19,7 @@ timeout =3D 300
>  # 		be read at program start (default 10, wait
>  # 		for 10 seconds then continue).
>  #
> -# master_wait =3D 10
> +#master_wait =3D 10
>  #
>  # negative_timeout - set the default negative timeout for
>  # 		     failed mount attempts (default 60).
> @@ -70,9 +70,9 @@ browse_mode =3D no
>  #logging =3D none
>  #
>  # force_standard_program_map_env - disable the use of the "AUTOFS_"
> -#			prefix for standard environemt variables when
> +#			prefix for standard environment variables when
>  #			executing a program map. Since program maps
> -#			are run as the privileded user this opens
> +#			are run as the privileged user this opens
>  #			automount(8) to potential user privilege
>  #			escalation when the program map is written
>  #			in a language that  can load components from,

s/that  can/that can/

Regards
Vince

> @@ -91,7 +91,7 @@ browse_mode =3D no
>  #
>  # Define server URIs
>  #
> -# ldap_uri - space seperated list of server uris of the form
> +# ldap_uri - space separated list of server uris of the form
>  # 	     <proto>://<server>[/] where <proto> can be ldap
>  # 	     or ldaps. The option can be given multiple times.
>  # 	     Map entries that include a server name override
> @@ -110,7 +110,7 @@ browse_mode =3D no
>  #
>  #ldap_uri =3D ""
>  #
> -# ldap_timeout - timeout value for the synchronous API  calls
> +# ldap_timeout - timeout value for the synchronous API calls
>  #		  (default is LDAP library default).
>  #
>  #ldap_timeout =3D -1
> @@ -167,7 +167,7 @@ browse_mode =3D no
>  #
>  # use_hostname_for_mounts - nfs mounts where the host name resolves
>  # 			to more than one IP address normally need
> -# 			to use the IP address to esure a mount to
> +# 			to use the IP address to ensure a mount to
>  # 			a host that isn't responding isn't done.
>  # 			If that behaviour is not wanted then set
>  #			ths to "yes", default is "no".
> @@ -349,7 +349,7 @@ browse_mode =3D no
>  #	is translated in its official host name.
>  #
>  # domain_strip - if set to "yes" the domain name part of the host
> -# 	is strippped when normalizing hostnames. This can be useful
> +# 	is stripped when normalizing hostnames. This can be useful
>  #	when using of the same maps in a multiple domain environment.
>  #
>  # normalize_slashes - is set to "yes" by default and will collapse
> @@ -394,8 +394,8 @@ dismount_interval =3D 300
>  #
>  # Overriding this can cause autofs to use less resources because
>  # it will use symlinks instead of bind mounts in certain cases.
> -# You should ensure that the autofs kernel module your using
> -# supports expration of symlinks for best results (although this
> +# You should ensure that the autofs kernel module you are using
> +# supports expiration of symlinks for best results (although this
>  # appears to work reasonably well most of the time without the
>  # update).
>  #
> diff --git a/samples/autofs.init.conf b/samples/autofs.init.conf
> index 2ca53ffb..01716964 100644
> --- a/samples/autofs.init.conf
> +++ b/samples/autofs.init.conf
> @@ -1,5 +1,5 @@
>  #
> -# Init syatem options
> +# Init system options
>  #
>  # If the kernel supports using the autofs miscellanous device
>  # and you wish to use it you must set this configuration option
> =
