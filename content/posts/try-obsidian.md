+++
title = "obsidianを使ってみる"
author = ["Marigold"]
description = "zettelkasten的な運用ができる有名なツールにobsidianがある。試しに使ってみたけど結局emacsによる運用を続けることにした。"
date = 2023-12-28T21:37:00+09:00
lastmod = 2024-02-25T22:13:41+09:00
tags = ["management"]
categories = ["article"]
draft = false
+++

## 概要 {#概要}

zettelkastenシステムを実現するためのツールの一つ。
emacs至上主義者のわたしがorg-roamより優れたツールなのでは？[^fn:1]と思い使用してみたのだが、やっぱりemacsに慣れ親しみすぎていて思うように使いこなせていない。


## インストール {#インストール}

ubuntuに導入する。

<https://obsidian.md/download>からlinux用のファイルをダウンロード。なお、snapはサポートしていませんと表示される。
debは試していないが、dpkgかaptでインストールできると思われる。

```bash
sudo apt install <ダンロードしたファイル.deb>
```

一番ラクなのは第一候補になっているappimageを使う方法だろう。まず、実行権限を付与する。

```bash
chmod a+x hogehoge.AppImage
```

あとは実行するだけ

```bash
./hogehoge.AppImage
```


## 使用感 {#使用感}

会員登録をする必要はないように感じる。有料版を使用するなら別だが。

起動したら手順に従ってVaultを作る。あとはここにノートを貯めていくだけなのだが...。使い勝手はどうかと言うと、少なくともemacsよりは遥かに劣る。これは慣れの問題なのかもしれない。でも、あれだけemacsとorg-roamの問題点をあげつらってきたのを後悔している。少し触ってすぐに気づいたのだが、結局、本質的にはobsidianもorg-roamもできることは同じなのだ。
backlinkにせよ、graph viewにせよ...ノードが多いとgraphが重くなるのも同じだ。

そうなるとわざわざ今のやり方を変える必要があるのかとなってしまう。キーボードショートカットをemacsに合わせようかと思っても、
emacsのように複雑なコマンドは設定できない。
emacsでobsidianを操作するための[パッケージ](https://github.com/licht1stein/obsidian.el)もある。でも、これはorg-roamのmd版といったような感じで悪くはないのだが、
org-modeで編集できるorg-roamのほうがはるかに文章を書きやすい。


## org-roamからの移行を試みる {#org-roamからの移行を試みる}

操作性の問題に加えて、移行の問題がある。これに関しても[移行用のプログラム](https://github.com/goshatch/orgroam_to_obsidian)があって、以下に使い方を書いておく。

まず、プログラムをダウンロードする

```bash
git clone git@github.com:goshatch/orgroam_to_obsidian.git
```

ディレクトリに入る

```bash
cd orgroam_to_obsidian/
```

rog-roam.dbとroamディレクトリをinput内にコピーする

```bash
cp ~/.emacs.d/.local/cache/org-roam.db input/
cp -R ~/org/roam input/
```

rubyとruby-bundler、pundocが必要になるのでaptでインストールする。

```bash
sudo apt install ruby
sudo apt install ruby-bundler
sudo apt install pandoc
```

あとは以下を実行

```bash
bundle install
./convert.rb
```

これでoutputフォルダの中に変換されたmdファイルが生成される。ファイル間のリンクはおそらく問題ない。ただ、画像ファイルなどはリンクの貼り直しが必要になる。

org側では

```text
[[file:/home/kanta/org/static/img/20231118/20231118_2.jpg][file:/home/kanta/org/static/img/20231118/thumbnail/20231118_2.jpg]]
```

のようになっているのだが、mdファイルでは

```text
[![](/home/kanta/org/static/img/20231109/thumbnail/20231109_1.jpg)](file:/home/kanta/org/static/img/20231109/20231109_1.jpg)
```

こうなる。

画像を表示させるためには

```text
![img](file:/home/kanta/org/static/img/20231104/thumbnail/20231104_5.jpg)
```

という風に修正が必要。imgの部分は画像の説明なのでなんでもいい。


## まとめ {#まとめ}

結局、ツールの問題ではなくてわたしのノートのとり方と整理の仕方に課題があるのだろうと思う。やっぱり浮気は良くない。でも、浮気したからこそorg-roamの良いところを見いだせたように感じる。

[^fn:1]: 私が思っていた[org-roamの問題点]({{< relref "problem-org-roam" >}})
