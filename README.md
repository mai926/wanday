# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :posts, dependent: :destroy
- has_many :pets
- has_many :items
- has_many :item_reviews
- has_many :shops
- has_many :shop_reviews
- has_many :calendars
- has_many :medicine_record
<!-- ウィザード -->
- has_one :account
<!-- フォロー機能 -->
- has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed", dependent: :destroy
- has_many :followers, through: :reverse_of_relationships, source: :follower
- has_many :relationships, class_name: "Relationship", foreign_key: "follower", dependent: :destroy
- has_many :followings, through: :relationships, source: :followed
<!-- いいね機能 -->
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post
<!-- コメント機能 -->
- has_many :comments

## posts テーブル (※画像は active_storage を使用)

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| caption | text       | null: false                   |
| user    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many_attached :images
<!-- いいね機能 -->
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
<!-- コメント機能 -->
- has_many :comments

## pets テーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| name     | string     | null: false                   |
| type     | string     |                               |
| birthday | date       | null: false                   |
| user     | references | null: false,foreign_key: true |

### Association

- belongs_to :user

## accounts テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| account_id | string | null: false |
| birthday   | date   | null: false |

### Association

- belongs_to :user

## relationship テーブル <!-- フォロー機能 -->

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| followed | references | null: false,foreign_key: true |
| follower | references | null: false,foreign_key: true |

### Association

belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"

## likes テーブル <!-- いいね機能 -->

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| post   | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## comments テーブル <!-- コメント機能 -->

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| comment | text       | null: false                   |
| user    | references | null: false,foreign_key: true |
| post    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## items テーブル <!-- 商品 --> (※画像は active_storage を使用)

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| explanation | text       | null: false                   |
| user        | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many :item_reviews
- has_many_attached :images

## item_reviews テーブル <!-- 商品レビュー機能 -->

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| title   | string     | null: false                   |
| comment | text       | null: false                   |
| rate    | float      |                               |
| user    | references | null: false,foreign_key: true |
| item    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shops テーブル <!-- お店 --> (※画像は active_storage を使用)

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| explanation | text       | null: false                   |
| user        | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many_attached :images

## shop_reviews テーブル <!-- 商品レビュー機能 -->

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| title   | string     | null: false                   |
| comment | text       | null: false                   |
| rate    | float      |                               |
| user    | references | null: false,foreign_key: true |
| shop    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shop

## calendars テーブル <!-- カレンダー機能 -->

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| event      | string     | null: false                   |
| text       | text       | null: false                   |
| start_time | date       | null: false                   |
| user       | references | null: false,foreign_key: true |

### Association

- belongs_to :user

## medicine_record テーブル <!-- お薬手帳機能 -->

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| name              | string     | null: false                   |
| disease_name      | string     | null: false                   |
| prescription_date | date       | null: false                   |
| user              | references | null: false,foreign_key: true |

### Association

- belongs_to :user

+## rooms テーブル <!-- DM機能 -->

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |

### Association

- has_many :entries
- has_many :messages

## entries テーブル <!-- DM機能 -->

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| room   | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## massages テーブル <!-- DM機能 -->

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| message | text       | null: false                   |
| user    | references | null: false,foreign_key: true |
| room    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

<!--
DM機能
掲示板機能 -->
