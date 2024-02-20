+++
title = "hugoを使ってhomepageを作成する"
author = ["Marigold"]
description = "hugoを使って簡単なホームページを作成するチュートリアル"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-21T01:02:35+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

静的サイトジェネレータ[Hugo](https://gohugo.io/)を使ってホームページを作成する。


## インストール {#インストール}

ubuntuなら

```shell
sudo snap install hugo
```

windowsなら <https://github.com/gohugoio/hugo> からwindows用のzipファイルをダウンロードして解凍する。


## ホームページの作成 {#ホームページの作成}

ホームページを作成したいディレクトリで

`hugo new site SITENAME`

を実行すると、 `SITENAME` というフォルダが作成される。

中を見ると

```bash
ls SITENAME
archetypes/  config.toml*  content/  data/  layouts/  public/  static/  themes/
```

となっている。


## 記事を投稿する {#記事を投稿する}

まだ骨組みしかない状態なので新しいコンテンツを追加する。

```shell
hugo new posts/my-first-post.md
```

を実行すると `contents/posts` にmarkdownファイルが作成される。ファイルを開いて、 `---` の下に適当な本文を書いて、draftを `true` から `false` に設定する。


## ホームページを確認する {#ホームページを確認する}

`config.toml` が保存されているディレクトリで

```bash
hugo server
```

を実行する。

<http://localhost:1313/> にアクセスすると作成されたホームページを確認することができる。


## Themeを導入する {#themeを導入する}

このままでは味気ないのでテーマを導入する。
[公式HP](https://themes.gohugo.io/)に色々なテーマがあるので好みのものを見つける。

ここでは私が使っている[Hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)を使うことにする。このテーマは見た目が綺麗なのはもちろんのこと各種説明も充実していて使い勝手が非常に良いのでオススメ。インストールの方法も以下に分かりやすくまとめられている([Installation | Update | PaperMod](https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-installation/))

設定方法などは[hugoのtheme-hugo papermod-]({{< relref "hugo-papermod-theme" >}})も参照。

テーマを有効化するために `config.toml` に `theme = "Papermod"` を追記する(値はフォルダ名と同じにする)。


## サイトをビルドする {#サイトをビルドする}

`hugo` コマンドでサイトをビルドすることができ、結果は `public` フォルダに保存される。

これをサーバーにアップロードすればホームページを公開することが出来る。

先に作っておいたgithub pagesのリポジトリにビルド結果を `push` する手順を示す。

1.  `config.toml` の `baseURL` を先に作ったgithub pageのURLに書き換える。
    `https://username.github.io/` あるいは `http://username.github.io/repository` のいずれか
2.  `public` フォルダを削除する
3.  `git submodule add https://github.com/username/username.github.io.git public` を実行する
4.  `hugo` を実行してサイトをビルドする。
5.  `public` フォルダに入り `git add .` 、 `git commit -m "My First Site Build"` を実行してコミットまで済ませる。
6.  `git push` でリモートへプッシュする。
