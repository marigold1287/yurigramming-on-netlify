+++
title = "回折の条件"
author = ["Marigold"]
description = "回折の条件"
date = 2024-03-09T09:19:00+09:00
lastmod = 2024-03-09T09:22:51+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

図6において、入射波 \\(\boldsymbol{k}\\) の行路差は \\(r\sin\phi\\) であり、位相角の差は \\(\frac{2\pi}{\lambda} r \sin\theta\\) であって、 \\(\boldsymbol{k} \cdot \boldsymbol{r}\\) に等しい。

同様に回折波\\(\boldsymbol{k'}\\)の行路差は \\(r\sin\phi\\) であり、位相角の差は \\(\frac{2\pi}{\lambda} r \sin\theta\\) であって、 \\(-\boldsymbol{k'} \cdot \boldsymbol{r}\\) に等しい。
(弾性散乱 \\(k^2 = k'^2\\)の場合)

よって、位相角の差の合計は \\((\boldsymbol{k} - \boldsymbol{k'}) \cdot \boldsymbol{r}\\) となる。散乱波の強度は \\(\exp[i(\boldsymbol{k} - \boldsymbol{k'}) \cdot \boldsymbol{r}]\\) で示され、電子密度に比例する
(位相角の差の合計が \\(2\pi n\\)であれば、
\\(\exp[i(\boldsymbol{k} - \boldsymbol{k'}) \cdot \boldsymbol{r}] = 1\\)となって散乱波は強め合う)。

散乱振幅 \\(F\\) は次の積分に比例する。

\begin{equation}
F = \int dV n(\boldsymbol{r}) \exp[i(\boldsymbol{k} - \boldsymbol{k'}) \cdot \boldsymbol{r}] = \int dV n(\boldsymbol{r}) \exp(-i \Delta\boldsymbol{k} \cdot \boldsymbol{r})
\end{equation}

\\(\Delta\boldsymbol{k}\\) を散乱ベクトルという。

散乱振幅は電子密度のフーリエ展開を代入して

\begin{equation}
F = \sum\_G  \int dV n\_G \exp[i (\boldsymbol{G} - \Delta\boldsymbol{k}) \cdot \boldsymbol{r}]
\end{equation}

となる。散乱ベクトル \\(\Delta\boldsymbol{k}\\) が逆格子ベクトルに等しいとき、

\begin{equation}
\Delta\boldsymbol{k} = \boldsymbol{G}
\end{equation}

が成立するとき、指数関数の引数が0になり、 \\(F = Vn\_G\\) となる。逆に、 \\(\Delta\boldsymbol{k}\\) がどの逆格子ベクトルともはっきり異なるとき、
\\(F\\) は無視できるくらい小さくなる（[回折線の幅]({{< relref "kittel-cp2-4" >}})）。

\begin{equation}
\Delta\boldsymbol{k} = \boldsymbol{G} = \boldsymbol{k'} - \boldsymbol{k}
\end{equation}

なので、

\begin{equation}
\boldsymbol{k} + \boldsymbol{G} = \boldsymbol{k'}
\end{equation}

である。弾性散乱であれば、 \\(\boldsymbol{k} = \boldsymbol{k'}\\)であり、両辺二乗すると、

\begin{equation}
2 \boldsymbol{k} \cdot \boldsymbol{G} + G^2 = 0
\end{equation}

を得る。もし \\(\boldsymbol{G}\\) が逆格子ベクトルであれば、 \\(-\boldsymbol{G}\\) も逆格子ベクトルであるから、

\begin{equation}
2 \boldsymbol{k} \cdot \boldsymbol{G} = G^2
\end{equation}

とも書ける。これはブラッグの法則 \\(2d\sin\theta = n\lambda\\) の別表現である。

\\(\boldsymbol{G} = h\boldsymbol{b\_1} + k\boldsymbol{b\_2} + l\boldsymbol{b\_3}\\)の方向に垂直な格子面の面間隔は
\\(d(hkl) = 2\pi / |\boldsymbol{G}|\\)である（[面間隔]({{< relref "kittel-cp2-2" >}})）。
\\(\theta\\)を入射線と結晶面の間の角とすると、 \\(2 \boldsymbol{k} \cdot \boldsymbol{G} = G^2\\) は

\begin{equation}
2 \frac{2\pi}{\lambda} \sin\theta = \frac{2\pi}{d(hkl)}
\end{equation}

すなわち、

\begin{equation}
2d\sin\theta = \lambda
\end{equation}

である。

[ブリルアン・ゾーン]({{< relref "kittel-cp2-c" >}})

<https://oec.chembio.nagoya-u.ac.jp/PDFs/OrgChem4/OrgChem4-12.pdf>
