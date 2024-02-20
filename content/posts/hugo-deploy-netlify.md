+++
title = "netlifyを使ってhugoのホームページをdeployする"
author = ["Marigold"]
description = "netlifyを使ってホームページをデプロイする"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-21T01:02:35+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

あらかじめ[githubのリポジトリを作って](https://github.com/new)おいて、
deployに必要なファイルをプッシュしておく。
([github pagesを使ってhugoのホームページをdeployする]({{< relref "hugo-deploy-github-pages" >}})を参考)


## netlify.toml {#netlify-dot-toml}

netlifyでdeployするときの設定をまとめたファイル。これをnetlify.tomlという名前でconfig.tomlと同じ場所に置いてプッシュする。

```toml
[build]
publish = "public"
command = "hugo --gc --minify"

[build.environment]
HUGO_VERSION = "0.122.0"

[context.production.environment]
HUGO_ENV           = "production"
HUGO_ENABLEGITINFO = "true"

[context.split1]
command = "hugo --gc --minify --enableGitInfo"

[context.split1.environment]
HUGO_ENV = "production"

[context.deploy-preview]
command = "hugo --gc --minify --buildFuture -b $DEPLOY_PRIME_URL"

[context.branch-deploy]
command = "hugo --gc --minify -b $DEPLOY_PRIME_URL"

[context.next.environment]
HUGO_ENABLEGITINFO = "true"

[[redirects]]
from   = "/npmjs/*"
to     = "/npmjs/"
status = 200
```


## deploy {#deploy}

1.  netlifyにログイン後、
    `Team overview - Add new site - Import an existing project`
    を選択
2.  Githubを選択。
3.  リポジトリを選ぶ
4.  各種設定を終えたらDeployをクリック
    -   ブランチを選択
    -   Base Directoryはサブディレクトリからデプロイする場合に必要。空白でも良い。
    -   ビルドコマンドはHugoの公式にある `hugo --gc --minify` とする
    -   Publish directoryはpublic。
    -   hugoのconfigファイルにあるBaseURLをnetlifyのサイトURLに書き換える


## 参考 {#参考}

-   [Hugo on Netlify | Netlify Docs](https://docs.netlify.com/integrations/frameworks/hugo/#app)

-[ Host on Netlify | Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/)
