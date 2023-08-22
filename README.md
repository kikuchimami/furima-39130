## usersテーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| email                     | string | null: false,              |
| encrypted_password        | string | null: false               |
| family_name(ZENKAKU)      | string | null: false               |
| last name(ZENKAKU)        | string | null: false               |
| KANA_family_name(ZENKAKU) | string | null: false               |
| KANA_last_name(ZENKAKU)   | string | null: false               |
| birthday                  | date   | null: false               |

### Association

-has_many :items
-has_many :comments

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation        | text       | null: false                    |
| category           | integer    | null, false                    |
| condition          | integer    | null, false                    |
| shipping charge    | integer    | null: false                    |
| shipping area      | integer    | null: false                    |
| shipment data      | integer    | null: false                    |
| user               | references | null: false                    |

### Association
belongs_to: purchase

## Addresses テーブル
| Colum                 | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postcode              | string     | null: false                    |
| prefectures           | integer    | null: false                    |
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
| user               | references | null: false, foreign_key :true |
| product            | references | null: false, foreign_key :true |


### Association
has_one :items
