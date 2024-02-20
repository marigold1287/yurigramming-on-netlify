+++
title = "emacsでセーブのたびにbackupファイルを作成する"
author = ["Marigold"]
description = "emacsで編集した文書の喪失を防ぐためにすべきこと"
date = 2024-01-20T10:58:00+09:00
lastmod = 2024-02-21T01:02:36+09:00
tags = ["emacs"]
categories = ["article"]
draft = false
+++

## 前置き {#前置き}

emacsでファイルを削除する時に
`delete-file-and-buffer` という関数をネットで拝借して使っていた。

```elisp
;; 間違えて消すと復元できなくなるので絶対に使わないこと。
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (delete-file filename)
              (message "Deleted file %s." filename)
              (kill-buffer)))
      (message "Not a file visiting buffer!"))))
```

emacsでは開いているバッファーのファイルを消す関数というのはなくて便利ではあるのだが、誤って必要なファイルを消してしまった時にファイルとバッファーを両方消してしまったら復元する方法は基本的にない。

デフォルトでは `~` のついたファイルがバックアップとして保存されるようになっているのだが、ディレクトリが汚れてしまうのが嫌で無効にしていたのも良くなかった。

再発防止のためにやはりバックアップは取っておくべきだろうということで設定を変更することにした。


## 手順 {#手順}


### バックアップを有効にする {#バックアップを有効にする}

デフォルトでは有効になっているのであえて書く必要はないが...

```elisp
(setq make-backup-files t)
```

とする。

非nilの場合、 **Emacsは初回保存時に** すべてのファイルのバックアップを作成する。起動後1回しか保存されないのは、その後の編集はカレントセッションの編集ということになるので `C-/` で復元できるからという思想のようだ。


### バックアップファイルの保存先を決める {#バックアップファイルの保存先を決める}

以下のようにすると、 `"."` すべてのファイルを、
`"~/.emacs.d/backups"` に保存する。絶対パスで指定すると元ファイルの保存場所を問わず指定したフォルダに保存される。このため、ファイル名は `!home!username!.emacs.d!init.el~` のように
`!` で区切られる。

```elisp
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
```

相対パスで指定した場合は元ファイルからの相対パス上に保存される。


### 復元する {#復元する}

雑なスクリプトだが

```shell
mv \!home\!username\!Temp\!gcc\!test.txt `ls \!home\!username\!Temp\!gcc\!test.txt | sed "s/\!/\//g"`
```

ディレクトリがすでに存在している必要はあるがこのスクリプトで `!` を `/` に変換して元の場所に移動させることができる。


## delete-current-buffer-file {#delete-current-buffer-file}

今回誤って削除してしまった元凶の関数を次のように修正した。消す前にsaveしてbackupをとるようにした。

```elisp
(defun delete-current-buffer-file()
  "deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (save-buffer)
              (backup-buffer)
              (delete-file filename)
              (kill-current-buffer)
              (message "Deleted file %s." filename)))
      (message "Not a file visiting buffer!"))))
```


## 補足 保存するたびにバックアップをとりたい時 {#補足-保存するたびにバックアップをとりたい時}

そうはいってもセーブごとにバックアップを取ったほうが安全だろう。調べているとそういう人は多いようで
[EmacsWiki: Force Backups](https://www.emacswiki.org/emacs/ForceBackups)などに解説が書かれている。

初回保存時に `buffer-backed-up` が `t` になるから保存のたびに `nil` に書き換えることでセーブのたびにバックアップを取ることが出来る。

`version-control` は `t` にしておかないと1つのファイルに対して1つのバックアップファイルしか残らないので有効にしておく。

```elisp
;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))
(setq make-backup-files t) ; Make Backup File
(setq vc-make-backup-files t)
(setq
    backup-by-copying t      ; don't clobber symlinks
    delete-old-versions t
    kept-new-versions 6
    kept-old-versions 2
    version-control t)       ; use versioned backups
(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook  'force-backup-of-buffer)
```


## 参考 {#参考}

<https://ayatakesi.github.io/emacs/24.5/elisp_html/Backup-Files.html>
