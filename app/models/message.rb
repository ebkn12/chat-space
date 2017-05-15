class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates_presence_of :body, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end

