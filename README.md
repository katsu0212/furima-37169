# README

# users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| first_name_kana    | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |

##  Association

- has_many :items
- has_many :purchases
- has_one  :sending_destinations


## items

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| image              | string     | null: false                     |
| name               | string     | null: false                     |
| introduction       | text       | null: false                     |
| category           | string     | null: false                     |
| status             | string     | null: false                     |
| postage            | integer    | null: false                     |
| region             | string     | null: false                     |
| preparation_day    | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

##  Association

- belongs_to :user
- has_one :purchase



## purchases

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |


##  Association

- belongs_to :user
- has_one :item
- belongs_to :sending_destinations

## sending_destinations

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postcode           | string     | null: false                     |
| prefecture         | string     | null: false                     |
| city               | string     | null: false                     |
| block              | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

##  Association

- belongs_to :purchase
- belongs_to :user




