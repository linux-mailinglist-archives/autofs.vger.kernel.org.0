Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71952EA01E
	for <lists+autofs@lfdr.de>; Mon,  4 Jan 2021 23:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbhADWmo (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 4 Jan 2021 17:42:44 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46083 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726333AbhADWmo (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 4 Jan 2021 17:42:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E51CA5C0107;
        Mon,  4 Jan 2021 17:41:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 04 Jan 2021 17:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        ghVa7PF4VZ5xHzA2yvhVFoQ+yk/wBMtNJvVHRDbIiV8=; b=jjAO+fSBstue3iPO
        wzhX7UxrQvRUEn/1XkjnhV0ssjhBvsfeTH2MysRuP0HN7s1ZIZSVi/mZ7JvbAx0r
        t8xjQotu3LIjEjSgCgyy7CWamMp7qT608MycRd8M6DOX3X0Z4mwOFpL7KD6qBYRg
        6QaKRG8VXANQWDeyCOvlxPYJ7sBLg7RORLeIxZMGcFsGe1uGiofAp4oy53WRa2NT
        62SfPRVWD9Knc/UnGjrp6UF2v528QqYDdAewMx9BvPN87PtJ11ncNgzwjrjIp5kA
        j8rXnHo5srBd7TlEXNFvYh9nsoooEcfyLeadwRx8T9sELTk93QPQ8lnoCcsr/GH6
        0QiyQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=ghVa7PF4VZ5xHzA2yvhVFoQ+yk/wBMtNJvVHRDbIi
        V8=; b=Q0Np2UWuhviI9FFcavCCA0L35+jqVE1KlDC5PdasxLA33Lr0IHqA1OK56
        xHEibwdD3IrH1mAwI+EeXjYDHkHNhPMiYvgEtgTFZbuzfPfqEH2AQyVSRz1+gLgV
        TTGbr5Pa08CujBKgSBfKfvnONkGaCIq4fEC/1OaIamAm4rqJrD7YQJPHqZ2lY/mG
        ZrjVuGEBxgTAy/q069IXrZ2NrW7k+qxpFKv0hMNSXEHF+5qA/7FuvhwAm9h4ALHt
        P2ZPVshxhXtN0sWQ5ZnloihcQDqSJBd/Rkujjo6ilkn9JfanG1vEGBtJGffvs4Ft
        NGQvzJ0mMVCZIfZSKDDzKAUD++RDw==
X-ME-Sender: <xms:oZnzXy1qQcBk3iKEOkf-RPxi_eD51YRPZeXqK_Roy5LXDDhCHby9iw>
    <xme:oZnzX1G_sNAE6VmQOGITJkC7nsUeUb9pVabLBXXpJEQ4_FJ7UupZcXK6nLCThCssn
    OAyMXXixkWu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfmvghn
    thcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepjeefue
    ekieeffeefteffgfekgeeggfehgefgvdehudelgfeludeiieeuvefggfegnecuffhomhgr
    ihhnpegvgigrmhhplhgvrdhlrghnpdgsohhthhgvnhgushdrlhgrnhenucfkphepuddtie
    drieelrddvgeejrddvtdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomheprhgrvhgvnhesthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:oZnzX66TMDvE8hFak6llxrT4Oe9xIDqZvXhAgBJdmi918sJhRbHicw>
    <xmx:oZnzXz2hqCVfTZ8FebjqzN1zD1zoQ_y9ZR7IHuKZLbeqrd_X0WWpVw>
    <xmx:oZnzX1E5KVCOE8Hsxf987XjOsgC4pBfhN0YWREWhhAcls8cyNywtQw>
    <xmx:oZnzX5QNMkGbC1gYQGBbVZn-FU4Di4FT10stc7z-z1TLIOklaciBpQ>
Received: from mickey.themaw.net (106-69-247-205.dyn.iinet.net.au [106.69.247.205])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BA9124005C;
        Mon,  4 Jan 2021 17:41:36 -0500 (EST)
Message-ID: <4e40c051aedc9a826965f34fa449144ea92ad6a1.camel@themaw.net>
Subject: Re: how to auto map cifs to a username mount without & for the
 share path
From:   Ian Kent <raven@themaw.net>
To:     Jelle de Jong <jelledejong@powercraft.nl>, autofs@vger.kernel.org
Date:   Tue, 05 Jan 2021 06:41:10 +0800
In-Reply-To: <066f707f-82dc-98c8-b9b9-28f294541a04@powercraft.nl>
References: <066f707f-82dc-98c8-b9b9-28f294541a04@powercraft.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

On Sat, 2020-12-26 at 21:54 +0100, Jelle de Jong wrote:
> Hello everbody,
> 
> I got the following autofs mapping example:
> 
> /mnt/org/home       /etc/auto.home --timeout=0
> 
> * 
> -fstype=cifs,sec=krb5,uid=${UID},gid=${UID},cruid=${UID},file_mode=06
> 60,dir_mode=0770,echo_interval=12 
> ://samba.example.lan/users/&
> 
> //samba.example.lan/users/<username> is on the server so 
> //samba.example.lan/users/& works fine, however I got other shares
> that 
> I want to mount and only accessable per user basis (securiy
> permissions)
> 
> /mnt/org/documents  /etc/auto.documents --timeout=0
> * 
> -fstype=cifs,sec=krb5,uid=${UID},gid=${UID},cruid=${UID},file_mode=06
> 60,dir_mode=0770,echo_interval=12 
> ://samba01.bothends.lan/documents
> 
> This mapping does works and it mounts the document share as 
> /mnt/org/documents/<username> however it also mount 
> /mnt/org/documents/.hidden and tries to mount as root and all the
> other 
> lookups in /mnt/org/documents will get a mount because the catchall
> * 
> and no matching & limit in the shrae path. It becomes a mess.
> 
> I have searched the manuals and I can not find a mapping system
> without 
> & in the file path I want the * to match the user name so only that 
> lookup with the username will be mounted.
> 
> & -fstype=cifs ://samba01.bothends.lan/documents
> $USER -fstype=cifs ://samba01.bothends.lan/documents

I don't understand how this would work, explain please?

Also, don't forget people may use their maps in environments
that have OSes other than Linux and things like ${USER} would
make those clients fail.

> 
> Something like this. How can I do this witout hardcoding the
> usernames 
> mount points? If this functionality is not supported would it be 
> possible to have * be replaced with a variable or some more dynamic 
> feature? Tips?

The problem with using the wildcard map key is that, as you have seen,
it will match any request sent from the kernel. And the kernel doesn't
know if if the request is valid or not so it's bound to send it to the
automount daemon for it to work that out.

It wasn't a problem until software, usually GUI software, started
trying to access directories in the parent of the requested path.

There is no variable substitution or patten matching in the key part
of a map entry. Patten matching would make things very difficult.

I have been thinking about the implications of allowing variable
substitution there.

There are problems with that though, such as how can you be sure
of what is used for ${USER}, the automount daemon doesn't know?

The kernel only knows the user id of the process that triggered
the mount which might not be the user id that you expect.

For example suppose process 1, the user you want a mount for walks
on the path you want mounted, and suppose process 2, also attempts
to access that path at the same time and it gets to the point in
the kernel that initiates the request before process 1.

Assuming the mount is carried out and succeeds, then at least one
of these processes will get an incorrect result.

There's nothing that can be done to help with this.

These unexpected requests will be sent to the daemon, there's nothing
that can be done about that, but IIUC there are only a few of those
invalid paths, like .hidden, so perhaps some mechanism to add a list
of invalid map keys could be implemented ... I'm thinking about what
that would mean ...

Ian

