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

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nick_name          | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| name               | string  | null: false              |
| last_name_kana     | string  | null: false              |
| name_kana          | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :items
- belongs_to :buyers


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| price                | integer    | null: false                    |
| information          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| area_id              | integer    | null: false                    |
| shipping_date_id     | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buyers


## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :addresses
- has_many :items


## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| tel                | string     | null: false                    |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :buyers
