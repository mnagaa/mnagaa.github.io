---
title: "ffmpeg: 動画の圧縮・変換"
date: 2022-09-29T05:49:51+09:00
draft: false
---


ffmpegを使って動画を軽量化する。

# ffmpeg

ffmpegは動画や音声を加工するためのツール。

Macの標準の画面収録で作成される`.mov`という形式の動画ファイルは容量が大きいので`.mp4`に変換することでクラウドにアップロードしたりしている。

特に学会発表とかで動画を用意しておかないといけない時にアップロード上限などに収まらない時に使っていた。

## 基本的にこれで良い

```shell
brew install ffmpeg
```

```shell
ffmpeg -i original.mov transformed.mp4
```

- original.movが変換前の動画。Macで画面収録した時に生成される。
- transformed.mp4が変換後の動画。結構圧縮できることがある。
