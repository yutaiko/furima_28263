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
- has_many :item_purchases

## itemsテーブル

| Column | Type | Options |
|  ---  |  ---  |  ---  |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_origin_id | integer | null: false |
| days_until_shipping_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true|
| stock | integer | null: false |

### Association
- belongs_to :user
- has_one :shipping_method
- has_one :item_purchase

## shipping_methodsテーブル

| Column | Type | Options |
|  ---  |  ---  |  ---  |
| postcode | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string | --- |
| phone_number | string | null: false |
| item | references | null: false, foreign_key: true|

### Association
- belongs_to :item

## item_purchasesテーブル

| Column | Type | Options |
|  ---  |  ---  |  ---  |
| user | references | null: false, foreign_key: true|
| item | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item