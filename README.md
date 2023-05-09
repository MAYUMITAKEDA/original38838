## usersテーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |

## Associations
has_many: posts
has_many: comments
has_many: favorites
has_many: follows
has_many: likes

## postsテーブル

| Colum                | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| text                 | text       | null: false                    |
| category_id          | integer    | null: false                    |
| time_id              | integer    | null: false                    |
| budget_id            | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

## Associations
belongs_to: user
has_many: comments
has_many: favorites
has_many: likes
has_many: posts_tag_relations
has_many: tags

## commentsテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| post  | references | null: false, foreign_key: true |

## Associations
belongs_to: user
belongs_to: post


## likesテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| post  | references | null: false, foreign_key: true |

## Associations
belongs_to: user
belongs_to: post


## tagsテーブル

| Colum    | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| tag_name | string | null: false, uniqueness: true |

## Associations
has_many: post_tag_relations
has_many: posts

## post_tag_relationsテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| post  | references | null: false, foreign_key: true |
| tag   | references | null: false, foreign_key: true |

## Associations
belongs_to: post
belongs_to: tag

