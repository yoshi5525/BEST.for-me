# README

## アプリ名
BEST-for-me

## 概要
仕事・生活効率を上げるおすすめ品情報を知りたかったため作成した。便利なアイテムを投稿・閲覧できるように設計した。
ブログやSNSでおすすめ品の情報を見ることはできるが、特化したサイトは少なく、短時間かつまとめて情報を得たいという個人的なニーズを元に作成に至った。

#### 機能一覧
* 投稿機能
* コメント機能
* タグ付与機能
* 投稿検索機能

#### 使用技術
* Ruby on Rails
* HAML
* SASS
* MySQL

## 制作背景

## DEMO
![BEST-for-me](https://user-images.githubusercontent.com/63286009/83207884-2f0d0880-a18f-11ea-9e62-2f74c34db636.jpg)

## 実装予定
* お気に入り機能
* API導入
## DB設計
### contentsテーブル
|Column|Type|Options|
|------|----|-------|
|product|text|null: false|
|body|text|null: false|
|image|string|null: false|
|link|string||
|user_id|integer|foreign_key: true|
#### Association
* has_many :tags, through: :content_tags
* has_many :content_tags
* has_many :comments
* belongs_to :user

### tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
#### Association
* has_many :contents, through: :cotent_tags
* has_many :content_tags

### content_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|content_id|integer|foreign_key: true|
|tab_id|integer|foreign_key: true|
#### Association
* belongs_to :content
* belongs_to :tag

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|foreign_key: true|
|content_id|integer|foreign_key: true|
#### Association
* belongs_to :content
* belongs_to :user

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false, index: true|
#### Association
* has_many :contents
* has_many :comments
