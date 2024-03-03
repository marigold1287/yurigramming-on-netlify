+++
title = "水素原子の原子形状因子"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-6"
date = 2024-02-28T23:40:00+09:00
lastmod = 2024-02-28T23:51:21+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

基準状態の水素原子において、電子密度は

<!--more-->

\begin{equation\*}
n( r) = \frac{1}{\pi a\_{0}^3}\exp(-2r/a\_0)
\end{equation\*}

である。ここに \\(a\_{0}\\) はボーア半径である。形状因子は

\begin{equation\*}
f\_G = \frac{16}{(4+G^2a\_{0}^2)^2}
\end{equation\*}

であることを示せ。

---

式(50)に電子密度を代入する。

\begin{align\*}
f\_G &= 4\pi \int dr n\_j( r)r^2\frac{\sin Gr}{Gr} \\\\
&= 4\pi \int dr \frac{1}{\pi a\_{0}^3}\exp(-2r/a\_0) r^2\frac{\sin Gr}{Gr} \\\\
&= \frac{4}{a\_{0}^3 G} \int r \sin(Gr) e^{-\frac{2r}{a\_0}} dr
\end{align\*}

部分積分を使って整理する。

\begin{split}
f\_G = \frac{4}{a\_{0}^3 G} &([-\frac{a\_0}{2} e^{-2r/a\_0} r \sin Gr]^\infty\_0  \\\\
&+ \int\_0^\infty [\frac{a\_0}{2} e^{-2r/a\_0} \sin Gr + \frac{a\_0G}{2} e^{-2r/a\_0} r \cos Gr]dr)
\end{split}

第一項は0である。

\begin{split}
f\_G = &\frac{2}{a\_0^2G} \int e^{-2r/a\_0} \sin Gr dr \\\\
&+ \frac{2}{a\_0^2} e^{-2r / a\_0} r \cos Gr dr
\end{split}

もう一度部分積分をする。

\begin{split}
f\_G =& \frac{2}{a\_0^2G} \int \frac{a\_0G}{2} e^{-2r/a\_0} \cos Gr dr \\\\
&+ \frac{2}{a\_0^2} \int \frac{a\_0}{2} e^{-2r/a\_0} \cos Gr dr \\\\
&- \frac{2}{a\_0^2} \int \frac{a\_0G}{2} e^{-2r/a\_0} r\sin Gr dr
\end{split}

整理すると、

\begin{split}
f\_G =& \frac{1}{a\_0} \int  e^{-2r/a\_0} \cos Gr dr \\\\
&+ \frac{1}{a\_0} \int  e^{-2r/a\_0} \cos Gr dr \\\\
&- \frac{G}{a\_0} \int  e^{-2r/a\_0} r\sin Gr dr
\end{split}

よって、

\begin{split}
f\_G =& \frac{2}{a\_0} \int  e^{-2r/a\_0} \cos Gr dr \\\\
&- \frac{G}{a\_0} \int  e^{-2r/a\_0} r\sin Gr dr
\end{split}

となる。

第二項は

\begin{equation}
\frac{G}{a\_0} \int  e^{-2r/a\_0} r\sin Gr dr = \frac{G^2a\_0^2}{4} f\_G
\end{equation}

であるため、

\begin{equation}
f\_G = \left(1 + \frac{G^2a\_0^2}{4}\right)^{-1} \frac{2}{a\_0} \int  e^{-2r/a\_0} \cos Gr dr
\end{equation}

である。

\begin{equation}
\int  e^{-2r/a\_0} \cos Gr dr = \frac{a\_0}{2} \left(1 + \frac{G^2a\_0^2}{4}\right)^{-1}
\end{equation}

なので、

\begin{equation}
f\_G = \frac{16}{\left(4 + G^2a\_0^2\right)^{2}}
\end{equation}
