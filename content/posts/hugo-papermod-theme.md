+++
title = "hugoのtheme-hugo papermod-"
author = ["Marigold"]
description = "このホームページで使っているthemeと設定について"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-21T23:12:11+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

## 公式 {#公式}

-   <https://github.com/adityatelange/hugo-PaperMod/>
-   <https://themes.gohugo.io/themes/hugo-papermod/>


## インストール {#インストール}

<https://github.com/adityatelange/hugo-PaperMod/wiki/Installation> ではサブモジュールとしてのインストールを推奨している。

config.tomlのあるフォルダに移動して、

```bash
git init

git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod

git submodule update --init --recursive
# needed when you reclone your repo (submodules may not get cloned automatically)
```


## アップデート {#アップデート}

同じくconfig.tomlのあるフォルダに移動して、

```bash
git submodule update --remote --merge
```


## テーマの有効化 {#テーマの有効化}

`config.toml` に `theme = "Papermod"` を追記する(値はフォルダ名と同じにする)。


## layoutsの読み込み優先順位 {#layoutsの読み込み優先順位}

`/layouts` 内が最優先。次に `/themes/Papermod/layouts` を読み込む。

カスタムしたいときには `/layouts` にファイルをコピーして編集すればよいが、こういうやり方をするときの注意として、themeをアップデートしたときに当該ファイルの更新を手動で実施する必要がある。


## カスタマイズ {#カスタマイズ}

-   [LastModを表示する]({{< relref "papermod-with-lastmod" >}})
-   [Papermodのcustom css]({{< relref "papermod-custom-css" >}})
-   [lightboxを使う]({{< relref "how-to-use-lightbox" >}})
-   [twitter cardの設定]({{< relref "hugo-papermod-twitter-card" >}})
-   [mathjaxによる数式表示]({{< relref "hugo-papermod-mathjax" >}})
