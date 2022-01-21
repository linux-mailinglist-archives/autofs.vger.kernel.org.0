Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39135495A4A
	for <lists+autofs@lfdr.de>; Fri, 21 Jan 2022 08:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378771AbiAUHH3 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Fri, 21 Jan 2022 02:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbiAUHH3 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Fri, 21 Jan 2022 02:07:29 -0500
X-Greylist: delayed 170464 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Jan 2022 23:07:28 PST
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BF4C061574
        for <autofs@vger.kernel.org>; Thu, 20 Jan 2022 23:07:28 -0800 (PST)
Date:   Fri, 21 Jan 2022 08:07:20 +0100
From:   Fabian Groffen <grobian@gentoo.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Yixun Lan <dlan@gentoo.org>, autofs@vger.kernel.org
Subject: Re: autofs-5.1.8: fail to mount certain /net shares
Message-ID: <YepbqFeUBns+KRbj@gentoo.org>
References: <13e80402c9602053148da44664204b22dcd70645.camel@themaw.net>
 <YeaBtjNlovM5gez4@ofant>
 <7ace29a11ae22c5704dc59b42ed83ec71b7643be.camel@themaw.net>
 <YeaWIKm/9szaWHIA@gentoo.org>
 <78fdc849f556c5c0a56560a2d54f3cd7c086d561.camel@themaw.net>
 <YehQdqiLSz6LMPVi@gentoo.org>
 <ea50cca1178e47671c6e84204a1ca0d2ada647e8.camel@themaw.net>
 <YekOscjFLNMjggd7@gentoo.org>
 <c445c06805b04cd5df591ec2d35cc2bda50cc781.camel@themaw.net>
 <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+M+N/p30iiBzRTqq"
Content-Disposition: inline
In-Reply-To: <846b94880cd4f3b9521b4cabdc8638d2cc785986.camel@themaw.net>
User-Agent: Mutt/2.1.5 (Darwin 17.7.0, VIM - Vi IMproved 8.2)
Organization: Gentoo Foundation, Inc.
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org


--+M+N/p30iiBzRTqq
Content-Type: multipart/mixed; boundary="aNqDN8bI+1AaZn/O"
Content-Disposition: inline


--aNqDN8bI+1AaZn/O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20-01-2022 19:41:11 +0800, Ian Kent wrote:
> > If it's not using the expected location for autofs.conf that's a
> > build
> > problem.
> >=20
> > Can you get me a build log.
>=20
> And what does "automount -V" say?

Linux automount version 5.1.8

Directories:
        config dir:     /etc/conf.d
        maps dir:       /etc/autofs
        modules dir:    /usr/lib64/autofs

Compile options:
  DISABLE_MOUNT_LOCKING ENABLE_FORCED_SHUTDOWN ENABLE_IGNORE_BUSY_MOUNTS=20
  LIBXML2_WORKAROUND WITH_LIBTIRPC=20

(this is identical to the 5.1.6 output)

build-log attached

Thanks,
Fabian

--=20
Fabian Groffen
Gentoo on a different level

--aNqDN8bI+1AaZn/O
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="autofs-5.1.8-r1-build.log"
Content-Transfer-Encoding: quoted-printable

