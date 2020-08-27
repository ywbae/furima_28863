# テーブル設計

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
| birth-date            | date     | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :credit_card
- has_one :shipping_address


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

- belongs_to :users


## items テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| img_url   | references | null: false, foreign_key: true |
| name      | string     | null: false                    |
| text      | text       | null: false                    |
| price     | integer    | null: false                    |

### Association

- belongs_to :users
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

- belongs_to :users
- belongs_to :items


## item-image テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_id        | references | null: false, foreign_key: true |
| img_url        | string     | null: false                    |

### Association

- belongs_to :items


## item-category テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| category  | integer    | null: false                    |

### Association

- belongs_to :items


## item-sales-status テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| sales_status | integer    | null: false                    |

### Association

- belongs_to :items


## item-shipping-fee テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_id             | references | null: false, foreign_key: true |
| shipping_fee_status | integer    | null: false                    |

### Association

- belongs_to :items


## item-prefecture テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| prefecture   | integer    | null: false                    |

### Association

- belongs_to :items


## item-scheduled テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| scheduled    | integer    | null: false                    |

### Association

- belongs_to :items

