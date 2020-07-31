# README
# テーブル設計

## usersテーブル

| Column | Type | Presence | Options |
|  ---  |  ---  |  ---  |  ---  |
| nickname | string | true | --- |
| email | string | true | unique:true |
| password | string | true | length:{min:6} match(/[a-z\d]{6,}/i) | 
| password_confirmation | string | true | length:{min:6} match(/[a-z\d]{6,}/i) | 
| first_name | string | true| match(/\A[ぁ-んァ-ン一-龥]+\z/) |
| last_name | string | true | match(/\A[ぁ-んァ-ン一-龥]+\z/) |
| first_name_kana | string | true | match(/\A[ァ-ン]+\z/) |
| last_name_kana | string | true | match(/\A[ァ-ン]+\z/) |
| birthday | date | true | --- |

## itemsテーブル

| Column | Type | Presence | Options |
|  ---  |  ---  |  ---  |  ---  |
| image | binary | true | ActiveStorage |
| name | string | true | --- |
| description | text | true | --- |
| category | integer | true | --- |
| condition | integer | true | --- |
| shipping_charge | integer | true | --- |
| shipping_origin | integer | true | --- |
| days_until_shipping | integer | true | --- |
| price | integer | true | match([3-9]{3}~[0-9]{7}) |
| user_id | integer | true | --- |

## payment_methodsテーブル

| Column | Type | Presence | Options |
|  ---  |  ---  |  ---  |  ---  |
| card_number | integer | true | match([0-9]{12}) |
| exp_month | integer | true | match([0-9]{2}) |
| exp_year | integer | true | match([0-9]{2}) |
| security_number | integer | true | match([0-9]{3}) |
| user_id | integer | true | --- |

## shipping_methodsテーブル

| Column | Type | Presence | Options |
|  ---  |  ---  |  ---  |  ---  |
| postcode | integer | true | match(/\A\d{3}[-]\d{2}\z/) |
| prefecture_id | integer | true | --- |
| city | string | true | --- |
| block | string | true | --- |
| building | string | false | --- |
| phone_number | integer | true |  match(/\A\d{11}\z/) |
| user_id | integer | true | --- |