+++
title = "twitter cardの設定"
author = ["Marigold"]
description = "twitterカードで表示する画像について"
date = 2024-02-21T23:09:00+09:00
lastmod = 2024-02-24T13:11:38+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

これもPaperModの場合。

記事ごとに設定するなら、.mdファイルのfront matterに

```toml
cover.image = "/path/to/img.jpg"

cover.image = "/img/20230715/20230715_14.jpg"
```

のように追加する。staticからの相対パス。

ox-hugoを使っているなら、PROPERTYとして

```org
:EXPORT_HUGO_CUSTOM_FRONT_MATTER: :cover.image "/img/20230715/20230715_14.jpg"
```

を追加する。

記事一覧や記事の上部に画像を表示したくないなら、
config.tomlに

```toml
[params]
cover.hidden = true             #twitterカード用の画像を記事上で非表示するかどうか
```

を追記する。

こんな感じ

{{<tweet user="marigold1332" id="1760302820635652284" >}}


## 参考 {#参考}

<https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-features/#post-cover-image>
