+++
title = "Papermodのcustom css"
author = ["Marigold"]
description = "papermodでcustom cssを使う方法"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-25T22:13:40+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

<https://github.com/adityatelange/hugo-PaperMod/wiki/FAQs#bundling-custom-css-with-themes-assets>

`assets/css/extended` の中に保存されたcssファイルはバンドルされた状態でデプロイされる。


## css例 {#css例}

私は横幅を書き換えたくてmain-widthを720から1080に増やしている。

```css
:root {
    --gap: 24px;
    --content-gap: 20px;
    --nav-width: 1024px;
    --main-width: 1080px;
    --header-height: 60px;
    --footer-height: 60px;
    --radius: 8px;
    --theme: rgb(255, 255, 255);
    --entry: rgb(255, 255, 255);
    --primary: rgb(30, 30, 30);
    --secondary: rgb(108, 108, 108);
    --tertiary: rgb(214, 214, 214);
    --content: rgb(31, 31, 31);
    --hljs-bg: rgb(28, 29, 33);
    --code-bg: rgb(245, 245, 245);
    --border: rgb(238, 238, 238);
}
```
