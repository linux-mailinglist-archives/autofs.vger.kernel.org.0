Return-Path: <autofs-owner@vger.kernel.org>
X-Original-To: lists+autofs@lfdr.de
Delivered-To: lists+autofs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B3D5A628B
	for <lists+autofs@lfdr.de>; Tue, 30 Aug 2022 13:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiH3L40 (ORCPT <rfc822;lists+autofs@lfdr.de>);
        Tue, 30 Aug 2022 07:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiH3L4Y (ORCPT
        <rfc822;autofs@vger.kernel.org>); Tue, 30 Aug 2022 07:56:24 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BE9B6563
        for <autofs@vger.kernel.org>; Tue, 30 Aug 2022 04:56:23 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fy31so21200964ejc.6
        for <autofs@vger.kernel.org>; Tue, 30 Aug 2022 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=nrkgH02o2Rcq15VakJfrbQDQa/xxZur4E42yyaQ4r1Y=;
        b=MQ+v9gmXLiQkD710ePwz9mO3FqnxINIVj+vKJgtDaEoGA1yC57OQL8Nm2OVdzmwI03
         8P5ytFZiGxJJjf3Rp82icmsW19CiChn7HPlKLAvW7hpoQ0gJzTiZXVu4VRyzDvjGK4wx
         tjToRtn/Hz9AmTE1BSUVOyPwg41aR2EhTEPSVNFAsTIhf5O3jzM+Sc36ZnLD5M16IQh4
         e/sMevrE8Js7ABLPuSMlDze8I7i4eWlbw60Z7CZjYnzrL86kj7pIfbpDeV7agiwDLU9F
         Qx9ffjziQFzv0uOpa05hLxzxfsc00rXtaibbPQNANrYCp+zMFIB+hFzVF7mkdtxT6pZM
         QbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nrkgH02o2Rcq15VakJfrbQDQa/xxZur4E42yyaQ4r1Y=;
        b=K/s7hYBzLT5O5CuJMph2oXHn8H0yytWPDB97IAfUSKIxZ9rXQqtbJS+iv8DWu0AgNQ
         8+X0+WmNb3kd2kIwzb+sChVloMpeC1xEq2mYC70/c3BokAMA0e/r8gnD9M8YSOdlUHyH
         5353s3nzQ0OBk+OtqX6Ph/y1MXvxHIVP6cGfxLrqu5yFEznLHcrKe8t/fZIb7ZWk8WML
         kD+c+wmQpUZBvC1XxJQYKqn50dTxA46BWpg56TT/TPANDeI/V002QiSByA/m5NT0zwo4
         Y5eVEA0HtxYbNcRI5b2kZkBz5nNVhPc4vXM/AFg8saXMb9OVzptzThB8yFr3KplB0iV9
         knHg==
X-Gm-Message-State: ACgBeo2x0HkwHSJDqk7BzoEbNWLg6ZV5WD8V2lidV/lYv6RZru8SWxLj
        4Peln/qDu69dB7yhoGsqZL3S/GYdmuf3+CmIz9E=
X-Google-Smtp-Source: AA6agR6So9hmF2A0UcmZwSCuNqgTP0X8jtzoegfxs/TxWIBeZ+VbQAeSOoZKus//L5dlbRgAw5cdhv/InhVER4C7QN0=
X-Received: by 2002:a17:907:2c77:b0:741:5f0b:aff2 with SMTP id
 ib23-20020a1709072c7700b007415f0baff2mr8873006ejc.698.1661860582368; Tue, 30
 Aug 2022 04:56:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:31cb:b0:73d:6076:ca65 with HTTP; Tue, 30 Aug 2022
 04:56:21 -0700 (PDT)
Reply-To: omrtonyelumelu98@gmail.cm
From:   " Mrs. Kristalina Georgieva" <oze123456788@gmail.com>
Date:   Tue, 30 Aug 2022 12:56:21 +0100
Message-ID: <CACOHB+1AR3imghvfm4MoO3jXtmiAfomwmMEzgMOto3o+fXqb3g@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROMSPACE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <autofs.vger.kernel.org>
X-Mailing-List: autofs@vger.kernel.org

