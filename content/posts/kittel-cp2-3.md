+++
title = "ブリルアン・ゾーンの体積"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-3"
date = 2024-02-25T16:37:00+09:00
lastmod = 2024-02-25T16:39:15+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

第1ブリルアン・ゾーンの体積を求めよ。

<!--more-->

ヒント: ブリルアン・ゾーンの体積はフーリエ空間の基本並行六面体の体積に等しい。ベクトルに関する等式

\begin{equation}
(\boldsymbol{c} \times \boldsymbol{a}) \times (\boldsymbol{a} \times \boldsymbol{b}) = (\boldsymbol{c} \cdot \boldsymbol{a} \times \boldsymbol{b}) \boldsymbol{a}
\end{equation}

を思い出せ。

---

\begin{equation}
V = \boldsymbol{b\_1} \cdot \boldsymbol{b\_2} \times \boldsymbol{b\_3}
\end{equation}

に

\begin{align\*}
\boldsymbol{b\_1} &= 2\pi\frac{\boldsymbol{a\_2} \times \boldsymbol{a\_3}}
                            {\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}} \\\\
\boldsymbol{b\_2} &= 2\pi\frac{\boldsymbol{a\_3} \times \boldsymbol{a\_1}}
                            {\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}} \\\\
\boldsymbol{b\_3} &= 2\pi\frac{\boldsymbol{a\_1} \times \boldsymbol{a\_2}}
                            {\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}}
\end{align\*}

を代入して整理すると

\begin{equation}
V = \frac{(2\pi)^3}{V\_c}
\end{equation}

を得る。 \\(V\_c\\)は結晶の基本単位格子の体積である。
