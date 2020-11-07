# README

#テーブル設計

##usersテーブル

| Column      | Type     | Options     |
|email        | string   | null: false | devise読み込み
|password     | string   | null: false | devise読み込み
|nickname     | string   | null: false |
|first-name   | string   | null: false |
|second-name  | string   | null: fa;se |
|first-name-k | string   | null: false |
|second-name-k| string   | null: false |
|birthday     | date     | null: false |
### Association
- has_many :items
- has_many :purchases

##itemsテーブル

| Column                  | Type        | Options           |
| user                    |  references | foreigh_key: true |
| name                    |  string     | null: false       |
| explanation             |  text       | null: false       |
| category-genre_id       |  integer    | null: false       |
| status-genre_id         |  integer    | null: false       |
| delivery-barden-genre_id|  integer    | null: false       |
| delivery-area-genre_id  |  integer    | null: false       |
| delivery-days-genre_id  |  integer    | null: false       |
| price                   |  integer    | null: false       |

### Association
- belongs_to :user
- has_one    :purchase


##purchasesテーブル
| Column            | Type       | Options          |
| user              | references | foreight_key: true |
| item              | references | foreight_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery


##deliveriesテーブル

| Column             | Type       | Options     |
| postal-code        | string     | null: false |
| prefectur-genre_id | integer    | null: false |
| municipality       | string     | null: false |
| adderss            | string     | null: false |
| build-name         | string     |             |
| phone-number       | string     | null: false |
| purchase           | references | null: false |

### Association
- belongs_to :purchase














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
