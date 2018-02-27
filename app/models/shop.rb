class Shop < ApplicationRecord
  belongs_to :category
  belongs_to :region
end
