class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

  has_many :comments, dependent: :restrict_with_error

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: :true

  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  has_many :followships, dependent: :destroy#外鍵預設為user_id
  has_many :followings, through: :followships#有很多自己追蹤的user

  has_many :inverse_followships, class_name: "Followship", foreign_key: :following_id
  has_many :followers, through: :inverse_followships, source: :user#從inverse_followships表裡面的user欄位去找

  has_many :friendships, dependent: :destroy#有很多朋友關係列表(user主動邀請)
  has_many :friends, through: :friendships#有很多朋友(user主動邀請)

  has_many :inversed_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :passive_friends, through: :inversed_friendships, source: :user#有很多朋友(user被請求為朋友)

  def admin?
    self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

  def friend?(user)
    self.friends.include?(user)
  end
end
