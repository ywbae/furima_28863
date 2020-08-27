# テーブル設計

## login テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| email        | references | null: false, foreign_key: true |
| password     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :shipping_address
- has_many :items
- has_many :comments
- has_one :credit_card


## shipping-address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | integer    | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |

### Association

- belongs_to :login


## users テーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false |
| password              | string   | null: false |
| password-confirmation | string   | null: false |
| first-name            | string   | null: false |
| last-name             | string   | null: false |
| first-name-kana       | string   | null: false |
| last-name-kana        | string   | null: false |
| birth-date            | datetime | null: false |

### Association

- has_one :login


## credit_card テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| card-number    | integer    | null: false                    |
| card-exp-month | integer    | null: false                    |
| card-exp-year  | integer    | null: false                    |
| card-cvc       | integer    | null: false                    |

### Association

- belongs_to :login


## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user_id                  | references | null: false, foreign_key: true |
| nickname                 | references | null: false, foreign_key: true |
| item_name                | string     | null: false, foreign_key: true |
| items_text               | text       | null: false                    |
| item_category            | integer    | null: false                    |
| item_sales_status        | integer    | null: false                    |
| item_shipping_fee_status | integer    | null: false                    |
| item_prefecture          | integer    | null: false                    |
| item_scheduled_delivery  | integer    | null: false                    |
| item_price               | integer    | null: false                    |

### Association

- belongs_to :login
- has_many :item-image
- has_many :item-category
- has_many :item-sales-status
- has_many :item-shipping-fee
- has_many :item-prefecture
- has_many :item-scheduled
- has_many :comments


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
| nickname     | references | null: false, foreign_key: true |
| comment_text | text       | null: false                    |

### Association

- belongs_to :sign_in
- belongs_to :items


## item-image テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_id        | references | null: false, foreign_key: true |
| img_url        | string     | null: false                    |

### Association

- belongs_to :items


## item-category テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_id        | references | null: false, foreign_key: true |
| item_category   | integer    | null: false                    |

### Association

- belongs_to :items


## item-sales-status テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_id             | references | null: false, foreign_key: true |
| item_sales_status   | integer    | null: false                    |

### Association

- belongs_to :items


## item-shipping-fee テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| item_id                    | references | null: false, foreign_key: true |
| item_shipping_fee_status   | integer    | null: false                    |

### Association

- belongs_to :items


## item-prefecture テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_id           | references | null: false, foreign_key: true |
| item_prefecture   | integer    | null: false                    |

### Association

- belongs_to :items


## item-scheduled テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_id           | references | null: false, foreign_key: true |
| item_scheduled    | integer    | null: false                    |

### Association

- belongs_to :items

