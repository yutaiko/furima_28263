# README
# テーブル設計

## usersテーブル

| users |
|  ---  |
| nickname |
| email |
| password |
| first_name |
| last_name |
| first_name_kana |
| last_name_kana |
| birthday |

## itemsテーブル

| items |
|  ---  |
| image |
| name |
| description |
| category |
| condition |
| shipping_charge |
| shipping_origin |
| days_until_shipping |
| price |
| user_id |

## payment_methodsテーブル

| payment_methods |
|  ---  |
| card_number |
| exp_month |
| exp_year |
| security_number |
| user_id |

## shipping_methodsテーブル

| shipping_methods |
|  ---  |
| postcode |
| prefecture_id |
| city |
| block |
| building |
| phone_number |
| user_id |
