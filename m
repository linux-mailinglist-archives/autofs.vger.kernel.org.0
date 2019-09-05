Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E929AAF2F
	for <lists+autofs@lfdr.de>; Fri,  6 Sep 2019 01:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388084AbfIEXqH (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Thu, 5 Sep 2019 19:46:07 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:48947
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387634AbfIEXqH (ORCPT
        <rfc822;autofs@vger.kernel.org>); Thu, 5 Sep 2019 19:46:07 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B/EAAYnXFd/1230XZlghkCghaBPyE?=
 =?us-ascii?q?SKoQhjwxSAQaBETiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNQgOAgw?=
 =?us-ascii?q?BAQEEAQEBAQEGAwFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/Mxo?=
 =?us-ascii?q?CijWBDCgBi3cYeIEHgREzimyCWASPMoVFXkKWGYIpjAOIZRuCNItIAxCKZy2?=
 =?us-ascii?q?Df6QnAjSBWE0uCjuCbJEUNjCBBgEBhDyKCAEB?=
X-IPAS-Result: =?us-ascii?q?A2B/EAAYnXFd/1230XZlghkCghaBPyESKoQhjwxSAQaBE?=
 =?us-ascii?q?TiJXI8rgXsJAQEBAQEBAQEBGxkBAgEBhD8CgjYjNQgOAgwBAQEEAQEBAQEGA?=
 =?us-ascii?q?wFthGtPQgEQAYR3BiMEYhgNAhgOAgJHEAYThRkTqnZ/MxoCijWBDCgBi3cYe?=
 =?us-ascii?q?IEHgREzimyCWASPMoVFXkKWGYIpjAOIZRuCNItIAxCKZy2Df6QnAjSBWE0uC?=
 =?us-ascii?q?juCbJEUNjCBBgEBhDyKCAEB?=
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; 
   d="scan'208";a="201582688"
Received: from unknown (HELO mickey.themaw.net) ([118.209.183.93])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 06 Sep 2019 07:42:53 +0800
Subject: [PATCH 22/32] autofs-5.1.5 - add glibc getmntent_r()
From:   Ian Kent <raven@themaw.net>
To:     autofs mailing list <autofs@vger.kernel.org>
Date:   Fri, 06 Sep 2019 07:42:53 +0800
Message-ID: <156772697319.5865.3867471941684087440.stgit@mickey.themaw.net>
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

Add a slightly modified version of the glibc getmntent_r() function
so autofs can read the proc mount table directly.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 CHANGELOG    |    1 +
 lib/mounts.c |   95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 6e0bf7c7..28651a40 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -28,6 +28,7 @@ xx/xx/2019 autofs-5.1.6
 - use bit flags for autofs mount types in mnt_list.
 - use mp instead of path in mnt_list entries.
 - always use PROC_MOUNTS to make mount lists.
+- add glibc getmntent_r().
 
 30/10/2018 autofs-5.1.5
 - fix flag file permission.
diff --git a/lib/mounts.c b/lib/mounts.c
index 530a26f4..d7f409d6 100644
--- a/lib/mounts.c
+++ b/lib/mounts.c
@@ -786,6 +786,101 @@ done:
 	return ret;
 }
 
+/* From glibc decode_name() */
+/* Since the values in a line are separated by spaces, a name cannot
+ * contain a space.  Therefore some programs encode spaces in names
+ * by the strings "\040".  We undo the encoding when reading an entry.
+ * The decoding happens in place.
+ */
+static char *local_decode_name(char *buf)
+{
+	char *rp = buf;
+	char *wp = buf;
+
+	do {
+		if (rp[0] == '\\' && rp[1] == '0' &&
+		    rp[2] == '4' && rp[3] == '0') {
+			/* \040 is a SPACE.  */
+			*wp++ = ' ';
+			rp += 3;
+		} else if (rp[0] == '\\' && rp[1] == '0' &&
+			   rp[2] == '1' && rp[3] == '1') {
+			/* \011 is a TAB.  */
+			*wp++ = '\t';
+			rp += 3;
+		} else if (rp[0] == '\\' && rp[1] == '0' &&
+			   rp[2] == '1' && rp[3] == '2') {
+			/* \012 is a NEWLINE.  */
+			*wp++ = '\n';
+			rp += 3;
+		} else if (rp[0] == '\\' && rp[1] == '\\') {
+			/*
+			 * We have to escape \\ to be able to represent
+			 * all characters.
+			 */
+			*wp++ = '\\';
+			rp += 1;
+		} else if (rp[0] == '\\' && rp[1] == '1' &&
+			   rp[2] == '3' && rp[3] == '4') {
+			/* \134 is also \\.  */
+			*wp++ = '\\';
+			rp += 3;
+		} else
+			*wp++ = *rp;
+	} while (*rp++ != '\0');
+
+	return buf;
+}
+
+/* From glibc getmntent_r() */
+static struct mntent *
+local_getmntent_r(FILE *tab, struct mntent *mnt, char *buf, int size)
+{
+	char *cp, *head;
+
+	do {
+		char *end_ptr;
+
+		if (fgets(buf, size, tab) == NULL)
+			return 0;
+
+		end_ptr = strchr(buf, '\n');
+		if (end_ptr != NULL) {
+			while (end_ptr[-1] == ' ' || end_ptr[-1] == '\t')
+				end_ptr--;
+			*end_ptr = '\0';
+		} else {
+			/* Whole line was not read. Do it now but forget it. */
+			char tmp[1024];
+			while (fgets(tmp, sizeof tmp, tab) != NULL)
+				if (strchr(tmp, '\n') != NULL)
+					break;
+		}
+
+		head = buf + strspn(buf, " \t");
+	/* skip empty lines and comment lines */
+	} while (head[0] == '\0' || head[0] == '#');
+
+	cp = strsep(&head, " \t");
+	mnt->mnt_fsname = cp != NULL ? local_decode_name(cp) : (char *) "";
+	if (head)
+		head += strspn(head, " \t");
+	cp = strsep(&head, " \t");
+	mnt->mnt_dir = cp != NULL ? local_decode_name (cp) : (char *) "";
+	if (head)
+		head += strspn(head, " \t");
+	cp = strsep(&head, " \t");
+	mnt->mnt_type = cp != NULL ? local_decode_name (cp) : (char *) "";
+	if (head)
+		head += strspn (head, " \t");
+	cp = strsep (&head, " \t");
+	mnt->mnt_opts = cp != NULL ? local_decode_name (cp) : (char *) "";
+
+	/* autofs doesn't need freq or passno */
+
+	return mnt;
+}
+
 /*
  * Get list of mounts under path in longest->shortest order
  */

