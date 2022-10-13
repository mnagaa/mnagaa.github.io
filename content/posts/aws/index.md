---
title: "github actions"
date: 2022-10-14T00:00:00+09:00
draft: false
---

# Github ActionsでAWSと連携する

Terraformなどを使ってリソース管理をしたい場合に、github actionsと連携する方法。

OpenID connectを使う
- https://docs.github.com/ja/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services

> プロバイダー URL の場合: https://token.actions.githubusercontent.com を使います
> "Audience" の場合: 公式のアクションを使っている場合は、sts.amazonaws.com を使います。


- readonly role & policy
- readwrite role & policy

をそれぞれ作成する


githubのcredentialにアカウント番号など設定したり、aws-configureが動くように設定する必要がある。
