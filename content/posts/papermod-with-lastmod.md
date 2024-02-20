+++
title = "PapermodでLastModを表示する"
author = ["Marigold"]
description = "Papermodのテンプレートを書き換えて最終更新日を表示するようにする"
date = 2024-02-21T00:45:00+09:00
lastmod = 2024-02-21T01:02:35+09:00
tags = ["hugo"]
categories = ["article"]
draft = false
+++

デフォルトでは最終更新日は表示されず、作成日のみが表示されるようになっている。

`layouts/partials/` に `post_meta.html` を作成して以下をペーストする。

```html
{{ $date := .Date.Format "02.01.2006" }}
{{ $lastmod := .Lastmod.Format "02.01.2006" }}

{{- $scratch := newScratch }}

{{- if not .Date.IsZero -}}
{{- $scratch.Add "meta" (slice (printf "<span title='%s'>%s</span>" (.Date) (.Date | time.Format (default "2006-01-02" site.Params.DateFormat)))) }}
{{- end }}

{{- if ne $date $lastmod -}}
{{- $scratch.Add "meta" (slice (printf "<span title='%s'>(updated %s)</span>" (.Lastmod) (.Lastmod | time.Format (default "2006-01-02" site.Params.DateFormat)))) }}
{{- end }}

{{- if (.Param "ShowReadingTime") -}}
{{- $scratch.Add "meta" (slice (i18n "read_time" .ReadingTime | default (printf "%d min" .ReadingTime))) }}
{{- end }}

{{- if (.Param "ShowWordCount") -}}
{{- $scratch.Add "meta" (slice (i18n "words" .WordCount | default (printf "%d words" .WordCount))) }}
{{- end }}

{{- if not (.Param "hideAuthor") -}}
{{- with (partial "author.html" .) }}
{{- $scratch.Add "meta" (slice .) }}
{{- end }}
{{- end }}

{{- with ($scratch.Get "meta") }}
{{- delimit . "&nbsp;·&nbsp;" | safeHTML -}}
{{- end -}}
```

[Use Lastmod with PaperMod | Jackson Lucky](https://www.jacksonlucky.net/posts/use-lastmod-with-papermod/)
