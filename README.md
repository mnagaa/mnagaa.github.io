# mnagaa.github.io

Hugo + PaperMod で運用している個人サイト（GitHub Pages）のリポジトリです。

## ローカルでの起動方法

### 前提条件

- [Hugo](https://gohugo.io/installation/) がインストールされていること（Extended 版を推奨）

### 初回セットアップ

テーマ（PaperMod）は Git サブモジュールで管理されています。初回のみサブモジュールを取得してください。

```bash
git submodule update --init --recursive
```

### ローカルサーバを起動

```bash
make serve
```

ブラウザで **http://localhost:1313** にアクセスするとサイトを確認できます。ドラフト記事も表示され、ファイル変更時に自動で再ビルドされます。

### その他の Make ターゲット

| コマンド | 説明 |
|----------|------|
| `make build` | 本番相当のファイルを `./public` に出力 |
| `make preview` | `build` 後に `public` をポート 1313 で配信 |
| `make clean` | 生成物（`public`）を削除 |
| `make update-theme` | PaperMod テーマを最新に更新 |
