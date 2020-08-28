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
- has_many :orders


## shipping-address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |

### Association

- belongs_to :order


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| text                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| trading_status         | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |

### Association

- belongs_to :users
- has_many :comments
- has_one :order
- has_one :category
- has_one :sales_status
- has_one :shipping_fee
- has_one :prefecture
- has_one :scheduled_delivery


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| nickname     | references | null: false, foreign_key: true |
| comment_text | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping-address


## category テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false                    |

### Association

- belongs_to :items


## sales_status テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| sales_status_id | integer    | null: false                  |

### Association

- belongs_to :items


## shipping_fee テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| shipping_fee_id | integer    | null: false                  |

### Association

- belongs_to :items


## prefecture テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                  |

### Association

- belongs_to :items


## scheduled_delivery テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item                  | references | null: false, foreign_key: true |
| scheduled_delivery_id | integer    | null: false                    |

### Association

- belongs_to :items