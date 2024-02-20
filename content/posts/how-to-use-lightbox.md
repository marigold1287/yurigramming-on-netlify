+++
title = "lightboxを使う"
author = ["Marigold"]
description = "hugoでlightboxを使って画像を拡大表示する方法"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-21T01:02:35+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

画像の拡大表示をカッコよくできる。


## 公式HP {#公式hp}

<https://lokeshdhakar.com/projects/lightbox2/>


## インストール {#インストール}

<https://github.com/lokesh/lightbox2/releases> からzipファイルをダウンロードする。


## staticフォルダにファイルを移動する {#staticフォルダにファイルを移動する}

distフォルダの中身を `static/lightbox` フォルダに移動させる


## extend_ehad.html {#extend-ehad-dot-html}

`layouts/partials/exntend_head.html` を作成し、

```html
<link href="{{ .Site.BaseURL }}lightbox/css/lightbox.css" rel="stylesheet" />
<script src="{{ .Site.BaseURL }}lightbox/js/lightbox-plus-jquery.min.js"></script>
```

を追記する。


## 使用例 {#使用例}

```org
#+attr_html: :rel lightbox[1] :height 200
[[file:/home/kanta/org/static/img/20230715/20230715_1.jpg][file:/home/kanta/org/static/img/20230715/thumbnail/20230715_1.jpg]]
```

こんな風に使う。

同じページにある画像を複数グループに分けたいときは
`:rel lightbox[1]` `:rel lightbox[2]` のように分ける[^fn:1]。


## 関連 {#関連}

[imagemagickで画像の圧縮とサムネイルファイルを作るためのサンプルプログラム]({{< relref "#d41d8c" >}})

[^fn:1]: data-lightboxという属性を使うこともできるようだが、attr_htmlでは特定の属性しかエクスポートしてくれないようで使えない。
