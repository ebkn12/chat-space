class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  validates_presence_of :name, :user_ids

  def latest_message
    messages.last.try(:body) || "No messages"
  end
end

