# README
# テーブル設計

## usersテーブル

| Column | Type | Options |
|  ---  |  ---  |  ---  |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| password | string | null: false | 
| password_confirmation | string | null: false | 
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birthday | date | null: false |

### Association
- has_many :items
- has_many :shipping_methods

## itemsテーブル

| Column | Type | Options |
|  ---  |  ---  |  ---  |
| image | binary | null: false |
| name | string | null: false |
| description | text | null: false |
| category | integer | null: false |
| condition | integer | null: false |
| shipping_charge | integer | null: false |
| shipping_origin | integer | null: false |
| days_until_shipping | integer | null: false |
| price | integer | null: false |
| user_id | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :shipping_method

## shipping_methodsテーブル

| Column | Type | Options |
|  ---  |  ---  |  ---  |
| postcode | integer | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string | --- |
| phone_number | integer | null: false |
| user_id | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item