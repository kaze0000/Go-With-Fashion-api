class User < ApplicationRecord
  has_secure_password

  has_many :user_favorite_brands
  has_many :brands, through: :user_favorite_brands
  has_many :posts
  has_one :user_profile
  has_one :user_image
  has_many :chat_messages
  has_many :chat_rooms, through: :chat_messages
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
