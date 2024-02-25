+++
title = "tomlについてのメモ"
author = ["Marigold"]
description = "tomlについての備忘録"
date = 2024-02-21T01:07:00+09:00
lastmod = 2024-02-25T22:13:42+09:00
categories = ["article"]
draft = false
+++

## Table {#table}

`[]` はTableをあらわす

```toml
[table]
key1 = "A"
key2 = 1
```

"table"に属するkey1とkey2。値は"A"と1

同じ名前のテーブルは1つしか作れない。


## Table 配列 {#table-配列}

`[[]]` はテーブル配列。menuに表示するリストなどはこれを使う。[hugoのconfig.toml]({{< relref "hugo-config-file" >}})
ならmenuとかicon群とか。
