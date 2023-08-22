## usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| password_confirmation |
| name                  | string | null: false               |
| name(KANA)            | string | null: false               |
| birthday              | string | null: false               |

### Association

-has_many :items
-has_many :comments

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| title              | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping charge    | string     | null: false                    |
| shipping area      | string     | null: false                    |
| shipment data      | string     | null: false                    | 

### Association
belongs_to: purchase

## comments テーブル
| Colum     | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| text      | text      | null: false                    |

### Association
-has_many :items
belongs_to :items

## purchace テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| credit information | string     | null: false                    |
| shipping address   | text       | null: false                    |

### Association
belongs_to: purchase
