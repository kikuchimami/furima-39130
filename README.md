## usersテーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| nickname                  | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |
| family_name_zenkaku       | string | null: false               |
| last_name_zenkaku         | string | null: false               |
| kana_family_name_zenkaku  | string | null: false               |
| kana_last_name_zenkaku    | string | null: false               |
| birthday                  | date   | null: false               |

### Association

-has_many :items
-has_many :orders

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipment_data_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key :true |

### Association
has_one :order
-belongs_to : user

## Addresses テーブル
| Colum                 | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postcode              | string     | null: false                    |
| shipping_area_id      | integer    | null: false                    |
| city                  | string     | null: false                    |
| street_address        | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| order                 | references | null: false, foreign_key :true |

### Association
belongs_to :order

## orders テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key :true |
| item               | references | null: false, foreign_key :true |


### Association
belongs_to: user
belongs_to: item
has_one :address
