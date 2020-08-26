# テーブル設計

## profile テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| user_id               | string | null: false |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name                  | string | null: false |
| name_kana             | string | null: false |
| birthday              | date   | null: false |
| created_at            | date   | null: false |

### Association

- has_one :users

## users テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| user_id  | string | null: false, foreign_key: true |
| nickname | string | null: false, foreign_key: true |

### Association

- belongs_to :profile
- has_many :items
- has_many :shipping
- has_many :comments

## shipping テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |
| postal_code | string     | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone_number| string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :items

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
| created_at   | date       | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| nickname       | references | null: false, foreign_key: true |
| item_id        | integer    | null: false, foreign_key: true |
| image_url      | string     | null: false                    |
| image_title    | text       | null: false                    |
| image_explain  | text       | null: false                    |
| image_category | string     | null: false                    |
| image_status   | string     | null: false                    |
| delivery_fee   | integer    | null: false                    |
| area           | string     | null: false                    |
| delivery_days  | integer    | null: false                    |
| price          | integer    | null: false                    |
| created_at     | date       | null: false                    |

### Association

- belongs_to :user
- has_one :shipping
- has_many :comments