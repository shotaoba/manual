# Application name
manual_app
# Application overview
作業手順の管理ができる

# URL	デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。


# テスト用アカウント	ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。
# 利用方法	このアプリケーションの利用方法を記述。
# 目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。
現在人手不足が深刻化しており、新入社員への教育時間がさけない。
しかし、教育は品質やサービスの質に直結する要素なので、疎かにできない。
よってこのアプリケーションを使用し、新入社員が教育者がいなくても自身で学習し、独り立ちできることをサポートする。
また感コツと行った熟練工の作業は、ニュアンスが伝わるよう動画を添付できるようにし、理解できるようにした。

# 洗い出した要件	スプレッドシートにまとめた要件定義を記述。
# 実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
# 実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

# データベース設計	ER図等を添付。
## usersテーブル
| Column             | Type       | Options                       |
| -------------------| ---------- | ------------------------------|
| name               | string     | null: false                   |
| email              | string     | null: false, uniqueness: true |
| password           | string     | null: false                   |
| encrypted_password | string     | null: false                   |
| authority_id       | integer    | null: false                   |
### Association
- has_many :work_manuals
- has_many :approvals
- has_many :procedures


## work_manualsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| process | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
### Association
- belongs_to :approval
- belongs_to :user
- has_many :work_manual_tag_relations
- has_many :tags, through: :work_manual_tag_relations
- has_many :procedures
- has_one_attached :video


## proceduresテーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| description    | text       | null: false |
| point          | text       |             |
| work_manual_id | integer    | null: false |
| user_id        | integer    | null: false |
### Association
- belongs_to :work_manual
- has_many :users
- has_one_attached :image


## approvalsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| manual | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
### Association
- belongs_to :work_manual
- belongs_to :user


## tagsテーブル
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| name   | string     | null: false, uniqueness: true |
### Association
- has_many :work_manual_tag_relations
- has_many :work_manuals, through: :work_manual_tag_relations

## work_manual_tagsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| work_manual | references | null: false, foreign_key: true |
| tag         | references | null: false, foreign_key: true |
### Association
- belongs_to :work_manual
- belongs_to :tag


# ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション