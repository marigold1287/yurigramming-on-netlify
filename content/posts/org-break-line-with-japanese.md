+++
title = "和文で書かれたorgファイルの改行について"
author = ["Marigold"]
description = "org-modeで日本語が改行されたときの仕様について調べたこと"
date = 2024-02-21T01:02:00+09:00
lastmod = 2024-02-25T22:13:41+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

`#+:OPTIONS: \n:nil` とすると、 \\(\TeX\\) 文書と同じように1つの改行は1つの空白となる。なので、

```nil
I love
Aikatsu
```

は、

```nil
I love Aikatsu
```

のように表示される。これが日本語になると、

```nil
私はアイカツが
好きです。
```

が

```nil
私はアイカツが 好きです。
```

となって、「が」と「好」の間にスペースが入ってしまう。要するにこの機能は文書が英文であることを前提にしているのだ。

私はhugoを使っているのでそれも含めて対処法をわかる範囲で記す。


## ox-hugoを使ってmdファイルを生成する時 {#ox-hugoを使ってmdファイルを生成する時}

localeを日本にする。これは `.bashrc` に以下を追記し他の言語設定をコメントアウトするなり削除すればよい。

```bash
export LANGUAGE=ja_JP.UTF-8
```

あるいは各orgファイルに

```nil
#+hugo_locale: ja
```

というオプションを加えても良い。いずれかを適用することでエクスポート `C-c C-e H H` 時に余計な空白が入らなくなる。

例えばorgファイル上で

```nil
私はアイカツが
好きです。
```

と書いたとする。localeが `ja` の状態でエクスポートすると `.md` ファイルは

```nil
私はアイカツが好きです。
```

と1文でつながった状態に出力されるようになる。 `en` の状態では

```nil
私はアイカツが
好きです。
```

と出力される。これでは「が」と「好」の間に空白が入ってしまう。

[CJK Support — ox-hugo - Org to Hugo exporter](https://ox-hugo.scripter.co/doc/cjk-support/)


## orgファイルを直接hugoのcontentsフォルダに保存する場合 {#orgファイルを直接hugoのcontentsフォルダに保存する場合}

hugoではorgファイルを直接使用することもできる。こうする場合は

```nil
#+OPTIONS: ealb:t
```

というオプションを各orgファイルに追加する。ealbは `east asian line break` の意味。

<https://niklasfasching.github.io/go-org/#east_asian_line_breaks.org>


## orgファイルをhtmlに変換する場合 {#orgファイルをhtmlに変換する場合}

残念ながら `C-c C-e h h` を使う場合の解決策がわからない。

`\n:t` とすると、orgファイル上で改行が挿入された箇所に `<br />` が挿入されるのだが、
`nil` にすると何も挿入されなくなる。しかしhtmlファイル内では改行された状態で出力されてしまい、さらに改行はスペースに置換されるルールになっているようなので、どうしても間にスペースが入ってしまう。

つまりorgファイル上の

```nil
わたしはアイカツが
好きです。
```

が `\n:nil` の状態でhtmlに変換すると

```nil
<p>
わたしはアイカツが
好きです。
</p>
```

となって、これをブラウザで表示すると改行はスペースに置き換わるので

```nil
わたしはアイカツが 好きです。
```

となるのである。エクスポートの設定で
CJKとか改行に関するものがあれば解決できるのかもしれないが現時点では解決法がわからない。

<https://uwabami.github.io/cc-env/Emacs.html> は一つの解決策を提示しているように見える。


## hugoの改行設定 {#hugoの改行設定}

hugoのコンフィグファイルに、 `hardWraps` というオプションがあり有効にすると改行箇所がそのまま改行されるようになる。

```toml
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      hardWraps = false
```

この設定について注意すべき点を2つ記す。端的に言うと \\(\TeX\\) 的な記法を使いたいなら

1.  `#+begin_verse` は使わない
2.  `hardWraps = false`

にするとよい


### #+begin_verse {#plus-begin-verse}

例えば

```org
#+begin_verse
私はアイカツが
好きです。
#+end_verse
```

と書いたとすると、 `.md` として出力されるのは

```nil
<div class="verse">

私はアイカツが<br />
好きです。<br />

</div>
```

なのだが `hardWraps = false` になっていると `<br />` は空白に置き換わってしまう。そうなると結局は `locale` を `en` にした場合と同じになって、「が」と「好」の間に空白が入ってしまう。

この問題は `verse` を使うのではなくて `src` を使えば解決する。少なくとも私が使っているthemeでは `src` のほうが見栄えも良い。


### 行頭に英文が来る場合 {#行頭に英文が来る場合}

和文で書いているとは言っても行頭に英単語などが来る場合がある。

```org
わたしは
Aikatsu が好きです。
```

これを `.md` に変換するとlocaleに関わらず

```nil
わたしは
Aikatsu が好きです。
```

と出力される。すると改行はスペースに変換されるので

```nil
わたしは Aikatsu が好きです。
```

と表示される。行頭に英単語が来る場合にはlocaleに関係なく正しく表示されるのだ。

困るのは `hardWrap = true` にした場合でこの時は改行がそのまま表示されるので

```nil
わたしは
Aikatsu が好きです。
```

となってしまう。

[hugoの改行をgithub風に変更する](https://blog.blackcoffy.net/posts/configure-hugo-newline)


## メモ {#メモ}

org-modeを使い始めた時には空白行を挟まないと改行されないという仕様が不可解に思えて `\n:t` オプションを有効化していたが、 \\(\TeX\\) の記法について勉強してこの記法がデフォルト設定になっている意味が分かった気がする。エディタ上では読みやすいように適当に改行を打っておいて、出力する時には段落ごとに1つの文章にまとめてくれるというのはたしかに上手く使えれば便利だし活用していきたい。

大分整理ができたように感じるのでしばらくはこのやり方でやってみようかな。
