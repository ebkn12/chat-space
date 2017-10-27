class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :user_ids, presence: true

  def latest_message
    messages.last.try(:body) || 'No messages'
  end
end
