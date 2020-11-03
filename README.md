# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| last_name      | string | null: false |
| first_name     | string | null: false |
| password       | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| nickname       | string | null: false |
| birth_date     | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column                        | Type      | Options                       |
| ----------------------------- | --------  | ----------------------------- |
| name                          | string    | null: false                   |
| user                          | references| null: false, foreign_key: true|
| description                   | text      | null: false                   |
| images_id (active_hash)       | integer   | null: false                   |
| category_id (active_hash)     | integer   | null: false                   |
| condition_id (active_hash)    | integer   | null: false                   |
| postage_payer_id (active_hash)| integer   | null: false                   |
| prefecture_id (active_hash)   | integer   | null: false                   |
| handling_time_id (active_hash)| integer   | null: false                   |
| price                         | integer   | null: false                   |


### Association

- has_many :comments
- has_many :images
- has_one :purchases
- belong_to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| purchase_date| date       | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :addresses

## addresses テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| post_code                  | string     | null: false                    |
| prefecture_id (active_hash)| integer    | null: false, foreign_key: true |
| city                       | string     | null: false                    |
| municipality               | string     | null: false                    |
| building_name              | string     |                                |
| phone_number               | string     | null: false                    |
| purchase                   | references | null: false, foreign_key: true |


### Association

- belongs_to :purchases

## comments

| Column| Type      |Options     |
| ----- | --------- | ---------- |
| user  | references|            |
| item  | references|            |
| text  | string    | null: false|


### Association

- belong_to :user
- belong_to :item
