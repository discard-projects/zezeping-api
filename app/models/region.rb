class Region < ApplicationRecord
  has_ancestry

  has_many :stores
end
