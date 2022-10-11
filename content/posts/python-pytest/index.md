---
title: "Pytest context manager"
date: 2022-09-25T00:00:00+09:00
draft: false
---


# Pytest

Pytestを使用する場合に、テスト用/本番用のデータベースを分離する際に行なった方法などをメモしておく。

- [Pytest](https://docs.pytest.org/en/6.2.x/index.html) 

Pytestを使っていて分かったのは、Pytest自体がテスト関数に対して暗黙的にdecoratorなどを使っているため、自分で実装したdecoratorがぶつかってしまうことがあった。
decoratorをPytestと一緒に使うことはあまり好ましいとは思えなかった。
decoratorに渡さないといけない引数などが把握しにくかったり、勝手にPytestから引数を意図せず渡してしまうことになる。

代わりにcontext.managerを活用して、テスト時にテスト用のデータベースに切り替えるという実装をした。

## 関係するツールなど

- [SQLite](https://www.sqlite.org/index.html)
- [Pytest](https://docs.pytest.org/en/6.2.x/index.html) 

まず、データベースのテストのためのfixtureを作成する。擬似コードは以下のよう。

```python
import pytest

@pytest.fixture
def fixture_prepare_records():
    with sqlite.session_manager(use_test=True) as session:
        # (1) データベースへのinsert
    # (2) テスト関数の実行
    yield
    with sqlite.session_manager(use_test=True) as session:
        # (3) データベースからのdelete
        
def test_slot_dialog_repo(fixture_prepare_records):
    with sqlite.session_manager(use_test=True) as session:
        # (4) selectなどを使ったテスト
```

1. 必要なデータのinsert
2. test関数の実行
3. 使用したデータのdelete
4. fixtureで用意したデータを使ってselectなどのテスト（引数としてfixture_prepare_recordsを渡しているところがポイント）

context.managerで実装したsqliteの向き先の変更は以下のよう。デフォルトでは本番DBのパスを向けるようにしている。

```python
import contextlib

@contextlib.contextmanager
def session_manager(use_test: bool = False):
    if use_test:
        # (1)テスト用のパスをセットする
        Params.set_test_env()

    # (2)SQLiteとの接続用のClient
    sqlc = SQLiteClient()
    session = sqlc.create_session()
    try:
        yield session
        session.commit()
    except Exception as e:
        logger.error(e)
        session.rollback()
        raise e
    finally:
        session.close()

    if use_test:
        # (3)最後にprdに戻す
        Params.set_prd_env()
```

- Paramsにはclassmethodとしてデータベースのパスを変更が実装されている。
- yield sessionの部分でsessionを返すことができるので、終わった時にはsessionのclose処理などを正しく実行できるようにしている。
- context.managerのwithの範囲が終了した時に必ず実行されるようになっている。

SQLiteClientの実装は次のようになっている。もう少しうまく実装できると思っているので、このあたりの実装はもう少し改善したいと思っている。

```python
import sqlalchemy
from sqlalchemy.orm import sessionmaker

class SQLiteClient:
    def __init__(self):
        resource = Params.data_resource
        self.resource = f"sqlite:///{resource}"
        self.engine = sqlalchemy.create_engine(self.resource, echo=False)

    def create_tables(self):
        # データベースにテーブルを作成する
        Base.metadata.create_all(bind=self.engine)

    def create_session(self):
        # データベースとの新しいsessionを作成する
        create_session = sessionmaker(bind=self.engine)
        return create_session()
```

最初は`@use_testdb`というようにdecoratorとしてデータベースの切り替えを実装しようとしていたが、pytestとぶつかってしまうということがわかったので`context.manager`を使うことにした。
例えば`@pytest.mark.parametrize`などのpytestが提供する機能を使えるようになったので、コードがすっきりした。

データベースのユニットテストでは、データベースと正しくデータがやりとりできるかをチェックしているが、それよりも上の層では、pytestの機能のmockerなども使用して、データベースにはアクセスしないでロジック部分だけをテストできるようにした。

