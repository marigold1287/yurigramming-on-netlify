+++
title = "スカラー三重積"
author = ["Marigold"]
description = "キッテル固体物理学入門1章の補足"
date = 2024-02-23T00:22:00+09:00
lastmod = 2024-02-23T00:27:41+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

スカラー三重積は平行六面体の体積である。

<!--more-->

ベクトル \\(\vec{a\_1}, \vec{a\_2}\\) からなる平行四辺形の面積 \\(S\\) は外積を使って

\\[
S = |\vec{a\_1} \times \vec{a\_2}| = |\vec{a\_1}||\vec{a\_2}| \sin{\theta}
\\]

で与えられる。

平行四辺形の単位法線ベクトルは \\(\vec{a\_1}, \vec{a\_2}\\) を使って

\\[
\vec{n} = \frac{\vec{a\_1} \times \vec{a\_2}}{|\vec{a\_1} \times \vec{a\_2}|}
\\]

である。平行六面体を形成する残りの一つのベクトルを \\(\vec{a\_3}\\) とすると、六面体の高さは

\\[
h = \vec{n} \cdot \vec{a\_3}
\\]

である。よって、平行六面体の体積 \\(V\\) は

\begin{align\*}
V &= Sh \\\\
&= |\vec{a\_1} \times \vec{a\_2}| \frac{\vec{a\_1} \times \vec{a\_2}}{|\vec{a\_1} \times \vec{a\_2}|} \cdot \vec{a\_3} \\\\
&= \vec{a\_1} \times \vec{a\_2} \cdot \vec{a\_3}
\end{align\*}
