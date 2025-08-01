# Makefile — Hugo/PaperMod ローカル開発用

HUGO        ?= hugo
BASE_URL    ?= https://mnagaa.github.io

## ヘルプ
help:
	@echo "\n主要ターゲット一覧:";
	@grep -E '^##' Makefile | sed -e 's/^## //';

## ローカルサーバを起動（ドラフトも含む / 高速レンダリング無効）
serve:
	$(HUGO) server --buildDrafts --disableFastRender

## 本番相当のファイルを ./public に出力
build:
	$(HUGO) --minify --baseURL $(BASE_URL)

## 生成物を削除
clean:
	rm -rf public

## build した内容をローカル 1313 ポートで確認
preview: build
	cd public && python3 -m http.server 1313

## PaperMod テーマを取得（初回） & 最新へ更新
update-theme:
	git submodule update --init --recursive --remote --merge

## GitHub Actions の build job をローカル Docker で実行（要 act）
act-build:
	act -j build

