+++
title = "github pagesを使ってhugoのホームページをdeployする"
author = ["Marigold"]
description = "github pagesでホームページをデプロイする"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-25T22:13:40+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

## GitHub Pagesの種類 {#github-pagesの種類}

[GitHub Pages](https://pages.github.com/)には

-   User
-   Organization
-   Project

Siteの3種類がある。User/Organization Siteは1つしか作れないが、Project Siteはいくつでも作れる。


### User Site {#user-site}

1.  リポジトリを作る

    名前は `username.github.io` としなくてはならない。
2.  htmlファイルを作る

    `index.html` というファイルを作って
    ```html
    <!--- index.html --->
    <h1>Hello!</h1>
    ```
    とでも書いてみる。
3.  コミットする
4.  アクセス

    <https://username.github.io/> でアクセスできる。（上手くいかない場合はSetting-Pages-Branch でブランチを `main` にしておく必要があるかもしれない）


### Project Site {#project-site}

1.  リポジトリの用意

    新しくリポジトリを作るか既存のリポジトリにアクセスする。User Pageと違ってリポジトリ名の制約はない
2.  htmlファイルを作る

    User Siteと作り方は同じ。
3.  リポジトリの設定

    Setting-Pages-Branch でブランチを `main` にする。
4.  アクセス

    <http://username.github.io/repository> でアクセスできる


### 参考 {#参考}

[GitHub Pages | Websites for you and your projects, hosted directly from your ...](https://pages.github.com/)


## deploy {#deploy}

ニ通りのやり方がある。


### (推奨)github actionを使う {#推奨--github-actionを使う}

githubにはソースとなるファイルをアップロードして、github actionでサイトをビルド、デプロイする。


#### gitリポジトリを作成 {#gitリポジトリを作成}

configファイルを設置しているディレクトリで `git init` を実行


#### publicフォルダを管理外に置く {#publicフォルダを管理外に置く}

```bash
echo "/public" > .gitignore
```

でpublicフォルダを管理外におく。


#### ファイルを追加し、コミットする {#ファイルを追加し-コミットする}

```bash
git add .
git commit -m "first commit"
```


#### githubでリポジトリを作成する {#githubでリポジトリを作成する}

```bash
git remote add origin URL
```

でリモートリポジトリを追加する。


#### pushする {#pushする}

```bash
git push origin main
```


#### Github actionsの設定 {#github-actionsの設定}

githubにて `Settings-Pages-Build and deployment` とたどって
Github Actionsを選択する。

選択肢の中にある `hugo` をクリックすると
`pages.yml` というworkflowが自動で生成されるのでcommitする。


#### workflowファイルをpullしてローカルにコピーする {#workflowファイルをpullしてローカルにコピーする}

```bash
git pull origin main
```

ここでエラーが出る場合、ひとまず `git config pull.rebase false` とするか、
`git config --global` としてconfigファイルに書いてしまっても良い。


#### 完了 {#完了}

これで `push` するたびにサイトが生成されるようになる。


#### shell script {#shell-script}

以下のシェルスクリプトを site フォルダ（configのあるフォルダ）に保存して実行する。引数にcommit時のコメントを取る。なければ現在時刻をコメントにする。

```shell
#!bin/bash

cd `dirname $0`

git add .

if [ $# = 0 ]; then
    COMMENT=`date +%Y%m%d%H%M%S`
else
    COMMENT=$1
fi

git commit -m ${COMMENT}

git push origin main
```


### (旧)publicフォルダをpushする。 {#旧--publicフォルダをpushする}

[hugoを使ってhomepageを作成する]({{< relref "how-to-use-hugo" >}})で説明した `public` フォルダの中身ををpushする。


#### config.toml {#config-dot-toml}

baseURLをgithub pagesのURLに書き換える。

```toml
baseURL = 'https://username.github.io/'
```


#### repositoryにpublicフォルダを追加する {#repositoryにpublicフォルダを追加する}

public フォルダを削除する

```bash
rm -rf public
```

submoduleとしてpublicフォルダを追加する

```bash
git submodule add https://github.com/username/username.github.io.git public
```


#### サイトをビルドする {#サイトをビルドする}

config.tomlの置いてあるディレクトリで `hugo` を実行してサイトをビルドする。


#### 変更をコミットする {#変更をコミットする}

`public` フォルダに入り

```bash
git add .
git commit -m "My First Site Build"
```


#### deployする {#deployする}

```bash
git push
```

でリモートへプッシュする。


#### 記事を削除する {#記事を削除する}

`my-second-post.md` のように消したい記事を `content` 内から削除する。その後、 `hugo` でページを構築して `commit` , `push` を行う。これでページ上からは表示されなくなるが、git上に `html` のファイルが残ってしまっているため、アドレスを直打ちすればアクセスできてしまう。

`hugo --cleanDestinationDir` を実行すればpublicフォルダ内の余計なファイルを削除したうえで再構築してくれる。ただし、これをやるとgithubpageにpushする時に必要な.gitファイルまで消えてしまうので注意。

なお、 `static` フォルダ内に .gitファイルをコピーしておくとコマンドを実行しても残っていてくれるようになる。


## ref {#ref}

-   [Quick Start | Hugo](https://gohugo.io/getting-started/quick-start/)
-   [Host on GitHub | Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
-   [Git 2.27 での git pull 時の warning について - Qiita](https://qiita.com/tearoom6/items/0237080aaf2ad46b1963) gitエラー時の対処法
