+++
title = "ox-hugoでのexport機能とリンクの解決方法について"
author = ["Marigold"]
description = "org-roamを使っているとIDリンクを含む文章を書く機会が多くなる。ただ、リンクを含んだ記事をエクスポートしようとしてかなり苦戦したためここで整理しておく。"
date = 2024-01-04T18:24:29+09:00
lastmod = 2024-02-25T22:13:39+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

## 要点 {#要点}

[ox-hugo](https://ox-hugo.scripter.co/doc/blogging-flow/)は One post per Org subtree を推奨している。リンクのことで面倒な思いをしたことがあるなら
1つのorg fileにすべての記事をまとめて
`C-c C-e H H` でエクスポートするのが良い。


## 前提 {#前提}

org-fileは `org_files` というディレクトリの中に入っている。

```org
- org_files
  - all-posts.org
  - another-posts.org
  - sub_directory
    - sub-post.org
```

`all-posts.org` は

```text
#+title: all-posts
* subtree1
   :PROPERTIES:
   :ID: A
   :EXPORT_FILE_NAME: AAA
   :END:
   [[ID:C][link to another-posts]]
* subtree2
   :PROPERTIES:
   :ID: B
   :EXPORT_FILE_NAME: BBB
   :END:
   [[ID:A][link to subtree1]]
* subtree3
   :PROPERTIES:
   :ID: D
   :EXPORT_FILE_NAME: DDD
   :END:
   [[ID:Z][link to subpost]]
```

`another-posts.org` は

```text
#+title: another-posts
* anothertree
   :PROPERTIES:
   :ID: C
   :EXPORT_FILE_NAME: CCC
   :END:
```

となっている。

`sub_directory` の中には

```text
:PROPERTIES:
:ID: Z
:EXPORT_FILE_NAME: ZZZ
:END:
```

という `sub-post.org` が入っている。


## ファイルをまるごとエクスポートする {#ファイルをまるごとエクスポートする}

`C-c C-e H h` 。ただ、[ox-hugoの推奨](https://ox-hugo.scripter.co/doc/blogging-flow/)は One post per Org subtree である。このやり方は One post per Org fileを前提としている。

`all-posts.org` をエクスポートするとそれぞれのリンクは

-   another-posts:
    [link to another-posts]({{&lt; relref "CCC.md#CCC" &gt;}})
-   subtree1:
    `[link to subtree1](#AAA)`
-   sub_directory/sub-post:
    [link to subpost]({{&lt; relref "sub_directory/sub-post.md" &gt;}})

となる。一番最後の例がわかりやすいが、hugoのcontentディレクトリとorgディレクトリの構造は同じでないといけない。それさえ注意すれば問題ないのだが、すべてのファイルをもれなくエクスポートしないとリンク切れのエラーが出てサイトのビルドができないので注意。私の経験上One post per Org fileはpostが増えたりpost間のリンクが多くなってくると管理が困難になる。

なお、一番目と二番目の#はAnchorになっていて見出しへのリンクになる[^fn:1]。


## サブツリーをエクスポートする {#サブツリーをエクスポートする}

`C-c C-e H H` 。 `EXPORT_FILE_NAME` プロパティが存在するサブツリーで実行した時はサブツリーが、無い時にはファイルがエクスポートされる。

subtree2を出力すると

\`[link]({{&lt; relref "AAA" &gt;}})\`

となって正しいリンクが作られる。

ただし、別のファイルや別のファイルのサブツリーへのリンクは解決できない。
subtree1から別ファイルのanothertreeへのリンクが貼られている。このリンクはemacs上ではたどることが出来るが
subtree1をエクスポートした時につくられるmdファイルは

```text
[link]({{< relref "#d41d8c" >}})
```

となっていてよく分からないアンカーが作られる[^fn:2]。

サブツリーを出力するやり方はあくまでもox-hugoが推奨しているすべての記事が1つのorg-fileに存在していることが前提になっているのだろう。


### サブツリー内にある外部ファイルへのリンクを解決するには {#サブツリー内にある外部ファイルへのリンクを解決するには}

色々調べている[^fn:3] <sup>, </sup>[^fn:4]と解決策もあることはある。

`another-posts.org` を

```text
#+title: another-posts
* anothertree
   :PROPERTIES:
   :ID: C
   :EXPORT_FILE_NAME: CCC
   :CUSTOM_ID: anothertree
   :END:
```

として、 `subtree1` は

```text
* subtree1
   :PROPERTIES:
   :ID: A
   :EXPORT_FILE_NAME: AAA
   :END:
   [[file:onother-posts.org::#anothertree][link to another-posts]]
```

とするようだ。

まず、ファイルが外部にあるのでファイルパスを指定する。そのあとにサブツリーへのリンクにしたければCUSTOM_IDが見出しへのリンクになってくれる。いずれにせよファイル名を書いておかないといけないのでファイルを移動させたりファイル名を変えたりした時にはリンクを手動で書き換えるしか無い。

このやり方は One post per Org subtree と One post per Org file を足して2で割ったような感じだが管理が面倒になるのでやらないほうが良さそう。


### 注意 エクスポート時のScopeは変えないこと {#注意-エクスポート時のscopeは変えないこと}

ファイルをエクスポートする `C-c C-e H h` を使うときに
`C-s` で Scope をサブツリーにすればサブツリーを出力できる。

ただし、このやり方はあくまで1つのファイルから1つのmdファイルを生成するためのもので
Scopeを変えるとリンクの解決ができなくなる。

たとえば、1つのファイル（ファイル名は `all-posts.org` ）の中に

```text
* subtree1
   :PROPERTIES:
   :ID: A
   :END:

* subtree2
   :PROPERTIES:
   :ID: B
   :END:
   [[ID:A][link]]
```

と書いてあって、AとBをこのやり方でエクスポートしてみる。

そうするとリンクの部分は

[link]({{&lt; relref "all-posts.md" &gt;}})

となってしまってリンクが解決できないというエラーが出てサイトのBuildもできなくなってしまう。あくまでもファイル単位で出力する機能なのでリンク先もファイルになってしまうということだろうか。

ox-hugoを使う時はScopeをいじらないほうが良い。


## roamとの連携 {#roamとの連携}

ox-hugoは One post per Org subtree だが
org-roamは One node per Org file とでもいうべき管理法を推奨していて相容れない。

roamのメモをまるごとエクスポートしたようなサイトをデジタルガーデンと言って調べれば驚嘆するようなサイトを多数見つけることが出来る。ただ、ox-hugoでroamのメモを一度に出力するには自前でlispプログラムを書かないといけないので大変な作業になると思ったほうがいい。

今の私は

-   roamにメモを書き溜める。
-   書き溜めたメモをhugoの記事に清書してパーマネントノートにする。記事はox-hugoの推奨通りOne post per Org subtreeで管理する。
-   不要になったメモを捨てる。

がいいんじゃないかと思っている。

[^fn:1]: Anchorの命名には優先順位があって EXPORT_FILE_NAME, CUSTOM_ID, 見出し名 の順。詳細は <https://ox-hugo.scripter.co/doc/anchors/> を参照
[^fn:2]: このおかげでリンク切れがあってもサイトが表示できるようになっている。
[^fn:3]: <https://github.com/kaushalmodi/ox-hugo/blob/cb1b6cfd7b080e889352150416c1725f11ba937a/test/site/content-org/issues/issue-542.org#L23>
[^fn:4]: <https://ox-hugo.scripter.co/test/posts/links-outside-the-same-post/>
