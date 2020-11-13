# README

#テーブル設計

##usersテーブル

| Column      | Type     | Options          |
| email       | string   | null: false      | devise読み込み
| encrypted_password | string | null: false | devise読み込み
| nickname     | string   | null: false     |
| first_name   | string   | null: false     |
| second_name  | string   | null: fa;se     |
| first_name_k | string   | null: false     |
| second_name_k| string   | null: false     |
| birthday     | date     | null: false     |
### Association
- has_many :items
- has_many :orders

##itemsテーブル

| Column                  | Type        | Options           |
| user                    |  references | foreign_key: true |
| name                    |  string     | null: false       |
| explanation             |  text       | null: false       |
| category_genre_id       |  integer    | null: false       |
| status_genre_id         |  integer    | null: false       |
| delivery_burden_genre_id|  integer    | null: false       |
| prefecture_genre_id     |  integer    | null: false       |
| delivery_days_genre_id  |  integer    | null: false       |
| price                   |  integer    | null: false       |

### Association
- belongs_to :user
- has_one    :order


##ordersテーブル
| Column            | Type       | Options          |
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery


##deliveriesテーブル

| Column             | Type       | Options     |
| postal_code        | string     | null: false |
| prefecture_genre_id | integer    | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| build_name         | string     |             |
| phone_number       | string     | null: false |
| purchase           | references | null: false |

### Association
- belongs_to :order














This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
