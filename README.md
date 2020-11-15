# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------------   | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |   
| kana_first         | string | null: false |
| kana_last          | string | null: false |
| birth_day          | date   | null: false |



### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                       |
| --------------    | ---------- | ----------------------------- |
| item_name         | string     | null: false                   |
| item_description  | integer    | null: false                   |
| category_id       | integer    | null: false                   |
| condition_id      | integer    | null: false                   |
| shipping_area_id  | integer    | null: false                   |
| day_id            | integer    | null: false                   |
| price_id          | integer    | null: false                   |
| user              | references | null: false,foreign_key: true |

### Association

- belongs_to :users
- has_many :purchases


## address テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| shipping_address | text       | null: false                   |
| postal_code      | string     | null: false                   |
| prefecture       | string     | null: false                   |
| address_number   | string     | null: false                   |
| municipalities   | string     | null: false                   |
| phone_number     | string     | null: false                   |
| user             | references | null: false,foreign_key: true |

### Association

- belongs_to :purchases


## purchases テーブル

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :address