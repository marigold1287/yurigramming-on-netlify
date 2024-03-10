+++
title = "ブラッグの公式を結晶格子に拡張する"
author = ["Marigold"]
description = "ブラッグの公式とフーリエ変換"
date = 2024-03-09T09:19:00+09:00
lastmod = 2024-03-09T09:19:39+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

結晶には周期性があるから電子密度 \\(n(\boldsymbol{r})\\) は
\\(\boldsymbol{r}\\) の周期関数となって、3つの結晶軸方向に周期 \\(\boldsymbol{a\_1}, \boldsymbol{a\_2}, \boldsymbol{a\_3}\\) を持つ。それゆえ、

\begin{equation}
n(\boldsymbol{r + T}) = n(\boldsymbol{r})
\end{equation}


## フーリエ変換 {#フーリエ変換}

周期性を持っているならフーリエ解析の対象とすることが出来る。つまり、1次元であれば

\begin{equation}
n(x) = n\_0 + \sum\_{p>0} [C\_p\cos(2\pi px/a) + S\_p\sin(2\pi px/a)]
\end{equation}

と展開できる。このとき、

\begin{equation}
n(x + a) = n(x)
\end{equation}

である。
\\(2\pi p/a\\)は結晶の逆格子空間（フーリエ空間）における点となる。これを複素数を用いて書くと、

\begin{equation}
n(x) = \sum\_p n\_p \exp(i2\pi p x/a)
\end{equation}

である。これが実関数となるためには

\begin{equation}
n\_{-p}^\* = n\_p
\end{equation}

を満たす必要がある。「\*」は共役複素数を意味する。つまり、

\begin{align\*}
n\_p &= a + bi
n\_{-p}^\* &= a + bi
n\_{-p} &= a - bi
\end{align\*}

である。このとき、p項と-p項の和は実関数になる。

三次元の周期関数に拡張するには、実格子状の点 \\(x\\) を ベクトル \\(\boldsymbol{r}\\) に、逆格子点 \\(p\\) をベクトル \\(\boldsymbol{G}\\) に書き換えて、

\begin{equation}
n(\boldsymbol{r}) = \sum\_G n\_G \exp(i \boldsymbol{G} \cdot \boldsymbol{r})
\end{equation}

である。このとき、結晶に変化を与えないすべての格子並進操作 \\(\boldsymbol{T}\\) に対して、

\begin{equation}
n(\boldsymbol{r+ T}) = \sum\_G n\_G \exp(i \boldsymbol{G} \cdot (\boldsymbol{r + T})) = n(\boldsymbol{r})
\end{equation}

を満たす必要がある。そのような \\(\boldsymbol{G}\\) は [逆格子ベクトル]({{< relref "kittel-cp2-b" >}}) である。


## フーリエ逆変換 {#フーリエ逆変換}

1次元のフーリエ級数のフーリエ係数 \\(n\_p\\) は

\begin{equation}
n\_p = a^{-1} \int\_0^a dx n(x) \exp(-i2\pi px/a)
\end{equation}

で与えられる。3次元の場合は

\begin{equation}
n\_G = V\_c^{-1} \int\_{cell} dV n(\boldsymbol{r}) \exp(-i \boldsymbol{G} \cdot \boldsymbol{r})
\end{equation}

である。
