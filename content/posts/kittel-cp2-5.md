+++
title = "ダイヤモンドの構造因子"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-5"
date = 2024-02-28T23:40:00+09:00
lastmod = 2024-02-28T23:40:47+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

ダイヤモンドの結晶構造は1章に説明されている。もし単位格子を通常の立方体に取るならば、単位構造は8個の原子からできている。

<!--more-->


## (a) {#a}

この単位構造の構造因子 S を求めよ。

---

ダイヤモンドの結晶構造は図25にあるとおり、体対角線方向にその1/4だけずれている2個のfcc格子からできている。格子点は8つあって、

\begin{align\*}
(0.0, 0.0, 0.0) \\\\
(0.0, 1/2, 1/2) \\\\
(1/2, 0.0, 1/2) \\\\
(1/2, 1/2, 0.0) \\\\
(1/4, 3/4, 3/4) \\\\
(3/4, 1/4, 3/4) \\\\
(3/4, 3/4, 1/4)
\end{align\*}

である。これを式46

\begin{equation\*}
S\_G(v\_1,v\_2,v\_3)=\sum\_{j}f\_j\exp[-i2\pi(v\_1x\_j + v\_xy\_j + v\_3z\_j)]
\end{equation\*}

に代入すると

\begin{split}
S &= f\\{1 + \exp[-\pi i (v\_2 + v\_3)] \\\\
        &+ \exp[-\pi i (v\_3 + v\_1)] \\\\
        &+ \exp[-\pi i (v\_1 + v\_2)] \\\\
        &+ \exp[-\frac{\pi}{2} i (v\_1 + v\_2 + v\_3)] \\\\
        &+ \exp[-\frac{\pi}{2} i (v\_1 + 3v\_2 + 3v\_3)] \\\\
        &+ \exp[-\frac{\pi}{2} i (3v\_1 + v\_2 + 3v\_3)] \\\\
        &+ \exp[-\frac{\pi}{2} i (3v\_1 + 3v\_2 + v\_3)]\\}
\end{split}


## (b) {#b}

略
