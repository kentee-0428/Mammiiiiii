# 1.自己紹介

・29歳でエンジニアを目指し会社を辞め、プログラミングスクールに通い現在は就職活動中です。

・英語圏での留学経験がある為、プログラミング学習は割とはじめやすかったです。

・好きなスポーツは球技全般。学生時代は野球をしていました。

・現在は、麻雀できるように勉強中です。

# 2.作成したアプリについて

子育てに役立つ情報や子育て中の親同士のコミュニケーションの場を提供したいと思い作成しました。

アプリ名: 『Mammiiiiii(マミー)』

アプリURL: https://mammiiiiii-0326.herokuapp.com/

GithubURL: https://github.com/kentee-0428/mammiiiiii

ホーム画面からゲストログインできます。（その他、新規登録画面からも可能です。）

![Alt text](/app/assets/images/readme/portfolio_1.png)

メインのターゲットユーザー：　「子育て中の親、またはこれから子育てに関する知識や情報を取得したい人へ」

# 3.作成背景

私自身6人兄弟で幼い頃から両親が一生懸命育てて頂きました。また、甥・姪っ子が現在6人おり時々一緒に遊んだり子守りをしましたがその時に、子育てがとても大変で体力のいることだと実際に体験して思いました。

子育て中の人もそうで無い人も子育てに関する感想や悩みなどをユーザー同士が繋がり情報を共有し助け合いのできる場を提供したいと思い作成しました。

また、現在の日本では少子高齢化が深刻な社会問題となっており2023年4月1日に「こども家庭庁」が発足し今後は益々、育児や子育てに関する法律や制度など様々なことが変わっていくと予想されます。

その情報などをユーザー同士で話し合いより良い環境をユーザー自ら発見し模索することで家庭とアプリを育てて行けたら良いなと思っております。

# 4.作成目的

子育て・育児に関する情報を取得したかったから

子育てをやっていない人と子育て中の人も簡単に繋がれるようにしたかったから
(実際に子育て中の人の意見が聞ける)

悩みや・アドバイスなどをユーザー同士でコミュニケーションを取れるプラットフォーム作りたかった。


# 5.使用画面のイメージ

使用画面のイメージについては以下の通りです。

①トップページ

②ユーザー関連ページ

③ポスト関連ページ

④スポット詳細ページ


## ①トップページ

トップページで何のアプリなのか分かりやすくしました。

本アプリの概要を掲載しました。

各機能の簡単な説明を掲載しました。

簡単なQ&Aを掲載しました。

![Alt text](/app/assets/images/readme/portfolio_7.mp4)

## ②ユーザー関連ページ

ユーザー一覧ページからでも各ユーザーのポスト・スポット数が分かるようにした。

ユーザー詳細ページでは本人が投稿したポスト・スポットを確認できるようにした。

・ユーザー一覧

・ユーザー詳細

・ユーザー新規登録

・ユーザー編集

![Alt text](/app/assets/images/readme/portfolio_2.png)


## ③ポスト関連ページ

ポスト詳細ページではその投稿に対しての他のユーザーがコメントできるようにした。

・ポスト一覧

・ポスト詳細

・ポスト新規登録

・ポスト編集

![Alt text](/app/assets/images/readme/portfolio_3.png)

## ④スポット関連ページ

サイドバーでスポットのカテゴリー検索できるように実装。

PCは3カラムでタブレットは2カラムスマホは1カラムで実装。

・スポット一覧

・スポット詳細

・スポット新規登録

・スポット編集

![Alt text](/app/assets/images/readme/portfolio_4.png)

# 6.機能一覧

## 基本機能

### ユーザー関連

・ユーザー一覧表示

・ユーザー詳細ページ表示

・ユーザー投稿

・ユーザー編集

・ユーザー削除
フラッシュメッセージ機能（ユーザーの投稿・編集・削除）

### ポスト関連

・ポスト一覧表示

