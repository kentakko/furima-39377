# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
has_many :items 
has_many :purchase_item


## items テーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| price              | integer    | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| shipping_price_id  | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| shipping_date_id   | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

### Association
belongs_to :user
has_one :purchase_item


## purchases_item テーブル
| Column             | Type       | Options                       |
| ------------------ | -----------| ----------------------------- |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |
| purchase_info      | references | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :items
belongs_to :purchase_info


## purchases_info テーブル
| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| card_date          | string    | null: false                   |
| card_deadline      | string    | null: false                   |
| security_code      | string    | null: false                   |
| post_code          | string    | null: false                   |
| prefecture_id      | integer   | null: false                   |
| city               | string    | null: false                   |
| address            | string    | null: false                   |
| building_name      | string    |                               |
| phone_number       | string    | null: false                   |
| user               | reference | null: false,foreign_key: true |

### Association
has_one :purchase_item