+++
title = "hcp構造"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題1-3"
date = 2024-02-23T00:21:00+09:00
lastmod = 2024-02-25T22:13:42+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

理想的なhcp構造に対するc/a比は \\(\sqrt{\frac{8}{3}} = 1.633\\)であることを示せ。もしc/aがこの値よりかなり大きいならば、結晶構造は、最密充填原子面が、隙間をもって積み上げられてできていると考えることが出来る。

<!--more-->

---

図23において、原点と正四面体の底面の重心との距離は
\\(\frac{\sqrt{3}}{3}a\\)である。重心の真上にある原子までの距離は三平方の定理を使って

\\[
\frac{c}{2} = a^2 - (\frac{\sqrt{3}}{3}a)^2 = \sqrt{\frac{2}{3}a}
\\]

よって
\\[
\frac{c}{a} = 2 \sqrt{\frac{2}{3}} = \sqrt{\frac{8}{3}} = 1.633
\\]

---

図23にはB層にある原子の原点からの位置は

\\[
\vec{r} = \frac{2}{3}\vec{a\_1} + \frac{1}{3}\vec{a\_2} + \frac{1}{2}\vec{a\_3}
\\]

とある。この位置は底面の正三角形の重心位置の真上になる。

最密充填時には原子間距離はすべて最近接原子間距離 \\(a\\) に等しくなくてはならないから、

\begin{equation\*}
|{\vec{r}}| = a
\end{equation\*}

である。

\begin{align\*}
|\vec{a\_1}| &= a \\\\
|\vec{a\_2}| &= a \\\\
|\vec{a\_3}| &= c \\\\
\end{align\*}

また、\\(\vec{a\_1}と\vec{a\_2} の成す角は120^\circ\\)であることに注意して、

\begin{equation\*}
|\vec{r}| = \left(\frac{2}{3}\vec{a\_1} + \frac{1}{3}\vec{a\_2} + \frac{1}{2}\vec{a\_3}\right)^2
\end{equation\*}

これを解くと、

\\[
\frac{c}{a} = \sqrt{\frac{8}{3}}
\\]

を得る。
