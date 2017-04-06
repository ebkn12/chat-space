# DB構成
***
### users table
##### association
* has_many :group_users
* has_many :groups, through: :group_users
* has_many :messages

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, index: true, unique: true|

### groups table
##### association
* has_many :group_users
* has_many :users, through: :group_users
* has_many :messages

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, unique: true, index: true|

### group_users table
##### association
* belongs_to :user
* belongs_to :group

|Column|Type|Options|
|:-:|:-:|:-:|
|user_id|integer|null: false|
|group_id|integer|null: false|
##### references
references :user, foreign_key: true
references :group, foreign_key: true

### messages table
##### association
* belongs_to :user
* belongs_to :group

|Column|Type|Options|
|:-:|:-:|:-:|
|body|text|index: true|
|image|string|index: true|
|user_id|integer|null: false|
|group_id|integer|null: false|
##### references
references :user, foreign_key: true
references :group, foreign_key: true
