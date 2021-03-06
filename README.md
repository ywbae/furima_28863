# テーブル設計

## users テーブル

| Column                | Type     | Options                  |
| --------------------- | -------- | ------------------------ |
| email                 | string   | null: false, default: "" |
| password              | string   | null: false, default: "" |
| password-confirmation | string   | null: false |
| nickname              | string   | null: false |
| first-name            | string   | null: false |
| last-name             | string   | null: false |
| first-name-kana       | string   | null: false |
| last-name-kana        | string   | null: false |
| birth-date            | date     | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## shipping_address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order        | references | foreign_key: true              |

### Association




## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| text                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |

### Association

- belongs_to :users
- has_many :comments
- has_one :order
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
| nickname     | references | null: false, foreign_key: true |
| comment_text | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items


## order テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| item    | references | foreign_key: true |
| user    | references | foreign_key: true |

### Association

- belongs_to :users, optional: true
- belongs_to :items, optional: true
- has_one :shipping-address
