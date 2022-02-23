# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchased_items



## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false,                   |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| Ship_fee_id  | integer    | null: false                    |
| ship_area_id | integer    | null: false                    |
| ship_time_id | integer    | null: false                    |
| price        | integer    | null: false                    |
| fees         | integer    | null: false                    |
| benefit      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- has_many :users
- has_one  :purchased_item, through: :user
- has_one  :users_address,  through: :user



## purchased_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :room
- belongs_to :user



## users_addresses テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| zip      | integer    | null: false                    |
| region   | integer    | null: false                    |
| city     | string     | null: false                    |
| block    | string     | null: false                    |
| building | string     |                                |
| phone    | string     | null: false                    |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :item