+++
title = "org-modeでexportするときに<が &(and)lt になってしまう問題"
author = ["Marigold"]
description = "山括弧を含む文書をエクスポートする時に&記号を使った表記に変換されてしまって、ショートコードなんかがうまく機能しないことがある。"
date = 2024-01-04T19:16:10+09:00
lastmod = 2024-01-05T11:18:01+09:00
categories = ["article"]
draft = false
+++

export時に &lt;, &gt; が &amp;(and)lt, &amp;(and)gt に変換されてしまうため[^fn:1]、
orgファイルにhtmlやShortcodeをじかに書き込んでも認識されない。

変換されないように &lt; や &gt; を書く方法を示す。


## hugoのショートコード {#hugoのショートコード}

```org
#+hugo: {{</* tweet pps_ps 1614077311544066048 */>}}
#+hugo: {{</* youtube 74zOY-vgkyw */>}}
```

のようにすること[^fn:2]。


## htmlの場合 {#htmlの場合}

```text
@@html: <iframe src="https://www.google.com/maps/d/embed?mid=19FYJCnCYa3CSFePxaLDQVENcRB1AEPo&ehbc=2E312F&noprof=1" width="640" height="480"></iframe>@@
```

このように@@でエスケープする[^fn:3]。しかし、今のHugoではmdファイルに生のhtmlを埋め込んでしまうと `<!-- raw HTML omitted -->` となって何も表示されなくなってしまう。対処法は以下の2通り。


### コンフィグファイルを編集する {#コンフィグファイルを編集する}

tomlファイルに以下を追記する。

```toml
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
```


### ショートコードを作る {#ショートコードを作る}

```org
#+hugo: {{</* rawhtml */>}}  <iframe src="https://www.google.com/maps/d/embed?mid=19FYJCnCYa3CSFePxaLDQVENcRB1AEPo&ehbc=2E312F&noprof=1" width="640" height="480"></iframe> {{</* /rawhtml */>}}
```

rawhtmlショートコードの中身は

```text
<!-- raw html -->
{{- .Inner -}}
```

[^fn:1]: もしかするとhtml上での表記は問題ないかもしれない。ただ、mdファイル上では&amp;(and)lt, &amp;(and)gtとなっている。
[^fn:2]: [Shortcodes — ox-hugo - Org to Hugo exporter](https://ox-hugo.scripter.co/doc/shortcodes/)によると
    orgファイルにショートコードを直接書き込むことは推奨されていない。
[^fn:3]: [Quoting HTML tags (The Org Manual)](https://orgmode.org/manual/Quoting-HTML-tags.html)なども参照