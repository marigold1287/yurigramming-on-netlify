+++
title = "ubuntuの設定いろいろ"
author = ["Marigold"]
description = "ubuntuインストール後に行ったこと。"
date = 2024-01-04T00:00:00+09:00
lastmod = 2024-02-25T22:13:41+09:00
tags = ["ubuntu"]
categories = ["article"]
draft = false
+++

## Programming関係のツールをまとめて入れる {#programming関係のツールをまとめて入れる}

`sudo apt install build-essential` をとりあえず実行しておくこと


## ubuntuのホームディレクトリを英語にする {#ubuntuのホームディレクトリを英語にする}

日本語でインストールするとホームディレクトリがミュージック、ダウンロードなどと日本語になる。これだとターミナルでのアクセスも面倒なので

```shell
LANG=C xdg-user-dirs-gtk-update
```

とするとMusic Downloadなどに変わる。再起動後に英語から日本語に戻すか聞かれるが、
Noと答えればいい。


## ubuntuでgoogledriveに接続する {#ubuntuでgoogledriveに接続する}

オンラインアカウントにログインすれば接続できる。ただ、ターミナル上では使えないようでファイラーを使わないとファイルを操作できない。

ターミナル上で操作したいなら以下を参照。


### google-drive-ocamlfuse {#google-drive-ocamlfuse}

Google Driveをマウントできるようにする。


#### インストール {#インストール}

```shell
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
```


#### 初期化 {#初期化}

```shell
google-drive-ocamlfuse
```

これで `~/.gdfuse/default` にコンフィグファイルを作る。


#### mount pointにフォルダを作る {#mount-pointにフォルダを作る}

```shell
mkdir ~/GoogleDrive
```


#### マウントする {#マウントする}

```shell
google-drive-ocamlfuse [mountpoint]
```


#### アンマウントしたい時は {#アンマウントしたい時は}

```shell
fusermount -u mountpoint
```


### ref {#ref}

