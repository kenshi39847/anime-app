# README
# DB設計
## usersテーブル
| Column             | Type    | Option                    |
|--------------------|---------|---------------------------|
| id                 | integer | null: false               |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association
- has_many :animes
- has_many :comments
- has_many :netabares



## animesテーブル
| Column            | Type       | Option                         |
|-------------------|------------|--------------------------------|
| id                | integer    | null: false                    |
| title             | string     | null: false                    |
| synopsis          | text       | null: false                    |
| genre_id          | integer    | null: false                    |
| good_point_id     | integer    | null: false                    |
| recommendation_id | integer    | null: false                    |
| text              | text       | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :comments
- has_one :netabare



## commentsテーブル
| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| id      | integer    | null: false                    |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| anime   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :anime



## netabaresテーブル
| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| id     | integer    | null: false                    |
| count  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :anime


