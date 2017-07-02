# DB構成

## users table

|Column|Type|Options|
|:-:|:-:|:-:|
|name|text|null: false, unique: true, index: true|

##### association
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages


## groups table

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, unique: true|

##### association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :messages


## group_users table

|Column|Type|Options|
|:-:|:-:|:-:|
|user_id|reference|null: false, foreign_key: true|
|group_id|reference|null: false, foreign_key: true|

##### association
- belongs_to :user
- belongs_to :group


## messages table

|Column|Type|Options|
|:-:|:-:|:-:|
|body|text||
|image|string||
|user_id|reference|null: false, foreign_key: true|
|group_id|reference|null: false, foreign_key: true|

##### association
- belongs_to :user
- belongs_to :group

