class Region < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  has_ancestry

  has_many :stores
end
