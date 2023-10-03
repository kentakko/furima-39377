# テーブル設計

## users テーブル

| Column             | Type   | Options          |
| ------------------ | ------ | ---------------- |
| nickname           | string | NOT NULL         |
| email              | string | NOT NULL         |
| password           | string | NOT NULL         |
| family_name        | string | NOT NULL         |
| first_name         | string | NOT NULL         |
| family_name_kana   | string | NOT NULL         |
| first_name_kana    | string | NOT NULL         |
| birth_day          | date   | NOT NULL         |

## items テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| name               | string     | NOT NULL                   |
| price              | string     | NOT NULL                   |
| explanation        | string     | NOT NULL                   |
| category_id        | integer    | NOT NULL,foreign_key: true |
| status             | string     | NOT NULL                   |
| shipping_price     | string     | NOT NULL                   |
| shipping_area      | string     | NOT NULL                   |
| shipping_date      | string     | NOT NULL                   |
| user_id            | string     | NOT NULL                   |

## card テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| user_id            | integer    | NOT NULL,foreign_key: true |
| card_id            | integer    | NOT NULL,foreign_key: true |


## purchases テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| family_name        | string     | NOT NULL                   |
| first_name         | string     | NOT NULL                   |
| family_name_kana   | string     | NOT NULL                   |
| first_name_kana    | string     | NOT NULL                   |
| post_code          | string     | NOT NULL                   |
| prefecture         | string     | NOT NULL                   |
| city               | string     | NOT NULL                   |
| address            | string     | NOT NULL                   |
| building_name      | string     | NOT NULL                   |
| phone_number       | string     | NOT NULL                   |
| user_id            | integer    | NOT NULL,foreign_key: true |

## images テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| image              | string     | NOT NULL                   |
| item_id            | integer    | NOT NULL,foreign_key: true |

## category テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| name               | string     | NOT NULL                   |
| ancestry           | string     |                            |


## brand テーブル
| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| name               | string     | NOT NULL                   |
