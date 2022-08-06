class Post < ApplicationRecord
  belongs_to :area
  belongs_to :user
  belongs_to :area

  has_many :posted_brands, dependent: :destroy
  has_many :brands, through: :posted_brands
end
