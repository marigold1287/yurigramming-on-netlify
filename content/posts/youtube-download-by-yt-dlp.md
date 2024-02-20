+++
title = "yt-dlpでyoutubeの動画をdownloadする"
author = ["Marigold"]
description = "yt-dlpを使った動画ダウンロード方法"
date = 2024-01-05T14:42:00+09:00
lastmod = 2024-02-21T01:02:36+09:00
tags = ["pc"]
categories = ["article"]
draft = false
+++

## インストール {#インストール}

youtube-dlは更新されていない。今はこっちが主流のようだ。

[GitHub - yt-dlp/yt-dlp: A youtube-dl fork with additional features and fixes](https://github.com/yt-dlp/yt-dlp)

のRELEASE FILESからyt-dlpを落とす。

権限がないと言われるので

```shell
chmod 700 yt-dlp
```

で権限を与える。

あるいは

```shell
sudo apt install yt-dlp/jammy-backports
```

でもよい。


## 使い方 {#使い方}

```shell
./yt-dlp URL
```

でDLできる。設定は省略。おそらくpythonとffmpegは必要。

outputパスを指定したい時は -o オプションを使う。詳細は公式HPのテンプレートを読むこと。

```shell
./yt-dlp https://www.youtube.com/watch?v=QGfxWP6siJA -o "~/Videos/%(title)s.%(ext)s"
```


## 画質指定 {#画質指定}

githubを読むべき。容量を抑えてできるかぎりで高画質化を目指すならこんな感じか。

`yt-dlp -f "b" -S "filesize~50M" https://youtu.be/8oiQtefvzOc`


## config {#config}

`~/.config/yt-dlp.conf` に設定を書き込んでおくことが出来る。

```text
# Lines starting with # are comments

# Always extract audio
# -x

# Do not copy the mtime
# --no-mtime

# Use this proxy
# --proxy 127.0.0.1:3128

# Save all videos under YouTube directory in your home directory
-o ~/Share/%(title)s.%(ext)s
```
