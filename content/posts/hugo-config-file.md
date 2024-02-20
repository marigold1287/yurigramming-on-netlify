+++
title = "hugoのconfig.toml"
author = ["Marigold"]
description = "papermodの設定について"
date = 2024-02-21T01:02:00+09:00
lastmod = 2024-02-21T01:02:35+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

使っているThemeによるので、[PaperMod](https://github.com/adityatelange/hugo-PaperMod/)の場合ということになる。


## 改行 {#改行}

```toml
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      hardWraps = true
```

[HugoのMarkdownでGitHub的改行をしたい - Qiita](https://qiita.com/sijiaoh/items/3dcbbed720a2fc668ca8)


## メインセクション {#メインセクション}

```toml
mainSections = ['posts']
```

トップページに表示される記事のセクションを選ぶ。
configで設定できるが、何も設定しなければ最も記事の数が多いセクションが選ばれる。

<https://gohugo.io/functions/collections/where/#mainsections>


## parameter {#parameter}

```toml
[params]
env = "production"              #enhanced SEO
ShowPostNavLinks = true
ShowBreadCrumbs = true
ShowCodeCopyButtons = true
showtoc = true                  #table of contents
ShowShareButtons = true         #share用のsnsボタン
cover.hidden = true             #twitterカード用の画像を記事上で非表示するかどうか
```


## トップページにSNSアイコンを配置 {#トップページにsnsアイコンを配置}

```toml
[[params.socialIcons]]
name = "twitter"
url =  "https://twitter.com/marigold1332"
```


## メニューボタン {#メニューボタン}

```toml
[[menu.main]]
identifier = "a"
name = "diary"
url="/categories/diary"
weight = 1
[[menu.main]]
identifier = "post"
name = "article"
url="/categories/article"
weight = 10
[[menu.main]]
identifier = "Tag"
name = "Tag"
url="/tags/"
weight = 20
[[menu.main]]
identifier = "Categories"
name = "Categories"
url="/categories/"
weight = 20
[[menu.main]]
identifier = "Archive"
name = "Archive"
url="/Archives/"
weight = 30
[[menu.main]]
identifier = "Search"
name = "search"
url="/search/"
weight = 40
```
