
# furima - 商品取引アプリ
## アプリケーション概要
このアプリケーションでは、ユーザーが商品を出品、購入、取引履歴の確認ができます。

## URL※
http://35.79.187.70/

テスト用アカウント
- ユーザー名: xxxx
- パスワード: xxxx
- (Basic認証がある場合) ID/Pass: admin/1010

## 利用方法
- アカウントを作成またはログインします。
- 商品を出品する場合、出品画面から商品情報を入力して出品します。
- 商品を購入する場合、商品一覧から購入したい商品を選択し、購入画面で支払い情報を入力して購入します。
- 取引履歴を確認する場合、マイページから取引履歴を選択します。

## アプリケーションを作成した背景
このアプリケーションを通じて、商品取引を簡単に行えるプラットフォームを提供し、購入者と出品者の間の取引をスムーズに行えるようにすることを目指しています。

## 実装予定の機能
- 商品の検索機能
- カテゴリ別商品表示機能

## データベース設計
ER図はer.dioに記載

## users テーブル


|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|nick_name            |string|null:false               |
|email                |string|null:false, unique: true |
|encrypted_password   |string|null:false               |
|last_name            |string|null:false               |
|first_name           |string|null:false               |
|last_name_kana       |string|null:false               |
|first_name_kana      |string|null:false               | 
|birth                |date  |null:false               |


### Association

* has_many :items
* has_many :orders

## items テーブル


|Column                  |Type      |Options                       |
|------------------------|----------|------------------------------|
|item_name               |string    |null:false                    |
|category_id             |integer   |null:false                    |
|situation_id            |integer   |null:false                    |
|delivery_fee_payment_id |integer   |null:false                    |
|region_id               |integer   |null:false                    |
|deadline_id             |integer   |null:false                    |
|price                   |integer   |null:false                    |
|item_text               |text      |null:false                    |
|user                    |references|null:false,  foreign_key: true|



### Association

* belongs_to :user
* has_one :order

## orders テーブル


|Column|Type      |Options                      |
|------|----------|-----------------------------|
|user  |references|null:false, foreign_key: true|
|item  |references|null:false, foreign_key: true|


### Association

* belongs_to :user
* belongs_to :item
* has_one :address

## addresses テーブル

|Column        |Type      |Options                      |
|--------------|----------|-----------------------------|
|post_code     |string    |null:false                   |
|region_id     |integer   |null:false                   |
|municipalities|string    |null:false                   |
|banchi        |string    |null:false                   |
|building_name |string    |                             |
|number        |string    |null:false                   |
|order         |references|null:false, foreign_key: true|

### Association

* belongs_to :order

## 各テーブルの説明
### usersテーブル
- ニックネーム
- メールアドレス
- 暗号化パスワード
- 姓(漢字) 
- 名(漢字)
- 姓(カナ)
- 名(カナ)
- 誕生年月日

### itemsテーブル
- カテゴリーID (Activehash)
- 価格
- 出品者
- 商品説明
- 商品状態ID (Activehash)
- 配送料負担ID (Activehash)
- 都道府県ID (Activehash)
- 発送までの日数ID (Activehash)

### favoritesテーブル
-ユーザーID (ユーザーの外部キーカラム)
商品ID (商品の外部キーカラム)

### Purchase_historyテーブル
- ユーザーID (ユーザーの外部キーカラム) 
- 商品ID (商品の外部キーカラム)

### addressesテーブル
- 購入履歴
- 郵便番号
- 都道府県ID (Activehash)
- 市区町村
- 番地
- 建物名
- 電話番号

## 開発環境
- 言語: Ruby
- フレームワーク: Ruby on Rails
- データベース: PostgreSQL
- バージョン管理: Git
