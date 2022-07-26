class User < ApplicationRecord
  has_secure_password

  has_many :user_favorite_brands
  has_many :posts
  has_one :user_profile

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
