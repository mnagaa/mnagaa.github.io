---
title: "Github Pages + Hugo"
date: 2022-08-07T16:31:51+09:00
draft: false
---


Github PagesとHugoでProfileページを作って公開する。


## はじめ方

```shell
$ brew install hugo
$ hugo new site $(siteName)
```

テンプレートとして`PaperMod`を使用する。

```shell
$ cd $(siteName)
$ git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod --depth=1                                                                                  ─╯
$ git submodule update --init --recursive
```

config.ymlを更新する。

## 公開方法

`Repository home -> Settings -> Pages` からデプロイ方法にGithub Actionsを指定する。
`config.yml`のbaseURLの下あたりに、`publishDir: "public"`を追加する。

## 更新方法

`hugo server -D`でローカルでサーバが起動する。

`hugo new post/${pageTitle}.md`で新しいページを作成する。
そして、マークダウンファイルを更新する。
公開したい場合は`draft: false`に変更する。