=1B[32m * =1B[39;49;00mPackage:    net-fs/autofs-5.1.8-r1
=1B[32m * =1B[39;49;00mRepository: gentoo
=1B[32m * =1B[39;49;00mMaintainer: dlan@gentoo.org
=1B[32m * =1B[39;49;00mUSE:        abi_x86_64 amd64 elibc_glibc kernel_linu=
x libtirpc userland_GNU
=1B[32m * =1B[39;49;00mFEATURES:   network-sandbox preserve-libs sandbox us=
erpriv usersandbox
=1B[32m * =1B[39;49;00mPackage:    net-fs/autofs-5.1.8-r1
=1B[32m * =1B[39;49;00mRepository: gentoo
=1B[32m * =1B[39;49;00mMaintainer: dlan@gentoo.org
=1B[32m * =1B[39;49;00mUSE:        abi_x86_64 amd64 elibc_glibc kernel_linu=
x libtirpc userland_GNU
=1B[32m * =1B[39;49;00mFEATURES:   network-sandbox preserve-libs sandbox us=
erpriv usersandbox
 =1B[32m*=1B[0m Determining the location of the kernel source code
 =1B[32m*=1B[0m Found kernel source directory:
 =1B[32m*=1B[0m     /usr/src/linux
 =1B[32m*=1B[0m Found sources for kernel version:
 =1B[32m*=1B[0m     5.10.76-gentoo-r1
 =1B[32m*=1B[0m Checking for suitable kernel configuration options...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
>>> Unpacking source...
>>> Unpacking autofs-5.1.8.tar.xz to /var/tmp/portage/net-fs/autofs-5.1.8-r=
1/work
>>> Unpacking autofs-5.1.8-patches-0.tar.xz to /var/tmp/portage/net-fs/auto=
fs-5.1.8-r1/work
>>> Source unpacked in /var/tmp/portage/net-fs/autofs-5.1.8-r1/work
>>> Preparing source in /var/tmp/portage/net-fs/autofs-5.1.8-r1/work/autofs=
-5.1.8 ...
 =1B[32m*=1B[0m Applying patches from /var/tmp/portage/net-fs/autofs-5.1.8-=
r1/work/autofs-5.1.8-patches/ ...
 =1B[32m*=1B[0m   0001-autofs-5.1.8-fix-missing-include-in-hash.h.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m   0002-autofs-5.1.8-fix-bashism-in-configure.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m   0003-autofs-5.1.8-define-fallback-dummy-NSS-config-path.p=
atch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m   0004-autofs-5.1.8-avoid-internal-stat.h-definitions.patch=
 ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m   0005-autofs-5.1.8-add-missing-include-to-hash.h-for-_WORD=
=2Epatch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m   0006-autofs-5.1.8-add-missing-include-to-log.h-for-pid_t.=
patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m   0007-autofs-5.1.8-define-_SWORD_TYPE-for-musl.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying autofs-5.1.8-dmalloc.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying autofs-5.1.8-nfsv4-mount.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614034.34140_1.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614054.34140_3.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614062.34140_5.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614073.34140_7.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614133.34140_9.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614138.34140_11.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614142.34140_13.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614153.34140_15.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614157.34140_17.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614186.34140_19.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[32m*=1B[0m Applying 1642614191.34140_21.isis:2,S.patch ...
=1B[A=1B[72C =1B[34;01m[ =1B[32;01mok=1B[34;01m ]=1B[0m
 =1B[33;01m*=1B[0m User patches applied.
>>> Source prepared.
>>> Configuring source in /var/tmp/portage/net-fs/autofs-5.1.8-r1/work/auto=
fs-5.1.8 ...
=2E/configure --prefix=3D/usr --build=3Dx86_64-pc-linux-gnu --host=3Dx86_64=
-pc-linux-gnu --mandir=3D/usr/share/man --infodir=3D/usr/share/info --datad=
ir=3D/usr/share --sysconfdir=3D/etc --localstatedir=3D/var/lib --docdir=3D/=
usr/share/doc/autofs-5.1.8-r1 --htmldir=3D/usr/share/doc/autofs-5.1.8-r1/ht=
ml --libdir=3D/usr/lib64 --with-confdir=3D/etc/conf.d --with-mapdir=3D/etc/=
autofs --without-dmalloc --without-openldap --with-libtirpc --without-sasl =
--disable-mount-locking --without-systemd --without-hesiod --disable-ext-en=
v --enable-sloppy-mount --enable-force-shutdown --enable-ignore-busy RANLIB=
=3D/usr/bin/x86_64-pc-linux-gnu-ranlib
checking for binaries in... /usr/bin:/bin:/usr/sbin:/sbin
checking for Linux proc filesystem... yes
checking location of the init.d directory... /etc/init.d
checking for x86_64-pc-linux-gnu-pkg-config... /usr/bin/x86_64-pc-linux-gnu=
-pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for x86_64-pc-linux-gnu-gcc... x86_64-pc-linux-gnu-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...=20
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether x86_64-pc-linux-gnu-gcc accepts -g... yes
checking for x86_64-pc-linux-gnu-gcc option to accept ISO C89... none needed
checking for systemd... no
checking for sm_notify in -lsystemd... no
checking for autofs configuration file directory... /etc/conf.d
checking for autofs maps directory... /etc/autofs
checking for autofs fifos directory... /run
checking for autofs flag file directory... /run
checking for TIRPC... yes
checking for getrpcbyname... yes
checking for getservbyname... yes
checking if malloc debugging is wanted... no
checking for mount... /bin/mount
checking for mount.nfs... /sbin/mount.nfs
checking for umount... /bin/umount
checking for fsck.ext2... /sbin/fsck.ext2
checking for fsck.ext3... /sbin/fsck.ext3
checking for fsck.ext4... /sbin/fsck.ext4
checking for flex... /usr/bin/flex
checking for bison... /usr/bin/bison
checking for ranlib... /usr/bin/x86_64-pc-linux-gnu-ranlib
checking for sssd autofs library... no
checking for pipe2... yes
checking if umount accepts the -c option... yes
checking for XML... yes
checking for krb5-config... /usr/bin/krb5-config
checking for Kerberos library... yes
checking for krb5_principal_get_realm... no
checking for library containing versionsort... none required
checking for clock_gettime in -lrt... yes
checking for NSL... yes
checking for res_query in -lresolv... no
checking for __res_query in -lresolv... yes
checking how to run the C preprocessor... x86_64-pc-linux-gnu-gcc -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking rpcsvc/ypclnt.h usability... yes
checking rpcsvc/ypclnt.h presence... yes
checking for rpcsvc/ypclnt.h... yes
checking rpcsvc/nis.h usability... yes
checking rpcsvc/nis.h presence... no
configure: WARNING: rpcsvc/nis.h: accepted by the compiler, rejected by the=
 preprocessor!
configure: WARNING: rpcsvc/nis.h: proceeding with the compiler's result
checking for rpcsvc/nis.h... yes
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu-gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether x86_64-pc-linux-gnu-gcc accepts -g... (cached) yes
checking for x86_64-pc-linux-gnu-gcc option to accept ISO C89... (cached) n=
one needed
checking whether gcc -fPIE works... yes
configure: creating ./config.status
config.status: creating Makefile.conf
config.status: creating include/config.h
>>> Source configured.
>>> Compiling source in /var/tmp/portage/net-fs/autofs-5.1.8-r1/work/autofs=
-5.1.8 ...
make -j5 STRIP=3D: DONTSTRIP=3D1=20
set -e; for i in lib daemon modules man samples; do make -C $i all; done=20
set -e; if [ -d samples ]; then make -C samples all; fi
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/lib'
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c cache.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c cat_path.c
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/samples'
sed -e "s|@@sbindir@@|/usr/sbin|g" \
    -e "s|@@autofslibdir@@|/usr/lib64/autofs|g" \
    -e "s|@@autofsconfdir@@|/etc/conf.d|g" \
    -e "s|@@initdir@@|/etc/init.d|g" < rc.autofs.in > rc.autofs
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c rpc_subs.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c mounts.c
sed -e "s|@@autofsmapdir@@|/etc/autofs|g" \
	< autofs.conf.default.in > autofs.conf.default
sed -e "s|@@sbindir@@|/usr/sbin|g" \
    -e "s|@@autofsconfdir@@|/etc/conf.d|g" \
    -e "s|@@autofspiddir@@|/run|g" \
	< autofs.service.in > autofs.service
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/samples'
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c log.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c nsswitch.c
/usr/bin/flex -onss_tok.c -Pnss_ nss_tok.l
/usr/bin/bison -v -d -p nss_ -b nss_parse nss_parse.y
/usr/bin/bison -v -d -p nss_ -b nss_parse nss_parse.y
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c args.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c alarm.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c macros.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c defaults.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c parse_subs.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c dev-ioctl-lib.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c nss_tok.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DA=
UTOFS_CONF_DIR=3D\"/etc/conf.d\" -c nss_parse.tab.c
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -fPIC -D_GNU_SOURCE -DAUTOFS_MAP_DIR=3D\"/etc/aut=
ofs\" -DAUTOFS_CONF_DIR=3D\"/etc/conf.d\" -o libautofs.so cache.o cat_path.=
o rpc_subs.o mounts.o log.o nsswitch.o nss_tok.o nss_parse.tab.o args.o ala=
rm.o macros.o defaults.o parse_subs.o dev-ioctl-lib.o -Wl,-O1 -Wl,--as-need=
ed -lpthread -ltirpc  -lrt
: libautofs.so
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/lib'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/daemon'
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c automount.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c indirect.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c direct.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c spawn.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c module.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c mount.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c master.c
/usr/bin/flex -omaster_tok.c -Pmaster_ master_tok.l
/usr/bin/bison -v -d -p master_ -b master_parse master_parse.y
/usr/bin/bison -v -d -p master_ -b master_parse master_parse.y
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c lookup.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c state.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c flag.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c master_tok.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -rdynamic -fPIE -D_GNU_SOURCE -I../include -DAUTOFS_LIB_DIR=3D\"/usr/li=
b64/autofs\"  -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -DAUTOFS_CONF_DIR=3D\"/etc=
/conf.d\" -DAUTOFS_FIFO_DIR=3D\"/run\" -DAUTOFS_FLAG_DIR=3D\"/run\" -DVERSI=
ON_STRING=3D\"5.1.8\" -c master_parse.tab.c
x86_64-pc-linux-gnu-gcc -pie -o automount automount.o indirect.o direct.o s=
pawn.o module.o mount.o master.o master_tok.o master_parse.tab.o lookup.o s=
tate.o flag.o -Wl,-O1 -Wl,--as-needed -rdynamic -lpthread -ltirpc  -lrt -ld=
l -lpthread -L../lib -lautofs
: automount
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/daemon'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/modules'
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o lookup_file.so l=
ookup_file.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -laut=
ofs
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o lookup_program.s=
o lookup_program.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib=
 -lautofs
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o lookup_userhome.=
so lookup_userhome.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../l=
ib -lautofs
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o lookup_multi.so =
lookup_multi.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -la=
utofs
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o lookup_hosts.so =
lookup_hosts.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -la=
utofs
: lookup_userhome.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o lookup_dir.so lo=
okup_dir.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -lautofs
: lookup_hosts.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o parse_sun.so par=
se_sun.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -lautofs
: lookup_multi.so
/usr/bin/bison -v -d -p amd_ -b amd_parse amd_parse.y
: lookup_dir.so
/usr/bin/bison -v -d -p amd_ -b amd_parse amd_parse.y
: lookup_program.so
/usr/bin/flex -oamd_tok.c -Pamd_ amd_tok.l
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_generic.so=
 mount_generic.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -=
lautofs
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\"/usr/lib=
64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -c replicated.c
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_afs.so mou=
nt_afs.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -lautofs
: lookup_file.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_autofs.so =
mount_autofs.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -la=
utofs
: mount_generic.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_changer.so=
 mount_changer.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -=
lautofs
: mount_afs.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_bind.so mo=
unt_bind.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -lautofs
: mount_changer.so
: mount_autofs.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_ext2.so mo=
unt_ext2.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -L../lib -lautofs
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -I/usr/include/tirp=
c  -o lookup_nisplus.so \
	lookup_nisplus.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -lnsl -lt=
irpc  -L../lib -lautofs
: mount_bind.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -I/usr/include/tirp=
c  -o lookup_yp.so \
	lookup_yp.c -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -lnsl -ltirpc =
 -L../lib -lautofs
: mount_ext2.so
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\"/usr/lib=
64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -c amd_parse.tab.c
x86_64-pc-linux-gnu-gcc -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/=
usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/include/tir=
pc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\"/usr/lib=
64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -c amd_tok.c
: parse_sun.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o mount_nfs.so \
	mount_nfs.c replicated.o -Wl,-O1 -Wl,--as-needed -lpthread -ltirpc  -lrt -=
L../lib -lautofs
: lookup_nisplus.so
: mount_nfs.so
: lookup_yp.so
x86_64-pc-linux-gnu-gcc -shared -O3 -pipe -D_REENTRANT -D_FILE_OFFSET_BITS=
=3D64 -I/usr/include/tirpc  -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -I/usr/in=
clude/tirpc  -I../include -I../lib -fPIC -D_GNU_SOURCE -DAUTOFS_LIB_DIR=3D\=
"/usr/lib64/autofs\" -DAUTOFS_MAP_DIR=3D\"/etc/autofs\" -o parse_amd.so \
	parse_amd.c amd_parse.tab.o amd_tok.o -Wl,-O1 -Wl,--as-needed -lpthread -l=
tirpc  -lrt -L../lib -lautofs
: parse_amd.so
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/modules'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/man'
sed -e 's|@@initdir@@|/etc/init.d|g' \
    -e 's|@@autofsmapdir@@|/etc/autofs|g' \
    -e "s|@@autofsconfdir@@|/etc/conf.d|g" \
< auto.master.5.in > auto.master.5
sed -e 's|@@initdir@@|/etc/init.d|g' \
    -e 's|@@autofsmapdir@@|/etc/autofs|g' \
    -e "s|@@autofsconfdir@@|/etc/conf.d|g" \
< autofs.8.in > autofs.8
sed -e 's|@@initdir@@|/etc/init.d|g' \
    -e 's|@@autofsmapdir@@|/etc/autofs|g' \
    -e "s|@@autofsconfdir@@|/etc/conf.d|g" \
< autofs.conf.5.in > autofs.conf.5
sed -e 's|@@initdir@@|/etc/init.d|g' \
    -e 's|@@autofsmapdir@@|/etc/autofs|g' \
    -e "s|@@autofsconfdir@@|/etc/conf.d|g" \
< autofs_ldap_auth.conf.5.in > autofs_ldap_auth.conf.5
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/man'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/samples'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/samples'
>>> Source compiled.
>>> Test phase [not enabled]: net-fs/autofs-5.1.8-r1

>>> Install net-fs/autofs-5.1.8-r1 into /var/tmp/portage/net-fs/autofs-5.1.=
8-r1/image
make -j5 DESTDIR=3D/var/tmp/portage/net-fs/autofs-5.1.8-r1/image install=20
set -e; for i in lib daemon modules man samples; do make -C $i install; don=
e =09
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/lib'
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib64/a=
utofs
install -c libautofs.so -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/imag=
e/usr/lib64
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/lib'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/daemon'
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/sbin
install -c automount -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/u=
sr/sbin
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/daemon'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/modules'
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib64/a=
utofs
install -c lookup_file.so lookup_program.so lookup_userhome.so lookup_multi=
=2Eso lookup_hosts.so lookup_dir.so parse_sun.so parse_amd.so mount_generic=
=2Eso mount_nfs.so mount_afs.so mount_autofs.so mount_changer.so mount_bind=
=2Eso mount_ext2.so lookup_nisplus.so lookup_yp.so -m 755 /var/tmp/portage/=
net-fs/autofs-5.1.8-r1/image/usr/lib64/autofs
rm -f /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib64/autofs/mount_=
smbfs.so
ln -fs lookup_file.so /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib=
64/autofs/lookup_files.so
ln -fs lookup_yp.so /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib64=
/autofs/lookup_nis.so
ln -fs mount_nfs.so /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib64=
/autofs/mount_nfs4.so
ln -fs mount_ext2.so /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib6=
4/autofs/mount_ext3.so
ln -fs mount_ext2.so /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib6=
4/autofs/mount_ext4.so
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/modules'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/man'
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/share/m=
an/man5
install -c *.5 -m 644 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/sha=
re/man/man5
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/share/m=
an/man8
install -c *.8 -m 644 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/sha=
re/man/man8
make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/man'
make[1]: Entering directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/a=
utofs-5.1.8/samples'
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/autofs

install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/init.d
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/conf.d
install rc.autofs -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/=
init.d/autofs
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/usr/lib64/a=
utofs
install -d -m 755 /var/tmp/portage/net-fs/autofs-5.1.8-r1/image/run

Installing autofs default configuation in /etc/autofs

Installing autofs init configuation in /etc/conf.d
'autofs.conf.default' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc=
/autofs/autofs.conf'
Installed package default configuration as "autofs.conf".

'autofs.init.conf' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/co=
nf.d/autofs'
Installed package init configuration as "autofs".
Installing autofs ldap auth config "autofs_ldap_auth.conf" in /etc/autofs

Installing autofs default master map in /etc/autofs
'autofs_ldap_auth.conf' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/e=
tc/autofs/autofs_ldap_auth.conf'
Installed package auth config as "autofs_ldap_auth.conf".

Installing autofs sample map "auto.misc" in /etc/autofs
'auto.master' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/autofs/=
auto.master'
Installed package master map as "auto.master".

'auto.misc' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/autofs/au=
to.misc'
Installing autofs sample map "auto.net" in /etc/autofs
Installed package sample map as "auto.misc".

Installing autofs sample map "auto.smb" in /etc/autofs
'auto.net' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/autofs/aut=
o.net'
Installed package sample map as "auto.net".
'auto.smb' -> '/var/tmp/portage/net-fs/autofs-5.1.8-r1/image/etc/autofs/aut=
o.smb'
Installed package sample map as "auto.smb".

make[1]: Leaving directory '/var/tmp/portage/net-fs/autofs-5.1.8-r1/work/au=
tofs-5.1.8/samples'
>>> Completed installing net-fs/autofs-5.1.8-r1 into /var/tmp/portage/net-f=
s/autofs-5.1.8-r1/image

 =1B[32m*=1B[0m Final size of build directory: 6200 KiB (6.0 MiB)
 =1B[32m*=1B[0m Final size of installed tree:  1268 KiB (1.2 MiB)


 =1B[33m*=1B[0m QA Notice: The following shared libraries lack a SONAME
 =1B[33m*=1B[0m /usr/lib64/libautofs.so

strip: x86_64-pc-linux-gnu-strip --strip-unneeded -N __gentoo_check_ldflags=
__ -R .comment -R .GCC.command.line -R .note.gnu.gold-version
   /usr/lib64/autofs/lookup_program.so
   /usr/lib64/libautofs.so
   /usr/sbin/automount
   /usr/lib64/autofs/lookup_userhome.so
   /usr/lib64/autofs/lookup_file.so
   /usr/lib64/autofs/lookup_multi.so
   /usr/lib64/autofs/lookup_dir.so
   /usr/lib64/autofs/lookup_hosts.so
   /usr/lib64/autofs/parse_amd.so
   /usr/lib64/autofs/parse_sun.so
   /usr/lib64/autofs/mount_generic.so
   /usr/lib64/autofs/mount_nfs.so
   /usr/lib64/autofs/mount_afs.so
   /usr/lib64/autofs/mount_autofs.so
   /usr/lib64/autofs/mount_changer.so
   /usr/lib64/autofs/mount_ext2.so
   /usr/lib64/autofs/lookup_nisplus.so
   /usr/lib64/autofs/lookup_yp.so
   /usr/lib64/autofs/mount_bind.so

--aNqDN8bI+1AaZn/O--

--+M+N/p30iiBzRTqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELUvHd/Gtp7LaU1vuzpXahU5EQpMFAmHqW6AACgkQzpXahU5E
QpMKrwf/XMkEJ3P1rBgftZylEFY1ClcA/AyB52qfhcoq2/Gl8QAVcd8LAtMkhIQn
lf+grwW3oLBj0jt2w6R5OIqTOrBwt+rpM0SEJAqMSN0ig6v0hfusKx/vhOhkNc6l
RiumCNGGYwMZYaJmBfZqNa1866zgO6d1DAqeRCQtfYHcnsLGSjznAo3IY33jyo8V
9FumjyuOBkHcA/7cf5ay34gbxFISOzMo+HFS8Ex2phwquz84cCdFya6DZ7fgryev
tXMgdQOZfOxf/AqO6n8DWX3FoezrnjiibVtHNHCWYjOAYJK2tMtcQpdhKHa5yfwN
xic2vzETfbusMgntI5JvK/UpbulX7A==
=TBGP
-----END PGP SIGNATURE-----

--+M+N/p30iiBzRTqq--
