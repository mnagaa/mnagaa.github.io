# Makefile — Hugo/PaperMod ローカル開発用

HUGO        ?= hugo
BASE_URL    ?= https://mnagaa.github.io

.DEFAULT_GOAL := help
.PHONY: help serve build clean preview update-theme act-build

help: ## このヘルプを表示
	@printf "\n主要ターゲット一覧:\n\n"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@printf "\n"

serve: ## ローカルサーバを起動（ドラフトも含む / 高速レンダリング無効）
	$(HUGO) server --buildDrafts --disableFastRender

build: ## 本番相当のファイルを ./public に出力
	$(HUGO) --minify --baseURL $(BASE_URL)

clean: ## 生成物を削除
	rm -rf public

preview: build ## build した内容をローカル 1313 ポートで確認
	cd public && python3 -m http.server 1313

update-theme: ## PaperMod テーマを取得（初回） & 最新へ更新
	git submodule update --init --recursive --remote --merge

act-build: ## GitHub Actions の build job をローカル Docker で実行（要 act）
	act -j build
