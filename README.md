# DB構成
***
### users table
##### association
* has_many :members
* has_many :groups, through: :members
* has_many :messages

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, index: true, unique: true|

### groups table
##### association
* has_many :members
* has_many :users, through: :members
* has_many :messages

|Column|Type|Options|
|:-:|:-:|:-:|
|name|string|null: false, unique: true, index: true|

### members table
##### association
* belongs_to :user
* belongs_to :group

### messages table
##### association
* belongs_to :user
* belongs_to :group

|Column|Type|Options|
|:-:|:-:|:-:|
|body|text|index: true|
|image|string|index: true|
