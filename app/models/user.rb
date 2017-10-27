class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages

  scope :get_keyword, ->(id, keyword) {
    where.not(id: id).where("name LIKE(?)","%#{keyword}%").order("updated_at ASC")
  }
end
