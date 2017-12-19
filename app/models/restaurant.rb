class Restaurant < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :image, PhotoUploader
  validates :name, presence: true

  has_many :comments
end
