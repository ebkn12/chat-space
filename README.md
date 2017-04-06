# DB構成
***
### users table
##### association
* has_many :groups
* has_many :groups, through: :chats
* has_many :messages, as: :messageable

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, index: true, unique: true|
|email|text|null: false, unique: true|
|password|text|null: false|
|password_confirmation|text|null: false|
|timestamps||　|

### groups table
##### association
* has_many :users
* has_many :users, through: :chats
* has_many :messages, as: :messageable

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, unique: true, index: true|
|timestamps||　|

### chats
##### association
* belongs_to :user
* belongs_to :group

|Column|Type|
|:-:|:-:|
|timestamps|　|

### messages table
##### association
* belongs_to :messageable, polymorphic: true

|Column|Type|Options|
|:-:|:-:|:-:|
|body|text|index: true|
|image|string|index: true|
|timestamps||null: false|
