+++
title = "面間隔"
author = ["Marigold"]
description = "キッテル固体物理学入門演習問題2-2"
date = 2024-02-25T15:58:00+09:00
lastmod = 2024-02-25T22:13:42+09:00
tags = ["kittel"]
categories = ["article"]
draft = false
+++

結晶格子のhkl面を考える

<!--more-->


## (a) {#a}

逆格子ベクトル \\(\boldsymbol{G}=h\boldsymbol{b\_1}+k\boldsymbol{b\_2}+l\boldsymbol{b\_3}\\)はこの面に垂直であることを証明せよ。

---

逆格子ベクトルの軸ベクトルは

\begin{align\*}
\boldsymbol{b\_1} &= 2\pi\frac{\boldsymbol{a\_2} \times \boldsymbol{a\_3}}
                            {\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}} \\\\
\boldsymbol{b\_2} &= 2\pi\frac{\boldsymbol{a\_3} \times \boldsymbol{a\_1}}
                            {\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}} \\\\
\boldsymbol{b\_3} &= 2\pi\frac{\boldsymbol{a\_1} \times \boldsymbol{a\_2}}
                            {\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}}
\end{align\*}

で与えられる。

また、hkl面上の2つのベクトルとして、

\begin{align\*}
\boldsymbol{n\_1} = \frac{1}{h}\boldsymbol{a\_1} - \frac{1}{k}\boldsymbol{a\_2}
\boldsymbol{n\_2} = \frac{1}{h}\boldsymbol{a\_1} - \frac{1}{l}\boldsymbol{a\_3}
\end{align\*}

を考える。

逆格子ベクトル \\(\boldsymbol{G}\\) と \\(\boldsymbol{n\_1}, \boldsymbol{n\_2}\\) の内積を求める。このとき、スカラー三重積の循環性に注意する。

\begin{equation}
\boldsymbol{a\_1} \cdot \boldsymbol{a\_2} \times \boldsymbol{a\_3}
= \boldsymbol{a\_3} \cdot \boldsymbol{a\_1} \times \boldsymbol{a\_2}
= \boldsymbol{a\_2} \cdot \boldsymbol{a\_3} \times \boldsymbol{a\_1}
\end{equation}

すると、

\begin{align\*}
\boldsymbol{G} \cdot \boldsymbol{n\_1}  &= 0 \\\\
\boldsymbol{G} \cdot \boldsymbol{n\_2}  &= 0
\end{align\*}

を導くことが出来る。よって、逆格子ベクトルはhkl面に垂直である。


## (b) {#b}

格子の平行な二枚の隣り合った面の間の距離は \\(d(hkl)=2\pi/|\boldsymbol{G}|\\)で与えられることを証明する。

---

単位法線ベクトルは

\begin{equation}
\boldsymbol{n} = \frac{\boldsymbol{G}}{|\boldsymbol{G}|}
\end{equation}

である。

hkl面上の点を指すベクトルとして

\begin{equation}
\frac{\boldsymbol{a\_1}}{h}
\end{equation}

を考える。

この2つのベクトルの内積を取ると、

\begin{equation}
\frac{\boldsymbol{a\_1}}{h} \cdot \frac{\boldsymbol{G}}{|\boldsymbol{G}|} \\\\
= \frac{2 \pi h}{h}\frac{1}{|\boldsymbol{G}|} \\\\
= \frac{2 \pi}{|\boldsymbol{G}|}
\end{equation}

を得る。

---

<https://batapara.com/archives/19150324.html/> ベクトルの射影。


## (c) {#c}

simple cubic(単純立方)格子では、 \\(d^2 = \frac{a^2}{h^2+k^2+l^2}\\) であることを示せ

---

単純立方格子では結晶格子の各基本並進ベクトルに対応する単位ベクトル(\\(\boldsymbol{x}, \boldsymbol{y}, \boldsymbol{z}\\))
は互いに直交している。

格子定数を \\(a\\) とすると、体積は \\(a^3\\) である。基本並進ベクトルは

\begin{align\*}
\boldsymbol{a\_1} &= a\boldsymbol{x} \\\\
\boldsymbol{a\_2} &= a\boldsymbol{y} \\\\
\boldsymbol{a\_3} &= a\boldsymbol{z}
\end{align\*}

である。このことを踏まえると逆格子の基本並進ベクトルは

\begin{align\*}
\boldsymbol{b\_1} &= \frac{2\pi}{a}\boldsymbol{x} \\\\
\boldsymbol{b\_2} &= \frac{2\pi}{a}\boldsymbol{y} \\\\
\boldsymbol{b\_3} &= \frac{2\pi}{a}\boldsymbol{z}
\end{align\*}

となる。

よって、逆格子ベクトルは

\begin{equation}
\boldsymbol{G} = \frac{2\pi}{a}h\boldsymbol{x} + \frac{2\pi}{a}k\boldsymbol{x} + \frac{2\pi}{a}l\boldsymbol{x}
\end{equation}

絶対値は

\begin{equation}
\boldsymbol{|G|} = \frac{2\pi}{a}\sqrt{h^2+k^2+l^2}
\end{equation}

よって、(b)で求めた面間隔の式に代入すると

\begin{equation}
d^2 = \frac{a^2}{h^2+k^2+l^2}
\end{equation}

を得る。
