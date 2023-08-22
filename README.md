## usersテーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| email                     | string | null: false,              |
| encrypted_password        | string | null: false               |
| family_name_ZENKAKU       | string | null: false               |
| last name_ZENKAKU         | string | null: false               |
| KANA_family_name_ZENKAKU  | string | null: false               |
| KANA_last_name_ZENKAKU    | string | null: false               |
| birthday                  | date   | null: false               |

### Association

-has_many :items
-has_many :addresses

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation        | text       | null: false                    |
| category           | integer    | null, false                    |
| condition          | integer    | null, false                    |
| shipping_charge    | integer    | null: false                    |
| shipping_area      | integer    | null: false                    |
| shipment_data      | integer    | null: false                    |
| user_id            | references | null: false                    |

### Association
belongs_to: orders

## Addresses テーブル
| Colum                 | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postcode              | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| street_address        | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| purchase_history      | references | null: false, foreign_key :true |

### Association
belongs_to :orders

## orders テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key :true |
| item               | references | null: false, foreign_key :true |


### Association
belongs_to: users
belongs_to: items
