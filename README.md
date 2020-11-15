# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| birth_day  | string | null: false |



### Association
- has_many :items
- has_one :cards
- has_one :address

## items テーブル

| Column        | Type       | Options                       |
| ---------     | ---------- | ----------------------------- |
| item_name     | string     | null: false                   |
| category      | string     | null: false                   |
| price         | string     | null: false                   |
| user          | references | null: false,foreign_key: true |

### Association

- belongs_to :users

## address テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| shipping_address | text       | null: false                   |
| user             | references | null: false,foreign_key: true |
| postal_code      | string     | null: false                   |
| prefecture       | string     | null: false                   |
| address_number   | string     | null: false                   |
| municipalities   | string     | null: false                   |
| phone_number     | string     | null: false                   |

### Association

- belongs_to :users


## cards テーブル

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| Security_code   | string     | null: false                    |
| expiration_date | string     | null: false,                   |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :users