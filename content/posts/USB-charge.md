+++
title = "スマホの充電速度について"
author = ["Marigold"]
description = "スマホの充電速度が遅かった話"
date = 2024-05-01T22:28:00+09:00
lastmod = 2024-05-01T22:29:43+09:00
categories = ["diary"]
draft = false
+++

新しいスマホにしてからも昔と同じ充電器（5V \* 1A=5W?）を使い続けていたのだが充電に5時間位時間がかかっていた。
senseからsense8に変わったことでバッテリー容量も倍近くまで増えていてこれが原因なのかなとも思っていたのだがどうもそうではなかったようで、

<https://jp.sharp/products/aquos-sense8/r/>

をみると、usb-pd 対応 20ワット。出力の小さい旧式のコンセントやPC経由での給電では十分な速度を出せないようだった。

PC側のUSB 3.2 Gen 1（青色の挿口）では最大4.5Wの電力供給が可能なのだが、これも電力が少ないことが分かる。実際、PCで充電しようとすると「低速充電」みたいなモードになってしまう。

結局AnkerのB2348N21という出力20Wの充電器を購入した。これを使うと1-2時間で充電が完了するので購入して正解だったな。