・ポスト詳細ページ表示
コメント機能(各投稿に対して他のユーザーがコメントできる)
いいね！機能(各投稿に対していいね！ができる)

・ポスト投稿

・ポスト編集

・ポスト削除
フラッシュメッセージ機能（ポストの投稿・編集・削除）

### スポット関連

・スポット一覧表示
カテゴリ検索機能(投稿時に選択したカテゴリを検索できる)
一覧を12件ごとにページネーション表示

・スポット詳細ページ表示

・スポット投稿

・スポット編集

・スポット削除
フラッシュメッセージ機能（スポットの投稿・編集・削除）

### ユーザー認証機能

・ユーザーログイン・ログアウト

・ゲストログイン

・アカウント再設定


# 7.使用技術

## フロントエンド

HTML

CSS,Sass

Booststrap5

【技術選定理由】

Booststrapを所々使用しました。基本はCSSで記述し、当初はレイアウト崩れなど使い方に手間取りましたがスキルアップのためBooststrap5を採用しました。

## バックエンド

Ruby 3.1.0

Ruby on Rails 6.1.7.3

【技術選定理由】

初学者向けのわかりやすい教材・記事が多数ある

##インフラ

Docker

Heroku(本番環境)＋AWS(S3)

【技術選定理由】

アプリの開発作業に集中したかったため、インフラにはデプロイ作業が簡易的にできるHerokuを採用しました。

AWSにデプロイしたかったのですが、力不足のため実現できなかったので、

今後AWSについてはこのアプリのデプロイ作業を通して、学習していく予定です。

## データベース

MySQL ver 14.14

## その他

Visual Studio Code（エディター）

Github(ソースコード管理)

Draw.io (ER図の作成)

pixabay(画像素材)


# 8.ER図
![Alt text](/app/assets/images/readme/portfolio_8.png)


# 9.工夫した点

## ユーザビリティーを意識して作成

【シンプルに作成】

余白などを余分に取りユーザーが見やすいように意識して作成。

【大きさ・位置の調整】

スマホサイズの画面ではボタンの大きさ・位置などを意識して作成。
(具体的にボタンの大きさをPC版と比べて大きくしたり、位置を右手でスマホを持った時に親指で届く位置に配置など)

【アイコン採用】

パッと見た時に何のボタンか？何を意味するリンクなのかが分かりやすく、また文字ばかりのアプリでは可読性に欠けるのでアイコンを採用。

![Alt text](/app/assets/images/readme/portfolio_5.png)
![Alt text](/app/assets/images/readme/portfolio_6.png)

# 10.作成中に意識したこと

### ①継続的な自己改善を意識

プログラミング学習を始めた当初から、自己改善に取り組むことを意識していました。定期的に自分のコードを見直し、改善点を見つけることで、より効率的で見やすいコードを書けるようになりました。

### ②フレームワークの理解

フレームワークを使うことで、開発効率の向上やコードの品質向上が期待できます。そこで、Webフレームワークやオープンソースのライブラリを学び、適切なフレームワークの選択や使い方を意識しました。

### ③問題解決能力の向上

プログラミングにおいては、問題解決能力が重要だと思います。プログラムが思った通りに動かなかった際に、自分なりに考えて問題を解決することを意識しました。また、問題解決のためにインターネットや書籍を活用し、自分で解決できる力を身に付けることを目指しました。


# 11.今後の課題・やりたかったことなど

・スポット投稿機能とGooglemapと連携

・Facebook・Twitterシェア

・AWSにデプロイ


# 12.アプリ作成後の感想

ポートフォリオを作成することで、自分自身のスキルや経験を整理し、自己分析を深めることができました。ポートフォリオ作成にあたっては、デザインやコンテンツの構成など、自分が想像する以上に多くの時間や労力が必要であることを実感しました。しかし、作成が終わった時には、自分が過去に取り組んだプロジェクトや実績を振り返り、自分自身の成長を実感できました。今後は、ポートフォリオを随時更新し、自分のスキルアップとともに自己アピールを行っていきたいと思っています。
