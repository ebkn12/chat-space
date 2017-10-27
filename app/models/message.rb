class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates_presence_of :body, unless: :image?

  mount_uploader :image, ImageUploader

  scope :presence_of_new_message, lambda { |last_message|
    where('id > ?', last_message)
  }
end
