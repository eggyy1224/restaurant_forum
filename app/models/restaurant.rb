class Restaurant < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :image, PhotoUploader
  validates :name, presence: true

  has_many :comments, dependent: :destroy 

  has_many :users, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def is_favorite? user
    self.favorited_users.include?(user)
  end

  def is_liked_by? user
    self.liked_users.include?(user)
  end
end
