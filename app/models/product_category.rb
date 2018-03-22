class ProductCategory < ApplicationRecord
  belongs_to :store
  belongs_to :category, optional: true
  has_many :products
end
