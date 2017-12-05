class Category < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  validates :name, presence: true
end
