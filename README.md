# Application name
Work_Manual_App
# Application overview
作業マニュアルの一元管理が可能なWebアプリケーションです。
作業教育をこのアプリケーションを使い実施することができます。
# URL
https://work-manual-app.herokuapp.com/ 

# テスト用アカウント
ID: test1@example
Pass: a111111

# 利用方法
ユーザー登録を行い、マニュアルを登録した後に、手順の登録ができます。
ユーザー登録時の権限により、機能と表示を制限しています。
基本的にはログインしていれば閲覧は全てのユーザーが、可能であるが、閲覧者は承認済みのみ可能です。
タグによる検索でマニュアルの一覧表示が可能です。
メッセージ機能でメールへの送信が可能です。
# 目指した課題解決
現在人手不足が深刻化しており、新入社員への教育時間がさけない現状があります。
しかし、品質やサービスの質に直結する要素として作業手順が重要なので、疎かにできません。
また作業マニュアル管理に対しても、管理工数がかかります。
よってこのアプリケーションを使用し、新入社員が教育者がいなくても自身で学習し、独り立ちできることをサポートします。
また感コツと行った熟練工の作業は、ニュアンスが伝わるよう動画を添付できるようにし、理解できるようにしました。

# 要件定義
[![Image from Gyazo](https://i.gyazo.com/79621746b8db2aa11bdfeb613ebd8eac.png)](https://gyazo.com/79621746b8db2aa11bdfeb613ebd8eac)
# 実装した機能の説明
## アプリケーションの使い方
誰でもわかりやすいよう、アプリケーションのHOW_TOを記載しています。
[![Image from Gyazo](https://i.gyazo.com/8ad3b723cfa3a5b0d0e6d72be10c0802.gif)](https://gyazo.com/8ad3b723cfa3a5b0d0e6d72be10c0802)

## ユーザー登録
ユーザー登録時に、権限を付与することで、マニュアル作成・削除や承認権限の機能に制限をかけています。
[![Image from Gyazo](https://i.gyazo.com/cda59b8fe99a16c3d770a907b0517713.gif)](https://gyazo.com/cda59b8fe99a16c3d770a907b0517713)
## マニュアル一覧
登録されたマニュアルが一覧で確認できます。このマニュアルは承認の有無でユーザーの権限により閲覧対象が変わります。動画を登録できます。
[![Image from Gyazo](https://i.gyazo.com/0074752a27e4c23630ee42c2f83cbc3e.gif)](https://gyazo.com/0074752a27e4c23630ee42c2f83cbc3e)

## マニュアル登録 タグ機能
マニュアル登録時にタグを入力します。インクリメンタルサーチを行っています。
[![Image from Gyazo](https://i.gyazo.com/eff60861386a1dd7f06a60d2600acff7.gif)](https://gyazo.com/eff60861386a1dd7f06a60d2600acff7)
## 手順の詳細
マニュアルの詳細ページでは手順の登録が画像付きで保存できます。最下部のフォームから追加します。手順の一つ一つ削除ができます。
[![Image from Gyazo](https://i.gyazo.com/2462b3ee546ad84011ed68637abd783f.gif)](https://gyazo.com/2462b3ee546ad84011ed68637abd783f)

## マニュアル検索
検索フォームに条件を入れることで、マニュアル検索が可能です。
[![Image from Gyazo](https://i.gyazo.com/018fdd40728e672733978d55ec4534b7.gif)](https://gyazo.com/018fdd40728e672733978d55ec4534b7)
## マニュアル承認
マニュアル承認することで、閲覧ページに表示ができます。非承認で表示を取り消すことができます。
[![Image from Gyazo](https://i.gyazo.com/a3ac8577aaac29322cf2a5cb08ddaf93.gif)](https://gyazo.com/a3ac8577aaac29322cf2a5cb08ddaf93)
## メッセージ送信
メッセージフォームから宛先を指定すると登録されているemailにメッセージが送信できます。
[![Image from Gyazo](https://i.gyazo.com/2e8dfefd54d1d72e5bd8ba9735866a16.png)](https://gyazo.com/2e8dfefd54d1d72e5bd8ba9735866a16)
[![Image from Gyazo](https://i.gyazo.com/f302b4dbd0cdfc9169dfa132ae8be091.png)](https://gyazo.com/f302b4dbd0cdfc9169dfa132ae8be091)
# データベース設計
## ER図
[![Image from Gyazo](https://i.gyazo.com/c2d9fdf0ff4fa7a8dcb266596ceab3ff.png)](https://gyazo.com/c2d9fdf0ff4fa7a8dcb266596ceab3ff)
## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5bf0fbc9295aa829136e45c2ed97c4fb.png)](https://gyazo.com/5bf0fbc9295aa829136e45c2ed97c4fb)

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
- has_many :messages

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
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| work_manual | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
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

## messagesテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| content     | text       | null: false                    |
| destination | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
### Association
- belongs_to :user
