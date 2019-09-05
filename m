Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02DAAAAF45
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389219AbfIEXuW (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:50:22 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:50112
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfIEXuW (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:50:22 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DqEgAKnHFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXJEmCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzcGDgIMAQE?=
 =?us-ascii?q?BBAEBAQEBBgMBbYRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p4fzMaAoo?=
 =?us-ascii?q?1gQwoAYt3GHiBB4ERM4psglgEjEoKgl6FRV5CbpQ9boIplGgbjXwDineELKQ?=
 =?us-ascii?q?7IoFYTS4KO4Jsgk4Xji82MIEGAQGEPIoIAQE?=
X-IPAS-Result: =?us-ascii?q?A2DqEgAKnHFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXJEmCQEBAQEBAQEBARsZAQIBAYQ/AoI2IzcGDgIMAQEBBAEBAQEBBgMBb?=
 =?us-ascii?q?YRrT0IBEAGEdwYjBGIYDQIYDgICRxAGE4UZE6p4fzMaAoo1gQwoAYt3GHiBB?=
 =?us-ascii?q?4ERM4psglgEjEoKgl6FRV5CbpQ9boIplGgbjXwDineELKQ7IoFYTS4KO4Jsg?=
 =?us-ascii?q?k4Xji82MIEGAQGEPIoIAQE?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582392"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:41:04 +0800
Subject: [PATCH 03/32] autofs-5.1.5 - fix macro expansion in selector values
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:41:04 +0800
Message-ID: <156772686394.5865.8169000998688622944.stgit@mickey.themaw.net>
In-Reply-To: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
References: <156772672378.5865.3952237351056831247.stgit@mickey.themaw.net>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: autofs-owner@vger.kernel.org
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Macro expansion is not done in selector values before use, for example
in "hostd==${/key}.<donain>.<name>" the ${/key} is not expanded before
use leading to an attempt to use an invalid host name.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG           |    1 
 modules/parse_amd.c |  286 ++++++++++++++++++++++++++++++++++-----------------
 2 files changed, 193 insertions(+), 94 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 24534e34..956a33b7 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -9,6 +9,7 @@ xx/xx/2019 autofs-5.1.6
 - Fix NFS mount from IPv6 addresses.
 - make expire remaining log level debug.
 - allow period following macro in selector value.
+- fix macro expansion in selector values.
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/modules/parse_amd.c b/modules/parse_amd.c
index 0e48e5ce..7703be5b 100644
--- a/modules/parse_amd.c
+++ b/modules/parse_amd.c
@@ -231,17 +231,29 @@ static struct substvar *add_lookup_vars(struct autofs_point *ap,
 	return list;
 }
 
-static int match_my_name(unsigned int logopt, const char *name, struct substvar *sv)
+static int match_my_name(struct autofs_point *ap, const char *name, struct substvar *sv)
 {
 	struct addrinfo hints, *cni, *ni, *haddr;
 	char host[NI_MAXHOST + 1], numeric[NI_MAXHOST + 1];
+	unsigned int logopt = ap->logopt;
 	const struct substvar *v;
+	char *exp_name = NULL;
 	int rv = 0, ret;
 
+	if (!expand_selectors(ap, name, &exp_name, sv))
+		exp_name = strdup(name);
+	if (!exp_name) {
+		error(logopt,
+		      MODPREFIX "error: failed to alloc space for name");
+		goto out;
+	}
+
 	v = macro_findvar(sv, "host", 4);
 	if (v) {
-		if (!strcmp(v->val, name))
-			return 1;
+		if (!strcmp(v->val, exp_name)) {
+			rv = 1;
+			goto out;
+		}
 	}
 
 	if (!v || !v->val) {
@@ -268,11 +280,11 @@ static int match_my_name(unsigned int logopt, const char *name, struct substvar
 	hints.ai_flags = AI_V4MAPPED | AI_ADDRCONFIG | AI_CANONNAME;
 
 	/* Resolve comparison name to its names and compare */
-	ret = getaddrinfo(name, NULL, &hints, &ni);
+	ret = getaddrinfo(exp_name, NULL, &hints, &ni);
 	if (ret) {
 		error(logopt, MODPREFIX
 		      "hostname lookup for %s failed: %s\n",
-		      name, gai_strerror(ret));
+		      exp_name, gai_strerror(ret));
 		freeaddrinfo(cni);
 		goto out;
 	}
@@ -310,18 +322,180 @@ next:
 	freeaddrinfo(ni);
 	freeaddrinfo(cni);
 out:
+	if (exp_name)
+		free(exp_name);
 	return rv;
 }
 
-static int eval_selector(unsigned int logopt,
+static int sel_strcmp(struct autofs_point *ap,
+		      const struct substvar *v, struct selector *s,
+		      struct substvar *sv)
+{
+	char *expand = NULL;
+	int ret = 0;
+	int res;
+
+	res = expand_selectors(ap, s->comp.value, &expand, sv);
+	if (res)
+		res = strcmp(v->val, expand);
+	else
+		res = strcmp(v->val, s->comp.value);
+
+	if (s->compare & SEL_COMP_EQUAL && !res) {
+		debug(ap->logopt, MODPREFIX
+		      "matched selector %s(%s) == %s",
+		      v->def, v->val, expand ? expand : s->comp.value);
+		ret = 1;
+	} else if (s->compare & SEL_COMP_NOTEQUAL && res) {
+		debug(ap->logopt, MODPREFIX
+		      "matched selector %s(%s) != %s",
+		      v->def, v->val, expand ? expand : s->comp.value);
+		ret = 1;
+	} else
+		debug(ap->logopt, MODPREFIX
+		      "did not match selector %s(%s) %s %s",
+		      v->def, v->val,
+		      (s->compare & SEL_COMP_EQUAL ? "==" : "!="),
+		      expand ? expand : s->comp.value);
+
+	if (expand)
+		free(expand);
+
+	return ret;
+}
+
+static int sel_lstat(struct autofs_point *ap,
+		     struct selector *s, struct substvar *sv)
+{
+	struct stat st;
+	char *expand = NULL;
+	int res, ret;
+
+	/* Sould be OK to fail on any error here */
+	res = expand_selectors(ap, s->func.arg1, &expand, sv);
+	if (res)
+		ret = !lstat(expand, &st);
+	else
+		ret = !lstat(s->func.arg1, &st);
+
+	if (s->compare == SEL_COMP_NOT)
+		ret = !ret;
+	if (ret)
+		debug(ap->logopt, MODPREFIX
+		      "matched selector %s(%s)",
+		      s->sel->name, expand ? expand : s->func.arg1);
+	else
+		debug(ap->logopt, MODPREFIX
+		      "did not match selector %s(%s)",
+		      s->sel->name, expand ? expand : s->func.arg1);
+	if (expand)
+		free(expand);
+
+	return ret;
+}
+
+static int sel_in_network(struct autofs_point *ap,
+			  struct selector *s, struct substvar *sv)
+{
+	char *expand = NULL;
+	int res, ret;
+
+	res = expand_selectors(ap, s->func.arg1, &expand, sv);
+	if (!res)
+		ret = in_network(s->func.arg1);
+	else
+		ret = in_network(expand);
+
+	if (s->compare == SEL_COMP_NOT)
+		ret = !ret;
+	if (ret)
+		debug(ap->logopt, MODPREFIX
+		      "matched selector %s(%s)",
+		      s->sel->name, expand ? expand : s->func.arg1);
+	else
+		debug(ap->logopt, MODPREFIX
+		      "did not match selector %s(%s)",
+		      s->sel->name, expand ? expand : s->func.arg1);
+
+	if (expand)
+		free(expand);
+
+	return ret;
+}
+
+static int sel_netgrp(struct autofs_point *ap,
+		      struct selector *s, struct substvar *sv)
+{
+	char *exp_arg1 = NULL, *exp_arg2 = NULL;
+	const struct substvar *v;
+	int res, ret = 0;
+	char *host;
+
+	if (s->func.arg2) {
+		res = expand_selectors(ap, s->func.arg2, &exp_arg2, sv);
+		if (res)
+			host = exp_arg2;
+		else
+			host = s->func.arg2;
+	} else {
+		if (s->sel->selector == SEL_NETGRP)
+			v = macro_findvar(sv, "host", 4);
+		else
+			v = macro_findvar(sv, "hostd", 5);
+		if (!v || !*v->val) {
+			error(ap->logopt, MODPREFIX
+			     "failed to get value of ${host}");
+			goto out;
+		}
+		host = v->val;
+	}
+
+	res = expand_selectors(ap, s->func.arg1, &exp_arg1, sv);
+	if (res)
+		ret = innetgr(exp_arg1, host, NULL, NULL);
+	else
+		ret = innetgr(s->func.arg1, host, NULL, NULL);
+
+	if (s->compare == SEL_COMP_NOT)
+		ret = !ret;
+	if (ret) {
+		if (!s->func.arg2)
+			debug(ap->logopt, MODPREFIX
+			      "matched selector %s(%s)",
+			      s->sel->name, exp_arg1 ? exp_arg1 : s->func.arg1);
+		else
+			debug(ap->logopt, MODPREFIX
+			      "matched selector %s(%s,%s)", s->sel->name,
+			      exp_arg1 ? exp_arg1 : s->func.arg1,
+			      exp_arg2 ? exp_arg2 : s->func.arg2);
+	} else {
+		if (!s->func.arg2)
+			debug(ap->logopt, MODPREFIX
+			      "did not match selector %s(%s)",
+			      s->sel->name, exp_arg1 ? exp_arg1 : s->func.arg1);
+		else
+			debug(ap->logopt, MODPREFIX
+			      "did not match selector %s(%s,%s)", s->sel->name,
+			      exp_arg1 ? exp_arg1 : s->func.arg1,
+			      exp_arg2 ? exp_arg2 : s->func.arg2);
+	}
+out:
+	if (exp_arg1)
+		free(exp_arg1);
+	if (exp_arg2)
+		free(exp_arg2);
+
+	return ret;
+}
+
+static int eval_selector(struct autofs_point *ap,
 			 struct amd_entry *this, struct substvar *sv)
 {
 	struct selector *s = this->selector;
+	unsigned int logopt = ap->logopt;
 	const struct substvar *v;
 	unsigned int s_type;
 	unsigned int v_type;
-	struct stat st;
-	char *host;
 	int res, val, ret = 0;
 
 	s_type = s->sel->flags & SEL_FLAGS_TYPE_MASK;
@@ -339,26 +513,7 @@ static int eval_selector(unsigned int logopt,
 
 		switch (v_type) {
 		case SEL_FLAG_STR:
-			res = strcmp(v->val, s->comp.value);
-			if (s->compare & SEL_COMP_EQUAL && !res) {
-				debug(logopt, MODPREFIX
-				      "matched selector %s(%s) == %s",
-				      v->def, v->val, s->comp.value);
-				ret = 1;
-				break;
-			} else if (s->compare & SEL_COMP_NOTEQUAL && res) {
-				debug(logopt, MODPREFIX
-				      "matched selector %s(%s) != %s",
-				      v->def, v->val, s->comp.value);
-				ret = 1;
-				break;
-			}
-
-			debug(logopt, MODPREFIX
-				      "did not match selector %s(%s) %s %s",
-				      v->def, v->val,
-				      (s->compare & SEL_COMP_EQUAL ? "==" : "!="),
-				      s->comp.value);
+			ret = sel_strcmp(ap, v, s, sv);
 			break;
 
 		case SEL_FLAG_NUM:
@@ -434,7 +589,7 @@ static int eval_selector(unsigned int logopt,
 			break;
 
 		case SEL_XHOST:
-			ret = match_my_name(logopt, s->func.arg1, sv);
+			ret = match_my_name(ap, s->func.arg1, sv);
 			if (s->compare == SEL_COMP_NOT)
 				ret = !ret;
 			if (ret)
@@ -448,32 +603,11 @@ static int eval_selector(unsigned int logopt,
 			break;
 
 		case SEL_EXISTS:
-			/* Sould be OK to fail on any error here */
-			ret = !lstat(s->func.arg1, &st);
-			if (s->compare == SEL_COMP_NOT)
-				ret = !ret;
-			if (ret)
-				debug(logopt, MODPREFIX
-				      "matched selector %s(%s)",
-				      s->sel->name, s->func.arg1);
-			else
-				debug(logopt, MODPREFIX
-				      "did not match selector %s(%s)",
-				      s->sel->name, s->func.arg1);
+			ret = sel_lstat(ap, s, sv);
 			break;
 
 		case SEL_IN_NETWORK:
-			ret = in_network(s->func.arg1);
-			if (s->compare == SEL_COMP_NOT)
-				ret = !ret;
-			if (ret)
-				debug(logopt, MODPREFIX
-				      "matched selector %s(%s)",
-				      s->sel->name, s->func.arg1);
-			else
-				debug(logopt, MODPREFIX
-				      "did not match selector %s(%s)",
-				      s->sel->name, s->func.arg1);
+			ret = sel_in_network(ap, s, sv);
 			break;
 
 		default:
@@ -492,43 +626,7 @@ static int eval_selector(unsigned int logopt,
 		switch (s->sel->selector) {
 		case SEL_NETGRP:
 		case SEL_NETGRPD:
-			if (s->func.arg2)
-				host = s->func.arg2;
-			else {
-				if (s->sel->selector == SEL_NETGRP)
-					v = macro_findvar(sv, "host", 4);
-				else
-					v = macro_findvar(sv, "hostd", 5);
-				if (!v || !*v->val) {
-					error(logopt, MODPREFIX
-					     "failed to get value of ${host}");
-					break;
-				}
-				host = v->val;
-			}
-			ret = innetgr(s->func.arg1, host, NULL, NULL);
-			if (s->compare == SEL_COMP_NOT)
-				ret = !ret;
-			if (ret) {
-				if (!s->func.arg2)
-					debug(logopt, MODPREFIX
-					      "matched selector %s(%s)",
-					      s->sel->name, s->func.arg1);
-				else
-					debug(logopt, MODPREFIX
-					      "matched selector %s(%s,%s)",
-					      s->sel->name, s->func.arg1,
-					      s->func.arg2);
-			} else {
-				if (!s->func.arg2)
-					debug(logopt, MODPREFIX
-					      "did not match selector %s(%s)",
-					      s->sel->name, s->func.arg1);
-				else
-					debug(logopt, MODPREFIX
-					      "did not match selector %s(%s,%s)",
-					      s->sel->name, s->func.arg1, s->func.arg2);
-			}
+			ret = sel_netgrp(ap, s, sv);
 			break;
 
 		default:
@@ -1753,7 +1851,7 @@ static void update_prefix(struct autofs_point *ap,
 	return;
 }
 
-static int match_selectors(unsigned int logopt,
+static int match_selectors(struct autofs_point *ap,
 			   struct amd_entry *entry, struct substvar *sv)
 {
 	struct selector *s = entry->selector;
@@ -1761,7 +1859,7 @@ static int match_selectors(unsigned int logopt,
 
 	/* No selectors, always match */
 	if (!s) {
-		debug(logopt, MODPREFIX "no selectors found in location");
+		debug(ap->logopt, MODPREFIX "no selectors found in location");
 		return 1;
 	}
 
@@ -1769,7 +1867,7 @@ static int match_selectors(unsigned int logopt,
 
 	/* All selectors must match */
 	while (s) {
-		ret = eval_selector(logopt, entry, sv);
+		ret = eval_selector(ap, entry, sv);
 		if (!ret)
 			break;
 		s = s->next;
@@ -1939,7 +2037,7 @@ static struct amd_entry *select_default_entry(struct autofs_point *ap,
 		if (!this->selector)
 			continue;
 
-		if (match_selectors(ap->logopt, this, sv)) {
+		if (match_selectors(ap, this, sv)) {
 			if (entry_default) {
 				/*update_with_defaults(entry_default, this, sv);*/
 				free_amd_entry(entry_default);
@@ -2192,7 +2290,7 @@ int parse_mount(struct autofs_point *ap, const char *name,
 			break;
 		}
 
-		if (!match_selectors(ap->logopt, this, sv))
+		if (!match_selectors(ap, this, sv))
 			continue;
 
 		at_least_one = 1;

