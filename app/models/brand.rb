class Brand < ApplicationRecord
  has_many :user_favorite_brands, dependent: :destroy
  has_many :users, through: :user_favorite_brands
end
