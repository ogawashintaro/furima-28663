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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| birthday           | integer | null: false |

## products テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| category           | string  | null: false                    |
| shippingcost       | string  | null: false                    |
| area               | string  | null: false                    |
| deliveryfee        | string  | null: false                    |
| send               | string  | null: false                    |
| productname        | string  | null: false                    |
| price              | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

## comments テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| text               | string  | null: false                    |
| user_id            | integer | null: false, foreign_key: true |
| goods_id           | integer | null: false, foreign_key: true |

## buyers テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| product_id         | integer | null: false, foreign_key: true |
| user_id            | integer | null: false, foreign_key: true |

## shippingaddres テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| address            | integer | null: false, foreign_key: true |
| buyer_id           | integer | null: false, foreign_key: true |