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

## Users Table

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| id              | bigint | primary key |
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | date   | null: false |

## Items Table

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| id              | bigint     | primary key                    |
| user_id         | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| handling_time_id| integer    | null: false                    |
| price           | integer    | null: false                    |

## Images Table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| id       | bigint     | primary key                    |
| item_id  | references | null: false, foreign_key: true |
| url      | string     | null: false                    |

## Purchases Table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| id      | bigint     | primary key                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

## Addresses Table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | bigint     | primary key                    |
| purchase_id  | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building_name| string     |                                |
| phone_number | string     | null: false                    |
