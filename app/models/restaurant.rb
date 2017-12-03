class Restaurant < ApplicationRecord

  mount_uploader :image, PhotoUploader
  validates :name, presence: true
end
