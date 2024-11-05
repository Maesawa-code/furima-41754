# データベス設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| Nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| image         | string     | null: false |
| name          | string     | null: false |
| description   | text       | null: false |
| category      | integer    | null: false |
| condition     | integer    | null: false |
| shipping_fee  | integer    | null: false |
| shipping_area | integer    | null: false |
| shipping_days | integer    | null: false |
| price         | integer    | null: false |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_records

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :delivery_addresses

## delivery_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :purchase_records