+++
title = "六方空間格子"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-1"
date = 2024-02-25T15:58:00+09:00
lastmod = 2024-02-25T16:00:43+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

六方空間格子の基本並進ベクトルは次のように取ることが出来る。

<!--more-->

\begin{align\*}
\boldsymbol{a\_1} &=   \frac{\sqrt{3}a}{2}\boldsymbol{x} + \frac{a}{2}\boldsymbol{y} \\\\
\boldsymbol{a\_2} &= - \frac{\sqrt{3}a}{2}\boldsymbol{x} + \frac{a}{2}\boldsymbol{y} \\\\
\boldsymbol{a\_3} &=   c\boldsymbol{z}
\end{align\*}


## (a) {#a}

基本単位格子の体積は

\begin{equation}
V = \boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3} = \frac{\sqrt{3}}{2}a^2c
\end{equation}

である。


## (b) {#b}

逆格子の基本並進ベクトルは

\begin{align\*}
\boldsymbol{b\_1} &=   \frac{2\pi}{\sqrt{3}a}\boldsymbol{x} + \frac{2\pi}{a}\boldsymbol{y} \\\\
\boldsymbol{b\_2} &= - \frac{2\pi}{\sqrt{3}a}\boldsymbol{x} + \frac{2\pi}{a}\boldsymbol{y} \\\\
\boldsymbol{b\_3} &=   \frac{2\pi}{c}\boldsymbol{z}
\end{align\*}

である。 \\(\boldsymbol{a\_1}\\) と \\(\boldsymbol{b\_1}\\) のなす角を内積の関係から求めると
\\(60^\circ\\)であることが分かる。

よって、六方空間格子の逆格子はもとの格子をz軸の周りに60度回転させた格子となる(回転させた後拡大収縮の操作を行った格子)。


## (c) {#c}

逆格子ベクトルは

\begin{equation}
\boldsymbol{G} = v\_1 \boldsymbol{b\_1} + v\_2 \boldsymbol{b\_2} + v\_3 \boldsymbol{b\_3}
\end{equation}

であり、整理すると

\begin{equation}
\boldsymbol{G} = \frac{2\pi}{\sqrt{3}a} (v\_1 - v\_2) \boldsymbol{x}
               + \frac{2\pi}{a} (v\_1 + v\_2) \boldsymbol{y}
               + \frac{2\pi}{c} v\_3 \boldsymbol{z}
\end{equation}

である。

最短の G は \\(v\_1, v\_2, v\_3\\) が次の6つの組み合わせの時に得られる。

\begin{align\*}
(1, 0, 0), (0, 1, 0), (-1, 0, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)
\end{align\*}

これを代入して整理すると、 G は
\\(\pm \boldsymbol{b\_1}, \pm \boldsymbol{b\_2}, \pm \boldsymbol{b\_3}\\)
となることが分かる。

六方空間格子のブリルアン・ゾーンは、これら6つのベクトルの垂直二等分面からなる六面体である。
