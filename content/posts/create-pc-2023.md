+++
title = "自作PCをつくる"
author = ["Marigold"]
description = "中学生の時以来10年ぶりにPCを自作した。はじめはubuntuを使おうとしていたのだが、結局諦めてwindows11を使用している。"
date = 2023-12-10T20:51:21+09:00
lastmod = 2024-02-25T22:13:41+09:00
tags = ["pc"]
categories = ["article"]
draft = false
+++

2023年8月にPCを自作した。


## 目的 {#目的}

-   実家にあるwindows8がサポート期限を終えてしまっているため。今使っているPC（DELL Inspiron3250）を実家で使いたい
-   メーカー製のPCは余計なソフトが入っているから自分でつくってクリーンな状態からはじめたい
-   勉強のため。中学生の時にPCをつくったこともあるが、改めて知識を身に着け直したい。
-   WindowsではWSLでubuntuを使っているが、それなら最初からubuntuをOSとして使ってみたい。


## 構成部品 {#構成部品}

CPU
: Core i5-12400 BOX

マザーボード
: ASRock B660M-HDV

メモリ
: ADATA AD4U320038G22-D 16GB(8GB × 2枚組)セット DDR4-3200

電源
: 玄人志向 KRPW-L5-400W/80+

ケース
: Thermaltake Versa H26

SSD
: KIOXIA SSD-CK1.0N3PG2/J (1TB)

SSDヒートシンク
: AINEX M.2 SSD用高性能ヒートシンク・工具セット BA-HM02

内蔵CDドライブ
: Hitachi-LG Data Storage GH24NSD5

wifi子機
: TP-Link Archer T2UB Nano/A

後で購入したもの

wifi子機
: L-WN725N

OS
: Windows11

工具

-   プラスドライバー
-   SSD取り付けに精密ドライバー

総額\\85,000ほど


## 組み立て中に苦労したこと、気になったこと {#組み立て中に苦労したこと-気になったこと}


### ケースがでかすぎる {#ケースがでかすぎる}

自作といえばミドルタワー型だろうとずっと思っていて、迷いもなく買ったのだが、あまりにもでかい。子供の頃に作った時はこんなにでかくなかった。というか、サーバー用の大きなマザーボードも搭載できるようだった。まあ、大は小を兼ねるということで...


### CPUソケット {#cpuソケット}

ここが一番気をつけなくちゃいけないところで慎重になっていたというのもあるかもだが、特にレバーを戻す時に結構力がいるので若干恐怖を感じた。あと、カバーを外すのにもやたらに手こずってしまった。


### 電源ケーブルの長さが足りない {#電源ケーブルの長さが足りない}

ケースがでかすぎるからなのだろうが、4ピンのケーブルがかなりギリギリだった。ウラ面配線できるようになっているのだが、その分だけ遠回りになってしまうというのもあるのだろう。ヨドバシで延長ケーブルを注文しておいた。


### BIOS ジャンパーキャップがない {#bios-ジャンパーキャップがない}

気にするほどでもないのだが、万一のために備忘録。これはショートさせられれば良くて、ドライバーでも何でも良いからいらない。


### 説明書をよく読む {#説明書をよく読む}

ホームページとか自作PCの本も購入していたのだが、特にマザーボードの説明書はよく読んだほうがいい。ケーブルのつなぎ方とかはここに全部書いてあるし、ボードごとに違うだろうから、最後にはこれを見なくちゃわからない。


### 電源ランプが明るすぎる {#電源ランプが明るすぎる}

ubuntuではスタンバイのことをサスペンドモードと呼ぶようだが、これにすると電源ランプが点滅するようになる。それがあまりにも明るすぎて寝るときに気になって仕方がない。
BIOSのACPI(Advanced Configuration and Power Interface)で設定を変えられるようなのだが、いまいちうまくいかず、結局LEDランプの電源を抜いて解決した。まあ、HDDのアクセスランプならまだしも電源ランプがついている必要はほとんどないだろう。


#### 関連 {#関連}

-   [システムのスリープ状態 - Windows drivers | Microsoft Learn](https://learn.microsoft.com/ja-jp/windows-hardware/drivers/kernel/system-sleeping-states)
-   [コンピューターのハイバネートはどのようにすればいいですか? - Ubuntu 18.04 LTS デスクトップガイド改](https://sicklylife.jp/ubuntu/1804/help/power-hibernate.html)


### 所要時間 {#所要時間}

3時間くらいかけて組み上げた。


## OSのインストール {#osのインストール}

組み上げ後のことは[ubuntuのインストール]({{< relref "how-to-install-ubuntu" >}})を参照


## 結果 {#結果}

特にwifi問題がやっかいで、これをやっていても私のためにならないし、時間を浪費しまった。音楽再生に使っているfoobar2000などはもちろんubuntu用のメディアプレーヤーに移行すればいいのかもしれないがやっぱり使い慣れたものを使いたいということでWine経由で起動させていた。

私の好きなゲームでToME4というのがあるのだが、Linux版が安定して起動しなかったのも残念なところだった。

こういう歪な形で運用するくらいなら普段はwindows、プログラミング関係はubuntuと住み分けさせたほうがいいんじゃないかと思ってやはりwindowsをメインで使おうと決心。ツクモネットショップで注文してしまった。

ただ、ubuntuはWSLと違って日本語入力がスムーズにできるし、snapを使えば簡単に最新のemacsを入れられるし、メリットも多い。

やはり普段づかいで色々やりたいというときにubuntuは難しいだろうと実感した。ただ、今まではWSLでやっていたが、今度は[Virtualbox]({{< relref "#d41d8c" >}})に挑戦しようかなと考えている。

WSLやMSYSを使う前に使おうとしたことがあったのだが、重くて断念。
Inspiron3250はメモリ8GBで厳しかったのだろうと思われる。それからはMSYSとかcygwinとかを使っていたのだった。

そう思うと一番はじめのところに先祖返りしているのだな。今までやったことが輪を描いて一つにつながったような印象を感じる。


## 参考にした情報 {#参考にした情報}

-   [PC自作の鉄則！2023 (日経BPパソコンベストムック) | 日経PC21 |本 | 通販 | Amazon](https://www.amazon.co.jp/PC%E8%87%AA%E4%BD%9C%E3%81%AE%E9%89%84%E5%89%87%EF%BC%812023-%E6%97%A5%E7%B5%8CBP%E3%83%91%E3%82%BD%E3%82%B3%E3%83%B3%E3%83%99%E3%82%B9%E3%83%88%E3%83%A0%E3%83%83%E3%82%AF-%E6%97%A5%E7%B5%8CPC21/dp/4296201085)
-   [自作パソコン作り方（自作PC）大図鑑～初心者必見～](https://jisaku-pc.net/build) 配線方法など詳しい
-   [各ケーブルの配線 | 初心者のための入門講座](https://jisaku-pc.net/build/cable_setup.html)
-   [これで全てが分かる。Thermaltake「Versa H26」徹底解説 - エルミタージュ秋葉原](https://www.gdm.or.jp/review/2017/1205/241809)。
    Thermaltakeは台湾のメーカー。ちなみにFractal designはスウェーデン。
-   [インテルのチップセットはB660とH610のどっちがいいの？ (1/5)](https://ascii.jp/elem/000/004/089/4089851/)。要点はローコストモデルならどちらでもいいが、GPUをつけるならB660にしておいたほうがいい。
