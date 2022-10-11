---
title: "Makefile setup"
date: 2022-09-19T05:49:51+09:00
draft: false
---


Makefileの基本設定について

# Makefile

ディレクトリに`Makefile`としてファイルを作成する。

```shell
# 上部に共通で使用する変数を書く。 cd $(TARGET)などのように使う
VARIABLE = hoge
TARGET = target

.PHONY: command-name
command-name:  ## comment of this command
	# ここにコマンドを書く
    cd dir_name

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
```

## Usage
- `make help`でコマンド一覧を表示することができる。
- `make command-name`という方法で実行することができる。
- `make`のみを入力した場合は、一番上のコマンドが実行される。つまり、上の例だと`make command-name`を実行したときと同じである。
