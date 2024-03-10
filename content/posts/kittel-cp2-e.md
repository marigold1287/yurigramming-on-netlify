+++
title = "単位構造のフーリエ変換"
author = ["Marigold"]
description = "構造因子と原子形状因子"
date = 2024-03-09T09:19:00+09:00
lastmod = 2024-03-09T09:23:22+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

回折の条件 \\(\Delta\boldsymbol{k} = \boldsymbol{G}\\) を満たすとき、散乱振幅は

\begin{equation}
F\_G = N \int\_{cell} dV n( r) \exp(-i \boldsymbol{G} \cdot \boldsymbol{r}) = nS\_G
\end{equation}

となる。量 \\(S\_G\\)を構造因子という。

\\(n(\boldsymbol{r}\\) は \\(\boldsymbol{r}\_j\\) をj番目の原子の中心までのベクトルとすると、関数 \\(n\_j(\boldsymbol( r) - \boldsymbol{r}\_j\\) は \\(\boldsymbol{r}\\) における電子密度に対するその原子の寄与を定義する。単位格子内のすべての原子による \\(\boldsymbol{r}\\) における電子密度は単位格子内の s個の原子に渡る和

\begin{equation}
n(\boldsymbol{r}) = \sum\_{j=1}^s n\_j(\boldsymbol{r} - \boldsymbol{r}\_j)
\end{equation}

である。これを構造因子の式に代入して整理すると、

\begin{equation}
S\_g = \sum\_j \exp(-i \boldsymbol{G} \cdot \boldsymbol{r}\_j) \int dV n\_j(\boldsymbol{\rho}) \exp(-i \boldsymbol{G} \cdot \boldsymbol{\rho})
\end{equation}

ここで \\(\rho\\) は \\(\boldsymbol{r} - \boldsymbol{r}\_j\\)
である。

原子形状因子は

\begin{equation}
f\_j = \int dV n\_j(\rho) \exp(-i \boldsymbol{G} \cdot \boldsymbol{\rho})
\end{equation}

である。よって、

\begin{equation}
S\_G = \sum\_j f\_j \exp(-i \boldsymbol{G} \cdot \boldsymbol{r}\_j)
\end{equation}

である。

ここに

\begin{align\*}
\boldsymbol{r}\_j &= x\_j \boldsymbol{a\_1} + y\_j \boldsymbol{a\_2} + z\_j \boldsymbol{a\_3} \\\\
\boldsymbol{G}   &= v\_1 \boldsymbol{b\_1} + v\_2 \boldsymbol{b\_2} + v\_3 \boldsymbol{b\_3}
\end{align\*}

よって、

\begin{equation}
S\_G(v\_1v\_2v\_3) = \sum\_j f\_j \exp[-i2\pi(v\_1x\_j + v\_2y\_j + v\_3z\_j)]
\end{equation}

bccなら \\(x\_1 = y\_1 = z\_1 = 0\\) あるいは \\(x\_2 = y\_2 = z\_2 = \frac{1}{2}\\) である。
