class Restaurant < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :image, PhotoUploader
  validates :name, presence: true

  has_many :comments, dependent: :destroy 

  has_many :users, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
end
