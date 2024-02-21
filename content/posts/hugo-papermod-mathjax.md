+++
title = "mathjaxによる数式表示"
author = ["Marigold"]
description = "mathjaxによる数式表示"
date = 2024-02-21T23:09:00+09:00
lastmod = 2024-02-21T23:13:35+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

mathjaxを読み込んで数式を表示できるようにする。

`layouts/partials/extend_footer.html` に以下を追加する。

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

<!-- 式番号を表示したい場合 -->
<script type="text/x-mathjax-config"> MathJax.Hub.Config({ TeX: { equationNumbers: { autoNumber: "all" } } }); </script>
```

こんな感じ。
\\[
\frac{\partial L}{\partial W} =
\left[\begin{array}{}
    \frac{\partial L}{\partial w\_{11}} & \frac{\partial L}{\partial w\_{12}} & \frac{\partial L}{\partial w\_{13}} \\\\
    \frac{\partial L}{\partial w\_{21}} & \frac{\partial L}{\partial w\_{22}} & \frac{\partial L}{\partial w\_{13}}
\end{array} \right]
\\]

<https://maku77.github.io/p/dsfzi4n/> も参考になる。

数式を使っていないページでの読み込みを防ぐためには
extend_footer.htmlを

```html
{{- /* Footer custom content area start */ -}}
{{- /*     Insert any custom code web-analytics, resources, etc. here */ -}}
{{- if eq .Params.useMath true }}
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/x-mathjax-config"> MathJax.Hub.Config({ TeX: { equationNumbers: { autoNumber: "all" } } }); </script>
{{- end }}
{{- /* Footer custom content area end */ -}}
```

と書き換える。

そして、記事のfrontmatterに

```toml
+++
title = "2023/07/15(土) 大楠山登山と横須賀観光"
useMath: true
+++
```

を加える。
