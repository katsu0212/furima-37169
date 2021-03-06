# users γγΌγγ«

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |

##  Association

- has_many :items
- has_many :purchases

## items

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| introduction       | text       | null: false                     |
| category_id        | integer    | null: false                     |
| item_condition_id  | integer    | null: false                     |
| postage_id         | integer    | null: false                     |
| region_id          | integer    | null: false                     |
| preparation_day_id | integer    | null: false                     |
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
- belongs_to :item
- has_one :sending_destination

## sending_destinations

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| post_code          | string     | null: false                     |
| region_id          | integer    | null: false                     |
| city               | string     | null: false                     |
| block              | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| purchase           | references | null: false, foreign_key: true  |


##  Association

- belongs_to  :purchase


20211126055339_create_active_storage_tables.active_storage.rb