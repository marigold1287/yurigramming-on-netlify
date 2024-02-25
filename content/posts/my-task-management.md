+++
title = "タスク管理方法を考える"
author = ["Marigold"]
description = "emacsでGTD的なタスク管理を実施できるように環境を構築した。"
date = 2024-01-07T21:44:00+09:00
lastmod = 2024-02-25T22:13:42+09:00
tags = ["management"]
categories = ["article"]
draft = false
+++

## はじめに {#はじめに}

読書、登山、仕事、色々なことに手を出すようになって今までよりも豊かな生活を送れるようになったのは良いことなのだが、優先順位をつけないままに色々なことに手を出しすぎていて発散気味になってしまっている。

今まで身につけた知識をまとめてどのようにタスクを管理すべきか考えてみたい。


## GTD {#gtd}

[GTD](https://ja.wikipedia.org/wiki/Getting_Things_Done)的アプローチをとるならおそらくこうなる。手順は調べれば色々と出てくるが、大事なのはどのタスクに取り組み、どのタスクは後回しにする、あるいは取り組まないかを選別することだろう。


### タスクを書き出す {#タスクを書き出す}

まずやりたいことを全て書き出してみる。これは頭の整理も兼ねていて思いつくままにすべて吐き出す。


### タスクを仕分ける {#タスクを仕分ける}

書き出したものをすべて実行するのはおそらく不可能である。時間は限られているということを自覚して、自分が本当に何をしたいのかをよく考えること。大事でないと判断できるものは切り捨ててしまってよい[^fn:1]。


### タスクに取り組む {#タスクに取り組む}

タスクはすべて整理しているから一つのタスクに集中して取り組む。


### タスクを見直す {#タスクを見直す}

できなかったタスクはないか、不要になったタスクはないか、完了したタスクはアーカイブするなど、タスクリストを最新の状態に保つ。


## 具体的にどうするか {#具体的にどうするか}


### タスク別管理方法 {#タスク別管理方法}

-   具体的なスケジュールが決まっている場合: emacsのjournalでつけている日記に書き込む。
-   決まっていない場合: GTD管理手法を使う。


### emacs {#emacs}

[org-gtd](https://github.com/Trevoke/org-gtd.el)というパッケージも良さそうではあるのだが多機能すぎて使いこなせそうにないというのと今まで運用していたやり方からの移行も大変そうに感じるのでひとまず自力で環境構築を試みた。


#### gtd.org {#gtd-dot-org}

思いついたことはすべてgtd.orgというファイルに書き込む。

```org
* Shopping     :shop:
** Something
** I
** want
* Task         :task:
** task1
** task2
*** subtask1
*** subtask2
```

単発のタスクは1つのサブツリーで、プロジェクトは階層構造にする[^fn:2]。


#### capture-template {#capture-template}

gtd.orgへの書き込みのためのcapture-templateはこんな感じにする。

```elisp
(setq org-capture-templates
      '(("t" "Task" entry
       (file+headline "~/org/works/gtd.org" "Task")
       (file "~/org/template/org-capture-gtd.org")
       :immediate-finish nil
       :unnarrowed nil
       :jump-to-captured nil)

      ("w" "stuff to buy" entry
       (file+headline "~/org/works/gtd.org" "Shopping")
       (file "~/org/template/org-capture-gtd.org")
       :immediate-finish nil
       :unnarrowed nil
       :jump-to-captured nil)))
```

templateはこんな感じ

```org
* %^{Title: }
:PROPERTIES:
:ADDED: %U
:END:
%?
```

gtd.orgのTODOリストは

```org
#+TODO: TODO WAIT | DONE CANCELED
```

のようになっていて、待ち・取り組み中・完了・キャンセルの4つにしている。

これで思いついたことをすべてgtdファイルにためていく。なお、このようにとりあえず溜め込んだものを Stuck と言う[^fn:3]。


#### custom-agenda {#custom-agenda}

タスクを仕分けたり確認するためのcustom-agendaを用意する。
custom-agendaの詳細は[チュートリアル](https://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html)とか[公式マニュアル](https://orgmode.org/manual/Custom-Agenda-Views.html)が参考になる。

まず `C-a g` で取り組むものを TODO にして、保留にするものを WAIT にする。定期的にこのコマンドを実行して WAIT から TODO / CALCELED にしたりする。完了したものは DONE にする。

CANCELしたタスクは `C-a c` で確認できる。

```elisp
(setq org-agenda-custom-commands
      '(("g" "GTD"
         ((agenda "" ((org-agenda-span 7)))
          ;; review all projects (assuming you use todo keywords to designate projects)
          (stuck "")
          (todo "WAIT")
          (todo "TODO"))
         ((org-agenda-files '("~/org/works/gtd.org"))
          (org-agenda-show-all-dates nil)
          (org-agenda-use-time-grid nil)
          (org-stuck-projects
           '("+LEVEL=2/-DONE-CANCELED" ("TODO" "NEXT" "WAIT") nil ""))
          (org-agenda-window-setup 'only-window)))
        ("c" "CANCELED ITEM" todo "CANCELED"
         (
          (org-agenda-files '("~/org/works/gtd.org" "~/org/works/my-booklist.org"))
          (org-agenda-show-all-dates nil)
          (org-agenda-use-time-grid nil)
          (org-agenda-window-setup 'only-window)
          )
         )))
```


## まとめ {#まとめ}

最初から機能の豊富なパッケージを使うのもいいかもしれないが、このパッケージはすでにGTDを実践している人向けというようなところもあって未経験のわたしには多機能過ぎる感じもする。自分でつくってみると勉強にもなるし具体的な運用方法もイメージしやすい。しばらくこれで運用してGTDの考えに慣れた上で機能を拡張していこうと思う。

[^fn:1]: data-lightboxという属性を使うこともできるようだが、attr_htmlでは特定の属性しかエクスポートしてくれないようで使えない。
[^fn:2]: <https://orgmode.org/manual/Breaking-Down-Tasks.html>
[^fn:3]: <https://orgmode.org/manual/Stuck-projects.html>
