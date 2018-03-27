class Category < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  mount_uploader :logo, ImageUploader
  has_ancestry
  acts_as_list scope: [:ancestry]

  has_and_belongs_to_many :stores
  has_many :product_categories
  has_many :products, :through => :product_categories

  # subtree 包含自身和所有子孙
  def subtree_stores
    Store.joins(:categories).merge(subtree)
  end
end
