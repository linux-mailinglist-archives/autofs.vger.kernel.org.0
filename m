Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2A12AB0D5
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 05:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388687AbfIFDH7 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 23:07:59 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56429 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388683AbfIFDH7 (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 23:07:59 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id DA46D21B2F;
        Thu,  5 Sep 2019 23:07:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 05 Sep 2019 23:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        KwT9shoGm4qyYHB2EkksOS3i0q49iismsvx94Nid/vs=; b=qGE1X0s02qttnnpy
        CMVwhusIGoov4dsovs9oF4Tp9zUmQU31QYQNAPgdM3ipUR7HOo9OLUbeHQbhKzOI
        fkcbbGojyamDZbS4AIo1mxo+rj4tMHRUyR0frNvVJ4FipHeMJqcvTs0epxtNNNTp
        DYpsCRPrRUy76AsK21G+MMRrWpUL7B5LefqcUTHeNYq6CLYgEgxeoVotIdLRm3ji
        Q8LiGoidT3Q3PlLwuu6YOXGnvzEeoS5RdhGiN6H3H9JipVH+Uru8JQQWdwXdBNnV
        uCVFAOdRJOV/gxcwaUS4Y0I4bwniTWK1l0X7zUB4Gno3JSTxtXyNBVaEJ6uu9U4h
        Im/w7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=KwT9shoGm4qyYHB2EkksOS3i0q49iismsvx94Nid/
        vs=; b=Q9rFVwURJKit7d3EbY/ErycSPsY4EkLCaw5Qh9aTAUGT0uJ2rMrwnNOIR
        euxk06br6a6Y+ZoRszx9jxa9BQ5Fs/Nqx0XBV/Nsd7wZ1Un24zqR2dVR7XUQJqhW
        0fon8AxDKVu9NR2oV3G7iyX79SwE/aKI+2eRuGZqsculGQP2cBgzJpkc9eTgPJ4V
        eQxCLyvVXsg5jbjcpMBqkIYHsTyVFSuX7FEquymkNQ/BmwpeR3WWbEicYZg9+dhU
        RGMAILZYKUANjItqSD4x9SLFyw+/tKY4qJ3o5x1s7Vmxu3bCDMzU380dVkLXFDFS
        duC9uddsP9ZQLv35TDnw7fl6TIyQg==
X-ME-Sender: <xms:jc1xXaC2_6vMC31-hBUc3zreFFALFGiJIxndpRKtq4AXS9nNrSh3_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejkedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
    mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucffohhmrghinheptghonh
    hfrdhinhdpuggvfhgruhhlthdrihhnnecukfhppeduudekrddvtdelrddukeefrdelfeen
    ucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvghtnecuve
    hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:jc1xXfGPXoOUJbsV9sZuAyx8JPT_FpiiICjjQaTWkrI66Vma_2KqBQ>
    <xmx:jc1xXaLd4W0XeB0-Dy_L84zL-h9W7hAgzuCnWqsRZsF04jJ_rLTVBg>
    <xmx:jc1xXbkf5DCJT3IeX0X9OoduNLkaVlcOOcPvcV6rJEKbkN07NAYmwA>
    <xmx:jc1xXWD8YrNYgdo4DRkk33pabPGlEIlebsY3avwuK3oWES0XJIq5bw>
Received: from mickey.themaw.net (unknown [118.209.183.93])
        by mail.messagingengine.com (Postfix) with ESMTPA id A503B80060;
        Thu,  5 Sep 2019 23:07:55 -0400 (EDT)
Message-ID: <17bbf1101ede96b404bb7cf6266c48ebf452e006.camel@themaw.net>
Subject: Re: [PATCH 04/32] autofs-5.1.5 - fix typing errors
From:   Ian Kent <raven@themaw.net>
To:     "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
Cc:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 11:07:51 +0800
In-Reply-To: <20190906001205.w3fagafcqddnfdrx@mayhem.atnf.CSIRO.AU>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
         <156772686966.5865.1649577308914702426.stgit@mickey.themaw.net>
         <20190906001205.w3fagafcqddnfdrx@mayhem.atnf.CSIRO.AU>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Fri, 2019-09-06 at 00:12 +0000, McIntyre, Vincent (CASS, Marsfield)
wrote:
> two tiny nitpicks

I'll fix those mistakes, thanks for looking at the patches.

Ian
> 
> On Fri, Sep 06, 2019 at 07:41:10AM +0800, Ian Kent wrote:
> > From: Andreas P <nurgrak@gmail.com>
> > 
> > Fix typing errors of various files.
> > 
> > Signed-off-by: Andreas P <nurgrak@gmail.com>
> > Signed-off-by: Ian Kent <raven@themaw.net>
> > ---
> >  CHANGELOG                      |    1 +
> >  Makefile.conf.in               |    2 +-
> >  README.amd-maps                |    4 ++--
> >  man/autofs.5                   |   12 ++++++-----
> >  redhat/autofs.conf.default.in  |   42 ++++++++++++++++++++------
> > --------------
> >  samples/autofs.conf.default.in |   20 ++++++++++---------
> >  samples/autofs.init.conf       |    2 +-
> >  7 files changed, 42 insertions(+), 41 deletions(-)
> > 
> > diff --git a/CHANGELOG b/CHANGELOG
> > index 956a33b7..44ce6b69 100644
> > --- a/CHANGELOG
> > +++ b/CHANGELOG
> > @@ -10,6 +10,7 @@ xx/xx/2019 autofs-5.1.6
> >  - make expire remaining log level debug.
> >  - allow period following macro in selector value.
> >  - fix macro expansion in selector values.
> > +- fix typing errors.
> >  
> >  30/10/2018 autofs-5.1.5
> >  - fix flag file permission.
> > diff --git a/Makefile.conf.in b/Makefile.conf.in
> > index ff9b18a1..a1e5eada 100644
> > --- a/Makefile.conf.in
> > +++ b/Makefile.conf.in
> > @@ -72,7 +72,7 @@ RANLIB = @PATH_RANLIB@
> >  TIRPCLIB = @TIRPC_LIBS@
> >  TIRPCCFLAGS = @TIRPC_CFLAGS@
> >  
> > -# Use dmalloc for memory debuging
> > +# Use dmalloc for memory debugging
> >  DMALLOCLIB = @DMALLOCLIB@
> >  
> >  #
> > diff --git a/README.amd-maps b/README.amd-maps
> > index c7e22c8d..d933a678 100644
> > --- a/README.amd-maps
> > +++ b/README.amd-maps
> > @@ -61,8 +61,8 @@ add it below the autofs configuration. Apart from
> > changing the amd
> >  changed. However, quite a few amd configuration options don't have
> >  meaning within autofs. When these options are seen they are
> > logged.
> >  
> > -Be aware that, if the an old configuration exists and the
> > configuration
> > -hasn't been updated after the installation, changes to the the old
> > +Be aware that, if an old configuration exists and the
> > configuration
> > +hasn't been updated after the installation, changes to the old
> >  configuration will override changes to the new configuration
> > because
> >  backward compatibility takes priority over the new implementation.
> >  
> > diff --git a/man/autofs.5 b/man/autofs.5
> > index c2421272..2c224e18 100644
> > --- a/man/autofs.5
> > +++ b/man/autofs.5
> > @@ -304,32 +304,32 @@ The \fBselectors\fP that take no arguments
> > are:
> >  .TP
> >  .B arch
> >  .br
> > -The machine architecture which, if not set in the confugration, is
> > +The machine architecture which, if not set in the configuration,
> > is
> >  obtained using uname(2).
> >  .TP
> >  .B karch
> >  .br
> > -The machine kernel architecture which, if not set in the
> > confugration,
> > +The machine kernel architecture which, if not set in the
> > configuration,
> >  is obtained using uname(2).
> >  .TP
> >  .B os
> >  .br
> > -The operating system name, if not set in the confugration, is
> > obtained
> > +The operating system name, if not set in the configuration, is
> > obtained
> >  using uname(2).
> >  .TP
> >  .B osver
> >  .br
> > -The operating system version, if not set in the confugration, is
> > obtained
> > +The operating system version, if not set in the configuration, is
> > obtained
> >  using uname(2).
> >  .TP
> >  .B full_os
> >  .br
> > -The full operating system name, if not set in the confugration
> > this selector
> > +The full operating system name, if not set in the configuration
> > this selector
> >  has no value.
> >  .TP
> >  .B vendor
> >  .br
> > -The operating system vendor name, if not set in the confugration
> > this selector
> > +The operating system vendor name, if not set in the configuration
> > this selector
> >  has the value "unknown".
> >  .TP
> >  .B byte
> > diff --git a/redhat/autofs.conf.default.in
> > b/redhat/autofs.conf.default.in
> > index 4b89a5f7..59b9dfdd 100644
> > --- a/redhat/autofs.conf.default.in
> > +++ b/redhat/autofs.conf.default.in
> > @@ -7,7 +7,7 @@
> >  #
> >  #master_map_name = auto.master
> >  #
> > -# timeout - set the default mount timeout in secons. The internal
> > +# timeout - set the default mount timeout in seconds. The internal
> >  #	    program default is 10 minutes, but the default installed
> >  #	    configuration overrides this and sets the timeout to 5
> >  #	    minutes to be consistent with earlier autofs releases.
> > @@ -51,13 +51,13 @@ timeout = 300
> >  browse_mode = no
> >  #
> >  # mount_nfs_default_protocol - set the default protocol that
> > mount.nfs(8)
> > -# 			       uses when performing a mount. Autofs
> > needs
> > -# 			       to know the default NFS protocol that
> > -# 			       mount.nfs(8) uses so it can do special
> > case
> > -# 			       handling for its availability probe for
> > -# 			       different NFS protocols. Since we can't
> > -# 			       identify the default automatically we
> > need
> > -# 			       to set it in our configuration.
> > +#			       uses when performing a mount. Autofs
> > needs
> > +#			       to know the default NFS protocol that
> > +#			       mount.nfs(8) uses so it can do special
> > case
> > +#			       handling for its availability probe for
> > +#			       different NFS protocols. Since we can't
> > +#			       identify the default automatically we
> > need
> > +#			       to set it in our configuration.
> >  #
> >  #mount_nfs_default_protocol = 3
> >  mount_nfs_default_protocol = 4
> > @@ -71,9 +71,9 @@ mount_nfs_default_protocol = 4
> >  #logging = none
> >  #
> >  # force_standard_program_map_env - disable the use of the
> > "AUTOFS_"
> > -#			prefix for standard environemt variables when
> > +#			prefix for standard environment variables when
> >  #			executing a program map. Since program maps
> > -#			are run as the privileded user this opens
> > +#			are run as the privileged user this opens
> >  #			automount(8) to potential user privilege
> >  #			escalation when the program map is written
> >  #			in a language that  can load components from,
> > @@ -92,7 +92,7 @@ mount_nfs_default_protocol = 4
> >  #
> >  # Define server URIs
> >  #
> > -# ldap_uri - space seperated list of server uris of the form
> > +# ldap_uri - space separated list of server uris of the form
> >  # 	     <proto>://<server>[/] where <proto> can be ldap
> >  # 	     or ldaps. The option can be given multiple times.
> >  # 	     Map entries that include a server name override
> > @@ -111,7 +111,7 @@ mount_nfs_default_protocol = 4
> >  #
> >  #ldap_uri = ""
> >  #
> > -# ldap_timeout - timeout value for the synchronous API  calls
> > +# ldap_timeout - timeout value for the synchronous API calls
> >  #		  (default is LDAP library default).
> >  #
> >  #ldap_timeout = -1
> > @@ -167,11 +167,11 @@ mount_nfs_default_protocol = 4
> >  #map_hash_table_size = 1024
> >  #
> >  # use_hostname_for_mounts - nfs mounts where the host name
> > resolves
> > -# 			 to more than one IP address normally need
> > -# 			 to use the IP address to esure a mount to
> > -# 			 a host that isn't responding isn't done.
> > -# 			 If that behaviour is not wanted then set
> > -#			 ths to "yes", default is "no".
> > +# 			to more than one IP address normally need
> > +# 			to use the IP address to ensure a mount to
> > +# 			a host that isn't responding isn't done.
> > +# 			If that behaviour is not wanted then set
> > +#			ths to "yes", default is "no".
> 
> s/ths/this/
> 
> >  #
> >  #use_hostname_for_mounts = "no"
> >  #
> > @@ -184,7 +184,7 @@ mount_nfs_default_protocol = 4
> >  #disable_not_found_message = "no"
> >  #
> >  # sss_master_map_wait - When sssd is starting up it can sometimes
> > return
> > -# 			"no such entry" for a short time until it has
> > read
> > +#			"no such entry" for a short time until it has
> > read
> >  # 			in the LDAP map information. Internal default
> > is 0
> >  # 			seconds, don't wait but if there is a problem
> > with
> >  # 			autofs not finding the master map at startup
> > (when
> > @@ -350,7 +350,7 @@ mount_nfs_default_protocol = 4
> >  #	is translated in its official host name.
> >  #
> >  # domain_strip - if set to "yes" the domain name part of the host
> > -# 	is strippped when normalizing hostnames. This can be useful
> > +# 	is stripped when normalizing hostnames. This can be useful
> >  #	when using of the same maps in a multiple domain environment.
> >  #
> >  # normalize_slashes - is set to "yes" by default and will collapse
> > @@ -395,8 +395,8 @@ dismount_interval = 300
> >  #
> >  # Overriding this can cause autofs to use less resources because
> >  # it will use symlinks instead of bind mounts in certain cases.
> > -# You should ensure that the autofs kernel module your using
> > -# supports expration of symlinks for best results (although this
> > +# You should ensure that the autofs kernel module you are using
> > +# supports expiration of symlinks for best results (although this
> >  # appears to work reasonably well most of the time without the
> >  # update).
> >  #
> > diff --git a/samples/autofs.conf.default.in
> > b/samples/autofs.conf.default.in
> > index 2f155111..e0c5e320 100644
> > --- a/samples/autofs.conf.default.in
> > +++ b/samples/autofs.conf.default.in
> > @@ -7,7 +7,7 @@
> >  #
> >  #master_map_name = auto.master
> >  #
> > -# timeout - set the default mount timeout in secons. The internal
> > +# timeout - set the default mount timeout in seconds. The internal
> >  #	    program default is 10 minutes, but the default installed
> >  #	    configuration overrides this and sets the timeout to 5
> >  #	    minutes to be consistent with earlier autofs releases.
> > @@ -19,7 +19,7 @@ timeout = 300
> >  # 		be read at program start (default 10, wait
> >  # 		for 10 seconds then continue).
> >  #
> > -# master_wait = 10
> > +#master_wait = 10
> >  #
> >  # negative_timeout - set the default negative timeout for
> >  # 		     failed mount attempts (default 60).
> > @@ -70,9 +70,9 @@ browse_mode = no
> >  #logging = none
> >  #
> >  # force_standard_program_map_env - disable the use of the
> > "AUTOFS_"
> > -#			prefix for standard environemt variables when
> > +#			prefix for standard environment variables when
> >  #			executing a program map. Since program maps
> > -#			are run as the privileded user this opens
> > +#			are run as the privileged user this opens
> >  #			automount(8) to potential user privilege
> >  #			escalation when the program map is written
> >  #			in a language that  can load components from,
> 
> s/that  can/that can/
> 
> Regards
> Vince
> 
> > @@ -91,7 +91,7 @@ browse_mode = no
> >  #
> >  # Define server URIs
> >  #
> > -# ldap_uri - space seperated list of server uris of the form
> > +# ldap_uri - space separated list of server uris of the form
> >  # 	     <proto>://<server>[/] where <proto> can be ldap
> >  # 	     or ldaps. The option can be given multiple times.
> >  # 	     Map entries that include a server name override
> > @@ -110,7 +110,7 @@ browse_mode = no
> >  #
> >  #ldap_uri = ""
> >  #
> > -# ldap_timeout - timeout value for the synchronous API  calls
> > +# ldap_timeout - timeout value for the synchronous API calls
> >  #		  (default is LDAP library default).
> >  #
> >  #ldap_timeout = -1
> > @@ -167,7 +167,7 @@ browse_mode = no
> >  #
> >  # use_hostname_for_mounts - nfs mounts where the host name
> > resolves
> >  # 			to more than one IP address normally need
> > -# 			to use the IP address to esure a mount to
> > +# 			to use the IP address to ensure a mount to
> >  # 			a host that isn't responding isn't done.
> >  # 			If that behaviour is not wanted then set
> >  #			ths to "yes", default is "no".
> > @@ -349,7 +349,7 @@ browse_mode = no
> >  #	is translated in its official host name.
> >  #
> >  # domain_strip - if set to "yes" the domain name part of the host
> > -# 	is strippped when normalizing hostnames. This can be useful
> > +# 	is stripped when normalizing hostnames. This can be useful
> >  #	when using of the same maps in a multiple domain environment.
> >  #
> >  # normalize_slashes - is set to "yes" by default and will collapse
> > @@ -394,8 +394,8 @@ dismount_interval = 300
> >  #
> >  # Overriding this can cause autofs to use less resources because
> >  # it will use symlinks instead of bind mounts in certain cases.
> > -# You should ensure that the autofs kernel module your using
> > -# supports expration of symlinks for best results (although this
> > +# You should ensure that the autofs kernel module you are using
> > +# supports expiration of symlinks for best results (although this
> >  # appears to work reasonably well most of the time without the
> >  # update).
> >  #
> > diff --git a/samples/autofs.init.conf b/samples/autofs.init.conf
> > index 2ca53ffb..01716964 100644
> > --- a/samples/autofs.init.conf
> > +++ b/samples/autofs.init.conf
> > @@ -1,5 +1,5 @@
> >  #
> > -# Init syatem options
> > +# Init system options
> >  #
> >  # If the kernel supports using the autofs miscellanous device
> >  # and you wish to use it you must set this configuration option

