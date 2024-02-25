+++
title = "hugoのBundleとstaticファイルのエクスポート先"
author = ["Marigold"]
description = "hugoのBundle機能に関する説明とox-hugoでBundle機能をどのように使用するかについてまとめた。"
date = 2024-01-05T14:16:00+09:00
lastmod = 2024-02-25T22:13:40+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

Branch / Leaf Bundleをうまく使うことでContentを構造化して管理できる[^fn:1] <sup>, </sup>[^fn:2]。


## 前提 {#前提}

このような構造になっているとする。

```text
content/posts/
└── mountaineering/
    ├── _index.md (mountaineering ブランチのコンテンツ)
    ├── mount-tsukuba/
    │   ├── index.md (mount-tsukuba リーフブランチのコンテンツ)
    │   └── images/
    │       ├── tsukuba-1.jpg
    │       └── tsukuba-2.jpg
    ├── mount-fuji/
    │   ├── index.md (mount-fuji リーフブランチのコンテンツ)
    │   └── images/
    │       ├── fuji-1.jpg
    │       └── fuji-2.jpg
    └── ...
```


## Branch {#branch}

Branch Bundleには `_index.md` ファイルを作る。この状態で
`/posts/mountaineering/` にアクセスすると mountaineering ブランチに含まれる記事の一覧を表示できる。


## Leaf {#leaf}

mount-tsukuba と mount-fuji は Leaf Bundle で、 `index.md` に記事を書く。
`/posts/mountaineering/mount-fuji/` にアクセスすると `index.md` の本文が表示される。


## BranchとLeafは共存できない {#branchとleafは共存できない}

当然といえば当然だが、両方同時には存在できない。
`_index.md` はBranchで、 `index.md` はLeafになる。
index.mdのあるフォルダよりも深くに.mdファイルを含むフォルダを作ることは普通しない。


## Branch内のリソースに別のBranchからアクセスすることはできない {#branch内のリソースに別のbranchからアクセスすることはできない}

BranchやLeafには画像などのリソースも保存することができる[^fn:3]。このリソースには別の枝葉からはアクセスできない。枝葉に直接関連するファイルをだけを同じ場所に置く。


## ox-hugoとの連携 {#ox-hugoとの連携}

ox-hugoでこの機能を使いたい場合、 org file は次のようにするといい。

```org
* 登山
   :PROPERTIES:
   :EXPORT_HUGO_BUNDLE: mountaineering
   :END:
** 登山
:PROPERTIES:
:EXPORT_FILE_NAME: _index
:END:
これがブランチになる
** 筑波
:PROPERTIES:
:EXPORT_HUGO_BUNDLE: mount-tsukuba
:EXPORT_FILE_NAME: index
:END:
これはリーフ

[[file:~/path/to/mount-tsukuba/img/B.jpg][パス上にBundle名が含まれていればcontent内でも構造が維持される。]]

[[file:~/path/to/static/mount-tsukuba/img/C.jpg][static内にBundleと同じディレクトリがあってもstatic内に出力される]]

[[file:~/path/to/static/A.jpg][static内にあるファイルはstaticに入る]]

https://ox-hugo.scripter.co/doc/images-in-content/
```

`:EXPORT_HUGO_BUNDLE:` プロパティは親から継承されるので、登山サブツリーは
`mountaineering/_index.md` として、筑波サブツリーは `mountaineering/mount-tsukuba/index.md` に出力される[^fn:4]。


## 静的ファイルのエクスポート先 {#静的ファイルのエクスポート先}

筑波サブツリーをエクスポートした時の画像の保存先を説明する。

1.  画像パス上に Bundle 名と同じディレクトリがある場合、
    content内でもディレクトリ構造が維持される。
2.  staticという名前のフォルダがパス上にあったらstatic内に入れられる。このときもディレクトリ構造は維持される。
3.  画像パス上に Bundle 名も staticもない場合は
    `org-hugo-default-static-subdirectory-for-externals` で設定されたフォルダがstaticフォルダの下に生成されそこに保存される。デフォルトは `ox-hugo` 。注意しなくてはいけないのは、 **`ox-hugo` の直下** にすべてのデータが保存されてしまうため、元のディレクトリ構造が保持されない。また、同じファイル名のファイルは上書きされることになるので注意すること。


## Bundleを使うかどうか {#bundleを使うかどうか}

[Hugo: Leaf and Branch Bundles ❚ A Scripter's Notes](https://scripter.co/hugo-leaf-and-branch-bundles/#so-which-bundle-should-i-use)を見て決めるのが良い。要はstaticファイルとmarkdownを1つにまとめて管理したければ使えばいいし、そうでないなら無理に使うことはないということ。

少なくともstaticファイルがない記事をBundleにする必要はない。

画像を1箇所にまとめておくやりかたにもメリットはあると思うのでこのサイトでは
Bundle機能を使っていない。

[^fn:1]: [Page Bundles | Hugo](https://gohugo.io/content-management/page-bundles/)
[^fn:2]: [Content Organization | Hugo](https://gohugo.io/content-management/organization/)
[^fn:3]: [Page Resources | Hugo](https://gohugo.io/content-management/page-resources/)
[^fn:4]: ox-hugoでは `:EXPORT_FILE_NAME:` をネストさせることを想定していないのでこのような構造にするのがベストと思われる。
    <https://ox-hugo.scripter.co/#before-you-export> を参照。
