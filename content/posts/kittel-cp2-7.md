+++
title = "2原子の並んだ線"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-7"
date = 2024-03-02T15:33:00+09:00
lastmod = 2024-03-02T15:33:35+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

原子がABAB......ABと並んだ線を考えよ。A-B結合の長さは1/2aである。原子A, Bの形状因子をそれぞれ \\(f\_A, f\_B\\) とする。入射X線は原子の線に垂直である。

<!--more-->


## (a) {#a}

干渉の条件は \\(n\lambda = a \cos\theta\\) であることを証明せよ。この\\(\theta\\)は回折線と原子の線との間の角である。

---

単位格子の長さは \\(a\\) であるから、波の行路差は \\(a\cos\theta\\) である。よって、干渉の条件は\\(n\lambda = a \cos\theta\\)である。


## (b) {#b}

P47式(39)から、散乱強度は構造因子に比例する。構造因子は式(43)のとおり。

\begin{align\*}
\boldsymbol{r\_A} &= 0\boldsymbol{a\_1} + 0\boldsymbol{a\_2} + 0\boldsymbol{a\_3} \\\\
\boldsymbol{r\_B} &= \frac{a}{2}\boldsymbol{a\_1} + 0\boldsymbol{a\_2} + 0\boldsymbol{a\_3}
\end{align\*}

である。

式(21)から逆格子ベクトルが散乱ベクトルに等しいときに回折条件を満たす。波数ベクトルの大きさは波数なので、 \\(|\boldsymbol{k}| = \frac{2\pi}{\lambda}\\)に注意して、

\begin{equation}
\boldsymbol{G} = \boldsymbol{k'} - \boldsymbol{k} = \frac{2\pi}{\lambda}\cos\theta\boldsymbol{a\_1} + \frac{2\pi}{\lambda}(\sin\theta - 1)\boldsymbol{a\_2}
\end{equation}

よって、構造因子は

\begin{equation}
S\_G = \sum\_jf\_j\exp(-iG \cdot r\_j) = f\_A + f\_B \exp(-i \frac{2\pi}{\lambda}\cos\theta \frac{a}{2}) = f\_A + f\_B \exp(-i n\pi)
\end{equation}

である。

nが奇数のときには \\(\exp(-i n\pi) = -1\\)、
nが偶数のときには \\(\exp(-i n\pi) = 1\\)である。


## (c) {#c}

\\(f\_a = f\_B\\)かつnが奇数であるなら、構造因子は0になる。
