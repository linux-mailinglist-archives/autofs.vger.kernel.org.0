Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B23E751679
	for <lists+autofs@lfdr.de>; Thu, 13 Jul 2023 04:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjGMCuF (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Wed, 12 Jul 2023 22:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjGMCuE (ORCPT
        <rfc822;autofs@vger.kernel.org>); Wed, 12 Jul 2023 22:50:04 -0400
X-Greylist: delayed 315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Jul 2023 19:50:02 PDT
Received: from smtp01.aussiebb.com.au (smtp01.aussiebb.com.au [IPv6:2403:5800:3:25::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11EF10EC
        for <autofs@vger.kernel.org>; Wed, 12 Jul 2023 19:50:02 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id 6B985100324
        for <autofs@vger.kernel.org>; Thu, 13 Jul 2023 12:44:50 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
        by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id clymIi-xFa1K for <autofs@vger.kernel.org>;
        Thu, 13 Jul 2023 12:44:50 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
        id 5D5FE1002F5; Thu, 13 Jul 2023 12:44:50 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from donald.themaw.net (2403-580e-4b40-0-7968-2232-4db8-a45e.ip6.aussiebb.net [IPv6:2403:580e:4b40:0:7968:2232:4db8:a45e])
        by smtp01.aussiebb.com.au (Postfix) with ESMTP id A87C5100286;
        Thu, 13 Jul 2023 12:44:49 +1000 (AEST)
Subject: [PATCH 2/2] autofs-5.1.8 - dont probe interface that cant send packet
From:   Ian Kent <raven@themaw.net>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>,
        Mike Gabriel <sunweaver@debian.org>,
        autofs mailing list <autofs@vger.kernel.org>
Date:   Thu, 13 Jul 2023 10:44:49 +0800
Message-ID: <168921628931.13982.6488125346971046236.stgit@donald.themaw.net>
In-Reply-To: <168921521309.13982.11820120661485368005.stgit@donald.themaw.net>
References: <168921521309.13982.11820120661485368005.stgit@donald.themaw.net>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

When calculating the proximity add checks for basic reachability.

If an interface doesn't have an address of the family of the target
host, or the interface address is the IPv6 link local address, or
the target host address is the IPv6 link local address then don't
add it to the list of hosts to probe.

Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Tested-by: Salvatore Bonaccorso <carnil@debian.org>
Cc: Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc: Mike Gabriel <sunweaver@debian.org>
Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG            |    1 +
 lib/parse_subs.c     |   36 +++++++++++++++++++++++++++++++++++-
 modules/replicated.c |   19 +++++++++++--------
 3 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 2f0b9dee..3885474c 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -91,6 +91,7 @@
 - add ioctlfd open helper.
 - make open files limit configurable.
 - use correct reference for IN6 macro call.
+- dont probe interface that cant send packet.
 
 19/10/2021 autofs-5.1.8
 - add xdr_exports().
diff --git a/lib/parse_subs.c b/lib/parse_subs.c
index 0ee00d51..3c95996e 100644
--- a/lib/parse_subs.c
+++ b/lib/parse_subs.c
@@ -218,7 +218,7 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 	int addr_len;
 	char buf[MAX_ERR_BUF];
 	uint32_t mask, ha, ia, *mask6, *ha6, *ia6;
-	int ret;
+	int ret, at_least_one;
 
 	addr = NULL;
 	addr6 = NULL;
@@ -228,6 +228,7 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 	ha6 = NULL;
 	ia6 = NULL;
 	ha = 0;
+	at_least_one = 0;
 
 	switch (host_addr->sa_family) {
 	case AF_INET:
@@ -245,6 +246,14 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 		hst6_addr = (struct in6_addr *) &addr6->sin6_addr;
 		ha6 = &hst6_addr->s6_addr32[0];
 		addr_len = sizeof(*hst6_addr);
+
+		/* The link-local address always seems to be a problem so
+		 * ignore it when trying to work out if the address we have
+		 * is reachable.
+		 */
+		if (IN6_IS_ADDR_LINKLOCAL(hst6_addr))
+			return PROXIMITY_UNSUPPORTED;
+
 		break;
 #endif
 
@@ -278,6 +287,14 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 				freeifaddrs(ifa);
 				return PROXIMITY_LOCAL;
 			}
+
+			/* If the target address is the loopback address it will
+			 * have matched above so we can ignore it when trying to
+			 * work out if the address we have is reachable.
+			 */
+			if (addr->sin_addr.s_addr != INADDR_LOOPBACK)
+				at_least_one = 1;
+
 			break;
 
 		case AF_INET6:
@@ -290,6 +307,15 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 				freeifaddrs(ifa);
 				return PROXIMITY_LOCAL;
 			}
+
+			/* If the interface address is the loopback address it will
+			 * have matched above so we can ignore it and the link-local
+			 * address always seems to be a problem so ignore it too when
+			 * trying to work out if the address we have is reachable.
+			 */
+			if (!IN6_IS_ADDR_LINKLOCAL(&if6_addr->sin6_addr) &&
+			    !IN6_IS_ADDR_LOOPBACK(&if6_addr->sin6_addr))
+				at_least_one = 1;
 #endif
 		default:
 			break;
@@ -297,6 +323,11 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 		this = this->ifa_next;
 	}
 
+	if (!at_least_one) {
+		freeifaddrs(ifa);
+		return PROXIMITY_UNSUPPORTED;
+	}
+
 	this = ifa;
 	while (this) {
 		if (!(this->ifa_flags & IFF_UP) ||
@@ -353,6 +384,9 @@ unsigned int get_proximity(struct sockaddr *host_addr)
 			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
 			ia6 = &if6_addr->sin6_addr.s6_addr32[0];
 
+			if (IN6_IS_ADDR_LINKLOCAL(&if6_addr->sin6_addr))
+				break;
+
 			/* Is the address within the network of the interface */
 
 			msk6_addr = (struct sockaddr_in6 *) this->ifa_netmask;
diff --git a/modules/replicated.c b/modules/replicated.c
index 2e628123..5e2f8b17 100644
--- a/modules/replicated.c
+++ b/modules/replicated.c
@@ -926,6 +926,15 @@ static int add_new_host(struct host **list,
 
 	prx = get_proximity(host_addr->ai_addr);
 
+	/*
+	 * If we tried to add an IPv6 address and we don't have IPv6
+	 * support (or the host_addr type doesn't match that of any
+	 * of the interface addresses or looks unreachable) return
+	 * success in the hope of getting a valid address later.
+	 */
+	if (prx == PROXIMITY_UNSUPPORTED)
+		return 1;
+
 	/*
 	 * If we want the weight to be the determining factor
 	 * when selecting a host, or we are using random selection,
@@ -938,13 +947,6 @@ static int add_new_host(struct host **list,
 		       MOUNT_FLAG_RANDOM_SELECT)))
 		prx = PROXIMITY_SUBNET;
 
-	/*
-	 * If we tried to add an IPv6 address and we don't have IPv6
-	 * support return success in the hope of getting an IPv4
-	 * address later.
-	 */
-	if (prx == PROXIMITY_UNSUPPORTED)
-		return 1;
 	if (prx == PROXIMITY_ERROR)
 		return 0;
 
@@ -1038,7 +1040,8 @@ try_name:
 		} else if (this->ai_family == AF_INET6) {
 			struct sockaddr_in6 *addr = (struct sockaddr_in6 *) this->ai_addr;
 
-			if (!IN6_IS_ADDR_LOOPBACK(&addr->sin6_addr))
+			if (!IN6_IS_ADDR_LOOPBACK(&addr->sin6_addr) &&
+			    !IN6_IS_ADDR_LINKLOCAL(&addr->sin6_addr))
 				rr6++;
 		}
 		this = this->ai_next;


