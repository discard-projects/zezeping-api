class Shop < ApplicationRecord
  belongs_to :category
  belongs_to :region
  has_one :shop_detail
end
