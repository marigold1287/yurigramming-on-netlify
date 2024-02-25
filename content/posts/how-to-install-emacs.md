+++
title = "emacsのインストール方法"
author = ["Marigold"]
description = "emacsのインストール方法。snapでインストールするのが一番良い。WSLではX Serverとか日本語入力の設定がかなり面倒。"
date = 2024-01-05T00:08:11+09:00
lastmod = 2024-02-25T22:13:41+09:00
tags = ["emacs"]
categories = ["article"]
draft = false
+++

## ubuntu {#ubuntu}


### snap {#snap}

snapを使えば最新版をインストールできる。

```shell
sudo snap  install --classic  emacs
```

このとき、旧バージョンが起動しないように

```shell
if [ -f /snap/bin/emacs ]; then
    alias emacs='/snap/bin/emacs'
fi
```

を `.bashrc` に設定しておくとよい。


### apt {#apt}

`sudo apt install emacs` ただし、最新バージョンではない可能性が高い。
aptではversion28まではリポジトリの追加ができたのだが、2023/12時点では29に対応していない。
[How to Install GNU Emacs 28.1 in Ubuntu 22.04 | 20.04 | UbuntuHandbook](https://ubuntuhandbook.org/index.php/2022/06/install-gnu-emacs-28-1-ubuntu-22-04-20-04/)

```shell
# uninstall。これをしないとエラーになるので注意。
sudo apt remove --autoremove emacs emacs-common
# package 検索先を追加
sudo add-apt-repository ppa:kelleyk/emacs
# list update
sudo apt update
# install emacs 28
sudo apt install emacs28
```


## WSL or Windows {#wsl-or-windows}

ChatGPTに聞いたらこんな風に答えてくれた。


### WSL上でEmacsを使う {#wsl上でemacsを使う}

利点

-   WSL上にLinux環境があり、Emacsを標準的な方法でインストールできます。
-   Linuxコマンドやツールとの互換性が高まります。
-   WSL内で動作するため、Windowsとの統合が比較的スムーズです。

注意点:

-   GUIアプリケーションを利用する場合、Xサーバーが必要になります。
-   フォントやテーマの設定が、Windows側の設定と異なることがあります。


### Windows上のEmacsを使う: {#windows上のemacsを使う}

利点:

-   Windows用にビルドされたEmacsを直接使用できます。ダウンロードして即座に利用可能です。
-   GUIアプリケーションとして利用可能で、Windowsインターフェースに適合します。
-   Windows用のエディタとしての統合が容易です。

注意点:

-   WSLとは別にWindows上にEmacsをインストールするため、
    Linuxコマンドとの互換性は低いかもしれません。
