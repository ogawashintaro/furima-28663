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
| lastname           | string  | null: false |
| name               | string  | null: false |
| lastnamekana       | string  | null: false |
| namekana           | string  | null: false |
| birthday           | date    | null: false |

## items テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| itemname           | string  | null: false                    |
| price              | integer | null: false                    |
| syouhinnsetumei    | text    | null: false                    |
| category           | integer | null: false                    |
| haisouryou         | integer | null: false                    |
| area               | integer | null: false                    |
| hassounissuu       | integer | null: false                    |
| user               | integer | null: false, foreign_key: true |

## buyers テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| item               | integer | null: false, foreign_key: true |
| user               | integer | null: false, foreign_key: true |

## addresses テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| postalcode         | string  | null:                          |
| todoufukenn        | integer | null:                          |
| sikutyousonn       | string  | null:                          |
| address            | string  | null:                          |
| buildingname       | string  | null:                          |
| tel                | string  | null:                          |
| buyer              | integer | null: false, foreign_key: true |
