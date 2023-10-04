# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| nickname           | string | null: false         |
| email              | string | null: false, UNIQUE |
| encrypted_password | string | null: false         |
| family_name        | string | null: false         |
| first_name         | string | null: false         |
| family_name_kana   | string | null: false         |
| first_name_kana    | string | null: false         |
| birth_day          | date   | null: false         |

## items テーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| name               | string  | null: false                   |
| price              | integer | null: false                   |
| explanation        | text    | null: false                   |
| category_id        | integer | null: false                   |
| status_id          | integer | null: false                   |
| shipping_price_id  | integer | null: false                   |
| prefecture_id      | integer | null: false                   |
| shipping_date_id   | integer | null: false                   |
| user_id            | integer | null: false                   |

## cards テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| card               | integer    | null: false                   |
| user_id            | references | null: false,foreign_key: true |

## purchases テーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| post_code          | string  | null: false                   |
| prefecture_id      | integer | null: false                   |
| city               | string  | null: false                   |
| address            | string  | null: false                   |
| building_name      | string  | null: false                   |
| phone_number       | string  | null: false                   |
| user_id            | integer | null: false,foreign_key: true |
