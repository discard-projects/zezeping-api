class ProductCategory < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  belongs_to :store
  belongs_to :category, optional: true
  has_many :products

end