[GitHub - astrada/google-drive-ocamlfuse: FUSE filesystem over Google Drive](https://github.com/astrada/google-drive-ocamlfuse)


## ubuntuファイルシステムの文字数上限について {#ubuntuファイルシステムの文字数上限について}

ubuntuのシステムではwindowsと違ってファイル名が長すぎるとエラーが出てしまう。幸いリネームはできるから修正すればいいのだが、普段の心がけが必要なところだろう。
windowsから移行する場合には注意が必要だ。


## ubuntuのwifi接続で苦労したこと {#ubuntuのwifi接続で苦労したこと}


### はじめに {#はじめに}

わたしが使っているwifiルーターが古いせいかも知れないが滅茶苦茶苦戦した。

はじめはArcher T2UB Nano/Aというwifiとbluetoothがセットになった外付けタイプの受信機を買った。コレ自体は挿せば普通に認識してくれて、

```shell
sudo lshw -C network
> driver=rtw_8821cu driverversion=6.2.0-26-generic
```

とすでにドライバが入っているようだった。右上の設定にも普通にSSID一覧が出てきてそこに私の使っているルーターも表示される。


### 問題 {#問題}

どれだけwifiに接続しようとしても一向につながらない。ネットでさんざん調べてgithubにあるドライバを入れるとかできる範囲で手を尽くしたのだが結局わからずじまいで今は有線でつないでいる。

購入したUSBは5GHzと2.4GHzの両方に対応しているのだが、私の持っているルーターは2.4GHzしか対応していない。

`lsusb` を実行すると

```text
Realtek Semiconductor Corp. 802.11ac NIC
```

となっている。acというのは5GHz帯のことでこの認識では5GHzの電波しか受信できないのではないだろうか。

| IEEE 802.11a      | 54Mbps  | 5GHz 帯    | -       |
|-------------------|---------|-----------|---------|
| IEEE 802.11b      | 11Mbps  | 2.4GHz 帯  | -       |
| IEEE 802.11g      | 54Mbps  | 2.4GHz 帯  | -       |
| **IEEE 802.11n**  | 600Mbps | 2.4/5GHz 帯 | Wi-Fi 4 |
| **IEEE 802.11ac** | 6.9Gbps | 5GHz 帯    | Wi-Fi 5 |
| IEEE 802.11ax     | 9.6Gbps | 2.4/5GHz 帯 | Wi-Fi 6 |

もしかしたらと思って、2.4GHzのみに対応しているTL-WN725N JP(11n/g/b)という子機を買ってみると解決して、挿すだけでwifi接続ができるようになった。


### 通信速度 {#通信速度}

[The Global Broadband Speed Test](https://www.speedtest.net/)で測ると下りが20Mbps、上りが0.17Mbps。あまりにも上りが遅いので[別のサイト](https://speedtest.gate02.ne.jp/)で測ると下りが20Mbps、上りが30Mbps。

有線だと90Mbps,50Mbpsで圧倒的に速い。

私の家は光ケーブルではなくて電話線で回線を引っ張ってきてるから、
ADSL相当の100Mbpsが限界なのだが、今までこのせいであまり速度が出ていないとばかり思っていた。真の実力はもっと上だったようだ。


## ubuntuでスマホとデータのやり取りをする {#ubuntuでスマホとデータのやり取りをする}

データの移行をするときにスマホに挿したSDカードを経由していたのだが、
SDカードからPCができてもPCからSDカードができないことに気づく。


### 解決法 {#解決法}

`/etc/fuse.conf` でコメントアウトされている `user_allow_other` のコメントを外す

```text
#user_allow_other
```

```text
user_allow_other
```


### ref {#ref}

[rootなのにアクセス権がなくて、コピーやバックアップが上手く行かないことがある。 - Qiita](https://qiita.com/horitasho/items/0f46e26e4afdbf9c59fc)


## cronでスケジュール実行を行う {#cronでスケジュール実行を行う}


### 起動 {#起動}

`echo "PASSWORD" | sudo -S service cron start > /dev/null 2>&1`

-   `>  /dev/null 2>&1` 出力をすべて捨てる
-   `-S` はパスワードを標準入力から読み込む


### 終了 {#終了}

`sodo service cron stop`


### 書き方 {#書き方}

```shell
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
```


### [推奨] /etc/cron.d を編集する。 {#推奨-etc-cron-dot-d-を編集する}

/etc/cron.d/内に拡張子のないファイルを作って、そこに上と同様にスケジュールを書き込む。


### [非推奨] crontab {#非推奨-crontab}

`crontab -e min hour day-of-month month day-of-week  user-name command`

`*/10 * * * * USR sh /home/USR/bin/sync.sh` 10分ごとにsync.shを実行する。

このコマンドで編集した場合は `/var/spool/cron/crontabs` にユーザー名のファイルが保存される。

`crontab -r` でコマンドを削除。間違いが起こりやすいのでcrontabは使わないほうが良い。

ログを出力したい場合はコマンドの後に `>> ~/.cron.log` などとするのもよい。


### ログを出力する rsyslogd {#ログを出力する-rsyslogd}

/etc/rsyslog.d/50-default.confでコメントアウトされている

```nil
#cron.*                          /var/log/cron.log
```

のコメントを外す。

rsyslogdを起動する。

```shell
sudo rsyslogd
```

/var/log/cron.logに出力される。


### WSLでwindows起動時にcronをスタートアップから起動する {#wslでwindows起動時にcronをスタートアップから起動する}

wsl上ではcronもrsyslogdも自動起動しない。以下の.batファイルを作成してスタートアップに入れておく。

```shell
wsl -u root -- rsyslogd
wsl -u root -- service cron start
```

このときファイル名をwslなどのコマンド名と同じにするとループして終わらなくなるので注意。


### 参考 {#参考}

-   [【Ubuntu】cron（crontab）でプログラムを定期的に実行：ジョブスケジューリング | OFFICE54](https://office54.net/iot/linux/ubuntu-cron-crontab)
-   [【Ubuntu】cronのログを/var/log/cron.logへ出力させる方法 | server-memo.net](https://www.server-memo.net/ubuntu/ubuntu_cron_log.html)
-   [batファイル名の落とし穴・・・連続実行されてしまう | 猫型iPS細胞研究所](https://ips.nekotype.com/1591/)
-   [Windows10: WSLのcronサービスを自動起動させる – システム管理メモ](http://www.lifewithunix.jp/notes/2021/06/15/how-to-describe-wsl-cron-automatically-start/)


## ubuntuのwineでwindowsソフトウェアを動かす {#ubuntuのwineでwindowsソフトウェアを動かす}

便利なツールだが、これを使うくらいならwindowsをインストールすればいいのではないだろうか。

```shell
sudo apt-get install wine winetricks -y
```

winetricksを起動すると色々設定ができる。

```shell
wine Downloads/foobar2000_v2.0.exe
```

とするとwindowsのインストーラを普通に開いてインストールできる。
`/home/.wine/drive_c/` の中にwindowsと同じようなディレクトリが作られていてここに入る。

ただ、なんというかあまり使い勝手が良くない気がする...

インストールもできるし起動もできるのだが。

文字が豆腐になっているので適当なフォントに変える。
wine上にフォントをインストールすることもできるのだが、何もしなくても一覧の中に日本語フォントがあるからそれを選べばいいと思う。

```shell
sudo curl -o /usr/share/applications/wine.desktop https://raw.githubusercontent.com/wine-mirror/wine/5c2d6211f6590d3856dc9188593b3d3597c8b441/loader/wine.desktop
```

をやると、エクスプローラ上でexeファイルを実行できるようになる。

foobarのインストーラをダウンロードして、インストールすると普通に起動する。
componentなども普通にダブルクリックで導入できる。
m4aもubuntuではGstreamを入れないと再生できないが、これなら労せずできる。ただ、Video周りが微妙で私の環境ではうまく表示されなかった。
VLCを使えばいいのだが。

wasapiは多分使えない、というか排他モードになっているのかよくわからない。


### foobar {#foobar}

-   [WineHQ - foobar2000](https://appdb.winehq.org/objectManager.php?sClass=application&iId=1749)
-   [Wineを使ってWindowsアプリケーション(.exe)をMac/Linuxで動かす | FRONTL1NE (フロントライン)](https://frontl1ne.net/2019/08/run-windows-application-on-unix-with-wine/)


### フォント {#フォント}

<https://kakurasan.tk/winenotes/fontsettings/>

winecfgを開いて外観の設定

-   アクティブ タイトルのテキスト
-   ヒントのテキスト
-   メッセージ ボックスのテキスト
-   メニューのテキスト

のフォントを日本語対応のものに変える。


## ubuntuでゲームはできるか {#ubuntuでゲームはできるか}

[第626回　UbuntuでもSteamのWindowsゲームを！ | gihyo.jp](https://gihyo.jp/admin/serial/01/ubuntu-recipe/0626)

これを見るとsteamならいけそうだが、私がTOME4をやろうとした限りでは無理と思ったほうがいい。日常的に使いたいならwindowsをベースにWSLかVirtualboxなどの仮想OSを使うべきだろう。


### steam {#steam}

公式HPからdebファイルをダウンロードして

```shell
sudo dpkg -i pkgname
```

でインストールできる。起動も問題ない。

tome4を起動すると時々クラッシュして再起動せざるを得ない状態に追い込まれる。
Factorioは普通に動く。万能ではないが使える時は使えそう。でも、tome4は公式にlinux用のインストーラが配布されているのだが。


### tome4 {#tome4}

読み込み時のプログレスバーの読み込みが早いときと遅いときの差が著しい。遅い時はどれだけ待っても（100%になっても）次に進まない。プレイはできるのだがこのあたり非常に不安定なのが気になる。

私がubuntuは厳しいなと思った2回目の瞬間


#### エラー {#エラー}

1つ分かったのは./t-engigeで起動したほうが良いということ。こうすると、プログラムのDumpが都度出力されて何が起こっているのかすぐわかる。

```text
not enough memory
[ENGINE] Setting requested FPS to 30 (33 ms)
[ENGINE] Setting requested FPS to 2 (500 ms)
```

などのエラーが出てくる。ただ、出ないときもあるし原因がよくわからない。


#### パッケージ不足か {#パッケージ不足か}

よくよくエラーを見ていると〇〇がないというのが散見された。

multiarch-support
: [Index of /ubuntu/pool/main/g/glibc](http://security.ubuntu.com/ubuntu/pool/main/g/glibc/)

libgcrypt11
: [Fix Missing libgcrypt11 Causing Spotify, Brackets And Other Apps Not To Work ...](http://www.webupd8.org/2015/04/fix-missing-libgcrypt11-causing-spotify.html)

libcanberra-gtk-module
: sudo apt install libcanberra-gtk-module

NVCtrl
: libxnvctrl0
    これはあまり関係ないかもしれない。エラーと言ってもINFOに過ぎず、深刻なものではない。

たしかにエラーは減ったのだがあまり解決もしていない。


## ubuntuでCDをリッピングする {#ubuntuでcdをリッピングする}

これは記載の通りにやればうまく行くし、リッピングもできる。

-   [Ubuntu で音楽 CD のリッピング | text.Baldanders.info](https://text.baldanders.info/remark/2019/06/ripping-cd-music-in-ubuntu/)
-   [Ubuntuで音楽CDのリッピングはAsunder一択！裏技あり！ - 処分か？再生か？パソコン・スマホの格安運用法！](https://lifeisbeatfull.com/712.html)

<!--listend-->

```shell
sudo apt install asunder lame
```

Asunderを起動して、「設定」→「詳細」を開いてください。このように「インターネット接続にHTTPプロクシを使う」にチェックを入れて、サーバのところに「freedbtest.dyndns.org」と入力し、ポートのところを「80」に修正します。


## ubuntuでDVDを再生する {#ubuntuでdvdを再生する}


### 手順 {#手順}

参考サイトのとおりだが、書いてあるとおりにやればOK


#### VLCのインストール {#vlcのインストール}

```shell
sudo apt install vlc
```


#### libdvd-pkg {#libdvd-pkg}

```shell
sudo apt install libdvd-pkg && sudo dpkg-reconfigure libdvd-pkg
```

選択肢はすべて「はい」でいい


#### regionsetツールをインストール {#regionsetツールをインストール}

ubuntu software を開いてSynaptic Package Managerをインストール。起動して regionset で検索、インストールする。


#### リージョンコードを書き換える {#リージョンコードを書き換える}

DVDを入れておく。sr0にマウントされる。

```shell
sudo regionset /dev/sr0
```

Would you like to change the region setting of your drive? [y/n]: y

Enter the new region number for your drive [1..8]:2

2は日本のリージョンコード。

New mask: 0xFFFFFFFD, correct? [y/n]:y

完了。

これでVLCでDVDを再生できる。


### ref {#ref}

[Ubuntu DVD再生ソフトVLCのインストール～リージョンコードの書き換え方法 ｜ 旅好きねっと｜なまら北海道野郎](https://tabi-suki.net/ubuntu-vlc-install-rewrite-dvd-region-code.html)


## ubuntuにウイルス対策は必要か {#ubuntuにウイルス対策は必要か}

[【Ubuntu日和】【第21回】ウイルス対策は必要？rootはなぜ無効？Ubuntuにおけるセキュリティのキホン - PC Watch](https://pc.watch.impress.co.jp/docs/column/ubuntu/1479414.html)
