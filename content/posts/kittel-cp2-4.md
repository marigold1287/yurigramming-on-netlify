+++
title = "回折線の幅"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-4"
date = 2024-02-27T00:59:00+09:00
lastmod = 2024-02-27T01:00:26+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

1次元結晶において、mを整数としたとき、各格子点 \\(\rho\_m = m\boldsymbol{a}\\) に点状の等しい散乱中心が並んでいるとする。

<!--more-->

(20)と比較して、全散乱波振幅は
\\(F = \sum \exp(-im\boldsymbol{a} \cdot \Delta\boldsymbol{k})\\) に比例する。
M個の格子点に関する和は級数

\begin{equation}
\sum\_{m=0}^{M-1}x^m = \frac{1-x^M}{1-x}
\end{equation}

を用いて

\begin{equation}
F = \frac{1 - \exp[-iM \boldsymbol{a} \cdot \Delta\boldsymbol{k}]}
     {1 - \exp[-i \boldsymbol{a} \cdot \Delta\boldsymbol{k}]}
\end{equation}

となる。


## (a) {#a}

散乱強度は \\(|F|^2\\) に比例している。

Fの複素共役F^\*は虚数部の符号を反転することで得られる。

\begin{equation}
F^\* = \frac{1 - \exp[iM \boldsymbol{a} \cdot \Delta\boldsymbol{k}]}
     {1 - \exp[i \boldsymbol{a} \cdot \Delta\boldsymbol{k}]}
\end{equation}

である。

これを用いて

\begin{equation}
|F|^2 = F^\*F
\end{equation}

を計算して整理すると

\begin{equation}
|F|^2 = \frac{\sin^2\frac{1}{2}M(\boldsymbol{a} \cdot \Delta\boldsymbol{k})}
             {\sin^2\frac{1}{2}(\boldsymbol{a} \cdot \Delta\boldsymbol{k})}
\end{equation}

を得られる。

このとき、半角の公式

\begin{equation}
\sin^2x = \frac{1 - \cos{x}}{2}
\end{equation}

を用いている。


## (b) {#b}

hを整数として、\\(\boldsymbol{a} \cdot \Delta\boldsymbol{k} = 2 \pi h\\)のときに回折極大の生じることが知られている。 \\(\Delta\boldsymbol{k}\\) を少し変えて
\\(\boldsymbol{a} \cdot \Delta\boldsymbol{k} = 2 \pi h + \epsilon\\) の &epsilon; を
\\(\sin{\frac{1}{2}M (\boldsymbol{a} \cdot \Delta\boldsymbol{k})}\\) の最初の零点の位置を与えるように定める。

\begin{align\*}
& \sin{\frac{1}{2}M (\boldsymbol{a} \cdot \Delta\boldsymbol{k})} \\\\
&= \sin{\frac{1}{2}M (2\pi h + \epsilon)} \\\\
&= \sin{M\pi h + \frac{M\epsilon}{2}} \\\\
&= (-1)^{Mh}\sin{\frac{M\epsilon}{2}}
\end{align\*}

これが零となるときの &epsilon; は

\begin{equation}
\epsilon = \frac{2\pi}{M}
\end{equation}

のときである。回折の極大の幅は1/Mに比例し、M（格子点の数）が巨視的な大きさを持つと極大の幅が非常に狭くなる。
