class ShopDetail < ApplicationRecord
  belongs_to :shop

  serialize :phones, Array
end
