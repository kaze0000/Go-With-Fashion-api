class Brand < ApplicationRecord
  has_many :user_favorite_brands, dependent: :destroy
  has_many :users, through: :user_favorite_brands

  has_many :posted_brands, dependent: :destroy
  has_many :posts, through: :posted_brands
end
