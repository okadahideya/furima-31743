# README

#テーブル設計

##usersテーブル

| Column      | Type     | Options     |
|email        | string   | uniqe: true |
|password     | string   | uniqe: true |
|nickname     | string   | null: false |
|first-name   | string   | null: false |
|second-name  | string   | null: fa;se |
|first-name-k | string   | null: false |
|second-name-k| string   | null: false |
|birthday     | datetime | null: false |
### Association
- has_many :items
- has_many :purchases

##itemsテーブル
| Column                   | Type        | Options          |
| user-id                 |  references | foreigh_key: true |
| image                   |  text       | null: false       |
| item-name               |  text       | null: false       |
| explanation             |  text       | null: false       |
| category-genre_id       |  integer    | null: false       |
| item-status-genre_id    |  integer    | null: false       |
| item-genre_id           |  integer    | null: false       |
| delivery-barden-genre_id|  integer    | null: false       |
| delivery-area-genre_id  |  integer    | null: false       |
| delivery-days-genre_id  |  integer    | null: false       |
| price                   |  integer    | null: false       |

### Association
- belongs_to :user
- has_one    :purchases


##purchasesテーブル
| Column            | Type       | Options          |
| card-number     | integer    | null: false        |
| expiration-date | datetime   | null: false        |
| card-code       | integer    | null: false        |
| user-id         | references | foreight_key: true |
| item-id         | references | foreight_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_many   :delivery


##deliveriesテーブル

| Column             | Type       | Options     |
| postal-code        | integer    | null: false |
| prefectur-genre_id | integer    | null: false |
| municipality       | text       | null: false |
| adderss            | text       | null: false |
| build-name         | text       |             |
| phone-number       | integer    | null: false |
| purchase-id        | references | null: false |

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
