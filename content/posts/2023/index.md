---
title: "2023年何やるか整理する"
date: 2023-01-13T00:00:00+09:00
draft: false
---

# 2022年やったこと

2023年に集中して時間をかけていきたいことを整理するために、2022年の振り返りなどをする。

## Snowflake

[Snowflake](https://www.snowflake.com/?lang=ja)に関して記事をZennで発信したり、　[terraform-provider-snowflake](https://github.com/Snowflake-Labs/terraform-provider-snowflake)というOSSにもいくつものPRがマージされた。結果的に、上位コントリビュータの欄に出てくるようになった。

![zenn](https://user-images.githubusercontent.com/13862551/212060143-aca492e2-46eb-4d71-bd01-16c481c5a8c9.png "zenn")

![terraform](https://user-images.githubusercontent.com/13862551/212060400-85af2d54-29d6-4bbd-970c-b4fe6a7813d4.png "terraform")

気になるところを見つけてはPRを出していたので、年末ごろにはSnowflakeのエンジニアとマネージャーから、今後のproviderについて議論したいという連絡も受けた。

![pr](https://user-images.githubusercontent.com/13862551/212062196-1d884504-bc78-4260-87ba-8ad1fcf059a6.png "pr")

他にも、普段の業務で扱っているデータエンジニアリングの知識をもとに、Snowflakeを使ってデータ基盤を一式構築するための知見をZennの本として公開した。

![](https://user-images.githubusercontent.com/13862551/212061334-1274b65f-cb86-450c-acda-368b3a7077de.png)

上にあげたようなものをはじめ、2022年は特にSnowflakeでたくさん遊んだなぁ（貢献したなぁ）という気持ちで終了しました。
社内でもチーム内外問わず質問のDMをいただけるようになったり、関連する話をたくさん相談されることになったので取り組んだことに対しては満足しています。
今後の動きについては後述します。

## Mage

[Mage](https://www.mage.ai/)というデータパイプライン（ワークフロー）のツールに関する日本で最初の紹介記事を書いてみたりもした。
ちょうどワークフローツールの比較をしているときに、AirflowやPrefectなどとの比較をしているうちに存在を知って、zennで軽く紹介した。
これについては、MageのCEOから直接、感謝のメッセージをもらったりしたので、印象に残っていて、これから伸びてほしいと思うし、自分も開発に加わっていこうという気持ちもある。


# 2023やること・注力したいこと

Snowflake DataSuperHeroも応募も出してみたが、サクッとリジェクトされました。
これもあって、2023年はSnowflakeからは少し離れようと思う。
自分の時間を使って記事書いたり、provider開発したりしてて、ボランティア続けるのが少しストレスになってきていた。（代わりにOSS開発誰かやってください）

Snowflake DataSuperHeroの申請にもOSSの考慮してほしい的なことは書いたけど、結果的に落とされたしもうやらないw

Mageについては、開発に加わろうかなと思っている。
アメリカのまだ新しい会社でプロダクトとしても未成熟ではあるが、中の人がDMくれたり印象が良いので、そちらは少し時間を割いても良いかなと思っている。
他のPipeline系のツールも色々と触ってみたいと思ってるので、空いた時間があれば見ていきたい。

AWS関係のGoのsdkで使いにくいものがいくつかあるので、そのあたりを自分で新しいものつくってもよさそう。

ソフトウェア開発の知識を身につけたい。


