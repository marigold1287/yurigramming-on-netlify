+++
title = "逆格子ベクトル"
author = ["Marigold"]
description = "逆格子ベクトルについて"
date = 2024-03-09T09:19:00+09:00
lastmod = 2024-03-09T09:22:22+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

逆格子ベクトルの軸ベクトルは

\begin{align\*}
\boldsymbol{b\_1} &= 2\pi \frac{\boldsymbol{a\_2} \times \boldsymbol{a\_3}}{\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}} \\\\
\boldsymbol{b\_2} &= 2\pi \frac{\boldsymbol{a\_3} \times \boldsymbol{a\_1}}{\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}} \\\\
\boldsymbol{b\_3} &= 2\pi \frac{\boldsymbol{a\_1} \times \boldsymbol{a\_2}}{\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}}
\end{align\*}

である。これらのベクトルは、結晶格子の2つの軸ベクトルと直交する。たとえば、 \\(\boldsymbol{b\_1}\\) は \\(\boldsymbol{a\_2}, \boldsymbol{a\_3}\\) と直交する。

\begin{equation}
\boldsymbol{b\_i} \cdot \boldsymbol{a\_j} = 2\pi \delta\_{ij}
\end{equation}

逆格子点の位置は1組のベクトル

\begin{equation}
\boldsymbol{G} = v\_1 \boldsymbol{b\_1} + v\_2 \boldsymbol{b\_2}+  v\_3 \boldsymbol{b\_3}
\end{equation}

で与えられる。これを逆格子ベクトルという。

フーリエ級数におけるベクトル \\(\boldsymbol{G}\\) は逆格子ベクトルである。

\begin{equation}
n(\boldsymbol{r}) = \sum\_G n\_G \exp(i \boldsymbol{G} \cdot \boldsymbol{r})
\end{equation}

なぜなら、電子密度を表すフーリエ級数は結晶の並進操作のいずれに対しても不変であるためである。

\begin{equation}
n(\boldsymbol{r+T}) = \sum\_G n\_G \exp(i \boldsymbol{G} \cdot \boldsymbol{r})\exp(i \boldsymbol{G} \cdot \boldsymbol{T})
\end{equation}

となるが、

\begin{align\*}
\exp(i \boldsymbol{G} \cdot \boldsymbol{T}) &= \exp[i(v\_1 \boldsymbol{b\_1} + v\_2 \boldsymbol{b\_2} + v\_3 \boldsymbol{b\_3}) \cdot (u\_1 \boldsymbol{a\_1} + u\_2 \boldsymbol{a\_2} + u\_3 \boldsymbol{a\_3})] \\\\
&= \exp[i2\pi(v\_1u\_1 + v\_2u\_2 + v\_3u\_3)] \\\\
&= 1
\end{align\*}

である。よって、

\begin{equation}
n(\boldsymbol{r+T}) = \sum\_G n\_G \exp(i \boldsymbol{G} \cdot \boldsymbol{r}) = n(\boldsymbol{r})
\end{equation}

である。

この結果から、結晶格子における周期関数のフーリエ表現は、逆格子ベクトル \\(\boldsymbol{G}\\) のところにだけ、成分 \\(n\_g\exp(i \boldsymbol{G} \cdot \boldsymbol{r})\\) を持つ。（電子密度の周期性を保つためには \\(\boldsymbol{G}\\) は逆格子ベクトルでなければならない）
