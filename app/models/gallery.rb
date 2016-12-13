class Gallery < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 10 }

  belongs_to :admin_user

  mount_uploader :photo, PhotoUploader
end
