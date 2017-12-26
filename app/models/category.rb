class Category < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  validates :name, dependent: :restrict_with_error
end
