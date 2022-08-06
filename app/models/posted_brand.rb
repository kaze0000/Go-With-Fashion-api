class PostedBrand < ApplicationRecord
  belongs_to :brand
  belongs_to :post
end