5Zu96Zqb6YCa6LKo5Z+66YeRIChJTUYpDQrlm73pmpvlgrXli5nnrqHnkIboqrINCu+8gzE5MDDj
gIFBVi5EVeekvumVtw0KDQpJLk0uRi4g44OH44Kj44Os44Kv44K/44O844Gu5YWs5byP6Zu75a2Q
44Oh44O844OrIOOCouODieODrOOCueOBuOOCiOOBhuOBk+OBneOAguOCr+ODquOCueOCv+ODquOD
vOODiuODu+OCsuOCquODq+OCruOCqOODrw0KDQoNCuimquaEm+OBquOCi+WPl+ebiuiAhe+8gQ0K
DQrmlrDjgZ/jgavku7vlkb3jgZXjgozjgZ/osqHli5nplbflrpjjgajlm73pgKPpgJrosqjlvZPl
sYDjga7ntbHmsrvmqZ/plqLjga/jgIHlm73pgKPmlL/lupzjgavplbfjgYTplpPlgrXli5njgpLo
sqDjgaPjgabjgYTjgZ/mnKroq4vmsYLjga7os4fph5HjgpLoqr/mn7vjgZnjgovjgZPjgajjgpLo
qLHlj6/jgZfjgZ/jgZ/jgoHjgIHmiYDmnInogIXjga/oqZDmrLrjgaflkYrnmbrjgZXjgozjgb7j
gZfjgZ8u5Zu96YCj44Gu5ZCN5YmN44KS5L2/55So44GX44Gf6KmQ5qy65bir44CC6Kq/5p+75Lit
44Gu44K344K544OG44Og44Gu6Zu75a2Q44Oh44O844OrDQrjgqLjg4njg6zjgrnjga7jg4fjg7zj
gr8g44K544OI44Os44O844K46KiY6Yyy44Gr44KI44KL44Go44CB44GC44Gq44Gf44Gu5pSv5omV
44GE44Gv44CB5qyh44Gu44Kr44OG44K044Oq44GuIDE1MCDkurrjga7lj5fnm4rogIXjga7jg6rj
grnjg4jjgavlkKvjgb7jgozjgabjgYTjgb7jgZnjgILlpZHntITos4fph5HjgIINCg0K44GC44Gq
44Gf44Gu6LOH6YeR44KS44Gg44G+44GX5Y+W44KL44Gf44KB44Gr5rGa6IG344KS54qv44GX44Gf
6IWQ5pWX44GX44Gf6YqA6KGM6IG35ZOh44Gv44CB44GC44Gq44Gf44Gu5pSv5omV44GE44KS5LiN
5b2T44Gr6YGF44KJ44Gb44CB44GC44Gq44Gf44Gu5YG044Gr5aSa44GP44Gu6LK755So44GM44GL
44GL44KK44CB44GC44Gq44Gf44Gu5pSv5omV44GE44Gu5Y+X44GR5YWl44KM44GM5LiN5b2T44Gr
6YGF44KM44G+44GX44GfLuWbvemAo+OBqOWbvemam+mAmuiyqOWfuumHkQ0KKElNRikg44Gv44CB
5YyX57Gz44CB5Y2X57Gz44CB57Gz5Zu944CB44Oo44O844Ot44OD44OR44CB44Ki44K444Ki44CB
44GK44KI44Gz5LiW55WM5Lit44GuIEFUTSBWaXNhIOOCq+ODvOODieOCkuS9v+eUqOOBl+OBpiAx
NTANCuS6uuOBruWPl+ebiuiAheOBq+OBmeOBueOBpuOBruijnOWEn+OCkuaUr+aJleOBhuOBk+OB
qOOCkumBuOaKnuOBl+OBvuOBl+OBn+OAguOBk+OBruOCsOODreODvOODkOODq+OBquaUr+aJleOB
hOaKgOihk+OBjOWIqeeUqOWPr+iDveOBp+OBguOCi+OBn+OCgeOBp+OBmeOAgua2iOiyu+iAheOA
geS8gealreOAgemHkeiejeapn+mWouOBq+OAguaUv+W6nOOBjOePvumHkeOChOWwj+WIh+aJi+OB
ruS7o+OCj+OCiuOBq+ODh+OCuOOCv+ODq+mAmuiyqOOCkuS9v+eUqOOBp+OBjeOCi+OCiOOBhuOB
q+OBl+OBvuOBmeOAgg0KDQpBVE0gVmlzYeOCq+ODvOODieOCkuS9v+eUqOOBl+OBpuaUr+aJleOB
hOOCkuihjOOBhuOCiOOBhuOBq+aJi+mFjeOBl+OBvuOBl+OBn+OAguOCq+ODvOODieOBr+eZuuih
jOOBleOCjOOAgeWIqeeUqOWPr+iDveOBquWuhemFjeS+v+OCteODvOODk+OCueOCkuS7i+OBl+OB
puebtOaOpeS9j+aJgOOBq+mAgeOCieOCjOOBvuOBmeOAguOBlOmAo+e1oeW+jOOAgTEsNTAwLDAw
MC4wMA0K57Gz44OJ44Or44Gu6YeR6aGN44GMIEFUTSBWaXNhIOOCq+ODvOODieOBq+i7oumAgeOB
leOCjOOBvuOBmeOAguOBk+OCjOOBq+OCiOOCiuOAgeOBiuS9j+OBvuOBhOOBruWbveOBriBBVE0g
44GL44KJIDEg5pel44GC44Gf44KK5bCR44Gq44GP44Go44KCIDEwLDAwMA0K57Gz44OJ44Or44KS
5byV44GN5Ye644GZ44GT44Go44Gn44CB44GK6YeR44KS5byV44GN5Ye644GZ44GT44Go44GM44Gn
44GN44G+44GZ44CC44GU6KaB5pyb44Gr5b+c44GY44Gm44CBMSDml6XjgYLjgZ/jgoogMjAsMDAw
LjAwDQrjg4njg6vjgb7jgafkuIrpmZDjgpLlvJXjgY3kuIrjgZLjgovjgZPjgajjgYzjgafjgY3j
gb7jgZnjgILjgZPjgozjgavplqLjgZfjgabjgIHlm73pmpvmlK/miZXjgYrjgojjgbPpgIHph5Hl
sYDjgavpgKPntaHjgZfjgIHopoHmsYLjgZXjgozjgZ/mg4XloLHjgpLmrKHjga7mlrnms5Xjgafm
j5DkvpvjgZnjgovlv4XopoHjgYzjgYLjgorjgb7jgZnjgIINCg0KMS7jgYLjgarjgZ/jga7jg5Xj
g6vjg43jg7zjg6AuLi4uLi4uLi4NCjIu44GC44Gq44Gf44Gu5a6M5YWo44Gq5L2P5omALi4uLi4u
Li4NCjMuIOWbveexjSAuLi4uLi4uLi4uLi4uLi4uLg0KNC7nlJ/lubTmnIjml6Xjg7vmgKfliKXi
gKbigKbigKbigKYNCjUu5bCC6ZaA5oCnLi4uLi4uLi4NCjYuIOmbu+ipseeVquWPtyAuLi4uLi4u
Li4uDQo3LiDlvqHnpL7jga7jg6Hjg7zjg6vjgqLjg4njg6zjgrnigKbigKYNCjgu5YCL5Lq644Gu
44Oh44O844Or44Ki44OJ44Os44K54oCm4oCmDQoNCg0K44GT44Gu44Kz44O844OJICjjg6rjg7Pj
gq86IENMSUVOVC05NjYvMTYpIOOCkuitmOWIpeOBmeOCi+OBq+OBr+OAgembu+WtkOODoeODvOOD
q+OBruS7tuWQjeOBqOOBl+OBpuS9v+eUqOOBl+OAgeS4iuiomOOBruaDheWgseOCkuasoeOBruW+
k+alreWToeOBq+aPkOS+m+OBl+OBpiBBVE0NClZpc2Eg44Kr44O844OJ44Gu55m66KGM44Go6YWN
6YCB44KS5L6d6aC844GX44Gm44GP44Gg44GV44GE44CCDQoNCumKgOihjOOBruaLheW9k+iAheOB
jOOBk+OBruaUr+aJleOBhOOCkui/vei3oeOBl+OAgeODoeODg+OCu+ODvOOCuOOCkuS6pOaPm+OB
l+OBpuOAgeizh+mHkeOBruOBleOCieOBquOCi+mBheW7tuOChOiqpOOBo+OBn+aWueWQkeS7mOOB
keOCkumYsuOBkOOBk+OBqOOBjOOBp+OBjeOCi+OCiOOBhuOBq+OAgeaWsOOBl+OBhOeVquWPt+OB
p+WAi+S6uuOBrumbu+WtkOODoeODvOODqw0K44Ki44OJ44Os44K544KS6ZaL44GP44GT44Go44KS
44GK5Yun44KB44GX44G+44GZ44CC5Lul5LiL44Gu6YCj57Wh5YWI5oOF5aCx44KS5L2/55So44GX
44Gm44CB44Om44OK44Kk44OG44OD44OJIOODkOODs+OCryDjgqrjg5Yg44Ki44OV44Oq44Kr44Gu
44Ko44O844K444Kn44Oz44OI44Gr5LuK44GZ44GQ44GU6YCj57Wh44GP44Gg44GV44GE44CCDQoN
CumAo+e1oeeqk+WPo++8muODiOODi+ODvOODu+OCqOODq+ODoeODq+awjw0K6KOc5YSf6YeR6YCB
6YeR6YOoIFVuaXRlZCBCYW5rIG9mIEFmcmljYSDpgKPntaHlhYjjg6Hjg7zjg6vjgqLjg4njg6zj
grk6ICwobXJ0b255ZWx1bWVsdTk4QGdtYWlsLmNvbSkNCg0K44GT44KM5Lul5LiK44Gu6YGF44KM
44KS6YG/44GR44KL44Gf44KB44Gr44CB44GT44Gu44Oh44O844Or44G444Gu6L+F6YCf44Gq5a++
5b+c44GM5b+F6KaB44Gn44GZ44CCDQoNCuaVrOWFtw0K44Kv44Oq44K544K/44Oq44O844OK44O7
44Ky44Kq44Or44Ku44Ko44OQ5aSr5Lq6DQo=
