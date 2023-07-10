Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43AB674CCA6
	for <lists+autofs@lfdr.de>; Mon, 10 Jul 2023 08:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjGJGJn (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Mon, 10 Jul 2023 02:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjGJGJm (ORCPT
        <rfc822;autofs@vger.kernel.org>); Mon, 10 Jul 2023 02:09:42 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58861FA
        for <autofs@vger.kernel.org>; Sun,  9 Jul 2023 23:09:41 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b703c900e3so61322041fa.1
        for <autofs@vger.kernel.org>; Sun, 09 Jul 2023 23:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688969379; x=1691561379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD+FaDSHy6yhGj9THVdrd5BRA00vuf2AuRNSCyIjYpM=;
        b=h1x5hP/OSgjv+qA+WK8fYpTUgwqawFJmxhW7rSWYeuoZi/hr5EC0N3zCbpiCN/Rxzk
         NGWtcsG0aMSxjqVWIU5W3lUJFwt3bff15W0Ld8lMTFSJLP8WJfXJd2u5fMpW1IRtG9vu
         4dhnG9lq36uXLD2LdInRQ2m1iOMsdb/DSRs/wXGZsb3oTlti/YdYnTKI8O0t2HEVkjn9
         Z2f/sFGp2iIYHlX/+N9N7YYV2/ykoxFP6t2JI6VCdh9Q4nadaw4sp4Iz9HiQ3MO7WbXj
         aC3G2KnorAd2YPBjXXhONxvLdpNrqhO9esO4vh1V0HGiK6fYwBDd2tJ2F9p8sy8q0Gpa
         oQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688969379; x=1691561379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD+FaDSHy6yhGj9THVdrd5BRA00vuf2AuRNSCyIjYpM=;
        b=bDy/VJ2hgR4+7Wr0JgEMc5POzWKYcOuLcROo/996cVd8RSiBt65zZwQ7IhnfDSPbUr
         hqUaD0GoA9Ff7f2kFUfHioWPUf9DkitYJ466CMvSSK1fdMh8K2r8IdTBRzY6gVF0HC32
         Io7KtaOSqdXnUaXOy8opqf974SZBhjhmV5VXCizq/oSdEX3WKZWYVjocAISdu8kQE3Me
         23MdqJ3f1Y0q1xDb7xGvIRS8ThDR93n6P6IBSDQVP3PhmRbrtghxsfXahhK2RL4iKfo/
         ak4S39Q1Ok5xQd4zqjGq5LHdalvGQMIO/VGU0sP7zBelPemaYe47+b6o1CmibIK9reg6
         861w==
X-Gm-Message-State: ABy/qLayHyqv0unXCugkj1zEbvvEbEzxh4A7C4OGKwV2NrMs370jXtFm
        ocHcgshRNTQGgEaYYHBn3j0=
X-Google-Smtp-Source: APBJJlFPHeLa8FmgSBBn8essIGExlXrTkbFGqAxtrmfWLmZOsXDOOtjlnLdM9/2zeHupDxiMLtW2/w==
X-Received: by 2002:a2e:3204:0:b0:2b6:d8ea:6650 with SMTP id y4-20020a2e3204000000b002b6d8ea6650mr8740793ljy.27.1688969379256;
        Sun, 09 Jul 2023 23:09:39 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id q9-20020a1709060e4900b00982842ea98bsm5648565eji.195.2023.07.09.23.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:09:38 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
        id 433F5BE2DE0; Mon, 10 Jul 2023 08:09:37 +0200 (CEST)
Date:   Mon, 10 Jul 2023 08:09:37 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Ian Kent <raven@themaw.net>
Cc:     Goldwyn Rodrigues <rgoldwyn@suse.de>, autofs@vger.kernel.org,
        Mike Gabriel <sunweaver@debian.org>
Subject: Re: Regression after changes for mounts from IPv6 addresses
 introducing delays
Message-ID: <ZKugoVJ27gOdQz2w@eldamar.lan>
References: <ZKrKz/QYjPSmMcts@eldamar.lan>
 <66eb24d5-988a-9646-b419-245096dfe3f0@themaw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66eb24d5-988a-9646-b419-245096dfe3f0@themaw.net>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

Hi Ian,

On Mon, Jul 10, 2023 at 10:53:31AM +0800, Ian Kent wrote:
> On 9/7/23 22:57, Salvatore Bonaccorso wrote:
> > Hi
> > 
> > The following sort of regression was noticed while updating a client
> > running Debian buster (with autofs 5.1.2 based) to Debian bullseye
> > (5.1.7 based autofs), but verified it's still present with 5.1.8. The
> > folloing setup is present:
> > 
> > There is a NFS server, dualstacked, with both public IPv4 and IPv6
> > addresses resolvable in DNS. As I cannot put the public IPs here in
> > the report, let's assume It is called nfs-server with addresses
> > 192.168.122.188 and fc00:192:168:122::188.
> 
> I assume the IPv6 address here is not what's used in practice. It
> 
> doesn't look valid, it doesn't look like an IPv4 mapped address, what
> 
> is it, how was it constructed?

I'm sorry this was just me trying to use something valid from
https://en.wikipedia.org/wiki/Unique_local_address . Yes this is nto
the IPv6 address which the server has in practice.

Regards,
Salvatore
